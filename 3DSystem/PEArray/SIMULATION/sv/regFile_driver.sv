/*********************************************************************************************
    File name   : regFile_driver.sv
    Author      : Lee Baker
    Affiliation : North Carolina State University, Raleigh, NC
    Date        : Dec 2016
    Email       : lbbaker@ncsu.edu
    
    Description : Drives the register file ports into the streaming Ops controller
                  FIXME : not required once we get the SIMD path working
*********************************************************************************************/

`include "common.vh"
`include "streamingOps_cntl.vh"
`include "streamingOps.vh"
`include "dma_cont.vh"
`include "mem_acc_cont.vh"
`include "pe.vh"
`include "pe_array.vh"
`include "noc_interpe_port_Bitmasks.vh"

`include "TB_streamingOps_cntl.vh"

import virtual_interface::*;
import operation::*;

class regFile_driver;
    
    int       Id [2]        ; // PE, lane
    mailbox   gen2rfP      ;
    event     gen2rfP_ack  ;
    event     finished      ;

    base_operation sys_operation;
    PE_DATA_TYPE pe_data_type ;

    vRegFileScalarDrv2stOpCntl_T  vP_srf ;
    vRegFileLaneDrv2stOpCntl_T    vP_vrf ;

    int i=0,j=0;
    int found = 0;

    function new (
                  input int                             Id[2]         ,
                  input vRegFileScalarDrv2stOpCntl_T    vP_srf        ,
                  input vRegFileLaneDrv2stOpCntl_T      vP_vrf        ,
                  input mailbox                         gen2rfP       ,
                  input event                           gen2rfP_ack ) ;

        this.Id           = Id            ;
        this.vP_srf       = vP_srf        ;
        this.vP_vrf       = vP_vrf        ;
        this.gen2rfP      = gen2rfP       ;
        this.gen2rfP_ack  = gen2rfP_ack   ;
    endfunction

    task run (); 

        sys_operation=new();


        forever 
            begin
                if ( gen2rfP.num() != 0 )
                    begin
                        $display ($time,": INFO:REGFILE DRIVER :: Operation received for {%02d,%02d}", Id[0], Id[1]);
                        gen2rfP.peek(sys_operation);   //Taking the transaction from the generator mailbox

                        if (sys_operation.OpType == `STREAMING_OP_CNTL_OPERATION_STD_STD_FP_MAC_TO_MEM )
                            begin
                                pe_data_type = PE_DATA_TYPE_WORD ;
                                $display("@%0t INFO: Received FP MAC operation from driver: {%0d,%0d} with expected result of %f, %f <> %f : written to address : 0x%6h (0b%24b)\n", $time,Id[0], Id[1], sys_operation.result, sys_operation.resultHigh, sys_operation.resultLow, sys_operation.destinationAddress[0], sys_operation.destinationAddress[0] );
                                // Make sure address is local to PE
                                if (sys_operation.destinationAddress[0][`PE_CHIPLET_ADDR_BITS_RANGE] != Id[0])
                                  begin
                                    $display("@%0t ERROR: Destination address not within this PE\'s local memory: {%0d,%0d} : %h\n", $time,Id[0], Id[1], sys_operation.destinationAddress[0][`PE_CHIPLET_ADDR_BITS_RANGE] );
                                  end
                                if (sys_operation.destinationAddress[0][`PE_CHIPLET_LANE_ADDR_BITS_RANGE] != Id[1])
                                  begin
                                    $display("@%0t ERROR: Destination address not within this PE\'s local lane address space: {%0d,%0d} : %h\n", $time,Id[0], Id[1], sys_operation.destinationAddress[0][`PE_CHIPLET_LANE_ADDR_BITS_RANGE] );
                                  end
                                //vP_vrf.r134 = (Id[0] << `PE_CHIPLET_ADDRESS_WIDTH ) | (Id[1] << `PE_CHIPLET_LANE_ADDRESS_WIDTH) | sys_operation.destinationAddress[0];
                                //vP_vrf.r135 = (Id[0] << `PE_CHIPLET_ADDRESS_WIDTH ) | (Id[1] << `PE_CHIPLET_LANE_ADDRESS_WIDTH) | sys_operation.destinationAddress[1];
                                // Now address is constrained in the base_operation to be within a PE and lane portion of local memory
                                vP_vrf.r134 = sys_operation.destinationAddress[0];
                                vP_vrf.r135 = sys_operation.destinationAddress[1];
                                //vP_vrf.r134 = (Id[0] << `PE_CHIPLET_ADDRESS_WIDTH ) | (Id[1] << `PE_CHIPLET_LANE_ADDRESS_WIDTH) | 32'b__0_0000_1000_0000;
                                //vP_vrf.r135 = (Id[0] << `PE_CHIPLET_ADDRESS_WIDTH ) | (Id[1] << `PE_CHIPLET_LANE_ADDRESS_WIDTH) | 32'b__0_1000_0000_0000;
                                //r134 [{1}] = 6'd32\'b'.format(pe,lane) + '{0:0>6}'.format(bin(pe).split('b')[1]) + "_" + '{0:0>5}'.format(bin(lane).split('b')[1]) + '__0_0000_1000_0000;'
                                vP_vrf.cb_out.r132[19:16] <= pe_data_type ;  // type (bit, nibble, byte, word)
                                vP_vrf.cb_out.r132[15: 0] <= sys_operation.numberOfOperands ;    // num of types - for dma
                                vP_vrf.cb_out.r133[19:16] <= pe_data_type ;  // type (bit, nibble, byte, word)
                                vP_vrf.cb_out.r133[15: 0] <= sys_operation.numberOfOperands ;
                                vP_srf.cb_out.rs0[0]      <= 1'b1;
                                vP_srf.cb_out.rs0[31:1]   <= `STREAMING_OP_CNTL_OPERATION_STD_STD_FP_MAC_TO_MEM ;
                                vP_srf.cb_out.rs1         <= {32{1'b1}};
                            end

                        gen2rfP.get(sys_operation);   //Remove the transaction from the driver mailbox
                        -> gen2rfP_ack;
                        $display ($time,": INFO:REGFILE DRIVER :: Operation driven for {%02d,%02d}", Id[0], Id[1]);
                    end
                else
                    begin
                         @(vP_vrf.cb_out);
                    end
 
            end
    endtask


endclass
