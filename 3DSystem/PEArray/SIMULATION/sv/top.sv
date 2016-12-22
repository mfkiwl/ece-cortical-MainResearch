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
    std_pe_lane_ifc    SysLane2PeArray [`PE_ARRAY_NUM_OF_PE][`PE_NUM_OF_EXEC_LANES] (.clk_lane            ( clk           ));  // shorthand for [0:63] ....
    std_pe_oob_ifc     SysOob2PeArray  [`PE_ARRAY_NUM_OF_PE]                        (.clk_oob             ( clk           ) ,
                                                                                     .reset_poweron       ( reset_poweron ));  

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


    //----------------------------------------------------------------------------------------------------
    // Processing layer
    //
    pe_array pe_array_inst (
   
         // Downstream Stack bus Interface
         `include "TB_system_stack_bus_downstream_instance_ports.vh"
       
        .clk               ( clk       ),
        .reset_poweron     ( reset_poweron     )
    );


    
    //----------------------------------------------------------------------------------------------------
    // Testbench
    //
        test  ti  (
                   SysLane2PeArray         ,  // array of interfaces for each downstream pe/lane stack bus
                   SysOob2PeArray          ,  // array of downstream stack bus OOB interfaces to each PE
                   Dma2Mem                 ,  // array of monitor probes for the DMA to Memory interface for each PE/Lane
                   RegFileScalar2StOpCntl  ,  // array of driver probes for the RegFile Vector registers to stOp Controller for each PE/Lane
                   RegFileLane2StOpCntl    ,  // array of driver probes for the RegFile Vector registers to stOp Controller for each PE/Lane
                   reset_poweron
                  );

    //----------------------------------------------------------------------------------------------------
    // Probes
    //
    // DMA to memory interface for result check
    genvar pe, lane;
    generate
       for (pe=0; pe<`PE_ARRAY_NUM_OF_PE; pe=pe+1)
           begin
               for (lane=0; lane<`PE_NUM_OF_EXEC_LANES; lane=lane+1)
                   begin
                       assign Dma2Mem[pe][lane].dma__memc__write_valid      = pe_array_inst.pe_inst[pe].pe.stOp_lane[lane].streamingOps_datapath.dma_cont.dma__memc__write_valid0        ;
                       assign Dma2Mem[pe][lane].dma__memc__write_address    = pe_array_inst.pe_inst[pe].pe.stOp_lane[lane].streamingOps_datapath.dma_cont.dma__memc__write_address0      ;
                       assign Dma2Mem[pe][lane].dma__memc__write_data       = pe_array_inst.pe_inst[pe].pe.stOp_lane[lane].streamingOps_datapath.dma_cont.dma__memc__write_data0         ;
                       assign Dma2Mem[pe][lane].dma__memc__read_valid       = pe_array_inst.pe_inst[pe].pe.stOp_lane[lane].streamingOps_datapath.dma_cont.dma__memc__read_valid0         ;
                       assign Dma2Mem[pe][lane].dma__memc__read_address     = pe_array_inst.pe_inst[pe].pe.stOp_lane[lane].streamingOps_datapath.dma_cont.dma__memc__read_address0       ;
                       assign Dma2Mem[pe][lane].dma__memc__read_pause       = pe_array_inst.pe_inst[pe].pe.stOp_lane[lane].streamingOps_datapath.dma_cont.dma__memc__read_pause0         ;

                       assign Dma2Mem[pe][lane].memc__dma__write_ready      = pe_array_inst.pe_inst[pe].pe.stOp_lane[lane].streamingOps_datapath.dma_cont.memc__dma__write_ready0        ;
                       assign Dma2Mem[pe][lane].memc__dma__read_data        = pe_array_inst.pe_inst[pe].pe.stOp_lane[lane].streamingOps_datapath.dma_cont.memc__dma__read_data0          ;
                       assign Dma2Mem[pe][lane].memc__dma__read_data_valid  = pe_array_inst.pe_inst[pe].pe.stOp_lane[lane].streamingOps_datapath.dma_cont.memc__dma__read_data_valid0    ;
                       assign Dma2Mem[pe][lane].memc__dma__read_ready       = pe_array_inst.pe_inst[pe].pe.stOp_lane[lane].streamingOps_datapath.dma_cont.memc__dma__read_ready0         ;
                   end
           end
    endgenerate

    //----------------------------------------------------------------------------------------------------
    // Forces
    //
    // connect regFile interfaces to SIMD regFile to streaming Ops controller interface
    generate
       for (pe=0; pe<`PE_ARRAY_NUM_OF_PE; pe=pe+1)
           begin
               assign pe_array_inst.pe_inst[pe].pe.simd__cntl__rs0  =   RegFileScalar2StOpCntl[pe].rs0 ;  //.TB_regFileScalarDrv2stOpCntl
               assign pe_array_inst.pe_inst[pe].pe.simd__cntl__rs1  =   RegFileScalar2StOpCntl[pe].rs1 ;  //.TB_regFileScalarDrv2stOpCntl
               for (lane=0; lane<`PE_NUM_OF_EXEC_LANES; lane=lane+1)
                   begin
                       assign pe_array_inst.pe_inst[pe].pe.simd__cntl__lane_r128[lane] =   RegFileLane2StOpCntl[pe][lane].r128 ;  //.TB_regFileLaneDrv2stOpCntl
                       assign pe_array_inst.pe_inst[pe].pe.simd__cntl__lane_r129[lane] =   RegFileLane2StOpCntl[pe][lane].r129 ;  //.TB_regFileLaneDrv2stOpCntl
                       assign pe_array_inst.pe_inst[pe].pe.simd__cntl__lane_r130[lane] =   RegFileLane2StOpCntl[pe][lane].r130 ;  //.TB_regFileLaneDrv2stOpCntl
                       assign pe_array_inst.pe_inst[pe].pe.simd__cntl__lane_r131[lane] =   RegFileLane2StOpCntl[pe][lane].r131 ;  //.TB_regFileLaneDrv2stOpCntl
                       assign pe_array_inst.pe_inst[pe].pe.simd__cntl__lane_r132[lane] =   RegFileLane2StOpCntl[pe][lane].r132 ;  //.TB_regFileLaneDrv2stOpCntl
                       assign pe_array_inst.pe_inst[pe].pe.simd__cntl__lane_r133[lane] =   RegFileLane2StOpCntl[pe][lane].r133 ;  //.TB_regFileLaneDrv2stOpCntl
                       assign pe_array_inst.pe_inst[pe].pe.simd__cntl__lane_r134[lane] =   RegFileLane2StOpCntl[pe][lane].r134 ;  //.TB_regFileLaneDrv2stOpCntl
                       assign pe_array_inst.pe_inst[pe].pe.simd__cntl__lane_r135[lane] =   RegFileLane2StOpCntl[pe][lane].r135 ;  //.TB_regFileLaneDrv2stOpCntl
                   end
           end
    endgenerate


    /*
    dut_probe_dma2mem probe_dma2mem(
             `include "TB_probe_dma2mem_connection.vh" 
                               );
    */
    //----------------------------------------------------------------------------------------------------
 


    //----------------------------------------------------------------------------------------------------
    // Testbench - random forces
    //

    int numOfTypes;
  
    initial
        begin
             numOfTypes = 20;
      
            @(posedge clk);
            `include "test_simd_init.vh"
            @(posedge clk);
            `include "test_std_std_fpmac_to_mem_init_step1.vh"
        end

endmodule : top
