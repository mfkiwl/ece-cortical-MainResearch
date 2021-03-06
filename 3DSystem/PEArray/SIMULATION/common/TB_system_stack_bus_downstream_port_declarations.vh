
  // General control and status                                                  
  //input [`PE_PE_ID_RANGE                 ]      sys__pe0__peId                ;
  input                                         sys__pe0__allSynchronized     ;
  output                                        pe0__sys__thisSynchronized    ;
  output                                        pe0__sys__ready               ;
  output                                        pe0__sys__complete            ;
  // OOB controls how the lanes are interpreted                                  
  input [`COMMON_STD_INTF_CNTL_RANGE     ]      std__pe0__oob_cntl            ;
  input                                         std__pe0__oob_valid           ;
  output                                        pe0__std__oob_ready           ;
  input [`STACK_DOWN_OOB_INTF_TYPE_RANGE ]      std__pe0__oob_type            ;
  input [`STACK_DOWN_OOB_INTF_DATA_RANGE ]      std__pe0__oob_data            ;
  output                                       pe0__std__lane0_strm0_ready       ;
  input [`DMA_CONT_STRM_CNTL_RANGE     ]       std__pe0__lane0_strm0_cntl        ;
  input [`STREAMING_OP_DATA_WIDTH_RANGE]       std__pe0__lane0_strm0_data        ;
  input                                        std__pe0__lane0_strm0_data_valid  ;

  output                                       pe0__std__lane0_strm1_ready       ;
  input [`DMA_CONT_STRM_CNTL_RANGE     ]       std__pe0__lane0_strm1_cntl        ;
  input [`STREAMING_OP_DATA_WIDTH_RANGE]       std__pe0__lane0_strm1_data        ;
  input                                        std__pe0__lane0_strm1_data_valid  ;

  output                                       pe0__std__lane1_strm0_ready       ;
  input [`DMA_CONT_STRM_CNTL_RANGE     ]       std__pe0__lane1_strm0_cntl        ;
  input [`STREAMING_OP_DATA_WIDTH_RANGE]       std__pe0__lane1_strm0_data        ;
  input                                        std__pe0__lane1_strm0_data_valid  ;

  output                                       pe0__std__lane1_strm1_ready       ;
  input [`DMA_CONT_STRM_CNTL_RANGE     ]       std__pe0__lane1_strm1_cntl        ;
  input [`STREAMING_OP_DATA_WIDTH_RANGE]       std__pe0__lane1_strm1_data        ;
  input                                        std__pe0__lane1_strm1_data_valid  ;

  output                                       pe0__std__lane2_strm0_ready       ;
  input [`DMA_CONT_STRM_CNTL_RANGE     ]       std__pe0__lane2_strm0_cntl        ;
  input [`STREAMING_OP_DATA_WIDTH_RANGE]       std__pe0__lane2_strm0_data        ;
  input                                        std__pe0__lane2_strm0_data_valid  ;

  output                                       pe0__std__lane2_strm1_ready       ;
  input [`DMA_CONT_STRM_CNTL_RANGE     ]       std__pe0__lane2_strm1_cntl        ;
  input [`STREAMING_OP_DATA_WIDTH_RANGE]       std__pe0__lane2_strm1_data        ;
  input                                        std__pe0__lane2_strm1_data_valid  ;

  output                                       pe0__std__lane3_strm0_ready       ;
  input [`DMA_CONT_STRM_CNTL_RANGE     ]       std__pe0__lane3_strm0_cntl        ;
  input [`STREAMING_OP_DATA_WIDTH_RANGE]       std__pe0__lane3_strm0_data        ;
  input                                        std__pe0__lane3_strm0_data_valid  ;

  output                                       pe0__std__lane3_strm1_ready       ;
  input [`DMA_CONT_STRM_CNTL_RANGE     ]       std__pe0__lane3_strm1_cntl        ;
  input [`STREAMING_OP_DATA_WIDTH_RANGE]       std__pe0__lane3_strm1_data        ;
  input                                        std__pe0__lane3_strm1_data_valid  ;

  output                                       pe0__std__lane4_strm0_ready       ;
  input [`DMA_CONT_STRM_CNTL_RANGE     ]       std__pe0__lane4_strm0_cntl        ;
  input [`STREAMING_OP_DATA_WIDTH_RANGE]       std__pe0__lane4_strm0_data        ;
  input                                        std__pe0__lane4_strm0_data_valid  ;

  output                                       pe0__std__lane4_strm1_ready       ;
  input [`DMA_CONT_STRM_CNTL_RANGE     ]       std__pe0__lane4_strm1_cntl        ;
  input [`STREAMING_OP_DATA_WIDTH_RANGE]       std__pe0__lane4_strm1_data        ;
  input                                        std__pe0__lane4_strm1_data_valid  ;

  output                                       pe0__std__lane5_strm0_ready       ;
  input [`DMA_CONT_STRM_CNTL_RANGE     ]       std__pe0__lane5_strm0_cntl        ;
  input [`STREAMING_OP_DATA_WIDTH_RANGE]       std__pe0__lane5_strm0_data        ;
  input                                        std__pe0__lane5_strm0_data_valid  ;

  output                                       pe0__std__lane5_strm1_ready       ;
  input [`DMA_CONT_STRM_CNTL_RANGE     ]       std__pe0__lane5_strm1_cntl        ;
  input [`STREAMING_OP_DATA_WIDTH_RANGE]       std__pe0__lane5_strm1_data        ;
  input                                        std__pe0__lane5_strm1_data_valid  ;

  output                                       pe0__std__lane6_strm0_ready       ;
  input [`DMA_CONT_STRM_CNTL_RANGE     ]       std__pe0__lane6_strm0_cntl        ;
  input [`STREAMING_OP_DATA_WIDTH_RANGE]       std__pe0__lane6_strm0_data        ;
  input                                        std__pe0__lane6_strm0_data_valid  ;

  output                                       pe0__std__lane6_strm1_ready       ;
  input [`DMA_CONT_STRM_CNTL_RANGE     ]       std__pe0__lane6_strm1_cntl        ;
  input [`STREAMING_OP_DATA_WIDTH_RANGE]       std__pe0__lane6_strm1_data        ;
  input                                        std__pe0__lane6_strm1_data_valid  ;

  output                                       pe0__std__lane7_strm0_ready       ;
  input [`DMA_CONT_STRM_CNTL_RANGE     ]       std__pe0__lane7_strm0_cntl        ;
  input [`STREAMING_OP_DATA_WIDTH_RANGE]       std__pe0__lane7_strm0_data        ;
  input                                        std__pe0__lane7_strm0_data_valid  ;

  output                                       pe0__std__lane7_strm1_ready       ;
  input [`DMA_CONT_STRM_CNTL_RANGE     ]       std__pe0__lane7_strm1_cntl        ;
  input [`STREAMING_OP_DATA_WIDTH_RANGE]       std__pe0__lane7_strm1_data        ;
  input                                        std__pe0__lane7_strm1_data_valid  ;

  output                                       pe0__std__lane8_strm0_ready       ;
  input [`DMA_CONT_STRM_CNTL_RANGE     ]       std__pe0__lane8_strm0_cntl        ;
  input [`STREAMING_OP_DATA_WIDTH_RANGE]       std__pe0__lane8_strm0_data        ;
  input                                        std__pe0__lane8_strm0_data_valid  ;

  output                                       pe0__std__lane8_strm1_ready       ;
  input [`DMA_CONT_STRM_CNTL_RANGE     ]       std__pe0__lane8_strm1_cntl        ;
  input [`STREAMING_OP_DATA_WIDTH_RANGE]       std__pe0__lane8_strm1_data        ;
  input                                        std__pe0__lane8_strm1_data_valid  ;

  output                                       pe0__std__lane9_strm0_ready       ;
  input [`DMA_CONT_STRM_CNTL_RANGE     ]       std__pe0__lane9_strm0_cntl        ;
  input [`STREAMING_OP_DATA_WIDTH_RANGE]       std__pe0__lane9_strm0_data        ;
  input                                        std__pe0__lane9_strm0_data_valid  ;

  output                                       pe0__std__lane9_strm1_ready       ;
  input [`DMA_CONT_STRM_CNTL_RANGE     ]       std__pe0__lane9_strm1_cntl        ;
  input [`STREAMING_OP_DATA_WIDTH_RANGE]       std__pe0__lane9_strm1_data        ;
  input                                        std__pe0__lane9_strm1_data_valid  ;

  output                                       pe0__std__lane10_strm0_ready       ;
  input [`DMA_CONT_STRM_CNTL_RANGE     ]       std__pe0__lane10_strm0_cntl        ;
  input [`STREAMING_OP_DATA_WIDTH_RANGE]       std__pe0__lane10_strm0_data        ;
  input                                        std__pe0__lane10_strm0_data_valid  ;

  output                                       pe0__std__lane10_strm1_ready       ;
  input [`DMA_CONT_STRM_CNTL_RANGE     ]       std__pe0__lane10_strm1_cntl        ;
  input [`STREAMING_OP_DATA_WIDTH_RANGE]       std__pe0__lane10_strm1_data        ;
  input                                        std__pe0__lane10_strm1_data_valid  ;

  output                                       pe0__std__lane11_strm0_ready       ;
  input [`DMA_CONT_STRM_CNTL_RANGE     ]       std__pe0__lane11_strm0_cntl        ;
  input [`STREAMING_OP_DATA_WIDTH_RANGE]       std__pe0__lane11_strm0_data        ;
  input                                        std__pe0__lane11_strm0_data_valid  ;

  output                                       pe0__std__lane11_strm1_ready       ;
  input [`DMA_CONT_STRM_CNTL_RANGE     ]       std__pe0__lane11_strm1_cntl        ;
  input [`STREAMING_OP_DATA_WIDTH_RANGE]       std__pe0__lane11_strm1_data        ;
  input                                        std__pe0__lane11_strm1_data_valid  ;

  output                                       pe0__std__lane12_strm0_ready       ;
  input [`DMA_CONT_STRM_CNTL_RANGE     ]       std__pe0__lane12_strm0_cntl        ;
  input [`STREAMING_OP_DATA_WIDTH_RANGE]       std__pe0__lane12_strm0_data        ;
  input                                        std__pe0__lane12_strm0_data_valid  ;

  output                                       pe0__std__lane12_strm1_ready       ;
  input [`DMA_CONT_STRM_CNTL_RANGE     ]       std__pe0__lane12_strm1_cntl        ;
  input [`STREAMING_OP_DATA_WIDTH_RANGE]       std__pe0__lane12_strm1_data        ;
  input                                        std__pe0__lane12_strm1_data_valid  ;

  output                                       pe0__std__lane13_strm0_ready       ;
  input [`DMA_CONT_STRM_CNTL_RANGE     ]       std__pe0__lane13_strm0_cntl        ;
  input [`STREAMING_OP_DATA_WIDTH_RANGE]       std__pe0__lane13_strm0_data        ;
  input                                        std__pe0__lane13_strm0_data_valid  ;

  output                                       pe0__std__lane13_strm1_ready       ;
  input [`DMA_CONT_STRM_CNTL_RANGE     ]       std__pe0__lane13_strm1_cntl        ;
  input [`STREAMING_OP_DATA_WIDTH_RANGE]       std__pe0__lane13_strm1_data        ;
  input                                        std__pe0__lane13_strm1_data_valid  ;

  output                                       pe0__std__lane14_strm0_ready       ;
  input [`DMA_CONT_STRM_CNTL_RANGE     ]       std__pe0__lane14_strm0_cntl        ;
  input [`STREAMING_OP_DATA_WIDTH_RANGE]       std__pe0__lane14_strm0_data        ;
  input                                        std__pe0__lane14_strm0_data_valid  ;

  output                                       pe0__std__lane14_strm1_ready       ;
  input [`DMA_CONT_STRM_CNTL_RANGE     ]       std__pe0__lane14_strm1_cntl        ;
  input [`STREAMING_OP_DATA_WIDTH_RANGE]       std__pe0__lane14_strm1_data        ;
  input                                        std__pe0__lane14_strm1_data_valid  ;

  output                                       pe0__std__lane15_strm0_ready       ;
  input [`DMA_CONT_STRM_CNTL_RANGE     ]       std__pe0__lane15_strm0_cntl        ;
  input [`STREAMING_OP_DATA_WIDTH_RANGE]       std__pe0__lane15_strm0_data        ;
  input                                        std__pe0__lane15_strm0_data_valid  ;

  output                                       pe0__std__lane15_strm1_ready       ;
  input [`DMA_CONT_STRM_CNTL_RANGE     ]       std__pe0__lane15_strm1_cntl        ;
  input [`STREAMING_OP_DATA_WIDTH_RANGE]       std__pe0__lane15_strm1_data        ;
  input                                        std__pe0__lane15_strm1_data_valid  ;

  output                                       pe0__std__lane16_strm0_ready       ;
  input [`DMA_CONT_STRM_CNTL_RANGE     ]       std__pe0__lane16_strm0_cntl        ;
  input [`STREAMING_OP_DATA_WIDTH_RANGE]       std__pe0__lane16_strm0_data        ;
  input                                        std__pe0__lane16_strm0_data_valid  ;

  output                                       pe0__std__lane16_strm1_ready       ;
  input [`DMA_CONT_STRM_CNTL_RANGE     ]       std__pe0__lane16_strm1_cntl        ;
  input [`STREAMING_OP_DATA_WIDTH_RANGE]       std__pe0__lane16_strm1_data        ;
  input                                        std__pe0__lane16_strm1_data_valid  ;

  output                                       pe0__std__lane17_strm0_ready       ;
  input [`DMA_CONT_STRM_CNTL_RANGE     ]       std__pe0__lane17_strm0_cntl        ;
  input [`STREAMING_OP_DATA_WIDTH_RANGE]       std__pe0__lane17_strm0_data        ;
  input                                        std__pe0__lane17_strm0_data_valid  ;

  output                                       pe0__std__lane17_strm1_ready       ;
  input [`DMA_CONT_STRM_CNTL_RANGE     ]       std__pe0__lane17_strm1_cntl        ;
  input [`STREAMING_OP_DATA_WIDTH_RANGE]       std__pe0__lane17_strm1_data        ;
  input                                        std__pe0__lane17_strm1_data_valid  ;

  output                                       pe0__std__lane18_strm0_ready       ;
  input [`DMA_CONT_STRM_CNTL_RANGE     ]       std__pe0__lane18_strm0_cntl        ;
  input [`STREAMING_OP_DATA_WIDTH_RANGE]       std__pe0__lane18_strm0_data        ;
  input                                        std__pe0__lane18_strm0_data_valid  ;

  output                                       pe0__std__lane18_strm1_ready       ;
  input [`DMA_CONT_STRM_CNTL_RANGE     ]       std__pe0__lane18_strm1_cntl        ;
  input [`STREAMING_OP_DATA_WIDTH_RANGE]       std__pe0__lane18_strm1_data        ;
  input                                        std__pe0__lane18_strm1_data_valid  ;

  output                                       pe0__std__lane19_strm0_ready       ;
  input [`DMA_CONT_STRM_CNTL_RANGE     ]       std__pe0__lane19_strm0_cntl        ;
  input [`STREAMING_OP_DATA_WIDTH_RANGE]       std__pe0__lane19_strm0_data        ;
  input                                        std__pe0__lane19_strm0_data_valid  ;

  output                                       pe0__std__lane19_strm1_ready       ;
  input [`DMA_CONT_STRM_CNTL_RANGE     ]       std__pe0__lane19_strm1_cntl        ;
  input [`STREAMING_OP_DATA_WIDTH_RANGE]       std__pe0__lane19_strm1_data        ;
  input                                        std__pe0__lane19_strm1_data_valid  ;

  output                                       pe0__std__lane20_strm0_ready       ;
  input [`DMA_CONT_STRM_CNTL_RANGE     ]       std__pe0__lane20_strm0_cntl        ;
  input [`STREAMING_OP_DATA_WIDTH_RANGE]       std__pe0__lane20_strm0_data        ;
  input                                        std__pe0__lane20_strm0_data_valid  ;

  output                                       pe0__std__lane20_strm1_ready       ;
  input [`DMA_CONT_STRM_CNTL_RANGE     ]       std__pe0__lane20_strm1_cntl        ;
  input [`STREAMING_OP_DATA_WIDTH_RANGE]       std__pe0__lane20_strm1_data        ;
  input                                        std__pe0__lane20_strm1_data_valid  ;

  output                                       pe0__std__lane21_strm0_ready       ;
  input [`DMA_CONT_STRM_CNTL_RANGE     ]       std__pe0__lane21_strm0_cntl        ;
  input [`STREAMING_OP_DATA_WIDTH_RANGE]       std__pe0__lane21_strm0_data        ;
  input                                        std__pe0__lane21_strm0_data_valid  ;

  output                                       pe0__std__lane21_strm1_ready       ;
  input [`DMA_CONT_STRM_CNTL_RANGE     ]       std__pe0__lane21_strm1_cntl        ;
  input [`STREAMING_OP_DATA_WIDTH_RANGE]       std__pe0__lane21_strm1_data        ;
  input                                        std__pe0__lane21_strm1_data_valid  ;

  output                                       pe0__std__lane22_strm0_ready       ;
  input [`DMA_CONT_STRM_CNTL_RANGE     ]       std__pe0__lane22_strm0_cntl        ;
  input [`STREAMING_OP_DATA_WIDTH_RANGE]       std__pe0__lane22_strm0_data        ;
  input                                        std__pe0__lane22_strm0_data_valid  ;

  output                                       pe0__std__lane22_strm1_ready       ;
  input [`DMA_CONT_STRM_CNTL_RANGE     ]       std__pe0__lane22_strm1_cntl        ;
  input [`STREAMING_OP_DATA_WIDTH_RANGE]       std__pe0__lane22_strm1_data        ;
  input                                        std__pe0__lane22_strm1_data_valid  ;

  output                                       pe0__std__lane23_strm0_ready       ;
  input [`DMA_CONT_STRM_CNTL_RANGE     ]       std__pe0__lane23_strm0_cntl        ;
  input [`STREAMING_OP_DATA_WIDTH_RANGE]       std__pe0__lane23_strm0_data        ;
  input                                        std__pe0__lane23_strm0_data_valid  ;

  output                                       pe0__std__lane23_strm1_ready       ;
  input [`DMA_CONT_STRM_CNTL_RANGE     ]       std__pe0__lane23_strm1_cntl        ;
  input [`STREAMING_OP_DATA_WIDTH_RANGE]       std__pe0__lane23_strm1_data        ;
  input                                        std__pe0__lane23_strm1_data_valid  ;

  output                                       pe0__std__lane24_strm0_ready       ;
  input [`DMA_CONT_STRM_CNTL_RANGE     ]       std__pe0__lane24_strm0_cntl        ;
  input [`STREAMING_OP_DATA_WIDTH_RANGE]       std__pe0__lane24_strm0_data        ;
  input                                        std__pe0__lane24_strm0_data_valid  ;

  output                                       pe0__std__lane24_strm1_ready       ;
  input [`DMA_CONT_STRM_CNTL_RANGE     ]       std__pe0__lane24_strm1_cntl        ;
  input [`STREAMING_OP_DATA_WIDTH_RANGE]       std__pe0__lane24_strm1_data        ;
  input                                        std__pe0__lane24_strm1_data_valid  ;

  output                                       pe0__std__lane25_strm0_ready       ;
  input [`DMA_CONT_STRM_CNTL_RANGE     ]       std__pe0__lane25_strm0_cntl        ;
  input [`STREAMING_OP_DATA_WIDTH_RANGE]       std__pe0__lane25_strm0_data        ;
  input                                        std__pe0__lane25_strm0_data_valid  ;

  output                                       pe0__std__lane25_strm1_ready       ;
  input [`DMA_CONT_STRM_CNTL_RANGE     ]       std__pe0__lane25_strm1_cntl        ;
  input [`STREAMING_OP_DATA_WIDTH_RANGE]       std__pe0__lane25_strm1_data        ;
  input                                        std__pe0__lane25_strm1_data_valid  ;

  output                                       pe0__std__lane26_strm0_ready       ;
  input [`DMA_CONT_STRM_CNTL_RANGE     ]       std__pe0__lane26_strm0_cntl        ;
  input [`STREAMING_OP_DATA_WIDTH_RANGE]       std__pe0__lane26_strm0_data        ;
  input                                        std__pe0__lane26_strm0_data_valid  ;

  output                                       pe0__std__lane26_strm1_ready       ;
  input [`DMA_CONT_STRM_CNTL_RANGE     ]       std__pe0__lane26_strm1_cntl        ;
  input [`STREAMING_OP_DATA_WIDTH_RANGE]       std__pe0__lane26_strm1_data        ;
  input                                        std__pe0__lane26_strm1_data_valid  ;

  output                                       pe0__std__lane27_strm0_ready       ;
  input [`DMA_CONT_STRM_CNTL_RANGE     ]       std__pe0__lane27_strm0_cntl        ;
  input [`STREAMING_OP_DATA_WIDTH_RANGE]       std__pe0__lane27_strm0_data        ;
  input                                        std__pe0__lane27_strm0_data_valid  ;

  output                                       pe0__std__lane27_strm1_ready       ;
  input [`DMA_CONT_STRM_CNTL_RANGE     ]       std__pe0__lane27_strm1_cntl        ;
  input [`STREAMING_OP_DATA_WIDTH_RANGE]       std__pe0__lane27_strm1_data        ;
  input                                        std__pe0__lane27_strm1_data_valid  ;

  output                                       pe0__std__lane28_strm0_ready       ;
  input [`DMA_CONT_STRM_CNTL_RANGE     ]       std__pe0__lane28_strm0_cntl        ;
  input [`STREAMING_OP_DATA_WIDTH_RANGE]       std__pe0__lane28_strm0_data        ;
  input                                        std__pe0__lane28_strm0_data_valid  ;

  output                                       pe0__std__lane28_strm1_ready       ;
  input [`DMA_CONT_STRM_CNTL_RANGE     ]       std__pe0__lane28_strm1_cntl        ;
  input [`STREAMING_OP_DATA_WIDTH_RANGE]       std__pe0__lane28_strm1_data        ;
  input                                        std__pe0__lane28_strm1_data_valid  ;

  output                                       pe0__std__lane29_strm0_ready       ;
  input [`DMA_CONT_STRM_CNTL_RANGE     ]       std__pe0__lane29_strm0_cntl        ;
  input [`STREAMING_OP_DATA_WIDTH_RANGE]       std__pe0__lane29_strm0_data        ;
  input                                        std__pe0__lane29_strm0_data_valid  ;

  output                                       pe0__std__lane29_strm1_ready       ;
  input [`DMA_CONT_STRM_CNTL_RANGE     ]       std__pe0__lane29_strm1_cntl        ;
  input [`STREAMING_OP_DATA_WIDTH_RANGE]       std__pe0__lane29_strm1_data        ;
  input                                        std__pe0__lane29_strm1_data_valid  ;

  output                                       pe0__std__lane30_strm0_ready       ;
  input [`DMA_CONT_STRM_CNTL_RANGE     ]       std__pe0__lane30_strm0_cntl        ;
  input [`STREAMING_OP_DATA_WIDTH_RANGE]       std__pe0__lane30_strm0_data        ;
  input                                        std__pe0__lane30_strm0_data_valid  ;

  output                                       pe0__std__lane30_strm1_ready       ;
  input [`DMA_CONT_STRM_CNTL_RANGE     ]       std__pe0__lane30_strm1_cntl        ;
  input [`STREAMING_OP_DATA_WIDTH_RANGE]       std__pe0__lane30_strm1_data        ;
  input                                        std__pe0__lane30_strm1_data_valid  ;

  output                                       pe0__std__lane31_strm0_ready       ;
  input [`DMA_CONT_STRM_CNTL_RANGE     ]       std__pe0__lane31_strm0_cntl        ;
  input [`STREAMING_OP_DATA_WIDTH_RANGE]       std__pe0__lane31_strm0_data        ;
  input                                        std__pe0__lane31_strm0_data_valid  ;

  output                                       pe0__std__lane31_strm1_ready       ;
  input [`DMA_CONT_STRM_CNTL_RANGE     ]       std__pe0__lane31_strm1_cntl        ;
  input [`STREAMING_OP_DATA_WIDTH_RANGE]       std__pe0__lane31_strm1_data        ;
  input                                        std__pe0__lane31_strm1_data_valid  ;

  // General control and status                                                  
  //input [`PE_PE_ID_RANGE                 ]      sys__pe1__peId                ;
  input                                         sys__pe1__allSynchronized     ;
  output                                        pe1__sys__thisSynchronized    ;
  output                                        pe1__sys__ready               ;
  output                                        pe1__sys__complete            ;
  // OOB controls how the lanes are interpreted                                  
  input [`COMMON_STD_INTF_CNTL_RANGE     ]      std__pe1__oob_cntl            ;
  input                                         std__pe1__oob_valid           ;
  output                                        pe1__std__oob_ready           ;
  input [`STACK_DOWN_OOB_INTF_TYPE_RANGE ]      std__pe1__oob_type            ;
  input [`STACK_DOWN_OOB_INTF_DATA_RANGE ]      std__pe1__oob_data            ;
  output                                       pe1__std__lane0_strm0_ready       ;
  input [`DMA_CONT_STRM_CNTL_RANGE     ]       std__pe1__lane0_strm0_cntl        ;
  input [`STREAMING_OP_DATA_WIDTH_RANGE]       std__pe1__lane0_strm0_data        ;
  input                                        std__pe1__lane0_strm0_data_valid  ;

  output                                       pe1__std__lane0_strm1_ready       ;
  input [`DMA_CONT_STRM_CNTL_RANGE     ]       std__pe1__lane0_strm1_cntl        ;
  input [`STREAMING_OP_DATA_WIDTH_RANGE]       std__pe1__lane0_strm1_data        ;
  input                                        std__pe1__lane0_strm1_data_valid  ;

  output                                       pe1__std__lane1_strm0_ready       ;
  input [`DMA_CONT_STRM_CNTL_RANGE     ]       std__pe1__lane1_strm0_cntl        ;
  input [`STREAMING_OP_DATA_WIDTH_RANGE]       std__pe1__lane1_strm0_data        ;
  input                                        std__pe1__lane1_strm0_data_valid  ;

  output                                       pe1__std__lane1_strm1_ready       ;
  input [`DMA_CONT_STRM_CNTL_RANGE     ]       std__pe1__lane1_strm1_cntl        ;
  input [`STREAMING_OP_DATA_WIDTH_RANGE]       std__pe1__lane1_strm1_data        ;
  input                                        std__pe1__lane1_strm1_data_valid  ;

  output                                       pe1__std__lane2_strm0_ready       ;
  input [`DMA_CONT_STRM_CNTL_RANGE     ]       std__pe1__lane2_strm0_cntl        ;
  input [`STREAMING_OP_DATA_WIDTH_RANGE]       std__pe1__lane2_strm0_data        ;
  input                                        std__pe1__lane2_strm0_data_valid  ;

  output                                       pe1__std__lane2_strm1_ready       ;
  input [`DMA_CONT_STRM_CNTL_RANGE     ]       std__pe1__lane2_strm1_cntl        ;
  input [`STREAMING_OP_DATA_WIDTH_RANGE]       std__pe1__lane2_strm1_data        ;
  input                                        std__pe1__lane2_strm1_data_valid  ;

  output                                       pe1__std__lane3_strm0_ready       ;
  input [`DMA_CONT_STRM_CNTL_RANGE     ]       std__pe1__lane3_strm0_cntl        ;
  input [`STREAMING_OP_DATA_WIDTH_RANGE]       std__pe1__lane3_strm0_data        ;
  input                                        std__pe1__lane3_strm0_data_valid  ;

  output                                       pe1__std__lane3_strm1_ready       ;
  input [`DMA_CONT_STRM_CNTL_RANGE     ]       std__pe1__lane3_strm1_cntl        ;
  input [`STREAMING_OP_DATA_WIDTH_RANGE]       std__pe1__lane3_strm1_data        ;
  input                                        std__pe1__lane3_strm1_data_valid  ;

  output                                       pe1__std__lane4_strm0_ready       ;
  input [`DMA_CONT_STRM_CNTL_RANGE     ]       std__pe1__lane4_strm0_cntl        ;
  input [`STREAMING_OP_DATA_WIDTH_RANGE]       std__pe1__lane4_strm0_data        ;
  input                                        std__pe1__lane4_strm0_data_valid  ;

  output                                       pe1__std__lane4_strm1_ready       ;
  input [`DMA_CONT_STRM_CNTL_RANGE     ]       std__pe1__lane4_strm1_cntl        ;
  input [`STREAMING_OP_DATA_WIDTH_RANGE]       std__pe1__lane4_strm1_data        ;
  input                                        std__pe1__lane4_strm1_data_valid  ;

  output                                       pe1__std__lane5_strm0_ready       ;
  input [`DMA_CONT_STRM_CNTL_RANGE     ]       std__pe1__lane5_strm0_cntl        ;
  input [`STREAMING_OP_DATA_WIDTH_RANGE]       std__pe1__lane5_strm0_data        ;
  input                                        std__pe1__lane5_strm0_data_valid  ;

  output                                       pe1__std__lane5_strm1_ready       ;
  input [`DMA_CONT_STRM_CNTL_RANGE     ]       std__pe1__lane5_strm1_cntl        ;
  input [`STREAMING_OP_DATA_WIDTH_RANGE]       std__pe1__lane5_strm1_data        ;
  input                                        std__pe1__lane5_strm1_data_valid  ;

  output                                       pe1__std__lane6_strm0_ready       ;
  input [`DMA_CONT_STRM_CNTL_RANGE     ]       std__pe1__lane6_strm0_cntl        ;
  input [`STREAMING_OP_DATA_WIDTH_RANGE]       std__pe1__lane6_strm0_data        ;
  input                                        std__pe1__lane6_strm0_data_valid  ;

  output                                       pe1__std__lane6_strm1_ready       ;
  input [`DMA_CONT_STRM_CNTL_RANGE     ]       std__pe1__lane6_strm1_cntl        ;
  input [`STREAMING_OP_DATA_WIDTH_RANGE]       std__pe1__lane6_strm1_data        ;
  input                                        std__pe1__lane6_strm1_data_valid  ;

  output                                       pe1__std__lane7_strm0_ready       ;
  input [`DMA_CONT_STRM_CNTL_RANGE     ]       std__pe1__lane7_strm0_cntl        ;
  input [`STREAMING_OP_DATA_WIDTH_RANGE]       std__pe1__lane7_strm0_data        ;
  input                                        std__pe1__lane7_strm0_data_valid  ;

  output                                       pe1__std__lane7_strm1_ready       ;
  input [`DMA_CONT_STRM_CNTL_RANGE     ]       std__pe1__lane7_strm1_cntl        ;
  input [`STREAMING_OP_DATA_WIDTH_RANGE]       std__pe1__lane7_strm1_data        ;
  input                                        std__pe1__lane7_strm1_data_valid  ;

  output                                       pe1__std__lane8_strm0_ready       ;
  input [`DMA_CONT_STRM_CNTL_RANGE     ]       std__pe1__lane8_strm0_cntl        ;
  input [`STREAMING_OP_DATA_WIDTH_RANGE]       std__pe1__lane8_strm0_data        ;
  input                                        std__pe1__lane8_strm0_data_valid  ;

  output                                       pe1__std__lane8_strm1_ready       ;
  input [`DMA_CONT_STRM_CNTL_RANGE     ]       std__pe1__lane8_strm1_cntl        ;
  input [`STREAMING_OP_DATA_WIDTH_RANGE]       std__pe1__lane8_strm1_data        ;
  input                                        std__pe1__lane8_strm1_data_valid  ;

  output                                       pe1__std__lane9_strm0_ready       ;
  input [`DMA_CONT_STRM_CNTL_RANGE     ]       std__pe1__lane9_strm0_cntl        ;
  input [`STREAMING_OP_DATA_WIDTH_RANGE]       std__pe1__lane9_strm0_data        ;
  input                                        std__pe1__lane9_strm0_data_valid  ;

  output                                       pe1__std__lane9_strm1_ready       ;
  input [`DMA_CONT_STRM_CNTL_RANGE     ]       std__pe1__lane9_strm1_cntl        ;
  input [`STREAMING_OP_DATA_WIDTH_RANGE]       std__pe1__lane9_strm1_data        ;
  input                                        std__pe1__lane9_strm1_data_valid  ;

  output                                       pe1__std__lane10_strm0_ready       ;
  input [`DMA_CONT_STRM_CNTL_RANGE     ]       std__pe1__lane10_strm0_cntl        ;
  input [`STREAMING_OP_DATA_WIDTH_RANGE]       std__pe1__lane10_strm0_data        ;
  input                                        std__pe1__lane10_strm0_data_valid  ;

  output                                       pe1__std__lane10_strm1_ready       ;
  input [`DMA_CONT_STRM_CNTL_RANGE     ]       std__pe1__lane10_strm1_cntl        ;
  input [`STREAMING_OP_DATA_WIDTH_RANGE]       std__pe1__lane10_strm1_data        ;
  input                                        std__pe1__lane10_strm1_data_valid  ;

  output                                       pe1__std__lane11_strm0_ready       ;
  input [`DMA_CONT_STRM_CNTL_RANGE     ]       std__pe1__lane11_strm0_cntl        ;
  input [`STREAMING_OP_DATA_WIDTH_RANGE]       std__pe1__lane11_strm0_data        ;
  input                                        std__pe1__lane11_strm0_data_valid  ;

  output                                       pe1__std__lane11_strm1_ready       ;
  input [`DMA_CONT_STRM_CNTL_RANGE     ]       std__pe1__lane11_strm1_cntl        ;
  input [`STREAMING_OP_DATA_WIDTH_RANGE]       std__pe1__lane11_strm1_data        ;
  input                                        std__pe1__lane11_strm1_data_valid  ;

  output                                       pe1__std__lane12_strm0_ready       ;
  input [`DMA_CONT_STRM_CNTL_RANGE     ]       std__pe1__lane12_strm0_cntl        ;
  input [`STREAMING_OP_DATA_WIDTH_RANGE]       std__pe1__lane12_strm0_data        ;
  input                                        std__pe1__lane12_strm0_data_valid  ;

  output                                       pe1__std__lane12_strm1_ready       ;
  input [`DMA_CONT_STRM_CNTL_RANGE     ]       std__pe1__lane12_strm1_cntl        ;
  input [`STREAMING_OP_DATA_WIDTH_RANGE]       std__pe1__lane12_strm1_data        ;
  input                                        std__pe1__lane12_strm1_data_valid  ;

  output                                       pe1__std__lane13_strm0_ready       ;
  input [`DMA_CONT_STRM_CNTL_RANGE     ]       std__pe1__lane13_strm0_cntl        ;
  input [`STREAMING_OP_DATA_WIDTH_RANGE]       std__pe1__lane13_strm0_data        ;
  input                                        std__pe1__lane13_strm0_data_valid  ;

  output                                       pe1__std__lane13_strm1_ready       ;
  input [`DMA_CONT_STRM_CNTL_RANGE     ]       std__pe1__lane13_strm1_cntl        ;
  input [`STREAMING_OP_DATA_WIDTH_RANGE]       std__pe1__lane13_strm1_data        ;
  input                                        std__pe1__lane13_strm1_data_valid  ;

  output                                       pe1__std__lane14_strm0_ready       ;
  input [`DMA_CONT_STRM_CNTL_RANGE     ]       std__pe1__lane14_strm0_cntl        ;
  input [`STREAMING_OP_DATA_WIDTH_RANGE]       std__pe1__lane14_strm0_data        ;
  input                                        std__pe1__lane14_strm0_data_valid  ;

  output                                       pe1__std__lane14_strm1_ready       ;
  input [`DMA_CONT_STRM_CNTL_RANGE     ]       std__pe1__lane14_strm1_cntl        ;
  input [`STREAMING_OP_DATA_WIDTH_RANGE]       std__pe1__lane14_strm1_data        ;
  input                                        std__pe1__lane14_strm1_data_valid  ;

  output                                       pe1__std__lane15_strm0_ready       ;
  input [`DMA_CONT_STRM_CNTL_RANGE     ]       std__pe1__lane15_strm0_cntl        ;
  input [`STREAMING_OP_DATA_WIDTH_RANGE]       std__pe1__lane15_strm0_data        ;
  input                                        std__pe1__lane15_strm0_data_valid  ;

  output                                       pe1__std__lane15_strm1_ready       ;
  input [`DMA_CONT_STRM_CNTL_RANGE     ]       std__pe1__lane15_strm1_cntl        ;
  input [`STREAMING_OP_DATA_WIDTH_RANGE]       std__pe1__lane15_strm1_data        ;
  input                                        std__pe1__lane15_strm1_data_valid  ;

  output                                       pe1__std__lane16_strm0_ready       ;
  input [`DMA_CONT_STRM_CNTL_RANGE     ]       std__pe1__lane16_strm0_cntl        ;
  input [`STREAMING_OP_DATA_WIDTH_RANGE]       std__pe1__lane16_strm0_data        ;
  input                                        std__pe1__lane16_strm0_data_valid  ;

  output                                       pe1__std__lane16_strm1_ready       ;
  input [`DMA_CONT_STRM_CNTL_RANGE     ]       std__pe1__lane16_strm1_cntl        ;
  input [`STREAMING_OP_DATA_WIDTH_RANGE]       std__pe1__lane16_strm1_data        ;
  input                                        std__pe1__lane16_strm1_data_valid  ;

  output                                       pe1__std__lane17_strm0_ready       ;
  input [`DMA_CONT_STRM_CNTL_RANGE     ]       std__pe1__lane17_strm0_cntl        ;
  input [`STREAMING_OP_DATA_WIDTH_RANGE]       std__pe1__lane17_strm0_data        ;
  input                                        std__pe1__lane17_strm0_data_valid  ;

  output                                       pe1__std__lane17_strm1_ready       ;
  input [`DMA_CONT_STRM_CNTL_RANGE     ]       std__pe1__lane17_strm1_cntl        ;
  input [`STREAMING_OP_DATA_WIDTH_RANGE]       std__pe1__lane17_strm1_data        ;
  input                                        std__pe1__lane17_strm1_data_valid  ;

  output                                       pe1__std__lane18_strm0_ready       ;
  input [`DMA_CONT_STRM_CNTL_RANGE     ]       std__pe1__lane18_strm0_cntl        ;
  input [`STREAMING_OP_DATA_WIDTH_RANGE]       std__pe1__lane18_strm0_data        ;
  input                                        std__pe1__lane18_strm0_data_valid  ;

  output                                       pe1__std__lane18_strm1_ready       ;
  input [`DMA_CONT_STRM_CNTL_RANGE     ]       std__pe1__lane18_strm1_cntl        ;
  input [`STREAMING_OP_DATA_WIDTH_RANGE]       std__pe1__lane18_strm1_data        ;
  input                                        std__pe1__lane18_strm1_data_valid  ;

  output                                       pe1__std__lane19_strm0_ready       ;
  input [`DMA_CONT_STRM_CNTL_RANGE     ]       std__pe1__lane19_strm0_cntl        ;
  input [`STREAMING_OP_DATA_WIDTH_RANGE]       std__pe1__lane19_strm0_data        ;
  input                                        std__pe1__lane19_strm0_data_valid  ;

  output                                       pe1__std__lane19_strm1_ready       ;
  input [`DMA_CONT_STRM_CNTL_RANGE     ]       std__pe1__lane19_strm1_cntl        ;
  input [`STREAMING_OP_DATA_WIDTH_RANGE]       std__pe1__lane19_strm1_data        ;
  input                                        std__pe1__lane19_strm1_data_valid  ;

  output                                       pe1__std__lane20_strm0_ready       ;
  input [`DMA_CONT_STRM_CNTL_RANGE     ]       std__pe1__lane20_strm0_cntl        ;
  input [`STREAMING_OP_DATA_WIDTH_RANGE]       std__pe1__lane20_strm0_data        ;
  input                                        std__pe1__lane20_strm0_data_valid  ;

  output                                       pe1__std__lane20_strm1_ready       ;
  input [`DMA_CONT_STRM_CNTL_RANGE     ]       std__pe1__lane20_strm1_cntl        ;
  input [`STREAMING_OP_DATA_WIDTH_RANGE]       std__pe1__lane20_strm1_data        ;
  input                                        std__pe1__lane20_strm1_data_valid  ;

  output                                       pe1__std__lane21_strm0_ready       ;
  input [`DMA_CONT_STRM_CNTL_RANGE     ]       std__pe1__lane21_strm0_cntl        ;
  input [`STREAMING_OP_DATA_WIDTH_RANGE]       std__pe1__lane21_strm0_data        ;
  input                                        std__pe1__lane21_strm0_data_valid  ;

  output                                       pe1__std__lane21_strm1_ready       ;
  input [`DMA_CONT_STRM_CNTL_RANGE     ]       std__pe1__lane21_strm1_cntl        ;
  input [`STREAMING_OP_DATA_WIDTH_RANGE]       std__pe1__lane21_strm1_data        ;
  input                                        std__pe1__lane21_strm1_data_valid  ;

  output                                       pe1__std__lane22_strm0_ready       ;
  input [`DMA_CONT_STRM_CNTL_RANGE     ]       std__pe1__lane22_strm0_cntl        ;
  input [`STREAMING_OP_DATA_WIDTH_RANGE]       std__pe1__lane22_strm0_data        ;
  input                                        std__pe1__lane22_strm0_data_valid  ;

  output                                       pe1__std__lane22_strm1_ready       ;
  input [`DMA_CONT_STRM_CNTL_RANGE     ]       std__pe1__lane22_strm1_cntl        ;
  input [`STREAMING_OP_DATA_WIDTH_RANGE]       std__pe1__lane22_strm1_data        ;
  input                                        std__pe1__lane22_strm1_data_valid  ;

  output                                       pe1__std__lane23_strm0_ready       ;
  input [`DMA_CONT_STRM_CNTL_RANGE     ]       std__pe1__lane23_strm0_cntl        ;
  input [`STREAMING_OP_DATA_WIDTH_RANGE]       std__pe1__lane23_strm0_data        ;
  input                                        std__pe1__lane23_strm0_data_valid  ;

  output                                       pe1__std__lane23_strm1_ready       ;
  input [`DMA_CONT_STRM_CNTL_RANGE     ]       std__pe1__lane23_strm1_cntl        ;
  input [`STREAMING_OP_DATA_WIDTH_RANGE]       std__pe1__lane23_strm1_data        ;
  input                                        std__pe1__lane23_strm1_data_valid  ;

  output                                       pe1__std__lane24_strm0_ready       ;
  input [`DMA_CONT_STRM_CNTL_RANGE     ]       std__pe1__lane24_strm0_cntl        ;
  input [`STREAMING_OP_DATA_WIDTH_RANGE]       std__pe1__lane24_strm0_data        ;
  input                                        std__pe1__lane24_strm0_data_valid  ;

  output                                       pe1__std__lane24_strm1_ready       ;
  input [`DMA_CONT_STRM_CNTL_RANGE     ]       std__pe1__lane24_strm1_cntl        ;
  input [`STREAMING_OP_DATA_WIDTH_RANGE]       std__pe1__lane24_strm1_data        ;
  input                                        std__pe1__lane24_strm1_data_valid  ;

  output                                       pe1__std__lane25_strm0_ready       ;
  input [`DMA_CONT_STRM_CNTL_RANGE     ]       std__pe1__lane25_strm0_cntl        ;
  input [`STREAMING_OP_DATA_WIDTH_RANGE]       std__pe1__lane25_strm0_data        ;
  input                                        std__pe1__lane25_strm0_data_valid  ;

  output                                       pe1__std__lane25_strm1_ready       ;
  input [`DMA_CONT_STRM_CNTL_RANGE     ]       std__pe1__lane25_strm1_cntl        ;
  input [`STREAMING_OP_DATA_WIDTH_RANGE]       std__pe1__lane25_strm1_data        ;
  input                                        std__pe1__lane25_strm1_data_valid  ;

  output                                       pe1__std__lane26_strm0_ready       ;
  input [`DMA_CONT_STRM_CNTL_RANGE     ]       std__pe1__lane26_strm0_cntl        ;
  input [`STREAMING_OP_DATA_WIDTH_RANGE]       std__pe1__lane26_strm0_data        ;
  input                                        std__pe1__lane26_strm0_data_valid  ;

  output                                       pe1__std__lane26_strm1_ready       ;
  input [`DMA_CONT_STRM_CNTL_RANGE     ]       std__pe1__lane26_strm1_cntl        ;
  input [`STREAMING_OP_DATA_WIDTH_RANGE]       std__pe1__lane26_strm1_data        ;
  input                                        std__pe1__lane26_strm1_data_valid  ;

  output                                       pe1__std__lane27_strm0_ready       ;
  input [`DMA_CONT_STRM_CNTL_RANGE     ]       std__pe1__lane27_strm0_cntl        ;
  input [`STREAMING_OP_DATA_WIDTH_RANGE]       std__pe1__lane27_strm0_data        ;
  input                                        std__pe1__lane27_strm0_data_valid  ;

  output                                       pe1__std__lane27_strm1_ready       ;
  input [`DMA_CONT_STRM_CNTL_RANGE     ]       std__pe1__lane27_strm1_cntl        ;
  input [`STREAMING_OP_DATA_WIDTH_RANGE]       std__pe1__lane27_strm1_data        ;
  input                                        std__pe1__lane27_strm1_data_valid  ;

  output                                       pe1__std__lane28_strm0_ready       ;
  input [`DMA_CONT_STRM_CNTL_RANGE     ]       std__pe1__lane28_strm0_cntl        ;
  input [`STREAMING_OP_DATA_WIDTH_RANGE]       std__pe1__lane28_strm0_data        ;
  input                                        std__pe1__lane28_strm0_data_valid  ;

  output                                       pe1__std__lane28_strm1_ready       ;
  input [`DMA_CONT_STRM_CNTL_RANGE     ]       std__pe1__lane28_strm1_cntl        ;
  input [`STREAMING_OP_DATA_WIDTH_RANGE]       std__pe1__lane28_strm1_data        ;
  input                                        std__pe1__lane28_strm1_data_valid  ;

  output                                       pe1__std__lane29_strm0_ready       ;
  input [`DMA_CONT_STRM_CNTL_RANGE     ]       std__pe1__lane29_strm0_cntl        ;
  input [`STREAMING_OP_DATA_WIDTH_RANGE]       std__pe1__lane29_strm0_data        ;
  input                                        std__pe1__lane29_strm0_data_valid  ;

  output                                       pe1__std__lane29_strm1_ready       ;
  input [`DMA_CONT_STRM_CNTL_RANGE     ]       std__pe1__lane29_strm1_cntl        ;
  input [`STREAMING_OP_DATA_WIDTH_RANGE]       std__pe1__lane29_strm1_data        ;
  input                                        std__pe1__lane29_strm1_data_valid  ;

  output                                       pe1__std__lane30_strm0_ready       ;
  input [`DMA_CONT_STRM_CNTL_RANGE     ]       std__pe1__lane30_strm0_cntl        ;
  input [`STREAMING_OP_DATA_WIDTH_RANGE]       std__pe1__lane30_strm0_data        ;
  input                                        std__pe1__lane30_strm0_data_valid  ;

  output                                       pe1__std__lane30_strm1_ready       ;
  input [`DMA_CONT_STRM_CNTL_RANGE     ]       std__pe1__lane30_strm1_cntl        ;
  input [`STREAMING_OP_DATA_WIDTH_RANGE]       std__pe1__lane30_strm1_data        ;
  input                                        std__pe1__lane30_strm1_data_valid  ;

  output                                       pe1__std__lane31_strm0_ready       ;
  input [`DMA_CONT_STRM_CNTL_RANGE     ]       std__pe1__lane31_strm0_cntl        ;
  input [`STREAMING_OP_DATA_WIDTH_RANGE]       std__pe1__lane31_strm0_data        ;
  input                                        std__pe1__lane31_strm0_data_valid  ;

  output                                       pe1__std__lane31_strm1_ready       ;
  input [`DMA_CONT_STRM_CNTL_RANGE     ]       std__pe1__lane31_strm1_cntl        ;
  input [`STREAMING_OP_DATA_WIDTH_RANGE]       std__pe1__lane31_strm1_data        ;
  input                                        std__pe1__lane31_strm1_data_valid  ;

  // General control and status                                                  
  //input [`PE_PE_ID_RANGE                 ]      sys__pe2__peId                ;
  input                                         sys__pe2__allSynchronized     ;
  output                                        pe2__sys__thisSynchronized    ;
  output                                        pe2__sys__ready               ;
  output                                        pe2__sys__complete            ;
  // OOB controls how the lanes are interpreted                                  
  input [`COMMON_STD_INTF_CNTL_RANGE     ]      std__pe2__oob_cntl            ;
  input                                         std__pe2__oob_valid           ;
  output                                        pe2__std__oob_ready           ;
  input [`STACK_DOWN_OOB_INTF_TYPE_RANGE ]      std__pe2__oob_type            ;
  input [`STACK_DOWN_OOB_INTF_DATA_RANGE ]      std__pe2__oob_data            ;
  output                                       pe2__std__lane0_strm0_ready       ;
  input [`DMA_CONT_STRM_CNTL_RANGE     ]       std__pe2__lane0_strm0_cntl        ;
  input [`STREAMING_OP_DATA_WIDTH_RANGE]       std__pe2__lane0_strm0_data        ;
  input                                        std__pe2__lane0_strm0_data_valid  ;

  output                                       pe2__std__lane0_strm1_ready       ;
  input [`DMA_CONT_STRM_CNTL_RANGE     ]       std__pe2__lane0_strm1_cntl        ;
  input [`STREAMING_OP_DATA_WIDTH_RANGE]       std__pe2__lane0_strm1_data        ;
  input                                        std__pe2__lane0_strm1_data_valid  ;

  output                                       pe2__std__lane1_strm0_ready       ;
  input [`DMA_CONT_STRM_CNTL_RANGE     ]       std__pe2__lane1_strm0_cntl        ;
  input [`STREAMING_OP_DATA_WIDTH_RANGE]       std__pe2__lane1_strm0_data        ;
  input                                        std__pe2__lane1_strm0_data_valid  ;

  output                                       pe2__std__lane1_strm1_ready       ;
  input [`DMA_CONT_STRM_CNTL_RANGE     ]       std__pe2__lane1_strm1_cntl        ;
  input [`STREAMING_OP_DATA_WIDTH_RANGE]       std__pe2__lane1_strm1_data        ;
  input                                        std__pe2__lane1_strm1_data_valid  ;

  output                                       pe2__std__lane2_strm0_ready       ;
  input [`DMA_CONT_STRM_CNTL_RANGE     ]       std__pe2__lane2_strm0_cntl        ;
  input [`STREAMING_OP_DATA_WIDTH_RANGE]       std__pe2__lane2_strm0_data        ;
  input                                        std__pe2__lane2_strm0_data_valid  ;

  output                                       pe2__std__lane2_strm1_ready       ;
  input [`DMA_CONT_STRM_CNTL_RANGE     ]       std__pe2__lane2_strm1_cntl        ;
  input [`STREAMING_OP_DATA_WIDTH_RANGE]       std__pe2__lane2_strm1_data        ;
  input                                        std__pe2__lane2_strm1_data_valid  ;

  output                                       pe2__std__lane3_strm0_ready       ;
  input [`DMA_CONT_STRM_CNTL_RANGE     ]       std__pe2__lane3_strm0_cntl        ;
  input [`STREAMING_OP_DATA_WIDTH_RANGE]       std__pe2__lane3_strm0_data        ;
  input                                        std__pe2__lane3_strm0_data_valid  ;

  output                                       pe2__std__lane3_strm1_ready       ;
  input [`DMA_CONT_STRM_CNTL_RANGE     ]       std__pe2__lane3_strm1_cntl        ;
  input [`STREAMING_OP_DATA_WIDTH_RANGE]       std__pe2__lane3_strm1_data        ;
  input                                        std__pe2__lane3_strm1_data_valid  ;

  output                                       pe2__std__lane4_strm0_ready       ;
  input [`DMA_CONT_STRM_CNTL_RANGE     ]       std__pe2__lane4_strm0_cntl        ;
  input [`STREAMING_OP_DATA_WIDTH_RANGE]       std__pe2__lane4_strm0_data        ;
  input                                        std__pe2__lane4_strm0_data_valid  ;

  output                                       pe2__std__lane4_strm1_ready       ;
  input [`DMA_CONT_STRM_CNTL_RANGE     ]       std__pe2__lane4_strm1_cntl        ;
  input [`STREAMING_OP_DATA_WIDTH_RANGE]       std__pe2__lane4_strm1_data        ;
  input                                        std__pe2__lane4_strm1_data_valid  ;

  output                                       pe2__std__lane5_strm0_ready       ;
  input [`DMA_CONT_STRM_CNTL_RANGE     ]       std__pe2__lane5_strm0_cntl        ;
  input [`STREAMING_OP_DATA_WIDTH_RANGE]       std__pe2__lane5_strm0_data        ;
  input                                        std__pe2__lane5_strm0_data_valid  ;

  output                                       pe2__std__lane5_strm1_ready       ;
  input [`DMA_CONT_STRM_CNTL_RANGE     ]       std__pe2__lane5_strm1_cntl        ;
  input [`STREAMING_OP_DATA_WIDTH_RANGE]       std__pe2__lane5_strm1_data        ;
  input                                        std__pe2__lane5_strm1_data_valid  ;

  output                                       pe2__std__lane6_strm0_ready       ;
  input [`DMA_CONT_STRM_CNTL_RANGE     ]       std__pe2__lane6_strm0_cntl        ;
  input [`STREAMING_OP_DATA_WIDTH_RANGE]       std__pe2__lane6_strm0_data        ;
  input                                        std__pe2__lane6_strm0_data_valid  ;

  output                                       pe2__std__lane6_strm1_ready       ;
  input [`DMA_CONT_STRM_CNTL_RANGE     ]       std__pe2__lane6_strm1_cntl        ;
  input [`STREAMING_OP_DATA_WIDTH_RANGE]       std__pe2__lane6_strm1_data        ;
  input                                        std__pe2__lane6_strm1_data_valid  ;

  output                                       pe2__std__lane7_strm0_ready       ;
  input [`DMA_CONT_STRM_CNTL_RANGE     ]       std__pe2__lane7_strm0_cntl        ;
  input [`STREAMING_OP_DATA_WIDTH_RANGE]       std__pe2__lane7_strm0_data        ;
  input                                        std__pe2__lane7_strm0_data_valid  ;

  output                                       pe2__std__lane7_strm1_ready       ;
  input [`DMA_CONT_STRM_CNTL_RANGE     ]       std__pe2__lane7_strm1_cntl        ;
  input [`STREAMING_OP_DATA_WIDTH_RANGE]       std__pe2__lane7_strm1_data        ;
  input                                        std__pe2__lane7_strm1_data_valid  ;

  output                                       pe2__std__lane8_strm0_ready       ;
  input [`DMA_CONT_STRM_CNTL_RANGE     ]       std__pe2__lane8_strm0_cntl        ;
  input [`STREAMING_OP_DATA_WIDTH_RANGE]       std__pe2__lane8_strm0_data        ;
  input                                        std__pe2__lane8_strm0_data_valid  ;

  output                                       pe2__std__lane8_strm1_ready       ;
  input [`DMA_CONT_STRM_CNTL_RANGE     ]       std__pe2__lane8_strm1_cntl        ;
  input [`STREAMING_OP_DATA_WIDTH_RANGE]       std__pe2__lane8_strm1_data        ;
  input                                        std__pe2__lane8_strm1_data_valid  ;

  output                                       pe2__std__lane9_strm0_ready       ;
  input [`DMA_CONT_STRM_CNTL_RANGE     ]       std__pe2__lane9_strm0_cntl        ;
  input [`STREAMING_OP_DATA_WIDTH_RANGE]       std__pe2__lane9_strm0_data        ;
  input                                        std__pe2__lane9_strm0_data_valid  ;

  output                                       pe2__std__lane9_strm1_ready       ;
  input [`DMA_CONT_STRM_CNTL_RANGE     ]       std__pe2__lane9_strm1_cntl        ;
  input [`STREAMING_OP_DATA_WIDTH_RANGE]       std__pe2__lane9_strm1_data        ;
  input                                        std__pe2__lane9_strm1_data_valid  ;

  output                                       pe2__std__lane10_strm0_ready       ;
  input [`DMA_CONT_STRM_CNTL_RANGE     ]       std__pe2__lane10_strm0_cntl        ;
  input [`STREAMING_OP_DATA_WIDTH_RANGE]       std__pe2__lane10_strm0_data        ;
  input                                        std__pe2__lane10_strm0_data_valid  ;

  output                                       pe2__std__lane10_strm1_ready       ;
  input [`DMA_CONT_STRM_CNTL_RANGE     ]       std__pe2__lane10_strm1_cntl        ;
  input [`STREAMING_OP_DATA_WIDTH_RANGE]       std__pe2__lane10_strm1_data        ;
  input                                        std__pe2__lane10_strm1_data_valid  ;

  output                                       pe2__std__lane11_strm0_ready       ;
  input [`DMA_CONT_STRM_CNTL_RANGE     ]       std__pe2__lane11_strm0_cntl        ;
  input [`STREAMING_OP_DATA_WIDTH_RANGE]       std__pe2__lane11_strm0_data        ;
  input                                        std__pe2__lane11_strm0_data_valid  ;

  output                                       pe2__std__lane11_strm1_ready       ;
  input [`DMA_CONT_STRM_CNTL_RANGE     ]       std__pe2__lane11_strm1_cntl        ;
  input [`STREAMING_OP_DATA_WIDTH_RANGE]       std__pe2__lane11_strm1_data        ;
  input                                        std__pe2__lane11_strm1_data_valid  ;

  output                                       pe2__std__lane12_strm0_ready       ;
  input [`DMA_CONT_STRM_CNTL_RANGE     ]       std__pe2__lane12_strm0_cntl        ;
  input [`STREAMING_OP_DATA_WIDTH_RANGE]       std__pe2__lane12_strm0_data        ;
  input                                        std__pe2__lane12_strm0_data_valid  ;

  output                                       pe2__std__lane12_strm1_ready       ;
  input [`DMA_CONT_STRM_CNTL_RANGE     ]       std__pe2__lane12_strm1_cntl        ;
  input [`STREAMING_OP_DATA_WIDTH_RANGE]       std__pe2__lane12_strm1_data        ;
  input                                        std__pe2__lane12_strm1_data_valid  ;

  output                                       pe2__std__lane13_strm0_ready       ;
  input [`DMA_CONT_STRM_CNTL_RANGE     ]       std__pe2__lane13_strm0_cntl        ;
  input [`STREAMING_OP_DATA_WIDTH_RANGE]       std__pe2__lane13_strm0_data        ;
  input                                        std__pe2__lane13_strm0_data_valid  ;

  output                                       pe2__std__lane13_strm1_ready       ;
  input [`DMA_CONT_STRM_CNTL_RANGE     ]       std__pe2__lane13_strm1_cntl        ;
  input [`STREAMING_OP_DATA_WIDTH_RANGE]       std__pe2__lane13_strm1_data        ;
  input                                        std__pe2__lane13_strm1_data_valid  ;

  output                                       pe2__std__lane14_strm0_ready       ;
  input [`DMA_CONT_STRM_CNTL_RANGE     ]       std__pe2__lane14_strm0_cntl        ;
  input [`STREAMING_OP_DATA_WIDTH_RANGE]       std__pe2__lane14_strm0_data        ;
  input                                        std__pe2__lane14_strm0_data_valid  ;

  output                                       pe2__std__lane14_strm1_ready       ;
  input [`DMA_CONT_STRM_CNTL_RANGE     ]       std__pe2__lane14_strm1_cntl        ;
  input [`STREAMING_OP_DATA_WIDTH_RANGE]       std__pe2__lane14_strm1_data        ;
  input                                        std__pe2__lane14_strm1_data_valid  ;

  output                                       pe2__std__lane15_strm0_ready       ;
  input [`DMA_CONT_STRM_CNTL_RANGE     ]       std__pe2__lane15_strm0_cntl        ;
  input [`STREAMING_OP_DATA_WIDTH_RANGE]       std__pe2__lane15_strm0_data        ;
  input                                        std__pe2__lane15_strm0_data_valid  ;

  output                                       pe2__std__lane15_strm1_ready       ;
  input [`DMA_CONT_STRM_CNTL_RANGE     ]       std__pe2__lane15_strm1_cntl        ;
  input [`STREAMING_OP_DATA_WIDTH_RANGE]       std__pe2__lane15_strm1_data        ;
  input                                        std__pe2__lane15_strm1_data_valid  ;

  output                                       pe2__std__lane16_strm0_ready       ;
  input [`DMA_CONT_STRM_CNTL_RANGE     ]       std__pe2__lane16_strm0_cntl        ;
  input [`STREAMING_OP_DATA_WIDTH_RANGE]       std__pe2__lane16_strm0_data        ;
  input                                        std__pe2__lane16_strm0_data_valid  ;

  output                                       pe2__std__lane16_strm1_ready       ;
  input [`DMA_CONT_STRM_CNTL_RANGE     ]       std__pe2__lane16_strm1_cntl        ;
  input [`STREAMING_OP_DATA_WIDTH_RANGE]       std__pe2__lane16_strm1_data        ;
  input                                        std__pe2__lane16_strm1_data_valid  ;

  output                                       pe2__std__lane17_strm0_ready       ;
  input [`DMA_CONT_STRM_CNTL_RANGE     ]       std__pe2__lane17_strm0_cntl        ;
  input [`STREAMING_OP_DATA_WIDTH_RANGE]       std__pe2__lane17_strm0_data        ;
  input                                        std__pe2__lane17_strm0_data_valid  ;

  output                                       pe2__std__lane17_strm1_ready       ;
  input [`DMA_CONT_STRM_CNTL_RANGE     ]       std__pe2__lane17_strm1_cntl        ;
  input [`STREAMING_OP_DATA_WIDTH_RANGE]       std__pe2__lane17_strm1_data        ;
  input                                        std__pe2__lane17_strm1_data_valid  ;

  output                                       pe2__std__lane18_strm0_ready       ;
  input [`DMA_CONT_STRM_CNTL_RANGE     ]       std__pe2__lane18_strm0_cntl        ;
  input [`STREAMING_OP_DATA_WIDTH_RANGE]       std__pe2__lane18_strm0_data        ;
  input                                        std__pe2__lane18_strm0_data_valid  ;

  output                                       pe2__std__lane18_strm1_ready       ;
  input [`DMA_CONT_STRM_CNTL_RANGE     ]       std__pe2__lane18_strm1_cntl        ;
  input [`STREAMING_OP_DATA_WIDTH_RANGE]       std__pe2__lane18_strm1_data        ;
  input                                        std__pe2__lane18_strm1_data_valid  ;

  output                                       pe2__std__lane19_strm0_ready       ;
  input [`DMA_CONT_STRM_CNTL_RANGE     ]       std__pe2__lane19_strm0_cntl        ;
  input [`STREAMING_OP_DATA_WIDTH_RANGE]       std__pe2__lane19_strm0_data        ;
  input                                        std__pe2__lane19_strm0_data_valid  ;

  output                                       pe2__std__lane19_strm1_ready       ;
  input [`DMA_CONT_STRM_CNTL_RANGE     ]       std__pe2__lane19_strm1_cntl        ;
  input [`STREAMING_OP_DATA_WIDTH_RANGE]       std__pe2__lane19_strm1_data        ;
  input                                        std__pe2__lane19_strm1_data_valid  ;

  output                                       pe2__std__lane20_strm0_ready       ;
  input [`DMA_CONT_STRM_CNTL_RANGE     ]       std__pe2__lane20_strm0_cntl        ;
  input [`STREAMING_OP_DATA_WIDTH_RANGE]       std__pe2__lane20_strm0_data        ;
  input                                        std__pe2__lane20_strm0_data_valid  ;

  output                                       pe2__std__lane20_strm1_ready       ;
  input [`DMA_CONT_STRM_CNTL_RANGE     ]       std__pe2__lane20_strm1_cntl        ;
  input [`STREAMING_OP_DATA_WIDTH_RANGE]       std__pe2__lane20_strm1_data        ;
  input                                        std__pe2__lane20_strm1_data_valid  ;

  output                                       pe2__std__lane21_strm0_ready       ;
  input [`DMA_CONT_STRM_CNTL_RANGE     ]       std__pe2__lane21_strm0_cntl        ;
  input [`STREAMING_OP_DATA_WIDTH_RANGE]       std__pe2__lane21_strm0_data        ;
  input                                        std__pe2__lane21_strm0_data_valid  ;

  output                                       pe2__std__lane21_strm1_ready       ;
  input [`DMA_CONT_STRM_CNTL_RANGE     ]       std__pe2__lane21_strm1_cntl        ;
  input [`STREAMING_OP_DATA_WIDTH_RANGE]       std__pe2__lane21_strm1_data        ;
  input                                        std__pe2__lane21_strm1_data_valid  ;

  output                                       pe2__std__lane22_strm0_ready       ;
  input [`DMA_CONT_STRM_CNTL_RANGE     ]       std__pe2__lane22_strm0_cntl        ;
  input [`STREAMING_OP_DATA_WIDTH_RANGE]       std__pe2__lane22_strm0_data        ;
  input                                        std__pe2__lane22_strm0_data_valid  ;

  output                                       pe2__std__lane22_strm1_ready       ;
  input [`DMA_CONT_STRM_CNTL_RANGE     ]       std__pe2__lane22_strm1_cntl        ;
  input [`STREAMING_OP_DATA_WIDTH_RANGE]       std__pe2__lane22_strm1_data        ;
  input                                        std__pe2__lane22_strm1_data_valid  ;

  output                                       pe2__std__lane23_strm0_ready       ;
  input [`DMA_CONT_STRM_CNTL_RANGE     ]       std__pe2__lane23_strm0_cntl        ;
  input [`STREAMING_OP_DATA_WIDTH_RANGE]       std__pe2__lane23_strm0_data        ;
  input                                        std__pe2__lane23_strm0_data_valid  ;

  output                                       pe2__std__lane23_strm1_ready       ;
  input [`DMA_CONT_STRM_CNTL_RANGE     ]       std__pe2__lane23_strm1_cntl        ;
  input [`STREAMING_OP_DATA_WIDTH_RANGE]       std__pe2__lane23_strm1_data        ;
  input                                        std__pe2__lane23_strm1_data_valid  ;

  output                                       pe2__std__lane24_strm0_ready       ;
  input [`DMA_CONT_STRM_CNTL_RANGE     ]       std__pe2__lane24_strm0_cntl        ;
  input [`STREAMING_OP_DATA_WIDTH_RANGE]       std__pe2__lane24_strm0_data        ;
  input                                        std__pe2__lane24_strm0_data_valid  ;

  output                                       pe2__std__lane24_strm1_ready       ;
  input [`DMA_CONT_STRM_CNTL_RANGE     ]       std__pe2__lane24_strm1_cntl        ;
  input [`STREAMING_OP_DATA_WIDTH_RANGE]       std__pe2__lane24_strm1_data        ;
  input                                        std__pe2__lane24_strm1_data_valid  ;

  output                                       pe2__std__lane25_strm0_ready       ;
  input [`DMA_CONT_STRM_CNTL_RANGE     ]       std__pe2__lane25_strm0_cntl        ;
  input [`STREAMING_OP_DATA_WIDTH_RANGE]       std__pe2__lane25_strm0_data        ;
  input                                        std__pe2__lane25_strm0_data_valid  ;

  output                                       pe2__std__lane25_strm1_ready       ;
  input [`DMA_CONT_STRM_CNTL_RANGE     ]       std__pe2__lane25_strm1_cntl        ;
  input [`STREAMING_OP_DATA_WIDTH_RANGE]       std__pe2__lane25_strm1_data        ;
  input                                        std__pe2__lane25_strm1_data_valid  ;

  output                                       pe2__std__lane26_strm0_ready       ;
  input [`DMA_CONT_STRM_CNTL_RANGE     ]       std__pe2__lane26_strm0_cntl        ;
  input [`STREAMING_OP_DATA_WIDTH_RANGE]       std__pe2__lane26_strm0_data        ;
  input                                        std__pe2__lane26_strm0_data_valid  ;

  output                                       pe2__std__lane26_strm1_ready       ;
  input [`DMA_CONT_STRM_CNTL_RANGE     ]       std__pe2__lane26_strm1_cntl        ;
  input [`STREAMING_OP_DATA_WIDTH_RANGE]       std__pe2__lane26_strm1_data        ;
  input                                        std__pe2__lane26_strm1_data_valid  ;

  output                                       pe2__std__lane27_strm0_ready       ;
  input [`DMA_CONT_STRM_CNTL_RANGE     ]       std__pe2__lane27_strm0_cntl        ;
  input [`STREAMING_OP_DATA_WIDTH_RANGE]       std__pe2__lane27_strm0_data        ;
  input                                        std__pe2__lane27_strm0_data_valid  ;

  output                                       pe2__std__lane27_strm1_ready       ;
  input [`DMA_CONT_STRM_CNTL_RANGE     ]       std__pe2__lane27_strm1_cntl        ;
  input [`STREAMING_OP_DATA_WIDTH_RANGE]       std__pe2__lane27_strm1_data        ;
  input                                        std__pe2__lane27_strm1_data_valid  ;

  output                                       pe2__std__lane28_strm0_ready       ;
  input [`DMA_CONT_STRM_CNTL_RANGE     ]       std__pe2__lane28_strm0_cntl        ;
  input [`STREAMING_OP_DATA_WIDTH_RANGE]       std__pe2__lane28_strm0_data        ;
  input                                        std__pe2__lane28_strm0_data_valid  ;

  output                                       pe2__std__lane28_strm1_ready       ;
  input [`DMA_CONT_STRM_CNTL_RANGE     ]       std__pe2__lane28_strm1_cntl        ;
  input [`STREAMING_OP_DATA_WIDTH_RANGE]       std__pe2__lane28_strm1_data        ;
  input                                        std__pe2__lane28_strm1_data_valid  ;

  output                                       pe2__std__lane29_strm0_ready       ;
  input [`DMA_CONT_STRM_CNTL_RANGE     ]       std__pe2__lane29_strm0_cntl        ;
  input [`STREAMING_OP_DATA_WIDTH_RANGE]       std__pe2__lane29_strm0_data        ;
  input                                        std__pe2__lane29_strm0_data_valid  ;

  output                                       pe2__std__lane29_strm1_ready       ;
  input [`DMA_CONT_STRM_CNTL_RANGE     ]       std__pe2__lane29_strm1_cntl        ;
  input [`STREAMING_OP_DATA_WIDTH_RANGE]       std__pe2__lane29_strm1_data        ;
  input                                        std__pe2__lane29_strm1_data_valid  ;

  output                                       pe2__std__lane30_strm0_ready       ;
  input [`DMA_CONT_STRM_CNTL_RANGE     ]       std__pe2__lane30_strm0_cntl        ;
  input [`STREAMING_OP_DATA_WIDTH_RANGE]       std__pe2__lane30_strm0_data        ;
  input                                        std__pe2__lane30_strm0_data_valid  ;

  output                                       pe2__std__lane30_strm1_ready       ;
  input [`DMA_CONT_STRM_CNTL_RANGE     ]       std__pe2__lane30_strm1_cntl        ;
  input [`STREAMING_OP_DATA_WIDTH_RANGE]       std__pe2__lane30_strm1_data        ;
  input                                        std__pe2__lane30_strm1_data_valid  ;

  output                                       pe2__std__lane31_strm0_ready       ;
  input [`DMA_CONT_STRM_CNTL_RANGE     ]       std__pe2__lane31_strm0_cntl        ;
  input [`STREAMING_OP_DATA_WIDTH_RANGE]       std__pe2__lane31_strm0_data        ;
  input                                        std__pe2__lane31_strm0_data_valid  ;

  output                                       pe2__std__lane31_strm1_ready       ;
  input [`DMA_CONT_STRM_CNTL_RANGE     ]       std__pe2__lane31_strm1_cntl        ;
  input [`STREAMING_OP_DATA_WIDTH_RANGE]       std__pe2__lane31_strm1_data        ;
  input                                        std__pe2__lane31_strm1_data_valid  ;

  // General control and status                                                  
  //input [`PE_PE_ID_RANGE                 ]      sys__pe3__peId                ;
  input                                         sys__pe3__allSynchronized     ;
  output                                        pe3__sys__thisSynchronized    ;
  output                                        pe3__sys__ready               ;
  output                                        pe3__sys__complete            ;
  // OOB controls how the lanes are interpreted                                  
  input [`COMMON_STD_INTF_CNTL_RANGE     ]      std__pe3__oob_cntl            ;
  input                                         std__pe3__oob_valid           ;
  output                                        pe3__std__oob_ready           ;
  input [`STACK_DOWN_OOB_INTF_TYPE_RANGE ]      std__pe3__oob_type            ;
  input [`STACK_DOWN_OOB_INTF_DATA_RANGE ]      std__pe3__oob_data            ;
  output                                       pe3__std__lane0_strm0_ready       ;
  input [`DMA_CONT_STRM_CNTL_RANGE     ]       std__pe3__lane0_strm0_cntl        ;
  input [`STREAMING_OP_DATA_WIDTH_RANGE]       std__pe3__lane0_strm0_data        ;
  input                                        std__pe3__lane0_strm0_data_valid  ;

  output                                       pe3__std__lane0_strm1_ready       ;
  input [`DMA_CONT_STRM_CNTL_RANGE     ]       std__pe3__lane0_strm1_cntl        ;
  input [`STREAMING_OP_DATA_WIDTH_RANGE]       std__pe3__lane0_strm1_data        ;
  input                                        std__pe3__lane0_strm1_data_valid  ;

  output                                       pe3__std__lane1_strm0_ready       ;
  input [`DMA_CONT_STRM_CNTL_RANGE     ]       std__pe3__lane1_strm0_cntl        ;
  input [`STREAMING_OP_DATA_WIDTH_RANGE]       std__pe3__lane1_strm0_data        ;
  input                                        std__pe3__lane1_strm0_data_valid  ;

  output                                       pe3__std__lane1_strm1_ready       ;
  input [`DMA_CONT_STRM_CNTL_RANGE     ]       std__pe3__lane1_strm1_cntl        ;
  input [`STREAMING_OP_DATA_WIDTH_RANGE]       std__pe3__lane1_strm1_data        ;
  input                                        std__pe3__lane1_strm1_data_valid  ;

  output                                       pe3__std__lane2_strm0_ready       ;
  input [`DMA_CONT_STRM_CNTL_RANGE     ]       std__pe3__lane2_strm0_cntl        ;
  input [`STREAMING_OP_DATA_WIDTH_RANGE]       std__pe3__lane2_strm0_data        ;
  input                                        std__pe3__lane2_strm0_data_valid  ;

  output                                       pe3__std__lane2_strm1_ready       ;
  input [`DMA_CONT_STRM_CNTL_RANGE     ]       std__pe3__lane2_strm1_cntl        ;
  input [`STREAMING_OP_DATA_WIDTH_RANGE]       std__pe3__lane2_strm1_data        ;
  input                                        std__pe3__lane2_strm1_data_valid  ;

  output                                       pe3__std__lane3_strm0_ready       ;
  input [`DMA_CONT_STRM_CNTL_RANGE     ]       std__pe3__lane3_strm0_cntl        ;
  input [`STREAMING_OP_DATA_WIDTH_RANGE]       std__pe3__lane3_strm0_data        ;
  input                                        std__pe3__lane3_strm0_data_valid  ;

  output                                       pe3__std__lane3_strm1_ready       ;
  input [`DMA_CONT_STRM_CNTL_RANGE     ]       std__pe3__lane3_strm1_cntl        ;
  input [`STREAMING_OP_DATA_WIDTH_RANGE]       std__pe3__lane3_strm1_data        ;
  input                                        std__pe3__lane3_strm1_data_valid  ;

  output                                       pe3__std__lane4_strm0_ready       ;
  input [`DMA_CONT_STRM_CNTL_RANGE     ]       std__pe3__lane4_strm0_cntl        ;
  input [`STREAMING_OP_DATA_WIDTH_RANGE]       std__pe3__lane4_strm0_data        ;
  input                                        std__pe3__lane4_strm0_data_valid  ;

  output                                       pe3__std__lane4_strm1_ready       ;
  input [`DMA_CONT_STRM_CNTL_RANGE     ]       std__pe3__lane4_strm1_cntl        ;
  input [`STREAMING_OP_DATA_WIDTH_RANGE]       std__pe3__lane4_strm1_data        ;
  input                                        std__pe3__lane4_strm1_data_valid  ;

  output                                       pe3__std__lane5_strm0_ready       ;
  input [`DMA_CONT_STRM_CNTL_RANGE     ]       std__pe3__lane5_strm0_cntl        ;
  input [`STREAMING_OP_DATA_WIDTH_RANGE]       std__pe3__lane5_strm0_data        ;
  input                                        std__pe3__lane5_strm0_data_valid  ;

  output                                       pe3__std__lane5_strm1_ready       ;
  input [`DMA_CONT_STRM_CNTL_RANGE     ]       std__pe3__lane5_strm1_cntl        ;
  input [`STREAMING_OP_DATA_WIDTH_RANGE]       std__pe3__lane5_strm1_data        ;
  input                                        std__pe3__lane5_strm1_data_valid  ;

  output                                       pe3__std__lane6_strm0_ready       ;
  input [`DMA_CONT_STRM_CNTL_RANGE     ]       std__pe3__lane6_strm0_cntl        ;
  input [`STREAMING_OP_DATA_WIDTH_RANGE]       std__pe3__lane6_strm0_data        ;
  input                                        std__pe3__lane6_strm0_data_valid  ;

  output                                       pe3__std__lane6_strm1_ready       ;
  input [`DMA_CONT_STRM_CNTL_RANGE     ]       std__pe3__lane6_strm1_cntl        ;
  input [`STREAMING_OP_DATA_WIDTH_RANGE]       std__pe3__lane6_strm1_data        ;
  input                                        std__pe3__lane6_strm1_data_valid  ;

  output                                       pe3__std__lane7_strm0_ready       ;
  input [`DMA_CONT_STRM_CNTL_RANGE     ]       std__pe3__lane7_strm0_cntl        ;
  input [`STREAMING_OP_DATA_WIDTH_RANGE]       std__pe3__lane7_strm0_data        ;
  input                                        std__pe3__lane7_strm0_data_valid  ;

  output                                       pe3__std__lane7_strm1_ready       ;
  input [`DMA_CONT_STRM_CNTL_RANGE     ]       std__pe3__lane7_strm1_cntl        ;
  input [`STREAMING_OP_DATA_WIDTH_RANGE]       std__pe3__lane7_strm1_data        ;
  input                                        std__pe3__lane7_strm1_data_valid  ;

  output                                       pe3__std__lane8_strm0_ready       ;
  input [`DMA_CONT_STRM_CNTL_RANGE     ]       std__pe3__lane8_strm0_cntl        ;
  input [`STREAMING_OP_DATA_WIDTH_RANGE]       std__pe3__lane8_strm0_data        ;
  input                                        std__pe3__lane8_strm0_data_valid  ;

  output                                       pe3__std__lane8_strm1_ready       ;
  input [`DMA_CONT_STRM_CNTL_RANGE     ]       std__pe3__lane8_strm1_cntl        ;
  input [`STREAMING_OP_DATA_WIDTH_RANGE]       std__pe3__lane8_strm1_data        ;
  input                                        std__pe3__lane8_strm1_data_valid  ;

  output                                       pe3__std__lane9_strm0_ready       ;
  input [`DMA_CONT_STRM_CNTL_RANGE     ]       std__pe3__lane9_strm0_cntl        ;
  input [`STREAMING_OP_DATA_WIDTH_RANGE]       std__pe3__lane9_strm0_data        ;
  input                                        std__pe3__lane9_strm0_data_valid  ;

  output                                       pe3__std__lane9_strm1_ready       ;
  input [`DMA_CONT_STRM_CNTL_RANGE     ]       std__pe3__lane9_strm1_cntl        ;
  input [`STREAMING_OP_DATA_WIDTH_RANGE]       std__pe3__lane9_strm1_data        ;
  input                                        std__pe3__lane9_strm1_data_valid  ;

  output                                       pe3__std__lane10_strm0_ready       ;
  input [`DMA_CONT_STRM_CNTL_RANGE     ]       std__pe3__lane10_strm0_cntl        ;
  input [`STREAMING_OP_DATA_WIDTH_RANGE]       std__pe3__lane10_strm0_data        ;
  input                                        std__pe3__lane10_strm0_data_valid  ;

  output                                       pe3__std__lane10_strm1_ready       ;
  input [`DMA_CONT_STRM_CNTL_RANGE     ]       std__pe3__lane10_strm1_cntl        ;
  input [`STREAMING_OP_DATA_WIDTH_RANGE]       std__pe3__lane10_strm1_data        ;
  input                                        std__pe3__lane10_strm1_data_valid  ;

  output                                       pe3__std__lane11_strm0_ready       ;
  input [`DMA_CONT_STRM_CNTL_RANGE     ]       std__pe3__lane11_strm0_cntl        ;
  input [`STREAMING_OP_DATA_WIDTH_RANGE]       std__pe3__lane11_strm0_data        ;
  input                                        std__pe3__lane11_strm0_data_valid  ;

  output                                       pe3__std__lane11_strm1_ready       ;
  input [`DMA_CONT_STRM_CNTL_RANGE     ]       std__pe3__lane11_strm1_cntl        ;
  input [`STREAMING_OP_DATA_WIDTH_RANGE]       std__pe3__lane11_strm1_data        ;
  input                                        std__pe3__lane11_strm1_data_valid  ;

  output                                       pe3__std__lane12_strm0_ready       ;
  input [`DMA_CONT_STRM_CNTL_RANGE     ]       std__pe3__lane12_strm0_cntl        ;
  input [`STREAMING_OP_DATA_WIDTH_RANGE]       std__pe3__lane12_strm0_data        ;
  input                                        std__pe3__lane12_strm0_data_valid  ;

  output                                       pe3__std__lane12_strm1_ready       ;
  input [`DMA_CONT_STRM_CNTL_RANGE     ]       std__pe3__lane12_strm1_cntl        ;
  input [`STREAMING_OP_DATA_WIDTH_RANGE]       std__pe3__lane12_strm1_data        ;
  input                                        std__pe3__lane12_strm1_data_valid  ;

  output                                       pe3__std__lane13_strm0_ready       ;
  input [`DMA_CONT_STRM_CNTL_RANGE     ]       std__pe3__lane13_strm0_cntl        ;
  input [`STREAMING_OP_DATA_WIDTH_RANGE]       std__pe3__lane13_strm0_data        ;
  input                                        std__pe3__lane13_strm0_data_valid  ;

  output                                       pe3__std__lane13_strm1_ready       ;
  input [`DMA_CONT_STRM_CNTL_RANGE     ]       std__pe3__lane13_strm1_cntl        ;
  input [`STREAMING_OP_DATA_WIDTH_RANGE]       std__pe3__lane13_strm1_data        ;
  input                                        std__pe3__lane13_strm1_data_valid  ;

  output                                       pe3__std__lane14_strm0_ready       ;
  input [`DMA_CONT_STRM_CNTL_RANGE     ]       std__pe3__lane14_strm0_cntl        ;
  input [`STREAMING_OP_DATA_WIDTH_RANGE]       std__pe3__lane14_strm0_data        ;
  input                                        std__pe3__lane14_strm0_data_valid  ;

  output                                       pe3__std__lane14_strm1_ready       ;
  input [`DMA_CONT_STRM_CNTL_RANGE     ]       std__pe3__lane14_strm1_cntl        ;
  input [`STREAMING_OP_DATA_WIDTH_RANGE]       std__pe3__lane14_strm1_data        ;
  input                                        std__pe3__lane14_strm1_data_valid  ;

  output                                       pe3__std__lane15_strm0_ready       ;
  input [`DMA_CONT_STRM_CNTL_RANGE     ]       std__pe3__lane15_strm0_cntl        ;
  input [`STREAMING_OP_DATA_WIDTH_RANGE]       std__pe3__lane15_strm0_data        ;
  input                                        std__pe3__lane15_strm0_data_valid  ;

  output                                       pe3__std__lane15_strm1_ready       ;
  input [`DMA_CONT_STRM_CNTL_RANGE     ]       std__pe3__lane15_strm1_cntl        ;
  input [`STREAMING_OP_DATA_WIDTH_RANGE]       std__pe3__lane15_strm1_data        ;
  input                                        std__pe3__lane15_strm1_data_valid  ;

  output                                       pe3__std__lane16_strm0_ready       ;
  input [`DMA_CONT_STRM_CNTL_RANGE     ]       std__pe3__lane16_strm0_cntl        ;
  input [`STREAMING_OP_DATA_WIDTH_RANGE]       std__pe3__lane16_strm0_data        ;
  input                                        std__pe3__lane16_strm0_data_valid  ;

  output                                       pe3__std__lane16_strm1_ready       ;
  input [`DMA_CONT_STRM_CNTL_RANGE     ]       std__pe3__lane16_strm1_cntl        ;
  input [`STREAMING_OP_DATA_WIDTH_RANGE]       std__pe3__lane16_strm1_data        ;
  input                                        std__pe3__lane16_strm1_data_valid  ;

  output                                       pe3__std__lane17_strm0_ready       ;
  input [`DMA_CONT_STRM_CNTL_RANGE     ]       std__pe3__lane17_strm0_cntl        ;
  input [`STREAMING_OP_DATA_WIDTH_RANGE]       std__pe3__lane17_strm0_data        ;
  input                                        std__pe3__lane17_strm0_data_valid  ;

  output                                       pe3__std__lane17_strm1_ready       ;
  input [`DMA_CONT_STRM_CNTL_RANGE     ]       std__pe3__lane17_strm1_cntl        ;
  input [`STREAMING_OP_DATA_WIDTH_RANGE]       std__pe3__lane17_strm1_data        ;
  input                                        std__pe3__lane17_strm1_data_valid  ;

  output                                       pe3__std__lane18_strm0_ready       ;
  input [`DMA_CONT_STRM_CNTL_RANGE     ]       std__pe3__lane18_strm0_cntl        ;
  input [`STREAMING_OP_DATA_WIDTH_RANGE]       std__pe3__lane18_strm0_data        ;
  input                                        std__pe3__lane18_strm0_data_valid  ;

  output                                       pe3__std__lane18_strm1_ready       ;
  input [`DMA_CONT_STRM_CNTL_RANGE     ]       std__pe3__lane18_strm1_cntl        ;
  input [`STREAMING_OP_DATA_WIDTH_RANGE]       std__pe3__lane18_strm1_data        ;
  input                                        std__pe3__lane18_strm1_data_valid  ;

  output                                       pe3__std__lane19_strm0_ready       ;
  input [`DMA_CONT_STRM_CNTL_RANGE     ]       std__pe3__lane19_strm0_cntl        ;
  input [`STREAMING_OP_DATA_WIDTH_RANGE]       std__pe3__lane19_strm0_data        ;
  input                                        std__pe3__lane19_strm0_data_valid  ;

  output                                       pe3__std__lane19_strm1_ready       ;
  input [`DMA_CONT_STRM_CNTL_RANGE     ]       std__pe3__lane19_strm1_cntl        ;
  input [`STREAMING_OP_DATA_WIDTH_RANGE]       std__pe3__lane19_strm1_data        ;
  input                                        std__pe3__lane19_strm1_data_valid  ;

  output                                       pe3__std__lane20_strm0_ready       ;
  input [`DMA_CONT_STRM_CNTL_RANGE     ]       std__pe3__lane20_strm0_cntl        ;
  input [`STREAMING_OP_DATA_WIDTH_RANGE]       std__pe3__lane20_strm0_data        ;
  input                                        std__pe3__lane20_strm0_data_valid  ;

  output                                       pe3__std__lane20_strm1_ready       ;
  input [`DMA_CONT_STRM_CNTL_RANGE     ]       std__pe3__lane20_strm1_cntl        ;
  input [`STREAMING_OP_DATA_WIDTH_RANGE]       std__pe3__lane20_strm1_data        ;
  input                                        std__pe3__lane20_strm1_data_valid  ;

  output                                       pe3__std__lane21_strm0_ready       ;
  input [`DMA_CONT_STRM_CNTL_RANGE     ]       std__pe3__lane21_strm0_cntl        ;
  input [`STREAMING_OP_DATA_WIDTH_RANGE]       std__pe3__lane21_strm0_data        ;
  input                                        std__pe3__lane21_strm0_data_valid  ;

  output                                       pe3__std__lane21_strm1_ready       ;
  input [`DMA_CONT_STRM_CNTL_RANGE     ]       std__pe3__lane21_strm1_cntl        ;
  input [`STREAMING_OP_DATA_WIDTH_RANGE]       std__pe3__lane21_strm1_data        ;
  input                                        std__pe3__lane21_strm1_data_valid  ;

  output                                       pe3__std__lane22_strm0_ready       ;
  input [`DMA_CONT_STRM_CNTL_RANGE     ]       std__pe3__lane22_strm0_cntl        ;
  input [`STREAMING_OP_DATA_WIDTH_RANGE]       std__pe3__lane22_strm0_data        ;
  input                                        std__pe3__lane22_strm0_data_valid  ;

  output                                       pe3__std__lane22_strm1_ready       ;
  input [`DMA_CONT_STRM_CNTL_RANGE     ]       std__pe3__lane22_strm1_cntl        ;
  input [`STREAMING_OP_DATA_WIDTH_RANGE]       std__pe3__lane22_strm1_data        ;
  input                                        std__pe3__lane22_strm1_data_valid  ;

  output                                       pe3__std__lane23_strm0_ready       ;
  input [`DMA_CONT_STRM_CNTL_RANGE     ]       std__pe3__lane23_strm0_cntl        ;
  input [`STREAMING_OP_DATA_WIDTH_RANGE]       std__pe3__lane23_strm0_data        ;
  input                                        std__pe3__lane23_strm0_data_valid  ;

  output                                       pe3__std__lane23_strm1_ready       ;
  input [`DMA_CONT_STRM_CNTL_RANGE     ]       std__pe3__lane23_strm1_cntl        ;
  input [`STREAMING_OP_DATA_WIDTH_RANGE]       std__pe3__lane23_strm1_data        ;
  input                                        std__pe3__lane23_strm1_data_valid  ;

  output                                       pe3__std__lane24_strm0_ready       ;
  input [`DMA_CONT_STRM_CNTL_RANGE     ]       std__pe3__lane24_strm0_cntl        ;
  input [`STREAMING_OP_DATA_WIDTH_RANGE]       std__pe3__lane24_strm0_data        ;
  input                                        std__pe3__lane24_strm0_data_valid  ;

  output                                       pe3__std__lane24_strm1_ready       ;
  input [`DMA_CONT_STRM_CNTL_RANGE     ]       std__pe3__lane24_strm1_cntl        ;
  input [`STREAMING_OP_DATA_WIDTH_RANGE]       std__pe3__lane24_strm1_data        ;
  input                                        std__pe3__lane24_strm1_data_valid  ;

  output                                       pe3__std__lane25_strm0_ready       ;
  input [`DMA_CONT_STRM_CNTL_RANGE     ]       std__pe3__lane25_strm0_cntl        ;
  input [`STREAMING_OP_DATA_WIDTH_RANGE]       std__pe3__lane25_strm0_data        ;
  input                                        std__pe3__lane25_strm0_data_valid  ;

  output                                       pe3__std__lane25_strm1_ready       ;
  input [`DMA_CONT_STRM_CNTL_RANGE     ]       std__pe3__lane25_strm1_cntl        ;
  input [`STREAMING_OP_DATA_WIDTH_RANGE]       std__pe3__lane25_strm1_data        ;
  input                                        std__pe3__lane25_strm1_data_valid  ;

  output                                       pe3__std__lane26_strm0_ready       ;
  input [`DMA_CONT_STRM_CNTL_RANGE     ]       std__pe3__lane26_strm0_cntl        ;
  input [`STREAMING_OP_DATA_WIDTH_RANGE]       std__pe3__lane26_strm0_data        ;
  input                                        std__pe3__lane26_strm0_data_valid  ;

  output                                       pe3__std__lane26_strm1_ready       ;
  input [`DMA_CONT_STRM_CNTL_RANGE     ]       std__pe3__lane26_strm1_cntl        ;
  input [`STREAMING_OP_DATA_WIDTH_RANGE]       std__pe3__lane26_strm1_data        ;
  input                                        std__pe3__lane26_strm1_data_valid  ;

  output                                       pe3__std__lane27_strm0_ready       ;
  input [`DMA_CONT_STRM_CNTL_RANGE     ]       std__pe3__lane27_strm0_cntl        ;
  input [`STREAMING_OP_DATA_WIDTH_RANGE]       std__pe3__lane27_strm0_data        ;
  input                                        std__pe3__lane27_strm0_data_valid  ;

  output                                       pe3__std__lane27_strm1_ready       ;
  input [`DMA_CONT_STRM_CNTL_RANGE     ]       std__pe3__lane27_strm1_cntl        ;
  input [`STREAMING_OP_DATA_WIDTH_RANGE]       std__pe3__lane27_strm1_data        ;
  input                                        std__pe3__lane27_strm1_data_valid  ;

  output                                       pe3__std__lane28_strm0_ready       ;
  input [`DMA_CONT_STRM_CNTL_RANGE     ]       std__pe3__lane28_strm0_cntl        ;
  input [`STREAMING_OP_DATA_WIDTH_RANGE]       std__pe3__lane28_strm0_data        ;
  input                                        std__pe3__lane28_strm0_data_valid  ;

  output                                       pe3__std__lane28_strm1_ready       ;
  input [`DMA_CONT_STRM_CNTL_RANGE     ]       std__pe3__lane28_strm1_cntl        ;
  input [`STREAMING_OP_DATA_WIDTH_RANGE]       std__pe3__lane28_strm1_data        ;
  input                                        std__pe3__lane28_strm1_data_valid  ;

  output                                       pe3__std__lane29_strm0_ready       ;
  input [`DMA_CONT_STRM_CNTL_RANGE     ]       std__pe3__lane29_strm0_cntl        ;
  input [`STREAMING_OP_DATA_WIDTH_RANGE]       std__pe3__lane29_strm0_data        ;
  input                                        std__pe3__lane29_strm0_data_valid  ;

  output                                       pe3__std__lane29_strm1_ready       ;
  input [`DMA_CONT_STRM_CNTL_RANGE     ]       std__pe3__lane29_strm1_cntl        ;
  input [`STREAMING_OP_DATA_WIDTH_RANGE]       std__pe3__lane29_strm1_data        ;
  input                                        std__pe3__lane29_strm1_data_valid  ;

  output                                       pe3__std__lane30_strm0_ready       ;
  input [`DMA_CONT_STRM_CNTL_RANGE     ]       std__pe3__lane30_strm0_cntl        ;
  input [`STREAMING_OP_DATA_WIDTH_RANGE]       std__pe3__lane30_strm0_data        ;
  input                                        std__pe3__lane30_strm0_data_valid  ;

  output                                       pe3__std__lane30_strm1_ready       ;
  input [`DMA_CONT_STRM_CNTL_RANGE     ]       std__pe3__lane30_strm1_cntl        ;
  input [`STREAMING_OP_DATA_WIDTH_RANGE]       std__pe3__lane30_strm1_data        ;
  input                                        std__pe3__lane30_strm1_data_valid  ;

  output                                       pe3__std__lane31_strm0_ready       ;
  input [`DMA_CONT_STRM_CNTL_RANGE     ]       std__pe3__lane31_strm0_cntl        ;
  input [`STREAMING_OP_DATA_WIDTH_RANGE]       std__pe3__lane31_strm0_data        ;
  input                                        std__pe3__lane31_strm0_data_valid  ;

  output                                       pe3__std__lane31_strm1_ready       ;
  input [`DMA_CONT_STRM_CNTL_RANGE     ]       std__pe3__lane31_strm1_cntl        ;
  input [`STREAMING_OP_DATA_WIDTH_RANGE]       std__pe3__lane31_strm1_data        ;
  input                                        std__pe3__lane31_strm1_data_valid  ;
