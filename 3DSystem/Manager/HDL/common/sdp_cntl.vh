`ifndef _sdp_cntl_vh
`define _sdp_cntl_vh

/*****************************************************************

    File name   : sdp_cntl.vh
    Author      : Lee Baker
    Affiliation : North Carolina State University, Raleigh, NC
    Date        : July 2017
    email       : lbbaker@ncsu.edu

*****************************************************************/


  
//------------------------------------------------------------------------------------------------------------
//------------------------------------------------------------------------------------------------------------
// FSM's
//------------------------------------------------------------------------------------------------------------
//--------------------------------------------------------
// Storage Descriptor Extract FSM

`define SDP_CNTL_EXTRACT_DESC_WAIT                         5'b0_0001
                                                 
`define SDP_CNTL_EXTRACT_DESC_EXTRACT                      5'b0_0010
`define SDP_CNTL_EXTRACT_DESC_START_PROCESSING             5'b0_0100
`define SDP_CNTL_EXTRACT_DESC_COMPLETE                     5'b0_1000
                                                  
`define SDP_CNTL_EXTRACT_DESC_ERR                          5'b1_0000

`define SDP_CNTL_EXTRACT_DESC_STATE_WIDTH         5
`define SDP_CNTL_EXTRACT_DESC_STATE_MSB           `SDP_CNTL_EXTRACT_DESC_STATE_WIDTH-1
`define SDP_CNTL_EXTRACT_DESC_STATE_LSB           0
`define SDP_CNTL_EXTRACT_DESC_STATE_SIZE          (`SDP_CNTL_EXTRACT_DESC_STATE_MSB - `SDP_CNTL_EXTRACT_DESC_STATE_LSB +1)
`define SDP_CNTL_EXTRACT_DESC_STATE_RANGE          `SDP_CNTL_EXTRACT_DESC_STATE_MSB : `SDP_CNTL_EXTRACT_DESC_STATE_LSB

//--------------------------------------------------------
// Storage Descriptor Process FSM

`define SDP_CNTL_PROC_STORAGE_DESC_WAIT                         16'b0000_0000_0000_0001
                                                 
`define SDP_CNTL_PROC_STORAGE_DESC_EXTRACT                      16'b0000_0000_0000_0010
`define SDP_CNTL_PROC_STORAGE_DESC_READ                         16'b0000_0000_0000_0100
`define SDP_CNTL_PROC_STORAGE_DESC_MEM_OUT_VALID                16'b0000_0000_0000_1000
`define SDP_CNTL_PROC_STORAGE_DESC_GENERATE_REQUEST             16'b0000_0000_0001_0000
`define SDP_CNTL_PROC_STORAGE_DESC_GENERATE_EXTRA_RESPONSE_ID   16'b0000_0000_0010_0000 
`define SDP_CNTL_PROC_STORAGE_DESC_CHECK_STRM_FIFO              16'b0000_0000_0100_0000
`define SDP_CNTL_PROC_STORAGE_DESC_CONS_FIELD                   16'b0000_0000_1000_0000
`define SDP_CNTL_PROC_STORAGE_DESC_JUMP_FIELD                   16'b0000_0001_0000_0000
`define SDP_CNTL_PROC_STORAGE_DESC_CALC_NUM_REQS                16'b0000_0010_0000_0000
`define SDP_CNTL_PROC_STORAGE_DESC_CHECK_PBC_VALUES             16'b0000_0100_0000_0000
`define SDP_CNTL_PROC_STORAGE_DESC_INC_PBC                      16'b0000_1000_0000_0000
`define SDP_CNTL_PROC_STORAGE_DESC_REQUESTS_COMPLETE            16'b0001_0000_0000_0000
`define SDP_CNTL_PROC_STORAGE_DESC_WAIT_STREAM_COMPLETE         16'b0010_0000_0000_0000

`define SDP_CNTL_PROC_STORAGE_DESC_COMPLETE                     16'b0100_0000_0000_0000
                                                  
`define SDP_CNTL_PROC_STORAGE_DESC_ERR                          16'b1000_0000_0000_0000

`define SDP_CNTL_PROC_STORAGE_DESC_STATE_WIDTH         16
`define SDP_CNTL_PROC_STORAGE_DESC_STATE_MSB           `SDP_CNTL_PROC_STORAGE_DESC_STATE_WIDTH-1
`define SDP_CNTL_PROC_STORAGE_DESC_STATE_LSB           0
`define SDP_CNTL_PROC_STORAGE_DESC_STATE_SIZE          (`SDP_CNTL_PROC_STORAGE_DESC_STATE_MSB - `SDP_CNTL_PROC_STORAGE_DESC_STATE_LSB +1)
`define SDP_CNTL_PROC_STORAGE_DESC_STATE_RANGE          `SDP_CNTL_PROC_STORAGE_DESC_STATE_MSB : `SDP_CNTL_PROC_STORAGE_DESC_STATE_LSB

//--------------------------------------------------------
// Stream Main Controller FSM

`define SDP_CNTL_STRM_CNTL_WAIT                    6'b00_0001
`define SDP_CNTL_STRM_CNTL_RUNNING                 6'b00_0010
`define SDP_CNTL_STRM_CNTL_FLUSH_REQUESTS          6'b00_0100
`define SDP_CNTL_STRM_CNTL_WAIT_DISABLE            6'b00_1000
`define SDP_CNTL_STRM_CNTL_COMPLETE                6'b01_0000
`define SDP_CNTL_STRM_CNTL_ERR                     6'b10_0000

`define SDP_CNTL_STRM_CNTL_STATE_WIDTH         6
`define SDP_CNTL_STRM_CNTL_STATE_MSB           `SDP_CNTL_STRM_CNTL_STATE_WIDTH-1
`define SDP_CNTL_STRM_CNTL_STATE_LSB           0
`define SDP_CNTL_STRM_CNTL_STATE_SIZE          (`SDP_CNTL_STRM_CNTL_STATE_MSB - `SDP_CNTL_STRM_CNTL_STATE_LSB +1)
`define SDP_CNTL_STRM_CNTL_STATE_RANGE          `SDP_CNTL_STRM_CNTL_STATE_MSB : `SDP_CNTL_STRM_CNTL_STATE_LSB

`define SDP_CNTL_REQUEST_COUNTER_WIDTH          5
`define SDP_CNTL_REQUEST_COUNTER_MSB           `SDP_CNTL_REQUEST_COUNTER_WIDTH-1
`define SDP_CNTL_REQUEST_COUNTER_LSB            0
`define SDP_CNTL_REQUEST_COUNTER_SIZE           (`SDP_CNTL_REQUEST_COUNTER_MSB - `SDP_CNTL_REQUEST_COUNTER_LSB +1)
`define SDP_CNTL_REQUEST_COUNTER_RANGE           `SDP_CNTL_REQUEST_COUNTER_MSB : `SDP_CNTL_REQUEST_COUNTER_LSB

//--------------------------------------------------------
// Stream Data FSM

`define SDP_CNTL_STRM_DATA_WAIT                    9'b0_0000_0001
`define SDP_CNTL_STRM_DATA_PTR_INIT                9'b0_0000_0010
`define SDP_CNTL_STRM_DATA_PTR_INC_INIT            9'b0_0000_0100

`define SDP_CNTL_STRM_DATA_LOAD_FIRST_CONS_COUNT   9'b0_0000_1000
`define SDP_CNTL_STRM_DATA_LOAD_JUMP_VALUE         9'b0_0001_0000
`define SDP_CNTL_STRM_DATA_COUNT_CONS              9'b0_0010_0000

`define SDP_CNTL_STRM_DATA_COMPLETE                9'b0_0100_0000
`define SDP_CNTL_STRM_DATA_WAIT_DISABLE            9'b0_1000_0000
`define SDP_CNTL_STRM_DATA_ERR                     9'b1_0000_0000

`define SDP_CNTL_STRM_DATA_STATE_WIDTH         9
`define SDP_CNTL_STRM_DATA_STATE_MSB           `SDP_CNTL_STRM_DATA_STATE_WIDTH-1
`define SDP_CNTL_STRM_DATA_STATE_LSB           0
`define SDP_CNTL_STRM_DATA_STATE_SIZE          (`SDP_CNTL_STRM_DATA_STATE_MSB - `SDP_CNTL_STRM_DATA_STATE_LSB +1)
`define SDP_CNTL_STRM_DATA_STATE_RANGE          `SDP_CNTL_STRM_DATA_STATE_MSB : `SDP_CNTL_STRM_DATA_STATE_LSB

`define SDP_CNTL_STRM_USES_DW_ADDER   

//------------------------------------------------------------------------------------------------------------
//------------------------------------------------------------------------------------------------------------
// end of FSM's
//------------------------------------------------------------------------------------------------------------
//------------------------------------------------------------------------------------------------------------


//------------------------------------------------------------------------------------------------------------
//--------------------------------------------------------
// Vector of channels
//  - used to indicate which channel has been opened with the current bank/page
  
`define SDP_CNTL_CHAN_BIT_WIDTH          `MGR_DRAM_NUM_CHANNELS
`define SDP_CNTL_CHAN_BIT_MSB           `SDP_CNTL_CHAN_BIT_WIDTH-1
`define SDP_CNTL_CHAN_BIT_LSB            0
`define SDP_CNTL_CHAN_BIT_SIZE           (`SDP_CNTL_CHAN_BIT_MSB - `SDP_CNTL_CHAN_BIT_LSB +1)
`define SDP_CNTL_CHAN_BIT_RANGE           `SDP_CNTL_CHAN_BIT_MSB : `SDP_CNTL_CHAN_BIT_LSB
//------------------------------------------------------------------------------------------------------------

`ifdef  MGR_DRAM_REQUEST_LINE_LT_CACHELINE
  //--------------------------------------------------------
  // Vector of Lines
  //  - used to indicate which line has been opened with the current chan/bank/page
    
  `define SDP_CNTL_LINE_BIT_WIDTH          `MGR_DRAM_NUM_LINES_PER_CLINE 
  `define SDP_CNTL_LINE_BIT_MSB           `SDP_CNTL_LINE_BIT_WIDTH-1
  `define SDP_CNTL_LINE_BIT_LSB            0
  `define SDP_CNTL_LINE_BIT_SIZE           (`SDP_CNTL_LINE_BIT_MSB - `SDP_CNTL_LINE_BIT_LSB +1)
  `define SDP_CNTL_LINE_BIT_RANGE           `SDP_CNTL_LINE_BIT_MSB : `SDP_CNTL_LINE_BIT_LSB
  //------------------------------------------------------------------------------------------------------------
`endif

//------------------------------------------------------------------------------------------------------------
//--------------------------------------------------------
// When we decrement the consequtive counter, we check for negative, so add bit
`define SDP_CNTL_CONS_COUNTER_WIDTH        `MGR_INST_CONS_JUMP_FIELD_WIDTH+1
`define SDP_CNTL_CONS_COUNTER_MSB          `SDP_CNTL_CONS_COUNTER_WIDTH-1
`define SDP_CNTL_CONS_COUNTER_LSB          0
`define SDP_CNTL_CONS_COUNTER_SIZE         (`SDP_CNTL_CONS_COUNTER_MSB - `SDP_CNTL_CONS_COUNTER_LSB +1)
`define SDP_CNTL_CONS_COUNTER_RANGE         `SDP_CNTL_CONS_COUNTER_MSB : `SDP_CNTL_CONS_COUNTER_LSB


//------------------------------------------------------------------------------------------------------------
//--------------------------------------------------------
// Number of active lanes is 1..32, so need 6 bits
  
`define SDP_CNTL_NUM_LANES_WIDTH               (`CLOG2(`PE_NUM_OF_EXEC_LANES))+1
`define SDP_CNTL_NUM_LANES_MSB           `SDP_CNTL_NUM_LANES_WIDTH-1
`define SDP_CNTL_NUM_LANES_LSB            0
`define SDP_CNTL_NUM_LANES_SIZE           (`SDP_CNTL_NUM_LANES_MSB - `SDP_CNTL_NUM_LANES_LSB +1)
`define SDP_CNTL_NUM_LANES_RANGE           `SDP_CNTL_NUM_LANES_MSB : `SDP_CNTL_NUM_LANES_LSB
//------------------------------------------------------------------------------------------------------------


//------------------------------------------------------------------------------------------------------------
//------------------------------------------------------------------------------------------------------------
// FIFO's
//------------------------------------------------------------------------------------------------------------

`define SDP_CNTL_DESC_FIFO_DEPTH          16
`define SDP_CNTL_DESC_FIFO_THRESHOLD      4

//--------------------------------------------------------
//--------------------------------------------------------
// From MMC

`define SDP_CNTL_FROM_MMC_FIFO_DEPTH          32
`define SDP_CNTL_FROM_MMC_FIFO_DEPTH_MSB      (`SDP_CNTL_FROM_MMC_FIFO_DEPTH) -1
`define SDP_CNTL_FROM_MMC_FIFO_DEPTH_LSB      0
`define SDP_CNTL_FROM_MMC_FIFO_DEPTH_SIZE     (`SDP_CNTL_FROM_MMC_FIFO_DEPTH_MSB - `SDP_CNTL_FROM_MMC_FIFO_DEPTH_LSB +1)
`define SDP_CNTL_FROM_MMC_FIFO_DEPTH_RANGE     `SDP_CNTL_FROM_MMC_FIFO_DEPTH_MSB : `SDP_CNTL_FROM_MMC_FIFO_DEPTH_LSB
`define SDP_CNTL_FROM_MMC_FIFO_MSB            ((`CLOG2(`SDP_CNTL_FROM_MMC_FIFO_DEPTH)) -1)
`define SDP_CNTL_FROM_MMC_FIFO_LSB            0
`define SDP_CNTL_FROM_MMC_FIFO_SIZE           (`SDP_CNTL_FROM_MMC_FIFO_MSB - `SDP_CNTL_FROM_MMC_FIFO_LSB +1)
`define SDP_CNTL_FROM_MMC_FIFO_RANGE           `SDP_CNTL_FROM_MMC_FIFO_MSB : `SDP_CNTL_FROM_MMC_FIFO_LSB

// For AGGREGATE_FIFO implemented as single memory, define field ranges
`define SDP_CNTL_FROM_MMC_AGGREGATE_DATA_WIDTH    (`MGR_MMC_TO_MRC_INTF_NUM_WORDS*`MGR_EXEC_LANE_WIDTH)
`define SDP_CNTL_FROM_MMC_AGGREGATE_DATA_MSB      `SDP_CNTL_FROM_MMC_AGGREGATE_DATA_WIDTH-1
`define SDP_CNTL_FROM_MMC_AGGREGATE_DATA_LSB      0
`define SDP_CNTL_FROM_MMC_AGGREGATE_DATA_SIZE     (`SDP_CNTL_FROM_MMC_AGGREGATE_DATA_MSB - `SDP_CNTL_FROM_MMC_AGGREGATE_DATA_LSB +1)
`define SDP_CNTL_FROM_MMC_AGGREGATE_DATA_RANGE     `SDP_CNTL_FROM_MMC_AGGREGATE_DATA_MSB : `SDP_CNTL_FROM_MMC_AGGREGATE_DATA_LSB

`define SDP_CNTL_FROM_MMC_AGGREGATE_CNTL_MSB      (`SDP_CNTL_FROM_MMC_AGGREGATE_CNTL_LSB+`COMMON_STD_INTF_CNTL_WIDTH) -1
`define SDP_CNTL_FROM_MMC_AGGREGATE_CNTL_LSB      `SDP_CNTL_FROM_MMC_AGGREGATE_DATA_MSB+1
`define SDP_CNTL_FROM_MMC_AGGREGATE_CNTL_SIZE     (`SDP_CNTL_FROM_MMC_AGGREGATE_CNTL_MSB - `SDP_CNTL_FROM_MMC_AGGREGATE_CNTL_LSB +1)
`define SDP_CNTL_FROM_MMC_AGGREGATE_CNTL_RANGE     `SDP_CNTL_FROM_MMC_AGGREGATE_CNTL_MSB : `SDP_CNTL_FROM_MMC_AGGREGATE_CNTL_LSB

`define SDP_CNTL_FROM_MMC_AGGREGATE_FIFO_WIDTH     `COMMON_STD_INTF_CNTL_WIDTH \
                                                   +`SDP_CNTL_FROM_MMC_AGGREGATE_DATA_WIDTH

`define SDP_CNTL_FROM_MMC_AGGREGATE_FIFO_MSB            `SDP_CNTL_FROM_MMC_AGGREGATE_FIFO_WIDTH -1
`define SDP_CNTL_FROM_MMC_AGGREGATE_FIFO_LSB            0
`define SDP_CNTL_FROM_MMC_AGGREGATE_FIFO_SIZE           (`SDP_CNTL_FROM_MMC_AGGREGATE_FIFO_MSB - `SDP_CNTL_FROM_MMC_AGGREGATE_FIFO_LSB +1)
`define SDP_CNTL_FROM_MMC_AGGREGATE_FIFO_RANGE           `SDP_CNTL_FROM_MMC_AGGREGATE_FIFO_MSB : `SDP_CNTL_FROM_MMC_AGGREGATE_FIFO_LSB


// Threshold below full when we assert almost full
// assert almost full when there are only this many entries available in the fifo
`define SDP_CNTL_FROM_MMC_FIFO_ALMOST_FULL_THRESHOLD 4


//--------------------------------------------------------
//--------------------------------------------------------
// Desc fsm to From MMC

`define SDP_CNTL_CJ_TO_STRM_FIFO_DEPTH         128
`define SDP_CNTL_CJ_TO_STRM_FIFO_DEPTH_MSB      (`SDP_CNTL_CJ_TO_STRM_FIFO_DEPTH) -1
`define SDP_CNTL_CJ_TO_STRM_FIFO_DEPTH_LSB      0
`define SDP_CNTL_CJ_TO_STRM_FIFO_DEPTH_SIZE     (`SDP_CNTL_CJ_TO_STRM_FIFO_DEPTH_MSB - `SDP_CNTL_CJ_TO_STRM_FIFO_DEPTH_LSB +1)
`define SDP_CNTL_CJ_TO_STRM_FIFO_DEPTH_RANGE     `SDP_CNTL_CJ_TO_STRM_FIFO_DEPTH_MSB : `SDP_CNTL_CJ_TO_STRM_FIFO_DEPTH_LSB
`define SDP_CNTL_CJ_TO_STRM_FIFO_MSB            ((`CLOG2(`SDP_CNTL_CJ_TO_STRM_FIFO_DEPTH)) -1)
`define SDP_CNTL_CJ_TO_STRM_FIFO_LSB            0
`define SDP_CNTL_CJ_TO_STRM_FIFO_SIZE           (`SDP_CNTL_CJ_TO_STRM_FIFO_MSB - `SDP_CNTL_CJ_TO_STRM_FIFO_LSB +1)
`define SDP_CNTL_CJ_TO_STRM_FIFO_RANGE           `SDP_CNTL_CJ_TO_STRM_FIFO_MSB : `SDP_CNTL_CJ_TO_STRM_FIFO_LSB

// For AGGREGATE_FIFO implemented as single memory, define field ranges
`define SDP_CNTL_CJ_TO_STRM_AGGREGATE_DATA_WIDTH    `MGR_INST_CONS_JUMP_FIELD_WIDTH 
`define SDP_CNTL_CJ_TO_STRM_AGGREGATE_DATA_MSB      `SDP_CNTL_CJ_TO_STRM_AGGREGATE_DATA_WIDTH-1
`define SDP_CNTL_CJ_TO_STRM_AGGREGATE_DATA_LSB      0
`define SDP_CNTL_CJ_TO_STRM_AGGREGATE_DATA_SIZE     (`SDP_CNTL_CJ_TO_STRM_AGGREGATE_DATA_MSB - `SDP_CNTL_CJ_TO_STRM_AGGREGATE_DATA_LSB +1)
`define SDP_CNTL_CJ_TO_STRM_AGGREGATE_DATA_RANGE     `SDP_CNTL_CJ_TO_STRM_AGGREGATE_DATA_MSB : `SDP_CNTL_CJ_TO_STRM_AGGREGATE_DATA_LSB

`define SDP_CNTL_CJ_TO_STRM_AGGREGATE_CNTL_WIDTH      `COMMON_STD_INTF_CNTL_WIDTH
`define SDP_CNTL_CJ_TO_STRM_AGGREGATE_CNTL_MSB      (`SDP_CNTL_CJ_TO_STRM_AGGREGATE_CNTL_LSB+`SDP_CNTL_CJ_TO_STRM_AGGREGATE_CNTL_WIDTH ) -1
`define SDP_CNTL_CJ_TO_STRM_AGGREGATE_CNTL_LSB      `SDP_CNTL_CJ_TO_STRM_AGGREGATE_DATA_MSB+1
`define SDP_CNTL_CJ_TO_STRM_AGGREGATE_CNTL_SIZE     (`SDP_CNTL_CJ_TO_STRM_AGGREGATE_CNTL_MSB - `SDP_CNTL_CJ_TO_STRM_AGGREGATE_CNTL_LSB +1)
`define SDP_CNTL_CJ_TO_STRM_AGGREGATE_CNTL_RANGE     `SDP_CNTL_CJ_TO_STRM_AGGREGATE_CNTL_MSB : `SDP_CNTL_CJ_TO_STRM_AGGREGATE_CNTL_LSB

`define SDP_CNTL_CJ_TO_STRM_AGGREGATE_FIFO_WIDTH    `SDP_CNTL_CJ_TO_STRM_AGGREGATE_CNTL_WIDTH \
                                                   +`SDP_CNTL_CJ_TO_STRM_AGGREGATE_DATA_WIDTH

`define SDP_CNTL_CJ_TO_STRM_AGGREGATE_FIFO_MSB            `SDP_CNTL_CJ_TO_STRM_AGGREGATE_FIFO_WIDTH -1
`define SDP_CNTL_CJ_TO_STRM_AGGREGATE_FIFO_LSB            0
`define SDP_CNTL_CJ_TO_STRM_AGGREGATE_FIFO_SIZE           (`SDP_CNTL_CJ_TO_STRM_AGGREGATE_FIFO_MSB - `SDP_CNTL_CJ_TO_STRM_AGGREGATE_FIFO_LSB +1)
`define SDP_CNTL_CJ_TO_STRM_AGGREGATE_FIFO_RANGE           `SDP_CNTL_CJ_TO_STRM_AGGREGATE_FIFO_MSB : `SDP_CNTL_CJ_TO_STRM_AGGREGATE_FIFO_LSB

`define SDP_CNTL_CJ_TO_STRM_FIFO_ALMOST_FULL_THRESHOLD 4

//------------------------------------------------------------------------------------------------------------
// 
`define SDP_CNTL_ADDR_TO_STRM_FIFO_DEPTH         64
`define SDP_CNTL_ADDR_TO_STRM_FIFO_DEPTH_MSB      (`SDP_CNTL_ADDR_TO_STRM_FIFO_DEPTH) -1
`define SDP_CNTL_ADDR_TO_STRM_FIFO_DEPTH_LSB      0
`define SDP_CNTL_ADDR_TO_STRM_FIFO_DEPTH_SIZE     (`SDP_CNTL_ADDR_TO_STRM_FIFO_DEPTH_MSB - `SDP_CNTL_ADDR_TO_STRM_FIFO_DEPTH_LSB +1)
`define SDP_CNTL_ADDR_TO_STRM_FIFO_DEPTH_RANGE     `SDP_CNTL_ADDR_TO_STRM_FIFO_DEPTH_MSB : `SDP_CNTL_ADDR_TO_STRM_FIFO_DEPTH_LSB
`define SDP_CNTL_ADDR_TO_STRM_FIFO_MSB            ((`CLOG2(`SDP_CNTL_ADDR_TO_STRM_FIFO_DEPTH)) -1)
`define SDP_CNTL_ADDR_TO_STRM_FIFO_LSB            0
`define SDP_CNTL_ADDR_TO_STRM_FIFO_SIZE           (`SDP_CNTL_ADDR_TO_STRM_FIFO_MSB - `SDP_CNTL_ADDR_TO_STRM_FIFO_LSB +1)
`define SDP_CNTL_ADDR_TO_STRM_FIFO_RANGE           `SDP_CNTL_ADDR_TO_STRM_FIFO_MSB : `SDP_CNTL_ADDR_TO_STRM_FIFO_LSB

// For AGGREGATE_FIFO implemented as single memory, define field ranges
`define SDP_CNTL_ADDR_TO_STRM_AGGREGATE_ADDR_WIDTH    `MGR_DRAM_LOCAL_ADDRESS_WIDTH 
`define SDP_CNTL_ADDR_TO_STRM_AGGREGATE_ADDR_MSB      `SDP_CNTL_ADDR_TO_STRM_AGGREGATE_ADDR_WIDTH-1
`define SDP_CNTL_ADDR_TO_STRM_AGGREGATE_ADDR_LSB      0
`define SDP_CNTL_ADDR_TO_STRM_AGGREGATE_ADDR_SIZE     (`SDP_CNTL_ADDR_TO_STRM_AGGREGATE_ADDR_MSB - `SDP_CNTL_ADDR_TO_STRM_AGGREGATE_ADDR_LSB +1)
`define SDP_CNTL_ADDR_TO_STRM_AGGREGATE_ADDR_RANGE     `SDP_CNTL_ADDR_TO_STRM_AGGREGATE_ADDR_MSB : `SDP_CNTL_ADDR_TO_STRM_AGGREGATE_ADDR_LSB

`define SDP_CNTL_ADDR_TO_STRM_AGGREGATE_ORDER_WIDTH      `MGR_INST_OPTION_ORDER_WIDTH
`define SDP_CNTL_ADDR_TO_STRM_AGGREGATE_ORDER_MSB      (`SDP_CNTL_ADDR_TO_STRM_AGGREGATE_ORDER_LSB+`SDP_CNTL_ADDR_TO_STRM_AGGREGATE_ORDER_WIDTH) -1
`define SDP_CNTL_ADDR_TO_STRM_AGGREGATE_ORDER_LSB      `SDP_CNTL_ADDR_TO_STRM_AGGREGATE_ADDR_MSB+1
`define SDP_CNTL_ADDR_TO_STRM_AGGREGATE_ORDER_SIZE     (`SDP_CNTL_ADDR_TO_STRM_AGGREGATE_ORDER_MSB - `SDP_CNTL_ADDR_TO_STRM_AGGREGATE_ORDER_LSB +1)
`define SDP_CNTL_ADDR_TO_STRM_AGGREGATE_ORDER_RANGE     `SDP_CNTL_ADDR_TO_STRM_AGGREGATE_ORDER_MSB : `SDP_CNTL_ADDR_TO_STRM_AGGREGATE_ORDER_LSB

`define SDP_CNTL_ADDR_TO_STRM_AGGREGATE_TGT_WIDTH      `MGR_INST_OPTION_TGT_WIDTH
`define SDP_CNTL_ADDR_TO_STRM_AGGREGATE_TGT_MSB      (`SDP_CNTL_ADDR_TO_STRM_AGGREGATE_TGT_LSB+`SDP_CNTL_ADDR_TO_STRM_AGGREGATE_TGT_WIDTH) -1
`define SDP_CNTL_ADDR_TO_STRM_AGGREGATE_TGT_LSB      `SDP_CNTL_ADDR_TO_STRM_AGGREGATE_ORDER_MSB+1
`define SDP_CNTL_ADDR_TO_STRM_AGGREGATE_TGT_SIZE     (`SDP_CNTL_ADDR_TO_STRM_AGGREGATE_TGT_MSB - `SDP_CNTL_ADDR_TO_STRM_AGGREGATE_TGT_LSB +1)
`define SDP_CNTL_ADDR_TO_STRM_AGGREGATE_TGT_RANGE     `SDP_CNTL_ADDR_TO_STRM_AGGREGATE_TGT_MSB : `SDP_CNTL_ADDR_TO_STRM_AGGREGATE_TGT_LSB

`define SDP_CNTL_ADDR_TO_STRM_AGGREGATE_TRANSFER_WIDTH      `MGR_INST_OPTION_TRANSFER_WIDTH
`define SDP_CNTL_ADDR_TO_STRM_AGGREGATE_TRANSFER_MSB      (`SDP_CNTL_ADDR_TO_STRM_AGGREGATE_TRANSFER_LSB+`SDP_CNTL_ADDR_TO_STRM_AGGREGATE_TRANSFER_WIDTH) -1
`define SDP_CNTL_ADDR_TO_STRM_AGGREGATE_TRANSFER_LSB      `SDP_CNTL_ADDR_TO_STRM_AGGREGATE_TGT_MSB+1
`define SDP_CNTL_ADDR_TO_STRM_AGGREGATE_TRANSFER_SIZE     (`SDP_CNTL_ADDR_TO_STRM_AGGREGATE_TRANSFER_MSB - `SDP_CNTL_ADDR_TO_STRM_AGGREGATE_TRANSFER_LSB +1)
`define SDP_CNTL_ADDR_TO_STRM_AGGREGATE_TRANSFER_RANGE     `SDP_CNTL_ADDR_TO_STRM_AGGREGATE_TRANSFER_MSB : `SDP_CNTL_ADDR_TO_STRM_AGGREGATE_TRANSFER_LSB

`define SDP_CNTL_ADDR_TO_STRM_AGGREGATE_NUM_LANES_WIDTH      `MGR_NUM_LANES_WIDTH
`define SDP_CNTL_ADDR_TO_STRM_AGGREGATE_NUM_LANES_MSB      (`SDP_CNTL_ADDR_TO_STRM_AGGREGATE_NUM_LANES_LSB+`SDP_CNTL_ADDR_TO_STRM_AGGREGATE_NUM_LANES_WIDTH) -1
`define SDP_CNTL_ADDR_TO_STRM_AGGREGATE_NUM_LANES_LSB      `SDP_CNTL_ADDR_TO_STRM_AGGREGATE_TRANSFER_MSB+1
`define SDP_CNTL_ADDR_TO_STRM_AGGREGATE_NUM_LANES_SIZE     (`SDP_CNTL_ADDR_TO_STRM_AGGREGATE_NUM_LANES_MSB - `SDP_CNTL_ADDR_TO_STRM_AGGREGATE_NUM_LANES_LSB +1)
`define SDP_CNTL_ADDR_TO_STRM_AGGREGATE_NUM_LANES_RANGE     `SDP_CNTL_ADDR_TO_STRM_AGGREGATE_NUM_LANES_MSB : `SDP_CNTL_ADDR_TO_STRM_AGGREGATE_NUM_LANES_LSB

`define SDP_CNTL_ADDR_TO_STRM_AGGREGATE_NUM_LANES_MINUS1_WIDTH      `MGR_NUM_LANES_WIDTH
`define SDP_CNTL_ADDR_TO_STRM_AGGREGATE_NUM_LANES_MINUS1_MSB      (`SDP_CNTL_ADDR_TO_STRM_AGGREGATE_NUM_LANES_MINUS1_LSB+`SDP_CNTL_ADDR_TO_STRM_AGGREGATE_NUM_LANES_MINUS1_WIDTH) -1
`define SDP_CNTL_ADDR_TO_STRM_AGGREGATE_NUM_LANES_MINUS1_LSB      `SDP_CNTL_ADDR_TO_STRM_AGGREGATE_NUM_LANES_MSB+1
`define SDP_CNTL_ADDR_TO_STRM_AGGREGATE_NUM_LANES_MINUS1_SIZE     (`SDP_CNTL_ADDR_TO_STRM_AGGREGATE_NUM_LANES_MINUS1_MSB - `SDP_CNTL_ADDR_TO_STRM_AGGREGATE_NUM_LANES_MINUS1_LSB +1)
`define SDP_CNTL_ADDR_TO_STRM_AGGREGATE_NUM_LANES_MINUS1_RANGE     `SDP_CNTL_ADDR_TO_STRM_AGGREGATE_NUM_LANES_MINUS1_MSB : `SDP_CNTL_ADDR_TO_STRM_AGGREGATE_NUM_LANES_MINUS1_LSB

`define SDP_CNTL_ADDR_TO_STRM_AGGREGATE_LANE_ENABLE_WIDTH      `MGR_NUM_OF_EXEC_LANES 
`define SDP_CNTL_ADDR_TO_STRM_AGGREGATE_LANE_ENABLE_MSB      (`SDP_CNTL_ADDR_TO_STRM_AGGREGATE_LANE_ENABLE_LSB+`SDP_CNTL_ADDR_TO_STRM_AGGREGATE_LANE_ENABLE_WIDTH) -1
`define SDP_CNTL_ADDR_TO_STRM_AGGREGATE_LANE_ENABLE_LSB      `SDP_CNTL_ADDR_TO_STRM_AGGREGATE_NUM_LANES_MINUS1_MSB+1
`define SDP_CNTL_ADDR_TO_STRM_AGGREGATE_LANE_ENABLE_SIZE     (`SDP_CNTL_ADDR_TO_STRM_AGGREGATE_LANE_ENABLE_MSB - `SDP_CNTL_ADDR_TO_STRM_AGGREGATE_LANE_ENABLE_LSB +1)
`define SDP_CNTL_ADDR_TO_STRM_AGGREGATE_LANE_ENABLE_RANGE     `SDP_CNTL_ADDR_TO_STRM_AGGREGATE_LANE_ENABLE_MSB : `SDP_CNTL_ADDR_TO_STRM_AGGREGATE_LANE_ENABLE_LSB

`define SDP_CNTL_ADDR_TO_STRM_AGGREGATE_FIFO_WIDTH      `SDP_CNTL_ADDR_TO_STRM_AGGREGATE_LANE_ENABLE_WIDTH      \
                                                      + `SDP_CNTL_ADDR_TO_STRM_AGGREGATE_NUM_LANES_MINUS1_WIDTH \
                                                      + `SDP_CNTL_ADDR_TO_STRM_AGGREGATE_NUM_LANES_WIDTH        \
                                                      + `SDP_CNTL_ADDR_TO_STRM_AGGREGATE_TRANSFER_WIDTH         \
                                                      + `SDP_CNTL_ADDR_TO_STRM_AGGREGATE_TGT_WIDTH              \
                                                      + `SDP_CNTL_ADDR_TO_STRM_AGGREGATE_ORDER_WIDTH            \
                                                      + `SDP_CNTL_ADDR_TO_STRM_AGGREGATE_ADDR_WIDTH

`define SDP_CNTL_ADDR_TO_STRM_AGGREGATE_FIFO_MSB            `SDP_CNTL_ADDR_TO_STRM_AGGREGATE_FIFO_WIDTH -1
`define SDP_CNTL_ADDR_TO_STRM_AGGREGATE_FIFO_LSB            0
`define SDP_CNTL_ADDR_TO_STRM_AGGREGATE_FIFO_SIZE           (`SDP_CNTL_ADDR_TO_STRM_AGGREGATE_FIFO_MSB - `SDP_CNTL_ADDR_TO_STRM_AGGREGATE_FIFO_LSB +1)
`define SDP_CNTL_ADDR_TO_STRM_AGGREGATE_FIFO_RANGE           `SDP_CNTL_ADDR_TO_STRM_AGGREGATE_FIFO_MSB : `SDP_CNTL_ADDR_TO_STRM_AGGREGATE_FIFO_LSB

`define SDP_CNTL_ADDR_TO_STRM_FIFO_ALMOST_FULL_THRESHOLD 4

//------------------------------------------------------------------------------------------------------------
//------------------------------------------------------------------------------------------------------------
// Response ID fifo
//  - for associating each channel return data with an address
//  - a fifo per channel
//
`define SDP_CNTL_RESPONSE_FIFO_DEPTH          64
`define SDP_CNTL_RESPONSE_FIFO_DEPTH_MSB      (`SDP_CNTL_RESPONSE_FIFO_DEPTH) -1
`define SDP_CNTL_RESPONSE_FIFO_DEPTH_LSB      0
`define SDP_CNTL_RESPONSE_FIFO_DEPTH_SIZE     (`SDP_CNTL_RESPONSE_FIFO_DEPTH_MSB - `SDP_CNTL_RESPONSE_FIFO_DEPTH_LSB +1)
`define SDP_CNTL_RESPONSE_FIFO_DEPTH_RANGE     `SDP_CNTL_RESPONSE_FIFO_DEPTH_MSB : `SDP_CNTL_RESPONSE_FIFO_DEPTH_LSB
`define SDP_CNTL_RESPONSE_FIFO_MSB            ((`CLOG2(`SDP_CNTL_RESPONSE_FIFO_DEPTH)) -1)
`define SDP_CNTL_RESPONSE_FIFO_LSB            0
`define SDP_CNTL_RESPONSE_FIFO_SIZE           (`SDP_CNTL_RESPONSE_FIFO_MSB - `SDP_CNTL_RESPONSE_FIFO_LSB +1)
`define SDP_CNTL_RESPONSE_FIFO_RANGE           `SDP_CNTL_RESPONSE_FIFO_MSB : `SDP_CNTL_RESPONSE_FIFO_LSB

// For AGGREGATE_FIFO implemented as single memory, define field ranges
`define SDP_CNTL_RESPONSE_AGGREGATE_LINE_WIDTH                       `MGR_DRAM_LINE_ADDRESS_WIDTH
`define SDP_CNTL_RESPONSE_AGGREGATE_LINE_LSB                         2  // account for byte address
`define SDP_CNTL_RESPONSE_AGGREGATE_LINE_MSB                         `SDP_CNTL_RESPONSE_AGGREGATE_LINE_LSB+`SDP_CNTL_RESPONSE_AGGREGATE_LINE_WIDTH-1
`define SDP_CNTL_RESPONSE_AGGREGATE_LINE_SIZE                        (`SDP_CNTL_RESPONSE_AGGREGATE_LINE_MSB - `SDP_CNTL_RESPONSE_AGGREGATE_LINE_LSB +1)
`define SDP_CNTL_RESPONSE_AGGREGATE_LINE_RANGE                        `SDP_CNTL_RESPONSE_AGGREGATE_LINE_MSB : `SDP_CNTL_RESPONSE_AGGREGATE_LINE_LSB

`define SDP_CNTL_RESPONSE_AGGREGATE_PAGE_WIDTH                       `MGR_DRAM_PAGE_ADDRESS_WIDTH
`define SDP_CNTL_RESPONSE_AGGREGATE_PAGE_LSB                         `SDP_CNTL_RESPONSE_AGGREGATE_LINE_MSB+1
`define SDP_CNTL_RESPONSE_AGGREGATE_PAGE_MSB                         `SDP_CNTL_RESPONSE_AGGREGATE_PAGE_LSB+`SDP_CNTL_RESPONSE_AGGREGATE_PAGE_WIDTH-1
`define SDP_CNTL_RESPONSE_AGGREGATE_PAGE_SIZE                        (`SDP_CNTL_RESPONSE_AGGREGATE_PAGE_MSB - `SDP_CNTL_RESPONSE_AGGREGATE_PAGE_LSB +1)
`define SDP_CNTL_RESPONSE_AGGREGATE_PAGE_RANGE                        `SDP_CNTL_RESPONSE_AGGREGATE_PAGE_MSB : `SDP_CNTL_RESPONSE_AGGREGATE_PAGE_LSB

`define SDP_CNTL_RESPONSE_AGGREGATE_BANK_WIDTH                       `MGR_DRAM_BANK_ADDRESS_WIDTH
`define SDP_CNTL_RESPONSE_AGGREGATE_BANK_LSB                         `SDP_CNTL_RESPONSE_AGGREGATE_PAGE_MSB+1
`define SDP_CNTL_RESPONSE_AGGREGATE_BANK_MSB                         `SDP_CNTL_RESPONSE_AGGREGATE_BANK_LSB+`SDP_CNTL_RESPONSE_AGGREGATE_BANK_WIDTH-1
`define SDP_CNTL_RESPONSE_AGGREGATE_BANK_SIZE                        (`SDP_CNTL_RESPONSE_AGGREGATE_BANK_MSB - `SDP_CNTL_RESPONSE_AGGREGATE_BANK_LSB +1)
`define SDP_CNTL_RESPONSE_AGGREGATE_BANK_RANGE                        `SDP_CNTL_RESPONSE_AGGREGATE_BANK_MSB : `SDP_CNTL_RESPONSE_AGGREGATE_BANK_LSB

`define SDP_CNTL_RESPONSE_AGGREGATE_CNTL_WIDTH                        `COMMON_STD_INTF_CNTL_WIDTH
`define SDP_CNTL_RESPONSE_AGGREGATE_CNTL_LSB                        `SDP_CNTL_RESPONSE_AGGREGATE_BANK_MSB+1
`define SDP_CNTL_RESPONSE_AGGREGATE_CNTL_MSB                        (`SDP_CNTL_RESPONSE_AGGREGATE_CNTL_LSB+`SDP_CNTL_RESPONSE_AGGREGATE_CNTL_WIDTH ) -1
`define SDP_CNTL_RESPONSE_AGGREGATE_CNTL_SIZE                       (`SDP_CNTL_RESPONSE_AGGREGATE_CNTL_MSB - `SDP_CNTL_RESPONSE_AGGREGATE_CNTL_LSB +1)
`define SDP_CNTL_RESPONSE_AGGREGATE_CNTL_RANGE                       `SDP_CNTL_RESPONSE_AGGREGATE_CNTL_MSB : `SDP_CNTL_RESPONSE_AGGREGATE_CNTL_LSB


`define SDP_CNTL_RESPONSE_AGGREGATE_FIFO_WIDTH    `SDP_CNTL_RESPONSE_AGGREGATE_LINE_WIDTH      \
                                                 +`SDP_CNTL_RESPONSE_AGGREGATE_PAGE_WIDTH      \
                                                 +`SDP_CNTL_RESPONSE_AGGREGATE_BANK_WIDTH      \
                                                 +`SDP_CNTL_RESPONSE_AGGREGATE_CNTL_WIDTH      

`define SDP_CNTL_RESPONSE_AGGREGATE_FIFO_MSB            `SDP_CNTL_RESPONSE_AGGREGATE_FIFO_WIDTH -1
`define SDP_CNTL_RESPONSE_AGGREGATE_FIFO_LSB            0
`define SDP_CNTL_RESPONSE_AGGREGATE_FIFO_SIZE           (`SDP_CNTL_RESPONSE_AGGREGATE_FIFO_MSB - `SDP_CNTL_RESPONSE_AGGREGATE_FIFO_LSB +1)
`define SDP_CNTL_RESPONSE_AGGREGATE_FIFO_RANGE           `SDP_CNTL_RESPONSE_AGGREGATE_FIFO_MSB : `SDP_CNTL_RESPONSE_AGGREGATE_FIFO_LSB


// Threshold below full when we assert almost full
// assert almost full when there are only this many entries available in the fifo
`define SDP_CNTL_RESPONSE_FIFO_ALMOST_FULL_THRESHOLD 12

//------------------------------------------------------------------------------------------------------------

`endif
