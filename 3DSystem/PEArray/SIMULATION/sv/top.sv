/*********************************************************************************************
    File name   : top.sv
    Author      : Lee B Baker
    Affiliation : North Carolina State University, Raleigh, NC
    Date        : Dec 2016
    Email       : lbbaker@ncsu.edu
    
    Description : This module is the top level. It contains the connections to and from the 
                  management layer, pe's and internal probe interfaces.
*********************************************************************************************/

`timescale 1ns/10ps

`include "TB_common.vh"
`include "common.vh"
`include "streamingOps_cntl.vh"
`include "streamingOps.vh"
`include "dma_cont.vh"
`include "mem_acc_cont.vh"
`include "pe.vh"
`include "pe_array.vh"
`include "noc_interpe_port_Bitmasks.vh"

module top;



    // system clock and reset
    logic reset_poweron       ;
    logic clk    =  0 ;

    always #5ns clk=~clk;

    initial begin
        reset_poweron            = 1;
        #100ns reset_poweron     = 0;
    end

    //----------------------------------------------------------------------------------------------------
    // Instantiate an interface for every pe/lane/stream pair
    //
    //                              pe  lane
    std_pe_lane_ifc    SysLane2PeArray [`PE_ARRAY_NUM_OF_PE][`PE_NUM_OF_EXEC_LANES] (.clk_lane            ( clk           ));  // [64] shorthand for [0:63] ....
    std_pe_oob_ifc     SysOob2PeArray  [`PE_ARRAY_NUM_OF_PE]                        (.clk_oob             ( clk           ));  

    //----------------------------------------------------------------------------------------------------
    // Probe interface(s)
    //
    // Write Memory probe
    pe_dma2mem_ifc    Dma2Mem      [`PE_ARRAY_NUM_OF_PE][`PE_NUM_OF_EXEC_LANES] (clk);  // shorthand for [0:63] ....

    //----------------------------------------------------------------------------------------------------
    // Probe interface(s) for forcing
    //
    // Regfile interface from SIMD
    regFileScalar2stOpCntl_ifc  RegFileScalar2StOpCntl    [`PE_ARRAY_NUM_OF_PE]                        (clk);
    regFileLane2stOpCntl_ifc    RegFileLane2StOpCntl      [`PE_ARRAY_NUM_OF_PE][`PE_NUM_OF_EXEC_LANES] (clk);

    // Load/Store interface from SIMD
    loadStore2memCntl_ifc       LoadStore2memCntl         [`PE_ARRAY_NUM_OF_PE]                        (clk);

    //----------------------------------------------------------------------------------------------------
    // Processing layer
    //
    pe_array pe_array_inst (
   
         // Downstream Stack bus Interface
         `include "TB_PEonly_system_stack_bus_downstream_instance_ports.vh"
       
        .clk               ( clk       ),
        .reset_poweron     ( reset_poweron     )
    );


    
    //----------------------------------------------------------------------------------------------------
    // Testbench
    //
        test  ti  (
                   .SysOob2PeArray         ( SysOob2PeArray         ) ,  // array of downstream stack bus OOB interfaces to each PE
                   .SysLane2PeArray        ( SysLane2PeArray        ) ,  // array of interfaces for each downstream pe/lane stack bus
                   .Dma2Mem                ( Dma2Mem                ) ,  // array of monitor probes for the DMA to Memory interface for each PE/Lane
                   .RegFileScalar2StOpCntl ( RegFileScalar2StOpCntl ) ,  // array of driver probes for the RegFile Scalar registers to stOp Controller for each PE
                   .RegFileLane2StOpCntl   ( RegFileLane2StOpCntl   ) ,  // array of driver probes for the RegFile Vector registers to stOp Controller for each PE/Lane
                   .LoadStore2memCntl      ( LoadStore2memCntl      ) ,  // array of driver probes for the Load/Store from SIMD to memory controller for each PE
                   .reset                  ( reset_poweron          ) 
                  );

    //----------------------------------------------------------------------------------------------------
    // Probes
    //
    // DMA to memory interface for result check
    genvar pe, lane;
    generate
//      `ifndef TB_PE_ONLY_GATES
//        for (pe=0; pe<`PE_ARRAY_NUM_OF_PE; pe=pe+1)
//          begin
//            for (lane=0; lane<`PE_NUM_OF_EXEC_LANES; lane=lane+1)
//              begin
//                // only observe stream 0
//                assign Dma2Mem[pe][lane].dma__memc__write_valid      = pe_array_inst.pe_inst[pe].pe.mem_acc_cont.dma__memc__write_valid0        ;
//                assign Dma2Mem[pe][lane].dma__memc__write_address    = pe_array_inst.pe_inst[pe].pe.mem_acc_cont.dma__memc__write_address0      ;
//                assign Dma2Mem[pe][lane].dma__memc__write_data       = pe_array_inst.pe_inst[pe].pe.mem_acc_cont.dma__memc__write_data0         ;
//                assign Dma2Mem[pe][lane].dma__memc__read_valid       = pe_array_inst.pe_inst[pe].pe.mem_acc_cont.dma__memc__read_valid0         ;
//                assign Dma2Mem[pe][lane].dma__memc__read_address     = pe_array_inst.pe_inst[pe].pe.mem_acc_cont.dma__memc__read_address0       ;
//                assign Dma2Mem[pe][lane].dma__memc__read_pause       = pe_array_inst.pe_inst[pe].pe.mem_acc_cont.dma__memc__read_pause0         ;
//
//                assign Dma2Mem[pe][lane].memc__dma__write_ready      = pe_array_inst.pe_inst[pe].pe.mem_acc_cont.memc__dma__write_ready0        ;
//                assign Dma2Mem[pe][lane].memc__dma__read_data        = pe_array_inst.pe_inst[pe].pe.mem_acc_cont.memc__dma__read_data0          ;
//                assign Dma2Mem[pe][lane].memc__dma__read_data_valid  = pe_array_inst.pe_inst[pe].pe.mem_acc_cont.memc__dma__read_data_valid0    ;
//                assign Dma2Mem[pe][lane].memc__dma__read_ready       = pe_array_inst.pe_inst[pe].pe.mem_acc_cont.memc__dma__read_ready0         ;
//              end
//        end
//      `else
        `include "TB_PEonly_connect_Dma2Mem.vh"
//      `endif
    endgenerate

    //----------------------------------------------------------------------------------------------------
    // Forces
    //
    // connect regFile interfaces to SIMD regFile to streaming Ops controller interface
    `ifdef TB_DRIVES_SIMD_REGFILE_INPUTS
    generate
       for (pe=0; pe<`PE_ARRAY_NUM_OF_PE; pe=pe+1)
           begin
               `ifdef TB_PE_ONLY_GATES
                 // the pe_cntl is blank because the regFIle driver sets simd reg's
                 assign  pe_array_inst.pe_inst[pe].pe.pe_cntl.cntl__sti__oob_ready      =  1'b1 ;
               `endif 

               assign  RegFileScalar2StOpCntl[pe].ready                  =  pe_array_inst.pe_inst[pe].pe.pe__sys__ready    ;  //.TB_regFileScalarDrv2stOpCntl
               assign  RegFileScalar2StOpCntl[pe].complete               =  pe_array_inst.pe_inst[pe].pe.pe__sys__complete ;  //.TB_regFileScalarDrv2stOpCntl
               assign  pe_array_inst.pe_inst[pe].pe.pe_cntl.cntl__simd__rs0      =  RegFileScalar2StOpCntl[pe].rs0                 ;  //.TB_regFileScalarDrv2stOpCntl
               assign  pe_array_inst.pe_inst[pe].pe.pe_cntl.cntl__simd__rs1      =  RegFileScalar2StOpCntl[pe].rs1                 ;  //.TB_regFileScalarDrv2stOpCntl
               for (lane=0; lane<`PE_NUM_OF_EXEC_LANES; lane=lane+1)
                   begin
                       `ifndef TB_PE_ONLY_GATES
                         assign  pe_array_inst.pe_inst[pe].pe.pe_cntl.cntl__simd__lane_r128[lane] =   RegFileLane2StOpCntl[pe][lane].r128 ;  //.TB_regFileLaneDrv2stOpCntl
                         assign  pe_array_inst.pe_inst[pe].pe.pe_cntl.cntl__simd__lane_r129[lane] =   RegFileLane2StOpCntl[pe][lane].r129 ;  //.TB_regFileLaneDrv2stOpCntl
                         assign  pe_array_inst.pe_inst[pe].pe.pe_cntl.cntl__simd__lane_r130[lane] =   RegFileLane2StOpCntl[pe][lane].r130 ;  //.TB_regFileLaneDrv2stOpCntl
                         assign  pe_array_inst.pe_inst[pe].pe.pe_cntl.cntl__simd__lane_r131[lane] =   RegFileLane2StOpCntl[pe][lane].r131 ;  //.TB_regFileLaneDrv2stOpCntl
                         assign  pe_array_inst.pe_inst[pe].pe.pe_cntl.cntl__simd__lane_r132[lane] =   RegFileLane2StOpCntl[pe][lane].r132 ;  //.TB_regFileLaneDrv2stOpCntl
                         assign  pe_array_inst.pe_inst[pe].pe.pe_cntl.cntl__simd__lane_r133[lane] =   RegFileLane2StOpCntl[pe][lane].r133 ;  //.TB_regFileLaneDrv2stOpCntl
                         assign  pe_array_inst.pe_inst[pe].pe.pe_cntl.cntl__simd__lane_r134[lane] =   RegFileLane2StOpCntl[pe][lane].r134 ;  //.TB_regFileLaneDrv2stOpCntl
                         assign  pe_array_inst.pe_inst[pe].pe.pe_cntl.cntl__simd__lane_r135[lane] =   RegFileLane2StOpCntl[pe][lane].r135 ;  //.TB_regFileLaneDrv2stOpCntl
                       `else
                         assign  pe_array_inst.pe_inst[pe].pe.pe_cntl.cntl__simd__lane_r128[((lane*32+32)-1):lane*32] =   RegFileLane2StOpCntl[pe][lane].r128 ;  //.TB_regFileLaneDrv2stOpCntl
                         assign  pe_array_inst.pe_inst[pe].pe.pe_cntl.cntl__simd__lane_r129[((lane*32+32)-1):lane*32] =   RegFileLane2StOpCntl[pe][lane].r129 ;  //.TB_regFileLaneDrv2stOpCntl
                         assign  pe_array_inst.pe_inst[pe].pe.pe_cntl.cntl__simd__lane_r130[((lane*32+32)-1):lane*32] =   RegFileLane2StOpCntl[pe][lane].r130 ;  //.TB_regFileLaneDrv2stOpCntl
                         assign  pe_array_inst.pe_inst[pe].pe.pe_cntl.cntl__simd__lane_r131[((lane*32+32)-1):lane*32] =   RegFileLane2StOpCntl[pe][lane].r131 ;  //.TB_regFileLaneDrv2stOpCntl
                         assign  pe_array_inst.pe_inst[pe].pe.pe_cntl.cntl__simd__lane_r132[((lane*32+32)-1):lane*32] =   RegFileLane2StOpCntl[pe][lane].r132 ;  //.TB_regFileLaneDrv2stOpCntl
                         assign  pe_array_inst.pe_inst[pe].pe.pe_cntl.cntl__simd__lane_r133[((lane*32+32)-1):lane*32] =   RegFileLane2StOpCntl[pe][lane].r133 ;  //.TB_regFileLaneDrv2stOpCntl
                         assign  pe_array_inst.pe_inst[pe].pe.pe_cntl.cntl__simd__lane_r134[((lane*32+32)-1):lane*32] =   RegFileLane2StOpCntl[pe][lane].r134 ;  //.TB_regFileLaneDrv2stOpCntl
                         assign  pe_array_inst.pe_inst[pe].pe.pe_cntl.cntl__simd__lane_r135[((lane*32+32)-1):lane*32] =   RegFileLane2StOpCntl[pe][lane].r135 ;  //.TB_regFileLaneDrv2stOpCntl
                       `endif
                   end
           end
    endgenerate
    `endif

    // connect Load/Store interface between SIMD and memory Controller
    generate
       for (pe=0; pe<`PE_ARRAY_NUM_OF_PE; pe=pe+1)
           begin
               //`ifndef TB_PE_ONLY_GATES
               assign (supply1, supply0) pe_array_inst.pe_inst[pe].pe.ldst__memc__request        =   LoadStore2memCntl [pe].ldst__memc__request       ;
               assign (supply1, supply0) pe_array_inst.pe_inst[pe].pe.ldst__memc__released       =   LoadStore2memCntl [pe].ldst__memc__released      ;
               assign (supply1, supply0) pe_array_inst.pe_inst[pe].pe.ldst__memc__write_address  =   LoadStore2memCntl [pe].ldst__memc__write_address ;
               assign (supply1, supply0) pe_array_inst.pe_inst[pe].pe.ldst__memc__write_data     =   LoadStore2memCntl [pe].ldst__memc__write_data    ;
               assign (supply1, supply0) pe_array_inst.pe_inst[pe].pe.ldst__memc__read_address   =   LoadStore2memCntl [pe].ldst__memc__read_address  ;
               assign (supply1, supply0) pe_array_inst.pe_inst[pe].pe.ldst__memc__write_valid    =   LoadStore2memCntl [pe].ldst__memc__write_valid   ;
               assign (supply1, supply0) pe_array_inst.pe_inst[pe].pe.ldst__memc__read_valid     =   LoadStore2memCntl [pe].ldst__memc__read_valid    ;
               //`endif
           end
    endgenerate

/*
    `ifdef TB_PE_ONLY_GATES
      initial
        begin
          for (int peId=0; peId<`PE_ARRAY_NUM_OF_PE; peId=peId+1)
            begin
              $readmemh($sformatf("./gatesInputFiles/pe%0d_pe_cntl_stOp_memory.dat", peId), pe_array_inst.pe[peId].pe_cntl.stOp_option_memory_0__gmemory.genblk23_mem2prf256x149.u0.mem_core_array);
            end
        end
    `endif
*/

    /*
    dut_probe_dma2mem probe_dma2mem(
             `include "TB_probe_dma2mem_connection.vh" 
                               );
    */
    //----------------------------------------------------------------------------------------------------
 


    //----------------------------------------------------------------------------------------------------
    // Testbench - random forces
    //

    /*
    int numOfTypes;
  
    initial
        begin
             numOfTypes = 20;
      
            @(posedge clk);
            `include "test_simd_init.vh"
            @(posedge clk);
            `include "test_std_std_fpmac_to_mem_init_step1.vh"
        end
     */

endmodule : top
