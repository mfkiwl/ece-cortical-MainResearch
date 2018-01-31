/*********************************************************************************************

    File name   : simd_core.v
    Author      : Lee Baker
    Affiliation : North Carolina State University, Raleigh, NC
    Date        : June 2017
    email       : lbbaker@ncsu.edu

    Description : This module contains the SIMD unit


*********************************************************************************************/
    
`timescale 1ns/10ps
`include "common.vh"
`include "pe_array.vh"
`include "pe.vh"
`include "pe_cntl.vh"
`include "simd_core.vh"
`include "simd_wrapper.vh"
`include "stack_interface.vh"
`include "noc_cntl.vh"
`include "streamingOps_cntl.vh"
`include "streamingOps.vh"
`include "dma_cont.vh"
`include "mem_acc_cont.vh"


`ifndef SYNTHESIS
  `include "/afs/eos.ncsu.edu/dist/synopsys2013/syn/dw/sim_ver/DW_fp_cmp.v"
  `include "/afs/eos.ncsu.edu/dist/synopsys2013/syn/dw/sim_ver/DW_fp_mac.v"
  `include "/afs/eos.ncsu.edu/dist/synopsys2013/syn/dw/sim_ver/DW_fp_exp.v"
  `include "/afs/eos.ncsu.edu/dist/synopsys2013/syn/dw/sim_ver/DW_fp_div.v"
  `include "/afs/eos.ncsu.edu/dist/synopsys2013/syn/dw/sim_ver/DW_fp_div_seq.v"

  `include "/afs/eos.ncsu.edu/dist/synopsys2013/syn/dw/sim_ver/DW_fp_flt2i.v"
  `include "/afs/eos.ncsu.edu/dist/synopsys2013/syn/dw/sim_ver/DW_fp_i2flt.v"
  `include "/afs/eos.ncsu.edu/dist/synopsys2013/syn/dw/sim_ver/DW_fp_sub.v"
  `include "/afs/eos.ncsu.edu/dist/synopsys2013/syn/dw/sim_ver/DW_fp_add.v"
  `include "/afs/eos.ncsu.edu/dist/synopsys2013/syn/dw/sim_ver/DW_fp_exp2.v"

  `include "/afs/eos.ncsu.edu/dist/synopsys2013/syn/dw/sim_ver/DW_fp_addsub.v"
  `include "/afs/eos.ncsu.edu/dist/synopsys2013/syn/dw/sim_ver/DW_exp2.v"
`endif


module simd_core (
                    //----------------------------------------------------------------------------------------------------
                    // Control
                    input  wire                                           cntl__simd__cfg_valid                                                ,
                    input  wire  [`SIMD_CORE_OPERATION_RANGE         ]    cntl__simd__cfg_operation                                            , 
                    input  wire  [`SIMD_WRAP_OPERATION_TYPE_RANGE    ]    cntl__simd__cfg_wrap_op        [`SIMD_WRAP_OPERATION_NUM_OF_STAGES ] ,
                    input  wire  [`PE_EXEC_LANE_ID_RANGE             ]    cntl__simd__cfg_wrap_op_idx                                          ,
                    input  wire                                           cntl__simd__cfg_wrap_op_inc                                          ,
                                                                                                                       
                    input  wire  [`PE_NUM_OF_EXEC_LANES_RANGE        ]    smdw__simd__regs_valid                           ,
                    input  wire  [`COMMON_STD_INTF_CNTL_RANGE        ]    smdw__simd__regs_cntl   [`PE_NUM_OF_EXEC_LANES ] ,
                    input  wire  [`PE_EXEC_LANE_WIDTH_RANGE          ]    smdw__simd__regs        [`PE_NUM_OF_EXEC_LANES ] ,

                    output reg                                            simd__smdw__processing                           ,
                    output reg                                            simd__smdw__complete                             ,
                    output reg   [`COMMON_STD_INTF_CNTL_RANGE        ]    simd__smdw__regs_cntl   [`PE_NUM_OF_EXEC_LANES ] ,
                    output reg   [`PE_NUM_OF_EXEC_LANES_RANGE        ]    simd__smdw__regs_valid                           ,
                    output reg   [`PE_EXEC_LANE_WIDTH_RANGE          ]    simd__smdw__regs        [`PE_NUM_OF_EXEC_LANES ] ,
                  
                    //----------------------------------------------------------------------------------------------------
                    // interface to LD/ST unit                                         
                    output reg                                            ldst__memc__request          ,
                    input  wire                                           memc__ldst__granted          ,
                    output reg                                            ldst__memc__released         ,
                    //                                                   
                    output reg                                            ldst__memc__write_valid     , 
                    output reg   [`MEM_ACC_CONT_MEMORY_ADDRESS_RANGE ]    ldst__memc__write_address   ,
                    output reg   [`MEM_ACC_CONT_MEMORY_DATA_RANGE    ]    ldst__memc__write_data      , 
                    input  wire                                           memc__ldst__write_ready     ,
                    output reg                                            ldst__memc__read_valid      , 
                    output reg   [`MEM_ACC_CONT_MEMORY_ADDRESS_RANGE ]    ldst__memc__read_address    ,
                    input  wire  [`MEM_ACC_CONT_MEMORY_DATA_RANGE    ]    memc__ldst__read_data       , 
                    input  wire                                           memc__ldst__read_data_valid , 
                    input  wire                                           memc__ldst__read_ready      , 
                    output reg                                            ldst__memc__read_pause      , 
                  
                    //----------------------------------------------------------------------------------------------------
                    // System
                    input  wire   [`PE_PE_ID_RANGE                   ]    peId                        , 
                    input  wire                                           clk                         ,
                    input  wire                                           reset_poweron               
                  
    );

  //----------------------------------------------------------------------------------------------------
  // Registers/Wires
  //

  reg                                            start_special_function                                            ;  
  reg                                            special_functions_complete                                        ; 
  reg   [`SIMD_WRAP_OPERATION_VEC_RANGE     ]    special_function_done                                             ; 

  reg   [`SIMD_WRAP_SFU_COUNT_RANGE         ]    special_op_index                                                  ;
  reg   [`SIMD_WRAP_OPERATION_TYPE_RANGE    ]    special_op                                                        ;
  reg   [`SIMD_WRAP_OPERATION_TYPE_RANGE    ]    curr_special_op                                                   ;  // latch special op


  reg   [`PE_EXEC_LANE_WIDTH_RANGE          ]    special_function_value                                            ;
  wire  [`PE_EXEC_LANE_WIDTH_RANGE          ]    special_function_out        [`SIMD_CORE_OPERATION_PC_NUM_OF_OPS ] ;
  wire  [`SIMD_CORE_SFU_CMP_RANGE           ]    special_function_cmp_flag                                         ;  // eq, lt, gt
  reg                                            load_sfu_value                                                    ;

  reg                                            cntl__simd__cfg_valid_d1                                                ;
  reg   [`SIMD_CORE_OPERATION_RANGE         ]    cntl__simd__cfg_operation_d1                                            ; 
  reg   [`SIMD_WRAP_OPERATION_TYPE_RANGE    ]    cntl__simd__cfg_wrap_op_d1        [`SIMD_WRAP_OPERATION_NUM_OF_STAGES ] ;
  reg   [`PE_EXEC_LANE_ID_RANGE             ]    cntl__simd__cfg_wrap_op_idx_d1                                          ;
  reg                                            cntl__simd__cfg_wrap_op_inc_d1                                          ;


  always @(posedge clk)
    begin
      cntl__simd__cfg_valid_d1         <= (reset_poweron) ? 1'b0 : cntl__simd__cfg_valid        ;
      cntl__simd__cfg_operation_d1     <=                          cntl__simd__cfg_operation    ;
      cntl__simd__cfg_wrap_op_idx_d1   <=                          cntl__simd__cfg_wrap_op_idx  ;
      cntl__simd__cfg_wrap_op_inc_d1   <=                          cntl__simd__cfg_wrap_op_inc  ;
    end


  genvar gvi;
  generate
    for (gvi=0; gvi<`SIMD_WRAP_OPERATION_NUM_OF_STAGES; gvi++)
      begin
        always @(*)
          begin
            cntl__simd__cfg_wrap_op_d1 [gvi]  <=  cntl__simd__cfg_wrap_op [gvi];
          end
      end          
  endgenerate


  // store regs for processing
  reg   [`PE_NUM_OF_EXEC_LANES_RANGE      ]      input_regs_valid                      ;
  reg   [`PE_EXEC_LANE_WIDTH_RANGE        ]      input_regs  [`PE_NUM_OF_EXEC_LANES ]  ;

  reg   [`PE_NUM_OF_EXEC_LANES_RANGE      ]      sfu_regs_valid                        ;
  reg   [`PE_EXEC_LANE_WIDTH_RANGE        ]      sfu_regs  [`PE_NUM_OF_EXEC_LANES ]    ;

  reg                                            simd_output_valid                     ;
  reg   [`PE_NUM_OF_EXEC_LANES_RANGE      ]      simd_regs_valid                       ;
  reg   [`PE_EXEC_LANE_WIDTH_RANGE        ]      simd_regs   [`PE_NUM_OF_EXEC_LANES ]  ;


  
  always @(posedge clk)
    begin
      ldst__memc__request         <= 'd0 ;
      ldst__memc__released        <= 'd1 ;
      
      ldst__memc__write_valid     <= 'd0 ; 
      ldst__memc__write_address   <= 'd0 ;
      ldst__memc__write_data      <= 'd0 ; 
      ldst__memc__read_valid      <= 'd0 ; 
      ldst__memc__read_address    <= 'd0 ;
      ldst__memc__read_pause      <= 'd0 ; 
    end

  //----------------------------------------------------------------------------------------------------
  // Local register for multi-instruction operations
  reg                                                                 reset_local_index                           ;  // which operation will reset save index
  reg                                                                 inc_local_index                             ;  // which operation will increment save index
  reg   [`PE_EXEC_LANE_ID_RANGE                                   ]   local_index                                 ;  // which local register to store wrapper result
  reg   [`PE_EXEC_LANE_WIDTH_RANGE                                ]   local_regs        [`PE_NUM_OF_EXEC_LANES ]  ;
  reg   [`PE_EXEC_LANE_WIDTH_RANGE                                ]   load_local_reg                              ;  // 
  reg   [`PE_EXEC_LANE_WIDTH_RANGE                                ]   local_regs_valid                            ;  // 

  //----------------------------------------------------------------------------------------------------
  //
  // SIMD Controller
  //
  

  reg [`SIMD_CORE_CNTL_STATE_RANGE ] simd_core_cntl_state      ; // state flop
  reg [`SIMD_CORE_CNTL_STATE_RANGE ] simd_core_cntl_state_next ;
  
  

  // State register 
  always @(posedge clk)
    begin
      simd_core_cntl_state <= ( reset_poweron ) ? `SIMD_CORE_CNTL_WAIT       :
                                                  simd_core_cntl_state_next  ;
    end
  
 
  always @(*)
    begin
      case (simd_core_cntl_state)  // synopsys parallel_case

        
        `SIMD_CORE_CNTL_WAIT: 
          simd_core_cntl_state_next =  ( cntl__simd__cfg_valid ) ? `SIMD_CORE_CNTL_PREPARE_OP :  
                                                                   `SIMD_CORE_CNTL_WAIT       ;
  
        // check simd enable bit in simd operation memory
        `SIMD_CORE_CNTL_PREPARE_OP: 
          simd_core_cntl_state_next =  //(cntl__simd__cfg_operation [`SIMD_CORE_OPERATION_PC_RANGE ] != `SIMD_CORE_OPERATION_PC_NOP ) ?  `SIMD_CORE_CNTL_SFU              :
                                                                                                                                       `SIMD_CORE_CNTL_SFU_START    ;
          
        `SIMD_CORE_CNTL_SFU_START: 
          simd_core_cntl_state_next =  `SIMD_CORE_CNTL_SFU_RUNNING        ;
          
        `SIMD_CORE_CNTL_SFU_RUNNING: 
          simd_core_cntl_state_next =  (special_functions_complete) ? `SIMD_CORE_CNTL_SFU_COMPLETE  :
                                                                      `SIMD_CORE_CNTL_SFU_RUNNING   ;
          
        `SIMD_CORE_CNTL_SFU_COMPLETE: 
          simd_core_cntl_state_next =   (special_op == `SIMD_WRAP_OPERATION_NOP)  ?  `SIMD_CORE_CNTL_WAIT_FOR_SIMD :
                                                                                     `SIMD_CORE_CNTL_SFU_START     ;
          
        `SIMD_CORE_CNTL_WAIT_FOR_SIMD: 
          simd_core_cntl_state_next =  `SIMD_CORE_CNTL_SEND_DATA        ;
          
        `SIMD_CORE_CNTL_SEND_DATA: 
          simd_core_cntl_state_next =  `SIMD_CORE_CNTL_WAIT_FOR_COMPLETE   ;

        `SIMD_CORE_CNTL_WAIT_FOR_COMPLETE:
          simd_core_cntl_state_next =   `SIMD_CORE_CNTL_WAIT_COMPLETE_DEASSERTED  ;


        `SIMD_CORE_CNTL_WAIT_COMPLETE_DEASSERTED:
          simd_core_cntl_state_next =   `SIMD_CORE_CNTL_COMPLETE  ;

        `SIMD_CORE_CNTL_COMPLETE:
          simd_core_cntl_state_next =   `SIMD_CORE_CNTL_WAIT    ; 

        // Latch state on error
        `SIMD_CORE_CNTL_ERR:
          simd_core_cntl_state_next = `SIMD_CORE_CNTL_ERR ;
  
        default:
          simd_core_cntl_state_next = `SIMD_CORE_CNTL_WAIT ;
    
      endcase // case(so_cntl_state)
    end // always @ (*)
  

  //----------------------------------------------------------------------------------------------------
  // Assignments
  //

  genvar lane;
  generate
    for (lane=0; lane<`PE_NUM_OF_EXEC_LANES; lane++)
      begin
        always @(posedge clk)
          begin
            simd__smdw__regs_cntl  [lane] <= `COMMON_STD_INTF_CNTL_SOM_EOM  ;
/*
            simd__smdw__regs_valid [lane] <= //( load_sfu_value ) ? special_function_value :  // FIXME
                                                                    sfu_regs_valid [lane]  ;
            simd__smdw__regs       [lane] <= //( load_sfu_value ) ? special_function_value :  // FIXME
                                                                    sfu_regs [lane]        ;
*/

            simd__smdw__regs_valid [lane]  <= ( simd_core_cntl_state == `SIMD_CORE_CNTL_COMPLETE  )  ?  sfu_regs_valid[lane]   :
                                                                                                       'd0                     ;
                                                                                                                           
            simd__smdw__regs       [lane]  <= ( simd_core_cntl_state == `SIMD_CORE_CNTL_COMPLETE  )  ?  sfu_regs[lane]         :
                                                                                                        simd__smdw__regs[lane] ;
        
          end
      end
  endgenerate
 
  always @(posedge clk)
    begin
      simd_output_valid       <= (simd_core_cntl_state == `SIMD_CORE_CNTL_COMPLETE );

      simd__smdw__processing  <= (simd_core_cntl_state != `SIMD_CORE_CNTL_WAIT );

      simd__smdw__complete    <= ( reset_poweron )  ?  1'b0  : simd_output_valid ;
    end

  assign   start_special_function    = (simd_core_cntl_state == `SIMD_CORE_CNTL_SFU_START );

  assign   load_sfu_value         = (simd_core_cntl_state == `SIMD_CORE_CNTL_SFU_RUNNING);
  
  // latch input until cfg is valid
  generate
    for (lane=0; lane<`PE_NUM_OF_EXEC_LANES; lane++)
      begin
        always @(posedge clk)
          begin
            input_regs_valid [lane]  <= ( simd_core_cntl_state == `SIMD_CORE_CNTL_WAIT  )  ?  smdw__simd__regs_valid[lane] :
                                                                                              input_regs_valid[lane]       ;
                                                                                                                           
            input_regs       [lane]  <= ( simd_core_cntl_state == `SIMD_CORE_CNTL_WAIT  )  ?  smdw__simd__regs[lane]       :
                                                                                              input_regs[lane]             ;
        
          end
      end
  endgenerate


  //----------------------------------------------------------------------------------------------------
  // Mux result data to global sfu output

  reg   [`PE_EXEC_LANE_WIDTH_RANGE      ]   sfu_add_local_regs        [`PE_NUM_OF_EXEC_LANES ]  ;
  reg   [`PE_EXEC_LANE_WIDTH_RANGE      ]   sfu_add_load_local_reg                              ;  // 

  generate
    for (lane=0; lane<`PE_NUM_OF_EXEC_LANES; lane++)
      begin
        always @(posedge clk)
          begin
   //         if ( simd_core_cntl_state == `SIMD_CORE_CNTL_SFU_COMPLETE)
   //           begin
                casex(special_function_done)
                  //--------------------------------------------------
                  // NOP
                  16'bxxxx_xxxx_xxxx_xxx1: 
                    begin
                      sfu_regs_valid [lane]  <= input_regs_valid[lane] ;
                                                                         
                      sfu_regs       [lane]  <= input_regs[lane]       ;
                    end
                  //--------------------------------------------------
                  // ReLu
                  16'bxxxx_xxxx_xxxx_xx1x: 
                    begin
                      sfu_regs_valid [lane]  <=  input_regs_valid[lane] ;
                                                                                                                                     
                      sfu_regs       [lane]  <= ( input_regs[lane][`COMMON_IEEE754_SIGN_RANGE]  )  ?  `COMMON_IEEE754_FLOAT_ZERO  :
                                                                                                       input_regs [lane]          ;
                    end
                  //--------------------------------------------------
                  // SUM_SAVE
                  16'bxxxx_xxxx_xxxx_x1xx: 
                    begin
                      sfu_regs_valid [lane]  <= (sfu_add_load_local_reg [lane]) ? 1'b1                      :  sfu_regs_valid [lane] ;

                      sfu_regs       [lane]  <= (sfu_add_load_local_reg [lane]) ? sfu_add_local_regs [lane] :  sfu_regs       [lane] ;
                    end
                  //--------------------------------------------------
                  // SUM_ACC
                  16'bxxxx_xxxx_xxxx_1xxx: 
                    begin
                      sfu_regs_valid [lane]  <= (sfu_add_load_local_reg [lane]) ? 1'b1                      :  sfu_regs_valid [lane] ;

                      sfu_regs       [lane]  <= (sfu_add_load_local_reg [lane]) ? sfu_add_local_regs [lane] :  sfu_regs       [lane] ;
                    end
                  //--------------------------------------------------
                  // SUM_SEND
                  16'bxxxx_xxxx_xxx1_xxxx: 
                    begin
                      sfu_regs_valid [lane]  <= (sfu_add_load_local_reg [lane]) ? 1'b1                      :  sfu_regs_valid [lane] ;

                      sfu_regs       [lane]  <= (sfu_add_load_local_reg [lane]) ? sfu_add_local_regs [lane] :  sfu_regs       [lane] ;
                    end
                endcase
          //    end
          end
      end
  endgenerate

  generate
    for (lane=0; lane<`PE_NUM_OF_EXEC_LANES; lane++)
      begin
        always @(posedge clk)
          begin
   //         if ( simd_core_cntl_state == `SIMD_CORE_CNTL_SFU_COMPLETE)
   //           begin
            if (reset_poweron)
              begin
                local_regs_valid [lane]  <= 'b0 ;
                                                                         
                local_regs       [lane]  <= 'd0 ;
              end
            else
              begin
                casex(special_function_done)
                  //--------------------------------------------------
                  // NOP
                  16'bxxxx_xxxx_xxxx_xxx1: 
                    begin
                      local_regs_valid [lane]  <= input_regs_valid[lane] ;
                                                                         
                      local_regs       [lane]  <= input_regs[lane]       ;
                    end
                  //--------------------------------------------------
                  // ReLu
                  16'bxxxx_xxxx_xxxx_xx1x: 
                    begin
                      local_regs_valid [lane]  <=  input_regs_valid[lane] ;
                                                                                                                                     
                      local_regs       [lane]  <= ( input_regs[lane][`COMMON_IEEE754_SIGN_RANGE]  )  ?  `COMMON_IEEE754_FLOAT_ZERO  :
                                                                                                       input_regs [lane]          ;
                    end
                  //--------------------------------------------------
                  // SUM_SAVE
                  16'bxxxx_xxxx_xxxx_x1xx: 
                    begin
                      local_regs_valid [lane]  <= sfu_add_load_local_reg [lane] ;

                      local_regs       [lane]  <= (sfu_add_load_local_reg [lane]) ? sfu_add_local_regs [lane] : local_regs [lane]  ;
                    end
                  //--------------------------------------------------
                  // SUM_ACC
                  16'bxxxx_xxxx_xxxx_1xxx: 
                    begin
                      local_regs_valid [lane]  <= sfu_add_load_local_reg [lane] ;

                      local_regs       [lane]  <= (sfu_add_load_local_reg [lane]) ? sfu_add_local_regs [lane] : local_regs [lane]  ;
                    end
                  //--------------------------------------------------
                  // SUM_SEND
                  16'bxxxx_xxxx_xxx1_xxxx: 
                    begin
                      local_regs_valid [lane]  <= 'b0 ;

                      local_regs       [lane]  <= 'd0 ;
                    end
                endcase
              end
          end
      end
  endgenerate
  //----------------------------------------------------------------------------------------------------
  //

  always @(posedge clk)
    begin
      special_functions_complete       <= |special_function_done ;  // only the selected SFU will assert done
    end

  always @(posedge clk)
    begin
      case (simd_core_cntl_state)
        `SIMD_CORE_CNTL_WAIT: 
           begin
             special_op_index   <= 'd0 ;
           end
        `SIMD_CORE_CNTL_SFU_START: 
           begin
             special_op_index   <= special_op_index + 'd1 ;
             curr_special_op    <= special_op             ;
           end
  
      endcase 
    end

  always @(*)
    begin
      special_op  = cntl__simd__cfg_wrap_op_d1 [special_op_index] ;
    end


  //----------------------------------------------------------------------------------------------------
  // Special Functions
  //
  //

  reg                  sfu_nop_done      ;
  reg                  sfu_add_save_done ;
  reg                  sfu_add_acc_done  ;
  reg                  sfu_add_send_done ;
  reg                  sfu_relu_done     ;
  reg                  sfu_div_done      ;
  reg                  sfu_exp_done      ;

  // assign done to function
  genvar sfu ;
  generate
    for (sfu=0; sfu<`SIMD_WRAP_OPERATION_NUM_OF_OPS ; sfu++)
      begin
        always @(*)
          begin
            if (sfu == `SIMD_WRAP_OPERATION_NOP)
              begin
                special_function_done [sfu]  = sfu_nop_done  ;
              end
            else if (sfu == `SIMD_WRAP_OPERATION_RELU)
              begin
                special_function_done [sfu]  = sfu_relu_done  ;
              end
            else if (sfu == `SIMD_WRAP_OPERATION_SUM_SAVE) 
              begin
                special_function_done [sfu]  = sfu_add_save_done  ;
              end
            else if (sfu == `SIMD_WRAP_OPERATION_SUM_ACC) 
              begin
                special_function_done [sfu]  = sfu_add_acc_done  ;
              end
            else if (sfu == `SIMD_WRAP_OPERATION_SUM_SEND) 
              begin
                special_function_done [sfu]  = sfu_add_send_done  ;
              end
            else
              begin
                special_function_done [sfu]  = 1'b0  ;
              end
          end
      end
  endgenerate

  always @(*)
    begin
      case (cntl__simd__cfg_operation [`SIMD_CORE_OPERATION_PC_RANGE ])
        `SIMD_CORE_OPERATION_PC_MAC :
          begin
            special_function_value  = special_function_out [0];
          end
        `SIMD_CORE_OPERATION_PC_EXP :
          begin
            special_function_value  = special_function_out [1];
          end
        `SIMD_CORE_OPERATION_PC_DIV :
          begin
            special_function_value  = special_function_out [2];
          end
        default :
          begin
            special_function_value  = 'd0 ;
          end
      endcase 
    end

  always @(*)
    begin
      reset_local_index  = special_function_done[`SIMD_WRAP_OPERATION_SUM_SEND ] ;

      inc_local_index    = special_function_done[`SIMD_WRAP_OPERATION_SUM_SAVE ] |
                           special_function_done[`SIMD_WRAP_OPERATION_SUM_ACC  ] ;
    end

  always @(posedge clk)
    begin
      local_index  <=  ( reset_poweron     )  ?  'd0               :
                       ( reset_local_index )  ?  'd0               :
                       ( inc_local_index   )  ?  local_index + 'd1 :
                                                 local_index       ;                                                   
    end


  //----------------------------------------------------------------------------------------------------
  //----------------------------------------------------------------------------------------------------
  // NOP
 
  // force complete when we see a NOP
  always @(posedge clk)
    begin
      sfu_nop_done  <=  ( reset_poweron                                                    ) ? 1'b0         :
                        (start_special_function && (special_op == `SIMD_WRAP_OPERATION_NOP)) ? 1'b1         :
                        (simd_core_cntl_state == `SIMD_CORE_CNTL_SFU_COMPLETE              ) ? 1'b0         :
                                                                                               sfu_nop_done ;
    end

  //----------------------------------------------------------------------------------------------------
  //----------------------------------------------------------------------------------------------------
  // Relu
 

  
  reg [`SIMD_CORE_SFU_RELU_CNTL_STATE_RANGE ]   simd_core_relu_cntl_state      ; // state flop
  reg [`SIMD_CORE_SFU_RELU_CNTL_STATE_RANGE ]   simd_core_relu_cntl_state_next ;

  reg   [`PE_EXEC_LANE_WIDTH_RANGE          ]   sfu_relu_local_regs        [`PE_NUM_OF_EXEC_LANES ]  ;
  reg   [`PE_EXEC_LANE_WIDTH_RANGE          ]   sfu_relu_load_local_reg                              ;  // 

  reg                                         perform_relu                   ;
  
  // State register 
  always @(posedge clk)
    begin
      simd_core_relu_cntl_state <= ( reset_poweron ) ? `SIMD_CORE_SFU_RELU_CNTL_WAIT       :
                                                       simd_core_relu_cntl_state_next  ;
    end
  
 
  always @(*)
    begin
      case (simd_core_relu_cntl_state)  // synopsys parallel_case

        // use special op for first transition, then use curr_special_op
        `SIMD_CORE_SFU_RELU_CNTL_WAIT: 
          simd_core_relu_cntl_state_next =  ( start_special_function  && (special_op == `SIMD_WRAP_OPERATION_RELU )) ? `SIMD_CORE_SFU_RELU_CNTL_RELU    :  
                                                                                                                       `SIMD_CORE_SFU_RELU_CNTL_WAIT    ;
  
        // must be a pulse state
        `SIMD_CORE_SFU_RELU_CNTL_RELU: 
          simd_core_relu_cntl_state_next =  `SIMD_CORE_SFU_RELU_CNTL_COMPLETE   ;
  
        // must be a pulse state
        `SIMD_CORE_SFU_RELU_CNTL_COMPLETE: 
          simd_core_relu_cntl_state_next =  `SIMD_CORE_SFU_RELU_CNTL_WAIT       ;
  
        // Latch state on error
        `SIMD_CORE_SFU_RELU_CNTL_ERR:
          simd_core_relu_cntl_state_next = `SIMD_CORE_SFU_RELU_CNTL_ERR ;
  
        default:
          simd_core_relu_cntl_state_next = `SIMD_CORE_SFU_RELU_CNTL_WAIT ;
    
      endcase 
    end // always @ (*)
  

  always @(posedge clk)
    begin
      case (simd_core_relu_cntl_state)
        `SIMD_CORE_SFU_RELU_CNTL_RELU: 
           begin
             perform_relu       <= 'd1 ;
           end
        default:
           begin
             perform_relu       <= 'd0 ;
           end
  
  
      endcase 
    end

  always @(posedge clk)
    begin
      case (simd_core_relu_cntl_state)
        `SIMD_CORE_SFU_RELU_CNTL_COMPLETE: 
           begin
             sfu_relu_done   <= 'd1 ;
           end
        default:
           begin
             sfu_relu_done   <= 'd0 ;
           end
      endcase 
    end



  //----------------------------------------------------------------------------------------------------
  //----------------------------------------------------------------------------------------------------
  // Sum
 
  reg [`SIMD_CORE_SFU_ADD_CNTL_STATE_RANGE ] simd_core_add_cntl_state      ; // state flop
  reg [`SIMD_CORE_SFU_ADD_CNTL_STATE_RANGE ] simd_core_add_cntl_state_next ;
  
  reg   [`PE_EXEC_LANE_COUNT_P1_RANGE   ]    add_register_count      ;  // when MSB is one we have cycled thru all regs
  reg   [`PE_EXEC_LANE_COUNT_P1_RANGE   ]    add_register_index      ;  // index thru registers 0-31
  reg   [`PE_EXEC_LANE_WIDTH_RANGE      ]    sfu_add_temp_result ;
  reg   [`PE_EXEC_LANE_WIDTH_RANGE      ]    adder_output_reg    ;
  reg   [`PE_EXEC_LANE_WIDTH_RANGE      ]    adder_input_a       ;
  reg   [`PE_EXEC_LANE_WIDTH_RANGE      ]    adder_input_b       ;
  wire  [`PE_EXEC_LANE_WIDTH_RANGE      ]    adder_output        ;

  DW_fp_add  #(
                   .sig_width       ( 23), 
                   .exp_width       ( 8 ), 
                   .ieee_compliance ( 1 )
               )
  DW_fp_add   ( .a     ( adder_input_a   ), 
                .b     ( adder_input_b   ), 
                .z     ( adder_output    ), 
                .rnd   ( 3'd4            ),
                .status( ));

  // ADD Controller
  //
  
  // State register 
  always @(posedge clk)
    begin
      simd_core_add_cntl_state <= ( reset_poweron ) ? `SIMD_CORE_SFU_ADD_CNTL_WAIT       :
                                                       simd_core_add_cntl_state_next  ;
    end
  
 
  always @(*)
    begin
      case (simd_core_add_cntl_state)  // synopsys parallel_case

        
        // use special op for first transition, then use curr_special_op
        `SIMD_CORE_SFU_ADD_CNTL_WAIT: 
          simd_core_add_cntl_state_next =  ( start_special_function  && (special_op == `SIMD_WRAP_OPERATION_SUM_SAVE )) ? `SIMD_CORE_SFU_ADD_CNTL_ACC_ALL  :  
                                                                                                                          `SIMD_CORE_SFU_ADD_CNTL_WAIT     ;
  
        `SIMD_CORE_SFU_ADD_CNTL_ACC_ALL: 
          simd_core_add_cntl_state_next =  ( add_register_count[`PE_EXEC_LANE_COUNT_P1_MSB] )   ?   `SIMD_CORE_SFU_ADD_CNTL_ACC_FLUSH  :
                                                                                                `SIMD_CORE_SFU_ADD_CNTL_ACC_ALL   ;
  
        `SIMD_CORE_SFU_ADD_CNTL_ACC_FLUSH: 
          simd_core_add_cntl_state_next =  `SIMD_CORE_SFU_ADD_CNTL_ACC_COMPLETE       ;
  
        `SIMD_CORE_SFU_ADD_CNTL_ACC_COMPLETE: 
          simd_core_add_cntl_state_next =  `SIMD_CORE_SFU_ADD_CNTL_COMPLETE       ;
  
        // must be a pulse state
        `SIMD_CORE_SFU_ADD_CNTL_COMPLETE: 
          simd_core_add_cntl_state_next =  `SIMD_CORE_SFU_ADD_CNTL_WAIT       ;
  
        // Latch state on error
        `SIMD_CORE_SFU_ADD_CNTL_ERR:
          simd_core_add_cntl_state_next = `SIMD_CORE_SFU_ADD_CNTL_ERR ;
  
        default:
          simd_core_add_cntl_state_next = `SIMD_CORE_SFU_ADD_CNTL_WAIT ;
    
      endcase 
    end // always @ (*)
  

  always @(posedge clk)
    begin
      case (simd_core_add_cntl_state)
        `SIMD_CORE_SFU_ADD_CNTL_WAIT: 
           begin
             adder_input_a      <= `COMMON_IEEE754_FLOAT_ZERO ;
             adder_input_b      <= `COMMON_IEEE754_FLOAT_ZERO ;
           end
  
        `SIMD_CORE_SFU_ADD_CNTL_ACC_ALL: 
           begin
             adder_input_a      <= (~add_register_count[`PE_EXEC_LANE_COUNT_P1_MSB]) ? input_regs [add_register_index]  :
                                                                                   adder_output                 ; // accumulate pipeline

             adder_input_b      <= (add_register_index == 0)   ?  `COMMON_IEEE754_FLOAT_ZERO :
                                                              adder_output_reg           ;
           end

        `SIMD_CORE_SFU_ADD_CNTL_ACC_FLUSH: 
           begin
             adder_input_a      <= adder_output      ;

             adder_input_b      <= adder_output_reg  ;
           end
  
        `SIMD_CORE_SFU_ADD_CNTL_ACC_COMPLETE: 
           begin
             adder_input_a      <= `COMMON_IEEE754_FLOAT_ZERO ;

             adder_input_b      <= adder_output_reg  ;
           end
  
      endcase 
    end

  always @(posedge clk)
    begin
      case (simd_core_add_cntl_state)
        `SIMD_CORE_SFU_ADD_CNTL_WAIT: 
           begin
             adder_output_reg    <= 'd0 ;
             sfu_add_temp_result <= 'd0 ;
             add_register_index      <= 'd0 ;
             add_register_count      <= 'd0 ;
           end
  
        `SIMD_CORE_SFU_ADD_CNTL_ACC_ALL: 
           begin
             adder_output_reg    <= adder_output      ;
             sfu_add_temp_result <= adder_output_reg  ;

             add_register_index      <= add_register_index +'d1  ;
             add_register_count      <= add_register_count +'d1  ;
           end
  
        `SIMD_CORE_SFU_ADD_CNTL_ACC_FLUSH: 
           begin
             adder_output_reg    <= adder_output      ;
             sfu_add_temp_result <= adder_output_reg  ;

             add_register_index      <= add_register_index  ;
             add_register_count      <= add_register_count  ;
           end
  
        `SIMD_CORE_SFU_ADD_CNTL_ACC_COMPLETE: 
           begin
             adder_output_reg    <= adder_output_reg  ;
             sfu_add_temp_result <= adder_output_reg  ;

             add_register_index      <= add_register_index  ;
             add_register_count      <= add_register_count  ;
           end
  
        default:
           begin
             adder_output_reg    <= adder_output_reg ;
             sfu_add_temp_result <= adder_output_reg ;

             add_register_index      <= add_register_index  ;
             add_register_count      <= add_register_count  ;
           end
  
      endcase 
    end

  always @(*)
    begin
      case (simd_core_add_cntl_state)
        `SIMD_CORE_SFU_ADD_CNTL_WAIT: 
           begin
             sfu_add_save_done   = 'd0 ;
             sfu_add_acc_done    = 'd0 ;
             sfu_add_send_done   = 'd0 ;
           end
        `SIMD_CORE_SFU_ADD_CNTL_COMPLETE: 
           begin
             sfu_add_save_done   = (curr_special_op == `SIMD_WRAP_OPERATION_SUM_SAVE );
             sfu_add_acc_done    = (curr_special_op == `SIMD_WRAP_OPERATION_SUM_ACC  );
             sfu_add_send_done   = (curr_special_op == `SIMD_WRAP_OPERATION_SUM_SEND );
           end
        default:
           begin
             sfu_add_save_done   = 'd0 ;
             sfu_add_acc_done    = 'd0 ;
             sfu_add_send_done   = 'd0 ;
           end
      endcase 
    end


  // Create load signals
  generate
    for (lane=0; lane<`PE_NUM_OF_EXEC_LANES; lane++)
      begin
        always @(*)
          begin
            case (simd_core_add_cntl_state)
              `SIMD_CORE_SFU_ADD_CNTL_COMPLETE: 
                 begin
                   case (curr_special_op)
                     `SIMD_WRAP_OPERATION_SUM_SAVE :
                       begin
                         if (lane==local_index)
                           begin
                             sfu_add_local_regs     [lane]       =  sfu_add_temp_result ;
                             sfu_add_load_local_reg [lane]       = 1'b1                 ; 
                           end
                         else
                           begin
                             sfu_add_local_regs     [lane]       = 'd0 ;
                             sfu_add_load_local_reg [lane]       = 'b0 ;
                           end
                       end
                     default:
                       begin
                         sfu_add_local_regs     [lane]       = 'd0 ;
                         sfu_add_load_local_reg [lane]       = 'b0 ;
                       end
                   endcase
                 end
              default:
                 begin
                   sfu_add_local_regs     [lane]       = 'd0 ;
                   sfu_add_load_local_reg [lane]       = 'b0 ;
                 end
            endcase 
          end
      end
  endgenerate




  //----------------------------------------------------------------------------------------------------
  // Exp
 
  reg [`SIMD_CORE_SFU_EXP_CNTL_STATE_RANGE ] simd_core_exp_cntl_state      ; // state flop
  reg [`SIMD_CORE_SFU_EXP_CNTL_STATE_RANGE ] simd_core_exp_cntl_state_next ;
  
  reg   [`PE_EXEC_LANE_COUNT_P1_RANGE   ]    exp_register_count      ;  // when MSB is one we have cycled thru all regs
  reg   [`PE_EXEC_LANE_COUNT_P1_RANGE   ]    exp_register_index      ;  // index thru registers 0-31
  reg   [`PE_EXEC_LANE_WIDTH_RANGE      ]    sfu_exp_temp_result     ;
  reg   [`PE_EXEC_LANE_WIDTH_RANGE      ]    exp_output_reg          ;
  reg   [`PE_EXEC_LANE_WIDTH_RANGE      ]    exp_input               ;
  wire  [`PE_EXEC_LANE_WIDTH_RANGE      ]    exp_output              ;


  // EXP Controller
  //
  
  // State register 
  always @(posedge clk)
    begin
      simd_core_exp_cntl_state <= ( reset_poweron ) ? `SIMD_CORE_SFU_EXP_CNTL_WAIT       :
                                                       simd_core_exp_cntl_state_next  ;
    end
  
 
  always @(*)
    begin
      case (simd_core_exp_cntl_state)  // synopsys parallel_case

        
        // use special op for first transition, then use curr_special_op
        `SIMD_CORE_SFU_EXP_CNTL_WAIT: 
          simd_core_exp_cntl_state_next =  ( start_special_function  && (special_op == `SIMD_WRAP_OPERATION_EXP )) ? `SIMD_CORE_SFU_EXP_CNTL_SETTLE  :  
                                                                                                                     `SIMD_CORE_SFU_EXP_CNTL_WAIT     ;
  
        `SIMD_CORE_SFU_EXP_CNTL_SETTLE: 
          simd_core_exp_cntl_state_next =  ( exp_register_count ==  `SIMD_WRAP_OPERATION_EXP_MULTICYCLE  )   ?   `SIMD_CORE_SFU_EXP_CNTL_LOAD     :
                                                                                                                 `SIMD_CORE_SFU_EXP_CNTL_SETTLE   ;
  
        `SIMD_CORE_SFU_EXP_CNTL_LOAD: 
          simd_core_exp_cntl_state_next =  `SIMD_CORE_SFU_EXP_CNTL_INC       ;
  
        `SIMD_CORE_SFU_EXP_CNTL_INC: 
          simd_core_exp_cntl_state_next =  ( exp_register_index[`PE_EXEC_LANE_COUNT_P1_MSB] )   ?   `SIMD_CORE_SFU_EXP_CNTL_COMPLETE     :
                                                                                                    `SIMD_CORE_SFU_EXP_CNTL_SETTLE       ;
  
        // must be a pulse state
        `SIMD_CORE_SFU_EXP_CNTL_COMPLETE: 
          simd_core_exp_cntl_state_next =  `SIMD_CORE_SFU_EXP_CNTL_WAIT       ;
  
        // Latch state on error
        `SIMD_CORE_SFU_EXP_CNTL_ERR:
          simd_core_exp_cntl_state_next = `SIMD_CORE_SFU_EXP_CNTL_ERR ;
  
        default:
          simd_core_exp_cntl_state_next = `SIMD_CORE_SFU_EXP_CNTL_WAIT ;
    
      endcase 
    end // always @ (*)
  

  always @(posedge clk)
    begin
      case (simd_core_exp_cntl_state)
        `SIMD_CORE_SFU_EXP_CNTL_WAIT: 
           begin
             exp_input        <= `COMMON_IEEE754_FLOAT_ZERO ;
           end
  
        default:
           begin
             exp_input        <= input_regs [exp_register_index]  ;
           end
      endcase 
    end

  always @(posedge clk)
    begin
      case (simd_core_exp_cntl_state)
        `SIMD_CORE_SFU_EXP_CNTL_WAIT: 
           begin
             exp_output_reg          <= 'd0 ;
             sfu_exp_temp_result     <= 'd0 ;
             exp_register_index      <= 'd0 ;
             exp_register_count      <= 'd0 ;
           end
  
        `SIMD_CORE_SFU_EXP_CNTL_SETTLE: 
           begin
             exp_output_reg      <= exp_output      ;
             sfu_exp_temp_result <= exp_output_reg  ;

             exp_register_index      <= exp_register_index       ;
             exp_register_count      <= exp_register_count +'d1  ;
           end
  
        `SIMD_CORE_SFU_EXP_CNTL_LOAD: 
           begin
             exp_output_reg      <= exp_output      ;
             sfu_exp_temp_result <= exp_output_reg  ;

             exp_register_index      <= exp_register_index + 'd1 ;
             exp_register_count      <= 'd0                      ;
           end
  
        default:
           begin
             exp_output_reg      <= exp_output_reg ;
             sfu_exp_temp_result <= exp_output_reg ;

             exp_register_index      <= exp_register_index  ;
             exp_register_count      <= exp_register_count  ;
           end
  
      endcase 
    end

  always @(*)
    begin
      case (simd_core_exp_cntl_state)
        `SIMD_CORE_SFU_EXP_CNTL_WAIT: 
           begin
             sfu_exp_done   = 1'b0 ;
           end
        `SIMD_CORE_SFU_EXP_CNTL_COMPLETE: 
           begin
             sfu_exp_done   = 1'b1 ;
           end
        default:
           begin
             sfu_exp_done   = 1'b0 ;
           end
      endcase 
    end



  DW_fp_exp  #(
                   .sig_width       ( 23), 
                   .exp_width       ( 8 ), 
                   .ieee_compliance ( 1 ),
                   .arch            ( 2 )
               )
  DW_fp_exp   ( .a     ( exp_input  ), 
                .z     ( exp_output ),
                .status( ));


  //----------------------------------------------------------------------------------------------------
  // Divider
 
  

  DW_fp_div_seq  #(
                   .sig_width       ( 23), 
                   .exp_width       ( 8 ), 
                   .ieee_compliance ( 1 ),
                   .num_cyc         ( 16),
                   .rst_mode        ( 0 ),
                   .input_mode      ( 1 ),
                   .output_mode     ( 1 ),
                   .early_start     ( 0 ),
                   .internal_reg    ( 1 )
                   )
  DW_fp_div_seq   ( .a         ( input_regs[0]          ), 
                    .b         ( input_regs[1]          ), 
                    .rnd       ( 3'b000                 ),
                    .start     ( start_special_function ),
                    .z         ( special_function_out [2] ), 
                    .complete  (                        ),
                    .status    (                        ),
                    .rst_n     (~reset_poweron          ), 
                    .clk       ( clk                    )
                 );



endmodule

