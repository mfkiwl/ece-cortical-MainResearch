`ifndef _mgr_cntl_vh
`define _mgr_cntl_vh

/*****************************************************************

    File name   : mgr_cntl.vh
    Author      : Lee Baker
    Affiliation : North Carolina State University, Raleigh, NC
    Date        : July 2017
    email       : lbbaker@ncsu.edu

*****************************************************************/


//------------------------------------------------------------------------------------------------------------
//------------------------------------------------------------------------------------------------------------
// Who needs their storage descriptor memory loaded
// MRC0, MRC1, MWC
`define MGR_CNTL_STORAGE_DESC_USERS_WIDTH         3
`define MGR_CNTL_STORAGE_DESC_USERS_MSB           `MGR_CNTL_STORAGE_DESC_USERS_WIDTH-1
`define MGR_CNTL_STORAGE_DESC_USERS_LSB           0
`define MGR_CNTL_STORAGE_DESC_USERS_SIZE          (`MGR_CNTL_STORAGE_DESC_USERS_MSB - `MGR_CNTL_STORAGE_DESC_USERS_LSB +1)
`define MGR_CNTL_STORAGE_DESC_USERS_RANGE          `MGR_CNTL_STORAGE_DESC_USERS_MSB : `MGR_CNTL_STORAGE_DESC_USERS_LSB

//------------------------------------------------------------------------------------------------------------
//------------------------------------------------------------------------------------------------------------
// FSM's
//------------------------------------------------------------------------------------------------------------
//--------------------------------------------------------
// Simple FSM simply to check MgrID from NoC
// - avoids having manager ID removed for SV

`define MGR_CNTL_MAIN_WAIT                   16'b0000_0000_0000_0001
`define MGR_CNTL_MAIN_START_WUD              16'b0000_0000_0000_0010
`define MGR_CNTL_MAIN_PROCESS_WUD            16'b0000_0000_0000_0100
`define MGR_CNTL_MAIN_COMPLETE_WUD           16'b0000_0000_0000_1000
`define MGR_CNTL_MAIN_MEM_UPLD_HEADER        16'b0000_0000_0001_0000
`define MGR_CNTL_MAIN_MEM_UPLD_DATA          16'b0000_0000_0010_0000
`define MGR_CNTL_MAIN_MEM_UPLD_DATA_END_PKT  16'b0000_0000_0100_0000
`define MGR_CNTL_MAIN_MEM_UPLD_COMPLETE      16'b0000_0000_1000_0000
`define MGR_CNTL_MAIN_MEM_DNLD               16'b0000_0001_0000_0000
`define MGR_CNTL_MAIN_SYNC_SEND_HEADER       16'b0000_0010_0000_0000
`define MGR_CNTL_MAIN_SYNC_SEND              16'b0000_0100_0000_0000
`define MGR_CNTL_MAIN_SYNC_SEND_END          16'b0000_1000_0000_0000
`define MGR_CNTL_MAIN_COMPLETE               16'b0100_0000_0000_0000

`define MGR_CNTL_MAIN_ERR                    16'b1000_0000_0000_0000

`define MGR_CNTL_MAIN_STATE_WIDTH         16
`define MGR_CNTL_MAIN_STATE_MSB           `MGR_CNTL_MAIN_STATE_WIDTH-1
`define MGR_CNTL_MAIN_STATE_LSB           0
`define MGR_CNTL_MAIN_STATE_SIZE          (`MGR_CNTL_MAIN_STATE_MSB - `MGR_CNTL_MAIN_STATE_LSB +1)
`define MGR_CNTL_MAIN_STATE_RANGE          `MGR_CNTL_MAIN_STATE_MSB : `MGR_CNTL_MAIN_STATE_LSB

//------------------------------------------------------------------------------------------------------------
//--------------------------------------------------------
// Simple FSM simply to check MgrID from NoC
// - avoids having manager ID removed for SV

`define MGR_CNTL_NOC_CNTL_INST_DNLD_INIT            12'b0000_0000_0001
`define MGR_CNTL_NOC_CNTL_DNLD_INST                 12'b0000_0000_0010
`define MGR_CNTL_NOC_CNTL_DNLD_INST_COMPLETE        12'b0000_0000_0100
                                                    
`define MGR_CNTL_NOC_CNTL_WAIT                      12'b0000_0000_1000
`define MGR_CNTL_NOC_CNTL_MWC_RCV                   12'b0000_0001_0000
                                                    
`define MGR_CNTL_NOC_CNTL_UNSOL_DMA_START           12'b0000_0010_0000
`define MGR_CNTL_NOC_CNTL_DMA_RCV_TRANSFER_HEADER   12'b0000_0100_0000
`define MGR_CNTL_NOC_CNTL_DMA_RCV_ADD_DESC          12'b0000_1000_0000
`define MGR_CNTL_NOC_CNTL_DMA_RCV_TRANSFER_DATA     12'b0001_0000_0000
`define MGR_CNTL_NOC_CNTL_DMA_RCV_WAIT_PKT          12'b0010_0000_0000

`define MGR_CNTL_NOC_CNTL_COMPLETE                  12'b0100_0000_0000
                                                            
`define MGR_CNTL_NOC_CNTL_ERR                       12'b1000_0000_0000

`define MGR_CNTL_NOC_CNTL_STATE_WIDTH         12
`define MGR_CNTL_NOC_CNTL_STATE_MSB           `MGR_CNTL_NOC_CNTL_STATE_WIDTH-1
`define MGR_CNTL_NOC_CNTL_STATE_LSB           0
`define MGR_CNTL_NOC_CNTL_STATE_SIZE          (`MGR_CNTL_NOC_CNTL_STATE_MSB - `MGR_CNTL_NOC_CNTL_STATE_LSB +1)
`define MGR_CNTL_NOC_CNTL_STATE_RANGE          `MGR_CNTL_NOC_CNTL_STATE_MSB : `MGR_CNTL_NOC_CNTL_STATE_LSB

//--------------------------------------------------------
//--------------------------------------------------------
// DMA lanes from memory read

`define MGR_CNTL_NUM_OF_DMA_LANES               2
`define MGR_CNTL_NUM_OF_DMA_LANES_MSB           (`MGR_CNTL_NUM_OF_DMA_LANES -1)
`define MGR_CNTL_NUM_OF_DMA_LANES_LSB            0
`define MGR_CNTL_NUM_OF_DMA_LANES_SIZE           (`MGR_CNTL_NUM_OF_DMA_LANES_MSB - `MGR_CNTL_NUM_OF_DMA_LANES_LSB +1)
`define MGR_CNTL_NUM_OF_DMA_LANES_RANGE           `MGR_CNTL_NUM_OF_DMA_LANES_MSB : `MGR_CNTL_NUM_OF_DMA_LANES_LSB

//------------------------------------------------
// FIFO's
//------------------------------------------------

//--------------------------------------------------------
//--------------------------------------------------------
// From WUD

`define MGR_CNTL_WU_FIFO_FIFO_DEPTH          8
`define MGR_CNTL_WU_FIFO_FIFO_DEPTH_MSB      (`MGR_CNTL_WU_FIFO_FIFO_DEPTH) -1
`define MGR_CNTL_WU_FIFO_FIFO_DEPTH_LSB      0
`define MGR_CNTL_WU_FIFO_FIFO_DEPTH_SIZE     (`MGR_CNTL_WU_FIFO_FIFO_DEPTH_MSB - `MGR_CNTL_WU_FIFO_FIFO_DEPTH_LSB +1)
`define MGR_CNTL_WU_FIFO_FIFO_DEPTH_RANGE     `MGR_CNTL_WU_FIFO_FIFO_DEPTH_MSB : `MGR_CNTL_WU_FIFO_FIFO_DEPTH_LSB
`define MGR_CNTL_WU_FIFO_FIFO_MSB            ((`CLOG2(`MGR_CNTL_WU_FIFO_FIFO_DEPTH)) -1)
`define MGR_CNTL_WU_FIFO_FIFO_LSB            0
`define MGR_CNTL_WU_FIFO_FIFO_SIZE           (`MGR_CNTL_WU_FIFO_FIFO_MSB - `MGR_CNTL_WU_FIFO_FIFO_LSB +1)
`define MGR_CNTL_WU_FIFO_FIFO_RANGE           `MGR_CNTL_WU_FIFO_FIFO_MSB : `MGR_CNTL_WU_FIFO_FIFO_LSB

// Threshold below full when we assert almost full
// assert almost full when there are only this many entries available in the fifo
`define MGR_CNTL_WU_FIFO_FIFO_ALMOST_FULL_THRESHOLD 4


`define MGR_CNTL_WU_FIFO_AGGREGATE_OPT_VALUE_0_WIDTH                       `MGR_WU_OPT_VALUE_WIDTH 
`define MGR_CNTL_WU_FIFO_AGGREGATE_OPT_VALUE_0_LSB                         0
`define MGR_CNTL_WU_FIFO_AGGREGATE_OPT_VALUE_0_MSB                         `MGR_CNTL_WU_FIFO_AGGREGATE_OPT_VALUE_0_LSB+`MGR_CNTL_WU_FIFO_AGGREGATE_OPT_VALUE_0_WIDTH-1
`define MGR_CNTL_WU_FIFO_AGGREGATE_OPT_VALUE_0_SIZE                        (`MGR_CNTL_WU_FIFO_AGGREGATE_OPT_VALUE_0_MSB - `MGR_CNTL_WU_FIFO_AGGREGATE_OPT_VALUE_0_LSB +1)
`define MGR_CNTL_WU_FIFO_AGGREGATE_OPT_VALUE_0_RANGE                        `MGR_CNTL_WU_FIFO_AGGREGATE_OPT_VALUE_0_MSB : `MGR_CNTL_WU_FIFO_AGGREGATE_OPT_VALUE_0_LSB

`define MGR_CNTL_WU_FIFO_AGGREGATE_OPT_TYPE_0_WIDTH                       `MGR_WU_OPT_TYPE_WIDTH 
`define MGR_CNTL_WU_FIFO_AGGREGATE_OPT_TYPE_0_LSB                         `MGR_CNTL_WU_FIFO_AGGREGATE_OPT_VALUE_0_MSB+1
`define MGR_CNTL_WU_FIFO_AGGREGATE_OPT_TYPE_0_MSB                         `MGR_CNTL_WU_FIFO_AGGREGATE_OPT_TYPE_0_LSB+`MGR_CNTL_WU_FIFO_AGGREGATE_OPT_TYPE_0_WIDTH-1
`define MGR_CNTL_WU_FIFO_AGGREGATE_OPT_TYPE_0_SIZE                        (`MGR_CNTL_WU_FIFO_AGGREGATE_OPT_TYPE_0_MSB - `MGR_CNTL_WU_FIFO_AGGREGATE_OPT_TYPE_0_LSB +1)
`define MGR_CNTL_WU_FIFO_AGGREGATE_OPT_TYPE_0_RANGE                        `MGR_CNTL_WU_FIFO_AGGREGATE_OPT_TYPE_0_MSB : `MGR_CNTL_WU_FIFO_AGGREGATE_OPT_TYPE_0_LSB

`define MGR_CNTL_WU_FIFO_AGGREGATE_OPT_VALUE_1_WIDTH                       `MGR_WU_OPT_VALUE_WIDTH 
`define MGR_CNTL_WU_FIFO_AGGREGATE_OPT_VALUE_1_LSB                         `MGR_CNTL_WU_FIFO_AGGREGATE_OPT_TYPE_0_MSB+1
`define MGR_CNTL_WU_FIFO_AGGREGATE_OPT_VALUE_1_MSB                         `MGR_CNTL_WU_FIFO_AGGREGATE_OPT_VALUE_1_LSB+`MGR_CNTL_WU_FIFO_AGGREGATE_OPT_VALUE_1_WIDTH-1
`define MGR_CNTL_WU_FIFO_AGGREGATE_OPT_VALUE_1_SIZE                        (`MGR_CNTL_WU_FIFO_AGGREGATE_OPT_VALUE_1_MSB - `MGR_CNTL_WU_FIFO_AGGREGATE_OPT_VALUE_1_LSB +1)
`define MGR_CNTL_WU_FIFO_AGGREGATE_OPT_VALUE_1_RANGE                        `MGR_CNTL_WU_FIFO_AGGREGATE_OPT_VALUE_1_MSB : `MGR_CNTL_WU_FIFO_AGGREGATE_OPT_VALUE_1_LSB

`define MGR_CNTL_WU_FIFO_AGGREGATE_OPT_TYPE_1_WIDTH                       `MGR_WU_OPT_TYPE_WIDTH 
`define MGR_CNTL_WU_FIFO_AGGREGATE_OPT_TYPE_1_LSB                         `MGR_CNTL_WU_FIFO_AGGREGATE_OPT_VALUE_1_MSB+1
`define MGR_CNTL_WU_FIFO_AGGREGATE_OPT_TYPE_1_MSB                         `MGR_CNTL_WU_FIFO_AGGREGATE_OPT_TYPE_1_LSB+`MGR_CNTL_WU_FIFO_AGGREGATE_OPT_TYPE_1_WIDTH-1
`define MGR_CNTL_WU_FIFO_AGGREGATE_OPT_TYPE_1_SIZE                        (`MGR_CNTL_WU_FIFO_AGGREGATE_OPT_TYPE_1_MSB - `MGR_CNTL_WU_FIFO_AGGREGATE_OPT_TYPE_1_LSB +1)
`define MGR_CNTL_WU_FIFO_AGGREGATE_OPT_TYPE_1_RANGE                        `MGR_CNTL_WU_FIFO_AGGREGATE_OPT_TYPE_1_MSB : `MGR_CNTL_WU_FIFO_AGGREGATE_OPT_TYPE_1_LSB

`define MGR_CNTL_WU_FIFO_AGGREGATE_OPT_VALUE_2_WIDTH                       `MGR_WU_OPT_VALUE_WIDTH 
`define MGR_CNTL_WU_FIFO_AGGREGATE_OPT_VALUE_2_LSB                         `MGR_CNTL_WU_FIFO_AGGREGATE_OPT_TYPE_1_MSB+1
`define MGR_CNTL_WU_FIFO_AGGREGATE_OPT_VALUE_2_MSB                         `MGR_CNTL_WU_FIFO_AGGREGATE_OPT_VALUE_2_LSB+`MGR_CNTL_WU_FIFO_AGGREGATE_OPT_VALUE_2_WIDTH-1
`define MGR_CNTL_WU_FIFO_AGGREGATE_OPT_VALUE_2_SIZE                        (`MGR_CNTL_WU_FIFO_AGGREGATE_OPT_VALUE_2_MSB - `MGR_CNTL_WU_FIFO_AGGREGATE_OPT_VALUE_2_LSB +1)
`define MGR_CNTL_WU_FIFO_AGGREGATE_OPT_VALUE_2_RANGE                        `MGR_CNTL_WU_FIFO_AGGREGATE_OPT_VALUE_2_MSB : `MGR_CNTL_WU_FIFO_AGGREGATE_OPT_VALUE_2_LSB

`define MGR_CNTL_WU_FIFO_AGGREGATE_OPT_TYPE_2_WIDTH                       `MGR_WU_OPT_TYPE_WIDTH 
`define MGR_CNTL_WU_FIFO_AGGREGATE_OPT_TYPE_2_LSB                         `MGR_CNTL_WU_FIFO_AGGREGATE_OPT_VALUE_2_MSB+1
`define MGR_CNTL_WU_FIFO_AGGREGATE_OPT_TYPE_2_MSB                         `MGR_CNTL_WU_FIFO_AGGREGATE_OPT_TYPE_2_LSB+`MGR_CNTL_WU_FIFO_AGGREGATE_OPT_TYPE_2_WIDTH-1
`define MGR_CNTL_WU_FIFO_AGGREGATE_OPT_TYPE_2_SIZE                        (`MGR_CNTL_WU_FIFO_AGGREGATE_OPT_TYPE_2_MSB - `MGR_CNTL_WU_FIFO_AGGREGATE_OPT_TYPE_2_LSB +1)
`define MGR_CNTL_WU_FIFO_AGGREGATE_OPT_TYPE_2_RANGE                        `MGR_CNTL_WU_FIFO_AGGREGATE_OPT_TYPE_2_MSB : `MGR_CNTL_WU_FIFO_AGGREGATE_OPT_TYPE_2_LSB

`define MGR_CNTL_WU_FIFO_AGGREGATE_TAG_WIDTH                       `MGR_STD_OOB_TAG_WIDTH
`define MGR_CNTL_WU_FIFO_AGGREGATE_TAG_LSB                         `MGR_CNTL_WU_FIFO_AGGREGATE_OPT_TYPE_2_MSB+1
`define MGR_CNTL_WU_FIFO_AGGREGATE_TAG_MSB                         `MGR_CNTL_WU_FIFO_AGGREGATE_TAG_LSB+`MGR_CNTL_WU_FIFO_AGGREGATE_TAG_WIDTH-1
`define MGR_CNTL_WU_FIFO_AGGREGATE_TAG_SIZE                        (`MGR_CNTL_WU_FIFO_AGGREGATE_TAG_MSB - `MGR_CNTL_WU_FIFO_AGGREGATE_TAG_LSB +1)
`define MGR_CNTL_WU_FIFO_AGGREGATE_TAG_RANGE                        `MGR_CNTL_WU_FIFO_AGGREGATE_TAG_MSB : `MGR_CNTL_WU_FIFO_AGGREGATE_TAG_LSB

`define MGR_CNTL_WU_FIFO_AGGREGATE_CNTL_WIDTH                       `COMMON_STD_INTF_CNTL_WIDTH 
`define MGR_CNTL_WU_FIFO_AGGREGATE_CNTL_LSB                         `MGR_CNTL_WU_FIFO_AGGREGATE_TAG_MSB+1
`define MGR_CNTL_WU_FIFO_AGGREGATE_CNTL_MSB                         `MGR_CNTL_WU_FIFO_AGGREGATE_CNTL_LSB+`MGR_CNTL_WU_FIFO_AGGREGATE_CNTL_WIDTH-1
`define MGR_CNTL_WU_FIFO_AGGREGATE_CNTL_SIZE                        (`MGR_CNTL_WU_FIFO_AGGREGATE_CNTL_MSB - `MGR_CNTL_WU_FIFO_AGGREGATE_CNTL_LSB +1)
`define MGR_CNTL_WU_FIFO_AGGREGATE_CNTL_RANGE                        `MGR_CNTL_WU_FIFO_AGGREGATE_CNTL_MSB : `MGR_CNTL_WU_FIFO_AGGREGATE_CNTL_LSB

`define MGR_CNTL_WU_FIFO_AGGREGATE_FIFO_WIDTH     `MGR_CNTL_WU_FIFO_AGGREGATE_OPT_VALUE_0_WIDTH  \
                                                 +`MGR_CNTL_WU_FIFO_AGGREGATE_OPT_TYPE_0_WIDTH   \
                                                 +`MGR_CNTL_WU_FIFO_AGGREGATE_OPT_VALUE_0_WIDTH  \
                                                 +`MGR_CNTL_WU_FIFO_AGGREGATE_OPT_TYPE_0_WIDTH   \
                                                 +`MGR_CNTL_WU_FIFO_AGGREGATE_OPT_VALUE_0_WIDTH  \
                                                 +`MGR_CNTL_WU_FIFO_AGGREGATE_OPT_TYPE_0_WIDTH   \
                                                 +`MGR_CNTL_WU_FIFO_AGGREGATE_TAG_WIDTH          \
                                                 +`MGR_CNTL_WU_FIFO_AGGREGATE_CNTL_WIDTH        
                                                 
`define MGR_CNTL_WU_FIFO_AGGREGATE_FIFO_MSB            `MGR_CNTL_WU_FIFO_AGGREGATE_FIFO_WIDTH -1
`define MGR_CNTL_WU_FIFO_AGGREGATE_FIFO_LSB            0
`define MGR_CNTL_WU_FIFO_AGGREGATE_FIFO_SIZE           (`MGR_CNTL_WU_FIFO_AGGREGATE_FIFO_MSB - `MGR_CNTL_WU_FIFO_AGGREGATE_FIFO_LSB +1)
`define MGR_CNTL_WU_FIFO_AGGREGATE_FIFO_RANGE           `MGR_CNTL_WU_FIFO_AGGREGATE_FIFO_MSB : `MGR_CNTL_WU_FIFO_AGGREGATE_FIFO_LSB



//--------------------------------------------------------
//--------------------------------------------------------
// From NoC

`define MGR_CNTL_FROM_NOC_FIFO_DEPTH          16
`define MGR_CNTL_FROM_NOC_FIFO_DEPTH_MSB      (`MGR_CNTL_FROM_NOC_FIFO_DEPTH) -1
`define MGR_CNTL_FROM_NOC_FIFO_DEPTH_LSB      0
`define MGR_CNTL_FROM_NOC_FIFO_DEPTH_SIZE     (`MGR_CNTL_FROM_NOC_FIFO_DEPTH_MSB - `MGR_CNTL_FROM_NOC_FIFO_DEPTH_LSB +1)
`define MGR_CNTL_FROM_NOC_FIFO_DEPTH_RANGE     `MGR_CNTL_FROM_NOC_FIFO_DEPTH_MSB : `MGR_CNTL_FROM_NOC_FIFO_DEPTH_LSB
`define MGR_CNTL_FROM_NOC_FIFO_MSB            ((`CLOG2(`MGR_CNTL_FROM_NOC_FIFO_DEPTH)) -1)
`define MGR_CNTL_FROM_NOC_FIFO_LSB            0
`define MGR_CNTL_FROM_NOC_FIFO_SIZE           (`MGR_CNTL_FROM_NOC_FIFO_MSB - `MGR_CNTL_FROM_NOC_FIFO_LSB +1)
`define MGR_CNTL_FROM_NOC_FIFO_RANGE           `MGR_CNTL_FROM_NOC_FIFO_MSB : `MGR_CNTL_FROM_NOC_FIFO_LSB

// Threshold below full when we assert almost full
// assert almost full when there are only this many entries available in the fifo
`define MGR_CNTL_FROM_NOC_FIFO_ALMOST_FULL_THRESHOLD 6

`define MGR_CNTL_FROM_NOC_AGGREGATE_DATA_WIDTH    `MGR_NOC_CONT_INTERNAL_DATA_WIDTH 
`define MGR_CNTL_FROM_NOC_AGGREGATE_DATA_MSB      `MGR_CNTL_FROM_NOC_AGGREGATE_DATA_WIDTH-1
`define MGR_CNTL_FROM_NOC_AGGREGATE_DATA_LSB      0
`define MGR_CNTL_FROM_NOC_AGGREGATE_DATA_SIZE     (`MGR_CNTL_FROM_NOC_AGGREGATE_DATA_MSB - `MGR_CNTL_FROM_NOC_AGGREGATE_DATA_LSB +1)
`define MGR_CNTL_FROM_NOC_AGGREGATE_DATA_RANGE     `MGR_CNTL_FROM_NOC_AGGREGATE_DATA_MSB : `MGR_CNTL_FROM_NOC_AGGREGATE_DATA_LSB

`define MGR_CNTL_FROM_NOC_AGGREGATE_PAYLOAD_VALID_WIDTH      1
`define MGR_CNTL_FROM_NOC_AGGREGATE_PAYLOAD_VALID_MSB      (`MGR_CNTL_FROM_NOC_AGGREGATE_PAYLOAD_VALID_LSB+`MGR_CNTL_FROM_NOC_AGGREGATE_PAYLOAD_VALID_WIDTH ) -1
`define MGR_CNTL_FROM_NOC_AGGREGATE_PAYLOAD_VALID_LSB      `MGR_CNTL_FROM_NOC_AGGREGATE_DATA_MSB+1
`define MGR_CNTL_FROM_NOC_AGGREGATE_PAYLOAD_VALID_SIZE     (`MGR_CNTL_FROM_NOC_AGGREGATE_PAYLOAD_VALID_MSB - `MGR_CNTL_FROM_NOC_AGGREGATE_PAYLOAD_VALID_LSB +1)
`define MGR_CNTL_FROM_NOC_AGGREGATE_PAYLOAD_VALID_RANGE     `MGR_CNTL_FROM_NOC_AGGREGATE_PAYLOAD_VALID_MSB : `MGR_CNTL_FROM_NOC_AGGREGATE_PAYLOAD_VALID_LSB

`define MGR_CNTL_FROM_NOC_AGGREGATE_PAYLOAD_TYPE_WIDTH    `MGR_NOC_CONT_NOC_PAYLOAD_TYPE_WIDTH            
`define MGR_CNTL_FROM_NOC_AGGREGATE_PAYLOAD_TYPE_MSB      (`MGR_CNTL_FROM_NOC_AGGREGATE_PAYLOAD_TYPE_LSB+`MGR_CNTL_FROM_NOC_AGGREGATE_PAYLOAD_TYPE_WIDTH ) -1
`define MGR_CNTL_FROM_NOC_AGGREGATE_PAYLOAD_TYPE_LSB      `MGR_CNTL_FROM_NOC_AGGREGATE_PAYLOAD_VALID_MSB+1
`define MGR_CNTL_FROM_NOC_AGGREGATE_PAYLOAD_TYPE_SIZE     (`MGR_CNTL_FROM_NOC_AGGREGATE_PAYLOAD_TYPE_MSB - `MGR_CNTL_FROM_NOC_AGGREGATE_PAYLOAD_TYPE_LSB +1)
`define MGR_CNTL_FROM_NOC_AGGREGATE_PAYLOAD_TYPE_RANGE     `MGR_CNTL_FROM_NOC_AGGREGATE_PAYLOAD_TYPE_MSB : `MGR_CNTL_FROM_NOC_AGGREGATE_PAYLOAD_TYPE_LSB

`define MGR_CNTL_FROM_NOC_AGGREGATE_PACKET_TYPE_WIDTH    `MGR_NOC_CONT_NOC_PACKET_TYPE_WIDTH            
`define MGR_CNTL_FROM_NOC_AGGREGATE_PACKET_TYPE_MSB      (`MGR_CNTL_FROM_NOC_AGGREGATE_PACKET_TYPE_LSB+`MGR_CNTL_FROM_NOC_AGGREGATE_PACKET_TYPE_WIDTH ) -1
`define MGR_CNTL_FROM_NOC_AGGREGATE_PACKET_TYPE_LSB      `MGR_CNTL_FROM_NOC_AGGREGATE_PACKET_VALID_MSB+1
`define MGR_CNTL_FROM_NOC_AGGREGATE_PACKET_TYPE_SIZE     (`MGR_CNTL_FROM_NOC_AGGREGATE_PACKET_TYPE_MSB - `MGR_CNTL_FROM_NOC_AGGREGATE_PACKET_TYPE_LSB +1)
`define MGR_CNTL_FROM_NOC_AGGREGATE_PACKET_TYPE_RANGE     `MGR_CNTL_FROM_NOC_AGGREGATE_PACKET_TYPE_MSB : `MGR_CNTL_FROM_NOC_AGGREGATE_PACKET_TYPE_LSB

`define MGR_CNTL_FROM_NOC_AGGREGATE_SRC_ID_WIDTH    `MGR_ARRAY_HOST_ID_WIDTH
`define MGR_CNTL_FROM_NOC_AGGREGATE_SRC_ID_MSB      (`MGR_CNTL_FROM_NOC_AGGREGATE_SRC_ID_LSB+`MGR_CNTL_FROM_NOC_AGGREGATE_SRC_ID_WIDTH ) -1
`define MGR_CNTL_FROM_NOC_AGGREGATE_SRC_ID_LSB      `MGR_CNTL_FROM_NOC_AGGREGATE_PACKET_VALID_MSB+1
`define MGR_CNTL_FROM_NOC_AGGREGATE_SRC_ID_SIZE     (`MGR_CNTL_FROM_NOC_AGGREGATE_SRC_ID_MSB - `MGR_CNTL_FROM_NOC_AGGREGATE_SRC_ID_LSB +1)
`define MGR_CNTL_FROM_NOC_AGGREGATE_SRC_ID_RANGE     `MGR_CNTL_FROM_NOC_AGGREGATE_SRC_ID_MSB : `MGR_CNTL_FROM_NOC_AGGREGATE_SRC_ID_LSB

`define MGR_CNTL_FROM_NOC_AGGREGATE_CNTL_WIDTH     `COMMON_STD_INTF_CNTL_WIDTH 
`define MGR_CNTL_FROM_NOC_AGGREGATE_CNTL_MSB      (`MGR_CNTL_FROM_NOC_AGGREGATE_CNTL_LSB+`MGR_CNTL_FROM_NOC_AGGREGATE_CNTL_WIDTH ) -1
`define MGR_CNTL_FROM_NOC_AGGREGATE_CNTL_LSB      `MGR_CNTL_FROM_NOC_AGGREGATE_TYPE_MSB+1
`define MGR_CNTL_FROM_NOC_AGGREGATE_CNTL_SIZE     (`MGR_CNTL_FROM_NOC_AGGREGATE_CNTL_MSB - `MGR_CNTL_FROM_NOC_AGGREGATE_CNTL_LSB +1)
`define MGR_CNTL_FROM_NOC_AGGREGATE_CNTL_RANGE     `MGR_CNTL_FROM_NOC_AGGREGATE_CNTL_MSB : `MGR_CNTL_FROM_NOC_AGGREGATE_CNTL_LSB



`define MGR_CNTL_FROM_NOC_AGGREGATE_FIFO_WIDTH       `MGR_CNTL_FROM_NOC_AGGREGATE_DATA_WIDTH            \
                                                    +`MGR_CNTL_FROM_NOC_AGGREGATE_PAYLOAD_VALID_WIDTH   \
                                                    +`MGR_CNTL_FROM_NOC_AGGREGATE_PAYLOAD_TYPE_WIDTH    \
                                                    +`MGR_CNTL_FROM_NOC_AGGREGATE_PACKET_TYPE_WIDTH     \
                                                    +`MGR_CNTL_FROM_NOC_AGGREGATE_SRC_ID_WIDTH          \
                                                    +`MGR_CNTL_FROM_NOC_AGGREGATE_CNTL_WIDTH            

`define MGR_CNTL_FROM_NOC_AGGREGATE_FIFO_MSB            `MGR_CNTL_FROM_NOC_AGGREGATE_FIFO_WIDTH -1
`define MGR_CNTL_FROM_NOC_AGGREGATE_FIFO_LSB            0
`define MGR_CNTL_FROM_NOC_AGGREGATE_FIFO_SIZE           (`MGR_CNTL_FROM_NOC_AGGREGATE_FIFO_MSB - `MGR_CNTL_FROM_NOC_AGGREGATE_FIFO_LSB +1)
`define MGR_CNTL_FROM_NOC_AGGREGATE_FIFO_RANGE           `MGR_CNTL_FROM_NOC_AGGREGATE_FIFO_MSB : `MGR_CNTL_FROM_NOC_AGGREGATE_FIFO_LSB



//------------------------------------------------------------------------------------------------------------

`endif
