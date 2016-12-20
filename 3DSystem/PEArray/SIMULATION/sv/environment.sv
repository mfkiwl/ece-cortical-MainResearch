/************************************************************************************************
    File name   : environment.sv
    Author      : Lee Baker
    Affiliation : North Carolina State University, Raleigh, NC
    Date        : Aug 2016
    Email       : lbbaker@ncsu.edu
    
    Description : This file contains the verification environment. It contains the objects of
                  generator, driver and scoreboards & checkers of all the blocks.
                  This class has 4 basic functions
                  new()     : This function retrieves the interafces, mailboxes, events etc.
                              passed by the testbench.
                  build()   : This function allocates a memory to the objects and pass the
                              required interfaces, mailboxes and events.
                  run()     : This function spawns the run functions of all the objects in parallel.
                  wrap_up() : This function marks the end of testing.

                  Note: leveraged from https://github.ncsu.edu/ECE-Memory-Controller-IS/ece-diram4-memory-controller

*************************************************************************************************/
`timescale 1ns/10ps

`include "common.vh"
`include "pe.vh"
`include "pe_array.vh"
`include "streamingOps_cntl.vh"

`include "interface.sv"
`include "generator.sv"
`include "driver.sv"
`include "mem_checker.sv"

import virtual_interface::*;

class Environment;
    // each generator/driver pair handles the two streams in each pe/lane
    generator     gen             [`PE_ARRAY_NUM_OF_PE][`PE_NUM_OF_EXEC_LANES] ; // [`PE_NUM_OF_STREAMS]  ;
    driver        drv             [`PE_ARRAY_NUM_OF_PE][`PE_NUM_OF_EXEC_LANES] ; // [`PE_NUM_OF_STREAMS]  ;
    mem_checker   dma2mem         [`PE_ARRAY_NUM_OF_PE][`PE_NUM_OF_EXEC_LANES] ; // [`PE_NUM_OF_STREAMS]  ;


    mailbox       gen2drv           ;
    event         gen2drv_ack      [`PE_ARRAY_NUM_OF_PE][`PE_NUM_OF_EXEC_LANES] ; // [`PE_NUM_OF_STREAMS]  ;
    // an operation defines what is sent on both the streams in a pe/lane
    event         new_operation    [`PE_ARRAY_NUM_OF_PE][`PE_NUM_OF_EXEC_LANES] ; // [`PE_NUM_OF_STREAMS]  ;
    event         final_operation  [`PE_ARRAY_NUM_OF_PE][`PE_NUM_OF_EXEC_LANES] ; // [`PE_NUM_OF_STREAMS]  ;

    mailbox       drv2memP          ;
    event         drv2memP_ack     [`PE_ARRAY_NUM_OF_PE][`PE_NUM_OF_EXEC_LANES] ; // [`PE_NUM_OF_STREAMS]  ; 

    // an array of all stream interfaces in the system
    vSysLane2PeArray_T  vSysLane2PeArray  [`PE_ARRAY_NUM_OF_PE][`PE_NUM_OF_EXEC_LANES]  ; // unpacked
    vSysOob2PeArray_T   vSysOob2PeArray   [`PE_ARRAY_NUM_OF_PE]                         ;

    // an array of all dma to memory interfaces in the system
    vDma2Mem_T          vDma2Mem          [`PE_ARRAY_NUM_OF_PE][`PE_NUM_OF_EXEC_LANES]  ; // unpacked

    //----------------------------------------------------------------------------------------------------
    // 
    function new (
                    // Retrieving the interface passed from the testbench in order to pass it to the required blocks.
                    input vSysLane2PeArray_T vSysLane2PeArray [`PE_ARRAY_NUM_OF_PE][`PE_NUM_OF_EXEC_LANES] ,
                    input vSysOob2PeArray_T  vSysOob2PeArray  [`PE_ARRAY_NUM_OF_PE]                        ,
                    input vDma2Mem_T         vDma2Mem         [`PE_ARRAY_NUM_OF_PE][`PE_NUM_OF_EXEC_LANES]
                );
        this.vSysLane2PeArray   =   vSysLane2PeArray   ;
        this.vSysOob2PeArray    =   vSysOob2PeArray    ;
        this.vDma2Mem           =   vDma2Mem           ;
    endfunction

    task build();                                 //This task passes the required interfaces, mailboxes, events to the objects of driver, generator and respective scoreboards.
        int Id [2];
        for (int pe=0; pe<`PE_ARRAY_NUM_OF_PE; pe++)
            begin
                for (int lane=0; lane<`PE_NUM_OF_EXEC_LANES; lane++)
                    begin
                        vSysLane2PeArray[pe][lane].cb_test.std__pe__lane_strm0_data_valid  <= 1'b0;
                        vSysLane2PeArray[pe][lane].cb_test.std__pe__lane_strm1_data_valid  <= 1'b0;

                        //$display("@%0t LEE: Create generators and drivers : {%0d,%0d,%0d}\n", $time,pe,lane,stream);
                        Id = {pe, lane};
                        gen2drv   = new () ;
                        drv2memP  = new () ;
                        // remember, each gen/drv tuple handle both streams in a lane
                        gen     [pe][lane]  = new ( Id, gen2drv , gen2drv_ack[pe][lane], new_operation[pe][lane], final_operation[pe][lane], vSysLane2PeArray[pe][lane]                                     );
                        drv     [pe][lane]  = new ( Id, gen2drv , gen2drv_ack[pe][lane], new_operation[pe][lane],                            vSysLane2PeArray[pe][lane] , drv2memP, drv2memP_ack[pe][lane]  );
                        dma2mem [pe][lane]  = new ( Id,                                                                                      vDma2Mem    [pe][lane] , drv2memP, drv2memP_ack[pe][lane]  );
                    end
            end


    endtask

    task run();                                                       //This task spawns parallel run tasks of generator, driver, golden models and their respective checkers.
        $display("@%0t : INFO:ENV: Run generators and drivers \n", $time);
        fork                                                          //These end after the generator triggers the event "final_operation" after generating the final transaction.
            // We have a generator, driver and checker for every pe/lane
            `include "TB_start_generators_and_drivers.vh"
            // gen.run();
            // drv.run();
        join_none

        //$display("@%0t LEE: Wait for final operation\n", $time);
        fork                                                          //These end after the generator triggers the event "final_operation" after generating the final transaction.
            `include "TB_wait_for_final_operation.vh"
            // @(final_operation);
        join
        //join_none
        //wait fork ;
        //$display("@%0t LEE: Drivers taken all operations \n", $time);

        repeat (50)              //Running simulation for some time after the final transaction is sent
        begin
            fork                                                          //These end after the generator triggers the event "final_operation" after generating the final transaction.
                `include "TB_quiesce_all_generators.vh"
                //@vSysLane2PeArray[0][0].cb_test;
                //vSysLane2PeArray[0][0].cb_test.std__pe__lane_strm_data_valid  <= 0  ;
            join_none
        end

        // check all memory checkers have finished
        for (int pe=0; pe<`PE_ARRAY_NUM_OF_PE; pe++)
            begin
                for (int lane=0; lane<`PE_NUM_OF_EXEC_LANES; lane++)
                    begin
                        // this will help finding any unfinished checkers
                        $display("@%0t INFO: Mem checker complete : {%0d,%0d}\n", $time,pe,lane);
                        //wait (dma2mem[pe][lane].finished.triggered);  // doesnt seem to work???
                        wait (dma2mem[pe][lane].found == 1);
                        //$display("@%0t LEE: Mem checker complete : {%0d,%0d}\n", $time,pe,lane);
                        dma2mem[pe][lane].finished = null ;
                    end
            end

    endtask

    task wrap_up();                                               //This task marks the completion of verification.
        $display("Complete!");
    endtask : wrap_up


endclass
