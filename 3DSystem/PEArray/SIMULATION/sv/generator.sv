/*********************************************************************************************
    File name   : generator.sv
    Author      : Lee Baker
    Affiliation : North Carolina State University, Raleigh, NC
    Date        : Nov 2016
    Email       : lbbaker@ncsu.edu
    
    Description : This file contains the operation generator for the PE.
                  It can generate X types of instructions, which it passes to the driver via
                  a mailbox
*********************************************************************************************/

`define VERBOSE0
`define VERBOSE1
`define VERBOSE2
`define VERBOSE3
`define VERBOSE4
`define VERBOSE5

`include "common.vh"
`include "streamingOps_cntl.vh"
`include "streamingOps.vh"
`include "dma_cont.vh"
`include "mem_acc_cont.vh"
`include "pe.vh"
`include "pe_array.vh"
`include "noc_interpe_port_Bitmasks.vh"


import virtual_interface::*;
import operation::*;

class generator;

    mailbox mgr2gen          ;
    event   mgr2gen_ack      ;
    mailbox gen2oob          ;
    event   gen2oob_ack      ;
    mailbox gen2drv          ;
    event   gen2drv_ack      ;
    event   new_operation    ;
    event   final_operation  ;
    int     Id [2]           ; // PE, Lane

    // Drive regFile interface
    // FIXME : should this be in the driver??
    // FIXME: may go away once SIMD and result path is working
    mailbox   gen2rfP         ;
    event     gen2rfP_ack     ;
        

    //-------------------------------------------------------------------------
    // HOW MANY?
    integer num_operations = 3;  // fp mac:{std,std}->mem, copy:std->mem, fp mac:{std,mem}->mem


    integer operationNum   = 0;  // used to set operation ID

    //variable to define the timeout in 'wrapup()' task in environment.sv
    integer transaction_timeout = 3000;
    integer timeout_option = 2; 

    //-------------------------------------------------------------------------
    // System random traffic variables
    int dist_type = 13;
    integer systemEventSeed = 166;  // Initial seed, random functions regenerate seed
    real systemEventMean = 47;  // mean
    real systemEventStddev = 13;  // standard deviation
    integer systemEventDeltaTime = 5;  // next time for event as integer
    //-------------------------------------------------------------------------

    vSysOob2PeArray_T    vSysOob2PeArray  ;  // FIXME OOB interface is a per PE i/f where generator is per lane
    vSysLane2PeArray_T   vSysLane2PeArray ;

    base_operation    sys_operation     ;  // operation packet containing all data associated with operation
    base_operation    sys_operation_mgr ;  // seed operation packet from manager
    base_operation    sys_operation_gen ;  // operation packet modified from manager operation for this lane
    oob_packet        oob_packet_new    ;

    // Keep track of previous command
    base_operation    priorOperations[$]               ; //Queue to hold previous operations
    base_operation    priorOperation                   ; // operation object copy of previous operations
    int               priorOperationNumberOfOperands   ;  // SV wont let me reference priorOperations as it might be null, so only reference priorOperations in post_randomize

    function new (
                  input int                   Id[2]             , 
                  input mailbox               mgr2gen           ,
                  input event                 mgr2gen_ack       ,
                  input mailbox               gen2drv           ,
                  input event                 gen2drv_ack       ,
                  input mailbox               gen2oob           ,
                  input event                 gen2oob_ack       ,
                  input event                 new_operation     ,
                  input event                 final_operation   ,
                  input vSysOob2PeArray_T     vSysOob2PeArray   ,
                  input vSysLane2PeArray_T    vSysLane2PeArray  ,
                  input mailbox               gen2rfP           ,
                  input event                 gen2rfP_ack       
                 );

        this.Id                = Id                 ;
        this.mgr2gen           = mgr2gen            ;
        this.mgr2gen_ack       = mgr2gen_ack        ;
        this.gen2drv           = gen2drv            ;
        this.gen2drv_ack       = gen2drv_ack        ;
        this.gen2oob           = gen2oob            ;
        this.gen2oob_ack       = gen2oob_ack        ;
        this.new_operation     = new_operation      ;
        this.final_operation   = final_operation    ;
        this.vSysOob2PeArray   = vSysOob2PeArray    ;
        this.vSysLane2PeArray  = vSysLane2PeArray   ;
        this.gen2rfP           = gen2rfP            ;
        this.gen2rfP_ack       = gen2rfP_ack        ;

    endfunction

    task run ();
        //$display("@%0t:%s:%0d: LEE: Running generator : {%0d,%0d}\n", $time, `__FILE__, `__LINE__, Id[0], Id[1]);
        // wait a few cycles before starting

        sys_operation_gen        =  new ()  ;  // copy of operation gcreated in manager, Generator re-creates different operand values
        sys_operation_gen.Id     =  Id      ;  // randomize needs to know which PE and lane

        repeat (20) @(vSysOob2PeArray.cb_test);  

        forever
            begin
                @(vSysOob2PeArray.cb_test);  
                if ( mgr2gen.num() != 0 )
                    begin
                        mgr2gen.peek(sys_operation_mgr);   //Taking the instruction from the manager
                        mgr2gen.get(sys_operation_mgr)  ;  //Removing the instruction from manager mailbox
                        //$display("@%0t:%s:%0d:LEE:Received operation from manager: {%0d,%0d}:%h\n", $time, `__FILE__, `__LINE__, Id[0], Id[1], sys_operation_mgr);
                        //sys_operation_mgr.displayOperationFoo(`__FILE__, `__LINE__);
                        -> mgr2gen_ack;  // have to ack right away and manager is in a for loop for each lane
                
                        
                        // Create a base operation and all operation sent to driver will be copies of this
                        // This allows us to keep track of what has been generated
                     
                        sys_operation_gen                 =  new sys_operation_mgr  ;  // seed object. Dont use directly as all lanes will use the same operation
                        sys_operation_gen.setPriorOperations(priorOperations) ;  // object may need to know what went before

/*
                        // DEBUG

                        $display("@%0t:%s:%0d:LEE:DEBUG:{%0d,%0d}\n", $time, `__FILE__, `__LINE__, Id[0], Id[1]);
                        sys_operation_gen.displayOperationFoo(`__FILE__, `__LINE__);

                        if ((Id[0]  == 63) && (Id[1] == 0) && (priorOperations.size > 0))
                            priorOperations[$].displayOperation();
                        else if ((Id[0]  == 63) && (Id[1] == 0))
                            $display("@%0t:%s:%0d:LEE:DEBUG:No prior operation:{%0d,%0d}\n", $time, `__FILE__, `__LINE__, Id[0], Id[1]);

*/


                        // randomize again to create operand values
                        assert(sys_operation_gen.randomize()) ;  // A previous randomize in the manager will have set the number of operands, so everything will be randomized except numberOfOperands

                       
                        
                        if (sys_operation_gen.OpType == `STREAMING_OP_CNTL_OPERATION_STD_NONE_NOP_TO_MEM )   // NOP
                            begin
                                $display("@%0t :%s:%0d: INFO: Generating NOP transfer to memory operation: {%0d,%0d}\n", $time, `__FILE__, `__LINE__, Id[0], Id[1]);
                                sys_operation_gen.create();
                                sys_operation = new sys_operation_gen ;  // create new operation and copy sys_operation_gen
                       
                                //$display("@%0t:%s:%0d:LEE: Setting regFile interface to stOp Controller driver: {%0d,%0d}\n", $time, `__FILE__, `__LINE__, Id[0], Id[1]);
                                oob_packet_new = new                                 ;
                                oob_packet_new.createFromOperation(0, sys_operation) ;
                                gen2rfP.put(oob_packet_new)                          ;
                                @gen2rfP_ack                                         ;  // wait for regFile inputs to be driven

                                //$display("@%0t:%s:%0d:LEE: Generating STD to memory copy operation to driver: {%0d,%0d} : starting at address %h: \n", $time, `__FILE__, `__LINE__, Id[0], Id[1], sys_operation.destinationAddress[0] );
                            end 
                       
                        else if(sys_operation_gen.OpType == `STREAMING_OP_CNTL_OPERATION_STD_STD_FP_MAC_TO_MEM )   // NOP
                            begin
                                $display("@%0t:%s:%0d: : INFO: Generating FP MAC operation: {%0d,%0d}\n", $time, `__FILE__, `__LINE__, Id[0], Id[1]);
                                sys_operation_gen.create();
                                sys_operation = new sys_operation_gen ;  // create new operation and copy sys_operation_gen
                       

                                //$display("@%0t:%s:%0d:LEE: Setting regFile interface to stOp Controller driver: {%0d,%0d}\n", $time, `__FILE__, `__LINE__, Id[0], Id[1]);
                                oob_packet_new = new                                 ;
                                oob_packet_new.createFromOperation(0, sys_operation) ;
                                gen2rfP.put(oob_packet_new)                          ;
                                @gen2rfP_ack                                         ;  // wait for regFile inputs to be driven

                                //$display("@%0t:%s:%0d:LEE: Generating FP MAC operation to driver: {%0d,%0d} with expected result of %f, %f <> %f : written to address : 0x%6h (0b%24b)\n", $time, `__FILE__, `__LINE__, Id[0], Id[1], sys_operation.result, sys_operation.resultHigh, sys_operation.resultLow, sys_operation.destinationAddress[0], sys_operation.destinationAddress[0] );
                            end
                        
                        else if(sys_operation_gen.OpType == `STREAMING_OP_CNTL_OPERATION_MEM_STD_FP_MAC_TO_MEM )  
                            begin
                                $display("@%0t:%s:%0d: : INFO: Generating FP MAC operation: {%0d,%0d}\n", $time, `__FILE__, `__LINE__, Id[0], Id[1]);
                                sys_operation_gen.create();
                                sys_operation = new sys_operation_gen ;  // create new operation and copy sys_operation_gen
                      
                                //$display("@%0t:%s:%0d:LEE:Setting regFile interface to stOp Controller driver: {%0d,%0d}\n", $time, `__FILE__, `__LINE__, Id[0], Id[1]);
                                oob_packet_new = new                                 ;
                                oob_packet_new.createFromOperation(0, sys_operation) ;
                                gen2rfP.put(oob_packet_new)                          ;
                                @gen2rfP_ack                                         ;  // wait for regFile inputs to be driven

                                //$display("@%0t:%s:%0d:LEE: Generating FP MAC operation to driver: {%0d,%0d} with expected result of %f, %f <> %f : written to address : 0x%6h (0b%24b)\n", $time, `__FILE__, `__LINE__, Id[0], Id[1], sys_operation.result, sys_operation.resultHigh, sys_operation.resultLow, sys_operation.destinationAddress[0], sys_operation.destinationAddress[0] );
                            end

/*
                        $display("@%0t:%s:%0d:LEE:DEBUG:{%0d,%0d}\n", $time, `__FILE__, `__LINE__, Id[0], Id[1]);
                        //if ((Id[0]  == 63) && (Id[1] == 0) )
                        sys_operation.displayOperationFoo(`__FILE__, `__LINE__);
*/


                        sys_operation.clearPriors();  // avoid nested pointers as we dont need here
                        priorOperations.push_back(sys_operation)                       ;  

                        // Send to driver
                        gen2drv.put(sys_operation)                    ;

                        // Keep copy of previous operations as they may influence future operations
                        priorOperations.push_back(sys_operation)       ;  // FIXME: do we need a queue in the base_operation??

                        // now wait for driver to take our sequence of operations
                        //sys_operation.displayOperation();
                        @gen2drv_ack;

                    end // if ( mgr2gen.num() != 0 )
            end  // forever
                
        

/*
        repeat (20) @(vSysOob2PeArray.cb_test);  

        // Create a base operation and all operation sent to driver will be copies of this
        // This allows us to keep track of what has been generated
        sys_operation_gen     =  new ()  ;  // seed object
        sys_operation_gen.Id  =  Id      ;  // randomize needs to know which PE and lane

        repeat (num_operations)                 //Number of transactions to be generated
            begin
                //assert (sys_operation_gen.randomize() );
                // FIXME: should we have a single source operation generator sending to all lane generators????
                sys_operation_gen.tId      = operationNum             ;
                assert(sys_operation_gen.randomize()) ;
                
                if (sys_operation_gen.OpType == `STREAMING_OP_CNTL_OPERATION_STD_NONE_NOP_TO_MEM )   // NOP
                    begin
                        $display("@%0t :%s:%0d: INFO: Generating NOP transfer to memory operation: {%0d,%0d}\n", $time, `__FILE__, `__LINE__, Id[0], Id[1]);
                        sys_operation_gen.create();
                        sys_operation = new sys_operation_gen ;  // create new operation and copy sys_operation_gen

                        operationNum++                                ;
                        //$display("@%0t:%s:%0d: LEE: Setting regFile interface to stOp Controller driver: {%0d,%0d}\n", $time, `__FILE__, `__LINE__, Id[0], Id[1]);
                        gen2rfP.put(sys_operation)                    ;
                        @gen2rfP_ack                                  ;  // wait for regFile inputs to be driven
                        //$display("@%0t:%s:%0d: LEE:generator.sv: Generating STD to memory copy operation to driver: {%0d,%0d} : starting at address %h: \n", $time, `__FILE__, `__LINE__, Id[0], Id[1], sys_operation.destinationAddress[0] );
                    end 

                else if(sys_operation_gen.OpType == `STREAMING_OP_CNTL_OPERATION_STD_STD_FP_MAC_TO_MEM )   // NOP
                    begin
                        $display("@%0t:%s:%0d: : INFO: Generating FP MAC operation: {%0d,%0d}\n", $time, `__FILE__, `__LINE__, Id[0], Id[1]);
                        sys_operation_gen.create();
                        sys_operation = new sys_operation_gen ;  // create new operation and copy sys_operation_gen

                        operationNum++                                ;
                        //$display("@%0t:%s:%0d: LEE: Setting regFile interface to stOp Controller driver: {%0d,%0d}\n", $time, `__FILE__, `__LINE__, Id[0], Id[1]);
                        gen2rfP.put(sys_operation)                    ;
                        @gen2rfP_ack                                  ;  // wait for regFile inputs to be driven
                        //$display("@%0t:%s:%0d: LEE:generator.sv: Generating FP MAC operation to driver: {%0d,%0d} with expected result of %f, %f <> %f : written to address : 0x%6h (0b%24b)\n", $time, `__FILE__, `__LINE__, Id[0], Id[1], sys_operation.result, sys_operation.resultHigh, sys_operation.resultLow, sys_operation.destinationAddress[0], sys_operation.destinationAddress[0] );
                    end
                
                else if(sys_operation_gen.OpType == `STREAMING_OP_CNTL_OPERATION_MEM_STD_FP_MAC_TO_MEM )  
                    begin
                        $display("@%0t:%s:%0d: : INFO: Generating FP MAC operation: {%0d,%0d}\n", $time, `__FILE__, `__LINE__, Id[0], Id[1]);
                        sys_operation_gen.create();
                        sys_operation = new sys_operation_gen ;  // create new operation and copy sys_operation_gen

                        operationNum++                                ;
                        //$display("@%0t:%s:%0d: LEE: Setting regFile interface to stOp Controller driver: {%0d,%0d}\n", $time, `__FILE__, `__LINE__, Id[0], Id[1]);
                        gen2rfP.put(sys_operation)                    ;
                        @gen2rfP_ack                                  ;  // wait for regFile inputs to be driven
                        //$display("@%0t:%s:%0d: LEE:generator.sv: Generating FP MAC operation to driver: {%0d,%0d} with expected result of %f, %f <> %f : written to address : 0x%6h (0b%24b)\n", $time, `__FILE__, `__LINE__, Id[0], Id[1], sys_operation.result, sys_operation.resultHigh, sys_operation.resultLow, sys_operation.destinationAddress[0], sys_operation.destinationAddress[0] );
                    end
                
                
                // Send to driver
                gen2drv.put(sys_operation)                    ;
                // Keep copy of previous operations as they may influence future operations
                priorOperations.push_back(sys_operation)       ;
                // now wait for driver to take our sequence of operations
                //sys_operation.displayOperation();
                @gen2drv_ack;
            end
           
        //-> final_operation;
*/
    endtask
endclass



