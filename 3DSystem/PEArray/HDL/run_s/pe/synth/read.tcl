#------------------------------------------------------------
#
# Basic Synthesis Script (TCL format)
#                                  
# Revision History                
#   1/15/03  : Author Shane T. Gehring - from class example
#   2/09/07  : Author Zhengtao Yu      - from class example
#   12/14/07 : Author Ravi Jenkal      - updated to 180 nm & tcl
#
#------------------------------------------------------------

#---------------------------------------------------------
# Read in Verilog file and map (synthesize) onto a generic
# library.
# MAKE SURE THAT YOU CORRECT ALL WARNINGS THAT APPEAR
# during the execution of the read command are fixed 
# or understood to have no impact.
# ALSO CHECK your latch/flip-flop list for unintended 
# latches                                            
#---------------------------------------------------------

read_sverilog $RTL_COM_DIR/generic_1port_memory.v
read_sverilog $RTL_COM_DIR/generic_2port_memory.v
read_sverilog $RTL_COM_DIR/generic_fifo.v
read_sverilog $RTL_COM_DIR/generic_pipelined_fifo.v

#------------------------------------------------------------------------------------------------------------------------
#------------------------------------------------------------------------------------------------------------------------
# Create parameterized modules
# - each FIFO has a corresponding memory
# - dont forget to create memory .db file
#

#------------------------------------------------------------------------------------------------------------------------
# Generic Pipelined FIFO's (and memory)
#  - elaborate the memory first, then generic_fifo then generic_pipelined_fifo

# <name>
#
# from_system_fifo
analyze -format sverilog -library WORK -define GENERIC_MEM_DEPTH=8,GENERIC_MEM_REGISTERED_OUT=0,GENERIC_MEM_DATA_WIDTH=34  $RTL_COM_DIR/generic_2port_memory.v
elaborate generic_2port_memory -parameter "GENERIC_MEM_DEPTH=8,GENERIC_MEM_REGISTERED_OUT=0,GENERIC_MEM_DATA_WIDTH=34"
analyze -format sverilog -library WORK -define GENERIC_FIFO_DEPTH=8,GENERIC_FIFO_THRESHOLD=4,GENERIC_FIFO_DATA_WIDTH=34  $RTL_COM_DIR/generic_fifo.v
elaborate generic_fifo -parameter "GENERIC_FIFO_DEPTH=8,GENERIC_FIFO_THRESHOLD=4,GENERIC_FIFO_DATA_WIDTH=34"
analyze -format sverilog -library WORK -define GENERIC_FIFO_DEPTH=8,GENERIC_FIFO_THRESHOLD=4,GENERIC_FIFO_DATA_WIDTH=34  $RTL_COM_DIR/generic_pipelined_fifo.v
elaborate generic_pipelined_fifo -parameter "GENERIC_FIFO_DEPTH=8,GENERIC_FIFO_THRESHOLD=4,GENERIC_FIFO_DATA_WIDTH=34"

analyze -format sverilog -library WORK -define GENERIC_MEM_DEPTH=16,GENERIC_MEM_REGISTERED_OUT=0,GENERIC_MEM_DATA_WIDTH=38  $RTL_COM_DIR/generic_2port_memory.v
elaborate generic_2port_memory -parameter "GENERIC_MEM_DEPTH=16,GENERIC_MEM_REGISTERED_OUT=0,GENERIC_MEM_DATA_WIDTH=38"
analyze -format sverilog -library WORK -define GENERIC_FIFO_DEPTH=16,GENERIC_FIFO_THRESHOLD=4,GENERIC_FIFO_DATA_WIDTH=38  $RTL_COM_DIR/generic_fifo.v
elaborate generic_fifo -parameter "GENERIC_FIFO_DEPTH=16,GENERIC_FIFO_THRESHOLD=4,GENERIC_FIFO_DATA_WIDTH=38"
analyze -format sverilog -library WORK -define GENERIC_FIFO_DEPTH=16,GENERIC_FIFO_THRESHOLD=4,GENERIC_FIFO_DATA_WIDTH=38  $RTL_COM_DIR/generic_pipelined_fifo.v
elaborate generic_pipelined_fifo -parameter "GENERIC_FIFO_DEPTH=16,GENERIC_FIFO_THRESHOLD=4,GENERIC_FIFO_DATA_WIDTH=38"



#------------------------------------------------------------------------------------------------------------------------
# Generic FIFO's (and memory)
#  - elaborate the memory first



#------------------------------------------------------------------------------------------------------------------------
# Generic Memories
#
analyze -format sverilog -library WORK -define GENERIC_MEM_DEPTH=256,GENERIC_MEM_REGISTERED_OUT=0,GENERIC_MEM_DATA_WIDTH=149  $RTL_COM_DIR/generic_1port_memory.v
elaborate generic_1port_memory -parameter "GENERIC_MEM_DEPTH=256,GENERIC_MEM_REGISTERED_OUT=0,GENERIC_MEM_DATA_WIDTH=149"


# <name>

#------------------------------------------------------------------------------------------------------------------------
#------------------------------------------------------------------------------------------------------------------------

#------------------------------------------------------------------------------------------------------------------------
# Done
#


# read_sverilog $RTL_DIR/streamingOps.v
# read_sverilog $RTL_DIR/streamingOps_cntl.v
# read_sverilog $RTL_DIR/dma_cont.v
# read_sverilog $RTL_DIR/streamingOps_datapath.v
# read_sverilog $RTL_DIR/pe_cntl.v

#------------------------------------------------------------------------------------------------------------------------
# WIP
#

read_sverilog $RTL_DIR/mem_acc_cont.v


#------------------------------------------------------------------------------------------------------------------------
# TBD
#
# read_sverilog $RTL_DIR/stack_interface.v
# read_sverilog $RTL_DIR/sram.v
# read_sverilog $RTL_DIR/pe.v
# read_sverilog $RTL_DIR/noc_cntl.v
# read_sverilog $RTL_DIR/my_include.v
# read_sverilog $RTL_DIR/mult.v
# read_sverilog $RTL_DIR/simd_upstream_intf.v
# read_sverilog $RTL_DIR/simd_wrapper.v
# 


#suppress_message LINT-28
check_design


