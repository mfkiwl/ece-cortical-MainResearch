#! /usr/bin/env python

if __name__ == "__main__":

  import sys
  import os
  import math
  import random
  import re

  # extract number of pe's
  FoundNumPes = False
  searchFile = open("../../PEArray/HDL/common/pe_array.vh", "r")
  for line in searchFile:
    if FoundNumPes == False:
      data = re.split(r'\s{1,}', line)
      # check define is in 2nd field
      if "PE_ARRAY_NUM_OF_PE" in data[1]:
        numOfPe = int(data[2])
        FoundNumPes = True
  searchFile.close()

  #FoundNumMgrs = False
  #searchFile = open("../HDL/common/manager_array.vh", "r")
  #for line in searchFile:
  #  if FoundNumMgrs == False:
  #    data = re.split(r'\s{1,}', line)
  #    # check define is in 2nd field
  #    if "MGR_ARRAY_NUM_OF_MGR" in data[1]:
  #      numOfMgr = int(data[2])
  #      FoundNumMgrs = True
  #searchFile.close()
  numOfMgr = numOfPe

  # Now extract number of noc ports
  FoundPorts = False
  searchFile = open("../../PEArray/HDL/common/noc_cntl.vh", "r")
  for line in searchFile:
    if FoundPorts == False:
      data = re.split(r'\s{1,}', line)
      # check define is in 2nd field
      if "NOC_CONT_NOC_NUM_OF_PORTS" in data[1]:
        numOfPorts = int(data[2])
        FoundPorts = True
  searchFile.close()

  FoundLanes = False
  searchFile = open("../../PEArray/HDL/common/pe.vh", "r")
  for line in searchFile:
    if FoundLanes == False:
      data = re.split(r'\s{1,}', line)
      # check define is in 2nd field
      if "PE_NUM_OF_EXEC_LANES" in data[1]:
        numOfExecLanes = int(data[2])
        FoundLanes = True
  searchFile.close()

  # extract number of tuples per instruction
  FoundNumOfTuplesPerInst = False
  searchFile = open("../../Manager/HDL/common/manager.vh", "r")
  for line in searchFile:
    if FoundNumOfTuplesPerInst == False:
      data = re.split(r'\s{1,}', line)
      # check define is in 2nd field
      if "MGR_WU_OPT_PER_INST" in data[1]:
        numOfTuplesPerInst = int(data[2])
        FoundNumOfTuplesPerInst = True
  searchFile.close()


  #------------------------------------------------------------------------------------------------------------------------------------------------------
  # General

  f = open('../HDL/common/manager_sys_general_connections.vh', 'w')
  pLine = ""
  pLine = pLine + '\n  // Send an \'all\' synchronized to all Managers\'s '
  pLine = pLine + '\n  // sys__mgr__thisSyncnronized basically means all the streams in a PE are complete'
  pLine = pLine + '\n  // The PE controller will move to a \'final\' state once it receives sys__pe__allSynchronized'
  pLine = pLine + '\n  wire  mgr__sys__allSynchronized = mgr_inst[0].sys__mgr__thisSynchronized & '  
  for pe in range (1, numOfPe-1):
    pLine = pLine + '\n                                   mgr_inst[{0}].sys__mgr__thisSynchronized & '.format(pe)
  pLine = pLine + '\n                                   mgr_inst[{0}].sys__mgr__thisSynchronized ; '.format(numOfPe-1)

  for pe in range (0, numOfPe):
    #
    pLine = pLine + '\n  assign  mgr{0}__sys__allSynchronized                 =  mgr_inst[{0}].mgr__sys__allSynchronized    ;'.format(pe) 
    pLine = pLine + '\n  assign  mgr_inst[{0}].sys__mgr__thisSynchronized     =  sys__mgr{0}__thisSynchronized              ;'.format(pe)
    pLine = pLine + '\n  assign  mgr_inst[{0}].sys__mgr__ready                =  sys__mgr{0}__ready                         ;'.format(pe)
    pLine = pLine + '\n  assign  mgr_inst[{0}].sys__mgr__complete             =  sys__mgr{0}__complete                      ;'.format(pe)
    pLine = pLine + '\n'
    #                                                                                                                  

  f.write(pLine)
  f.close()

  f = open('../HDL/common/manager_sys_general_instance_ports.vh', 'w')
  pLine = ""

  pLine = pLine + '\n               // General control and status                                                 '
  pLine = pLine + '\n               .sys__mgr__mgrId                     ( sys__mgr__mgrId                  ),      '
  pLine = pLine + '\n               .mgr__sys__allSynchronized           ( mgr__sys__allSynchronized        ),      '
  pLine = pLine + '\n               .sys__mgr__thisSynchronized          ( sys__mgr__thisSynchronized       ),      '
  pLine = pLine + '\n               .sys__mgr__ready                     ( sys__mgr__ready                  ),      '
  pLine = pLine + '\n               .sys__mgr__complete                  ( sys__mgr__complete               ),      '

  f.write(pLine)
  f.close()

  #------------------------------------------------------------------------------------------------------------------------------------------------------
  # NoC

  
  f = open('../HDL/common/manager_noc_instance_ports.vh', 'w')
  pLine = ""

  for port in range (0, numOfPorts):
    pLine = pLine + '\n  // NoC port {0}'.format(port)
    pLine = pLine + '\n  .mgr__noc__port{0}_valid           ( mgr__noc__port{0}_valid           ),'.format(port)
    pLine = pLine + '\n  .mgr__noc__port{0}_cntl            ( mgr__noc__port{0}_cntl            ),'.format(port)
    pLine = pLine + '\n  .mgr__noc__port{0}_data            ( mgr__noc__port{0}_data            ),'.format(port)
    pLine = pLine + '\n  .noc__mgr__port{0}_fc              ( noc__mgr__port{0}_fc              ),'.format(port)
    pLine = pLine + '\n  .noc__mgr__port{0}_valid           ( noc__mgr__port{0}_valid           ),'.format(port)
    pLine = pLine + '\n  .noc__mgr__port{0}_cntl            ( noc__mgr__port{0}_cntl            ),'.format(port)
    pLine = pLine + '\n  .noc__mgr__port{0}_data            ( noc__mgr__port{0}_data            ),'.format(port)
    pLine = pLine + '\n  .mgr__noc__port{0}_fc              ( mgr__noc__port{0}_fc              ),'.format(port)
    pLine = pLine + '\n  .sys__mgr__port{0}_destinationMask ( sys__mgr__port{0}_destinationMask ),'.format(port)
    pLine = pLine + '\n'        
  pLine = pLine + '\n'

  f.write(pLine)
  f.close()

  f = open('../HDL/common/manager_noc_instance_wires.vh', 'w')
  pLine = ""

  for port in range (0, numOfPorts):
    pLine = pLine + '\n  // NoC port {0}'.format(port)
    pLine = pLine + '\n  wire                                     mgr__noc__port{0}_valid ;'.format(port)
    pLine = pLine + '\n  wire  [`COMMON_STD_INTF_CNTL_RANGE ]   mgr__noc__port{0}_cntl  ;'.format(port)
    pLine = pLine + '\n  wire  [`MGR_NOC_CONT_NOC_PORT_DATA_RANGE ]   mgr__noc__port{0}_data  ;'.format(port)
    pLine = pLine + '\n  wire                                     noc__mgr__port{0}_fc    ;'.format(port)
    pLine = pLine + '\n  wire                                     noc__mgr__port{0}_valid ;'.format(port)
    pLine = pLine + '\n  wire  [`COMMON_STD_INTF_CNTL_RANGE ]   noc__mgr__port{0}_cntl  ;'.format(port)
    pLine = pLine + '\n  wire  [`MGR_NOC_CONT_NOC_PORT_DATA_RANGE ]   noc__mgr__port{0}_data  ;'.format(port)
    pLine = pLine + '\n  wire                                     mgr__noc__port{0}_fc    ;'.format(port)
    pLine = pLine + '\n  wire  [`MGR_MGR_ID_BITMASK_RANGE     ]   sys__mgr__port{0}_destinationMask ;'.format(port)
    pLine = pLine + '\n'        
  pLine = pLine + '\n'

  f.write(pLine)                
  f.close()                     


  f = open('../HDL/common/noc_interMgr_port_Bitmask_assignments.vh', 'w')
  pLine = ""

  for pe in range (0, numOfPe):
    for port in range (0, numOfPorts):
      pLine = pLine + '\n    // MGR{0}, Port{1} next hop mask                 '.format(pe,port)
      pLine = pLine + '\n    assign mgr_inst[{0}].sys__mgr__port{1}_destinationMask    = `MGR_NOC_CONT_MGR{0}_PORT{1}_DESTINATION_MGR_BITMASK ;'.format(pe,port)

  f.write(pLine)
  f.close()

  # Number of actual ports Per PE (all may not be used)
  portsPerPe = 4

  f = open('../HDL/common/noc_interMgr_connections.vh', 'w')
  pLine = ""

  # extract number of pe's
  FoundNewPe = False
  FoundPort = False
  searchFile = open("../scripts/nocConfig.txt", "r")
  for line in searchFile:
    if "Number of PEs in X direction" in line:
      data = re.split(r'\s{1,}', line)
      arrayX = int(data[7])
      #print arrayX
    elif "Number of PEs in Y direction" in line:
      data = re.split(r'\s{1,}', line)
      arrayY = int(data[7])
      #print arrayY

    data = re.split(r'\s{1,}', line)
    # check define is in 2nd field
    if "PE" in data[0]:
      if len(data) == 4 : 
        foundNewPe = True
        for i in range (0, len(data)):
          data[i] = re.sub('[\[\]]', '', data[i])
        srcPe = int(data[1])*arrayX + int(data[2])
        #print 'Generate connections for PE {0} '.format(srcPe)
    if re.search(r"Number of Ports", line) :
      numOfUtilizedPorts = portsPerPe-int(data[4])
      if numOfUtilizedPorts != 0 :
        pLine = pLine + '\n  // Terminate Mgr{0}\'s {1} unused Ports'.format(srcPe,numOfUtilizedPorts )
        for uP in range (int(data[4]), portsPerPe):
          pLine = pLine + '\n  assign mgr_inst[{0}].noc__mgr__port{1}_valid = \'d0 ;'.format(srcPe,uP)
          pLine = pLine + '\n  assign mgr_inst[{0}].noc__mgr__port{1}_cntl  = \'d0 ;'.format(srcPe,uP)
          pLine = pLine + '\n  assign mgr_inst[{0}].noc__mgr__port{1}_data  = \'d0 ;'.format(srcPe,uP)
          pLine = pLine + '\n  assign mgr_inst[{0}].noc__mgr__port{1}_fc    = \'d0 ;'.format(srcPe,uP)
        pLine = pLine + '\n'        
    if re.search(r"Port . Connected to Node", line) :
      #print line
      srcPort  = int(data[1])
      destPe   = int(data[6])*arrayX + int(data[7])
      destPort = int(data[8])
      
      pLine = pLine + '\n  // Connecting Mgr{0} Port{1} to Mgr{2} Port{3}'.format(srcPe,srcPort,destPe,destPort)
      pLine = pLine + '\n  assign mgr_inst[{2}].noc__mgr__port{3}_valid = mgr_inst[{0}].mgr__noc__port{1}_valid ;'.format(srcPe,srcPort,destPe,destPort)
      pLine = pLine + '\n  assign mgr_inst[{2}].noc__mgr__port{3}_cntl  = mgr_inst[{0}].mgr__noc__port{1}_cntl  ;'.format(srcPe,srcPort,destPe,destPort)
      pLine = pLine + '\n  assign mgr_inst[{2}].noc__mgr__port{3}_data  = mgr_inst[{0}].mgr__noc__port{1}_data  ;'.format(srcPe,srcPort,destPe,destPort)
      pLine = pLine + '\n  assign mgr_inst[{0}].noc__mgr__port{1}_fc    = mgr_inst[{2}].mgr__noc__port{3}_fc    ;'.format(srcPe,srcPort,destPe,destPort)
      pLine = pLine + '\n'        


  f.write(pLine)
  f.close()

  searchFile.close()
  
  f = open('../HDL/common/manager_noc_cntl_noc_ports.vh', 'w')
  pLine = ""

  for port in range (0, numOfPorts):
    pLine = pLine + '\n            // NoC port {0}'.format(port)
    pLine = pLine + '\n            mgr__noc__port{0}_valid            ,'.format(port)
    pLine = pLine + '\n            mgr__noc__port{0}_cntl             ,'.format(port)
    pLine = pLine + '\n            mgr__noc__port{0}_data             ,'.format(port)
    pLine = pLine + '\n            noc__mgr__port{0}_fc               ,'.format(port)
    pLine = pLine + '\n            noc__mgr__port{0}_valid            ,'.format(port)
    pLine = pLine + '\n            noc__mgr__port{0}_cntl             ,'.format(port)
    pLine = pLine + '\n            noc__mgr__port{0}_data             ,'.format(port)
    pLine = pLine + '\n            mgr__noc__port{0}_fc               ,'.format(port)
    pLine = pLine + '\n            sys__mgr__port{0}_destinationMask  ,'.format(port)
    pLine = pLine + '\n'        
  pLine = pLine + '\n'

  f.write(pLine)
  f.close()


  f = open('../HDL/common/manager_noc_cntl_noc_ports_declaration.vh', 'w')
  pLine = ""

  for port in range (0, numOfPorts):
    pLine = pLine + '\n  // NoC port {0}'.format(port)
    pLine = pLine + '\n  output                                   mgr__noc__port{0}_valid           ;'.format(port)
    pLine = pLine + '\n  output [`COMMON_STD_INTF_CNTL_RANGE ]  mgr__noc__port{0}_cntl            ;'.format(port)
    pLine = pLine + '\n  output [`MGR_NOC_CONT_NOC_PORT_DATA_RANGE ]  mgr__noc__port{0}_data            ;'.format(port)
    pLine = pLine + '\n  input                                    noc__mgr__port{0}_fc              ;'.format(port)
    pLine = pLine + '\n  input                                    noc__mgr__port{0}_valid           ;'.format(port)
    pLine = pLine + '\n  input  [`COMMON_STD_INTF_CNTL_RANGE ]  noc__mgr__port{0}_cntl            ;'.format(port)
    pLine = pLine + '\n  input  [`MGR_NOC_CONT_NOC_PORT_DATA_RANGE ]  noc__mgr__port{0}_data            ;'.format(port)
    pLine = pLine + '\n  output                                   mgr__noc__port{0}_fc              ;'.format(port)
    pLine = pLine + '\n  input  [`MGR_MGR_ID_BITMASK_RANGE     ]  sys__mgr__port{0}_destinationMask ;'.format(port)
    pLine = pLine + '\n'        
  pLine = pLine + '\n'

  f.write(pLine)
  f.close()

  f = open('../HDL/common/noc_to_mgrArray_connection_wires.vh', 'w')
  pLine = ""

  for port in range (0, numOfPorts):
    pLine = pLine + '\n  // NoC port {0}'.format(port)
    pLine = pLine + '\n  wire                                     mgr__noc__port{0}_valid ;'.format(port)
    pLine = pLine + '\n  wire   [`COMMON_STD_INTF_CNTL_RANGE ]  mgr__noc__port{0}_cntl  ;'.format(port)
    pLine = pLine + '\n  wire   [`MGR_NOC_CONT_NOC_PORT_DATA_RANGE ]  mgr__noc__port{0}_data  ;'.format(port)
    pLine = pLine + '\n  wire                                     noc__mgr__port{0}_fc    ;'.format(port)
    pLine = pLine + '\n  wire                                     noc__mgr__port{0}_valid ;'.format(port)
    pLine = pLine + '\n  wire   [`COMMON_STD_INTF_CNTL_RANGE ]  noc__mgr__port{0}_cntl  ;'.format(port)
    pLine = pLine + '\n  wire   [`MGR_NOC_CONT_NOC_PORT_DATA_RANGE ]  noc__mgr__port{0}_data  ;'.format(port)
    pLine = pLine + '\n  wire                                     mgr__noc__port{0}_fc    ;'.format(port)
    pLine = pLine + '\n'        
  pLine = pLine + '\n'

  f.write(pLine)
  f.close()

  f = open('../HDL/common/manager_noc_cntl_noc_ports_instance_ports.vh', 'w')
  pLine = ""

  for port in range (0, numOfPorts):
    pLine = pLine + '\n  // NoC port {0}'.format(port)
    pLine = pLine + '\n  .mgr__noc__port{0}_valid           ( mgr__noc__port{0}_valid           ),'.format(port)
    pLine = pLine + '\n  .mgr__noc__port{0}_cntl            ( mgr__noc__port{0}_cntl            ),'.format(port)
    pLine = pLine + '\n  .mgr__noc__port{0}_data            ( mgr__noc__port{0}_data            ),'.format(port)
    pLine = pLine + '\n  .noc__mgr__port{0}_fc              ( noc__mgr__port{0}_fc              ),'.format(port)
    pLine = pLine + '\n  .noc__mgr__port{0}_valid           ( noc__mgr__port{0}_valid           ),'.format(port)
    pLine = pLine + '\n  .noc__mgr__port{0}_cntl            ( noc__mgr__port{0}_cntl            ),'.format(port)
    pLine = pLine + '\n  .noc__mgr__port{0}_data            ( noc__mgr__port{0}_data            ),'.format(port)
    pLine = pLine + '\n  .mgr__noc__port{0}_fc              ( mgr__noc__port{0}_fc              ),'.format(port)
    pLine = pLine + '\n  .sys__mgr__port{0}_destinationMask ( sys__mgr__port{0}_destinationMask ),'.format(port)
    pLine = pLine + '\n'        
  pLine = pLine + '\n'

  f.write(pLine)
  f.close()

  f = open('../HDL/common/manager_noc_connection_wires.vh', 'w')
  pLine = ""

  pLine = pLine + '\n   // Control-Path (cp) to NoC '
  pLine = pLine + '\n   wire                                             rdp__noc__cp_valid      ; '
  pLine = pLine + '\n   wire [`COMMON_STD_INTF_CNTL_RANGE             ]  rdp__noc__cp_cntl       ; '
  pLine = pLine + '\n   wire                                             noc__rdp__cp_ready      ; '
  pLine = pLine + '\n   wire [`MGR_NOC_CONT_NOC_PACKET_TYPE_RANGE     ]  rdp__noc__cp_type       ; '
  pLine = pLine + '\n   wire [`MGR_NOC_CONT_NOC_PAYLOAD_TYPE_RANGE    ]  rdp__noc__cp_ptype      ; '
  pLine = pLine + '\n   wire [`MGR_NOC_CONT_NOC_DEST_TYPE_RANGE       ]  rdp__noc__cp_desttype   ; '
  pLine = pLine + '\n   wire                                             rdp__noc__cp_pvalid     ; '
  pLine = pLine + '\n   wire [`MGR_NOC_CONT_INTERNAL_DATA_RANGE       ]  rdp__noc__cp_data       ; '
  pLine = pLine + '\n'
  pLine = pLine + '\n   // Data-Path (dp) to NoC '
  pLine = pLine + '\n   wire                                             rdp__noc__dp_valid      ; '
  pLine = pLine + '\n   wire [`COMMON_STD_INTF_CNTL_RANGE             ]  rdp__noc__dp_cntl       ; '
  pLine = pLine + '\n   wire                                             noc__rdp__dp_ready      ; '
  pLine = pLine + '\n   wire [`MGR_NOC_CONT_NOC_PACKET_TYPE_RANGE     ]  rdp__noc__dp_type       ; '
  pLine = pLine + '\n   wire [`MGR_NOC_CONT_NOC_PAYLOAD_TYPE_RANGE    ]  rdp__noc__dp_ptype      ; '
  pLine = pLine + '\n   wire [`MGR_NOC_CONT_NOC_DEST_TYPE_RANGE       ]  rdp__noc__dp_desttype   ; '
  pLine = pLine + '\n   wire                                             rdp__noc__dp_pvalid     ; '
  pLine = pLine + '\n   wire [`MGR_NOC_CONT_INTERNAL_DATA_RANGE       ]  rdp__noc__dp_data       ; '
  pLine = pLine + '\n'
  pLine = pLine + '\n   // Data-Path (cp) from NoC '
  pLine = pLine + '\n   wire                                             noc__mcntl__cp_valid    ; '
  pLine = pLine + '\n   wire [`COMMON_STD_INTF_CNTL_RANGE             ]  noc__mcntl__cp_cntl     ; '
  pLine = pLine + '\n   wire                                             mcntl__noc__cp_ready    ; '
  pLine = pLine + '\n   wire [`MGR_NOC_CONT_NOC_PACKET_TYPE_RANGE     ]  noc__mcntl__cp_type     ; '
  pLine = pLine + '\n   wire [`MGR_NOC_CONT_NOC_PAYLOAD_TYPE_RANGE    ]  noc__mcntl__cp_ptype    ; '
  pLine = pLine + '\n   wire [`MGR_NOC_CONT_INTERNAL_DATA_RANGE       ]  noc__mcntl__cp_data     ; '
  pLine = pLine + '\n   wire [`MGR_MGR_ID_RANGE                       ]  noc__mcntl__cp_mgrId    ; '
  pLine = pLine + '\n'
  pLine = pLine + '\n   // Data-Path (dp) from NoC '
  pLine = pLine + '\n   wire                                             noc__mcntl__dp_valid    ; '
  pLine = pLine + '\n   wire [`COMMON_STD_INTF_CNTL_RANGE             ]  noc__mcntl__dp_cntl     ; '
  pLine = pLine + '\n   wire                                             mcntl__noc__dp_ready    ; '
  pLine = pLine + '\n   wire [`MGR_NOC_CONT_NOC_PACKET_TYPE_RANGE     ]  noc__mcntl__dp_type     ; '
  pLine = pLine + '\n   wire [`MGR_NOC_CONT_NOC_PAYLOAD_TYPE_RANGE    ]  noc__mcntl__dp_ptype    ; '
  pLine = pLine + '\n   wire [`MGR_NOC_CONT_INTERNAL_DATA_RANGE       ]  noc__mcntl__dp_data     ; '
  pLine = pLine + '\n   wire [`MGR_MGR_ID_RANGE                       ]  noc__mcntl__dp_mgrId    ; '
  pLine = pLine + '\n'

  f.write(pLine)
  f.close()

  #------------------------------------------------------------------------------------------------------------------------------------------------------
  # mgr_noc_cntl

  f = open('../HDL/common/mgr_noc_cntl_noc_ports_declaration.vh', 'w')
  pLine = ""

  for port in range (0, numOfPorts):
    pLine = pLine + '\n  // NoC port {0}'.format(port)
    pLine = pLine + '\n  output                                   mgr__noc__port{0}_valid           ;'.format(port)
    pLine = pLine + '\n  output [`COMMON_STD_INTF_CNTL_RANGE ]  mgr__noc__port{0}_cntl            ;'.format(port)
    pLine = pLine + '\n  output [`MGR_NOC_CONT_NOC_PORT_DATA_RANGE ]  mgr__noc__port{0}_data            ;'.format(port)
    pLine = pLine + '\n  input                                    noc__mgr__port{0}_fc              ;'.format(port)
    pLine = pLine + '\n  input                                    noc__mgr__port{0}_valid           ;'.format(port)
    pLine = pLine + '\n  input  [`COMMON_STD_INTF_CNTL_RANGE ]  noc__mgr__port{0}_cntl            ;'.format(port)
    pLine = pLine + '\n  input  [`MGR_NOC_CONT_NOC_PORT_DATA_RANGE ]  noc__mgr__port{0}_data            ;'.format(port)
    pLine = pLine + '\n  output                                   mgr__noc__port{0}_fc              ;'.format(port)
    pLine = pLine + '\n  input  [`PE_PE_ID_BITMASK_RANGE       ]  sys__mgr__port{0}_destinationMask ;'.format(port)
    pLine = pLine + '\n'        
  pLine = pLine + '\n'

  f.write(pLine)
  f.close()

  f = open('../HDL/common/mgr_noc_cntl_noc_ports_wires.vh', 'w')
  pLine = ""

  for port in range (0, numOfPorts):
    pLine = pLine + '\n  // NoC port {0}'.format(port)
    pLine = pLine + '\n  reg                                      mgr__noc__port{0}_valid           ;'.format(port)
    pLine = pLine + '\n  wire   [`COMMON_STD_INTF_CNTL_RANGE ]  mgr__noc__port{0}_cntl            ;'.format(port)
    pLine = pLine + '\n  wire   [`MGR_NOC_CONT_NOC_PORT_DATA_RANGE ]  mgr__noc__port{0}_data            ;'.format(port)
    pLine = pLine + '\n  wire                                     noc__mgr__port{0}_fc              ;'.format(port)
    pLine = pLine + '\n  wire                                     noc__mgr__port{0}_valid           ;'.format(port)
    pLine = pLine + '\n  wire   [`COMMON_STD_INTF_CNTL_RANGE ]  noc__mgr__port{0}_cntl            ;'.format(port)
    pLine = pLine + '\n  wire   [`MGR_NOC_CONT_NOC_PORT_DATA_RANGE ]  noc__mgr__port{0}_data            ;'.format(port)
    pLine = pLine + '\n  wire                                     mgr__noc__port{0}_fc              ;'.format(port)
    pLine = pLine + '\n  wire   [`PE_PE_ID_BITMASK_RANGE       ]  sys__mgr__port{0}_destinationMask ;'.format(port)
    pLine = pLine + '\n'        
  pLine = pLine + '\n'

  f.write(pLine)
  f.close()

  f = open('../HDL/common/mgr_noc_cntl_noc_wires.vh', 'w')

  pLine = ""
  pLine = pLine + '\n   reg [`MGR_MGR_ID_BITMASK_RANGE      ] thisMgrBitMask       ; '

  f.write(pLine)
  f.close()

  f = open('../HDL/common/mgr_noc_cntl_noc_general_assignments.vh', 'w')
  pLine = ""

  # Convert sys__mgr__mgrId to a bit field
  pLine = pLine + '\n'
  #pLine = pLine + '\nDEBUG NUMOFPE= {0}'.format(numOfMgr)
  numOfMgrIdBits = int(math.log(numOfMgr,2))
  pLine = pLine + '\n  // Convert the sys__mgr__mgrId to a bit mask'
  pLine = pLine + '\n  // This bitMask is used to determine if any incoming NoC packets are addressing the local port'
  pLine = pLine + '\n  always @(*)'
  pLine = pLine + '\n    begin'
  pLine = pLine + '\n      case(sys__mgr__mgrId)'
  for pe in range (0, numOfMgr):
    pLine = pLine + '\n      {2}\'d{0} :'.format(pe,numOfMgr,numOfMgrIdBits)
    pLine = pLine + '\n        begin'
    pLine = pLine + '\n          thisMgrBitMask = {1}\'b'.format(pe,numOfMgr)
    for bit in range (0, numOfMgr-1-pe):
      pLine = pLine + '0'
    pLine = pLine + '1'
    for bit in range (numOfMgr-pe, numOfMgr):
      pLine = pLine + '0'
    pLine = pLine + '  ; '
    pLine = pLine + '\n        end'
  pLine = pLine + '\n      default:'
  pLine = pLine + '\n        begin'
  pLine = pLine + '\n          thisMgrBitMask = \'d0 ; '
  pLine = pLine + '\n        end'
  pLine = pLine + '\n      endcase'
  pLine = pLine + '\n    end'
  pLine = pLine + '\n'
  
  for port in range (0, numOfPorts):
    pLine = pLine + '\n    wire  port{0}_localInqReq          ; // Request from an input port after being gated with local bitMask'.format(port)
    pLine = pLine + '\n    reg   port{0}_localInqPriority     ; // Indicate whether packet is Control or Data'.format(port)
    pLine = pLine + '\n    reg   port{0}_localInqAck          ; // accept request from input port'.format(port)
    pLine = pLine + '\n    reg   port{0}_localInqEnable       ; // Indicate when input q is able to take data'.format(port)
  pLine = pLine + '\n'

  for port in range (0, numOfPorts):
    pLine = pLine + '\n  reg  local_port{0}_OutqAck   ;  // the local input queue is actually an output for the port input controllers'.format(port)
    pLine = pLine + '\n  wire local_port{0}_OutqReady ;  // so ck the request from the port input controller'.format(port)

  f.write(pLine)
  f.close()

  f = open('../HDL/common/mgr_noc_cntl_noc_port_output_control_header_field_assignments.vh', 'w')
  pLine = ""

  pLine = pLine + '\n  //---------------------------------------------------'
  pLine = pLine + '\n  // Outgoing Port source data '
  pLine = pLine + '\n '
  for port in range (0, numOfPorts):
    pLine = pLine + '\n  // Connect Port {0}\'s "other" ports "to Noc" packet data requests to 0,1,2,3 of the output port controller'
    pLine = pLine + '\n  // The fields in the bus from the source have been set at the requestor, so simply pass the data from the requestor directly to the output FIFO'
    pLine = pLine + '\n '
    for otherPort in range (0, numOfPorts):
      pLine = pLine + '\n  // Port{0}, source{1}'.format(port,otherPort)
      pLine = pLine + '\n  assign Port_to_NoC[{0}].src{1}_cntl_toNoc    =  Port_from_NoC[{1}].cntl_fromNoc  ;'.format(port,otherPort)
      pLine = pLine + '\n  assign Port_to_NoC[{0}].src{1}_data_toNoc    = (Port_from_NoC[{1}].cntl_fromNoc == `COMMON_STD_INTF_CNTL_SOM    ) ? {{Port_from_NoC[{1}].data_fromNoc[`MGR_NOC_CONT_EXTERNAL_HEADER_SOURCE_PE_RANGE], Port_from_NoC[{1}].data_fromNoc[`MGR_NOC_CONT_EXTERNAL_HEADER_DESTINATION_ADDR_TYPE_RANGE], Port_from_NoC[{1}].data_fromNoc[`MGR_NOC_CONT_EXTERNAL_HEADER_PRIORITY_RANGE], (Port_from_NoC[{1}].data_fromNoc[`MGR_NOC_CONT_EXTERNAL_HEADER_DESTINATION_ADDR_RANGE] & Port_to_NoC[{0}].thisPort_destinationMask)}}  :'.format(port,otherPort)
      pLine = pLine + '\n                                             (Port_from_NoC[{1}].cntl_fromNoc == `COMMON_STD_INTF_CNTL_SOM_EOM) ? {{Port_from_NoC[{1}].data_fromNoc[`MGR_NOC_CONT_EXTERNAL_HEADER_SOURCE_PE_RANGE], Port_from_NoC[{1}].data_fromNoc[`MGR_NOC_CONT_EXTERNAL_HEADER_DESTINATION_ADDR_TYPE_RANGE], Port_from_NoC[{1}].data_fromNoc[`MGR_NOC_CONT_EXTERNAL_HEADER_PRIORITY_RANGE], (Port_from_NoC[{1}].data_fromNoc[`MGR_NOC_CONT_EXTERNAL_HEADER_DESTINATION_ADDR_RANGE] & Port_to_NoC[{0}].thisPort_destinationMask)}}  :'.format(port,otherPort)
      pLine = pLine + '\n                                                                                                                 Port_from_NoC[{1}].data_fromNoc                       ;'.format(port,otherPort)
      pLine = pLine + '\n  assign Port_to_NoC[{0}].src{1}_toNoc_valid   = Port_from_NoC[{1}].fromNoc_valid ;'.format(port,otherPort)
      pLine = pLine + '\n '
    pLine = pLine + '\n '


  f.write(pLine)
  f.close()


  f = open('../HDL/common/mgr_noc_cntl_noc_port_output_control_transfer_assignments.vh', 'w')
  pLine = ""


  # Port output controller fifo outputs to NoC
  pLine = pLine + '\n  // Port outputs to NoC'.format(port)
  for port in range (0, numOfPorts):
    pLine = pLine + '\n  // NoC port {0}'.format(port)
    pLine = pLine + '\n  assign mgr__noc__port{0}_cntl  = Port_to_NoC[{0}].fifo_read_cntl;'.format(port)
    pLine = pLine + '\n  assign mgr__noc__port{0}_data  = Port_to_NoC[{0}].fifo_read_data;'.format(port)
    pLine = pLine + '\n  assign Port_to_NoC[{0}].fifo_read = ~Port_to_NoC[{0}].fifo_empty & ~noc__mgr__port{0}_fc ;'.format(port)
    pLine = pLine + '\n  always @(posedge clk)'
    pLine = pLine + '\n      mgr__noc__port{0}_valid  <= Port_to_NoC[{0}].fifo_read ;'.format(port)
    pLine = pLine + '\n'        
  pLine = pLine + '\n'

  # FIXME: Need to create a vector of Acks for each requestor
  # e.g. port2 sends out a single request that goes to the local input queue and ports 0, 1 and 3
  # All 4 destinations need to respond immediately telling the source a destination has accepted the request
  # In the case of multicast, more than one may accept the request. All destinations must assert ack in parallel simultaneously.
  # Only when all destinations have asserted their enable will the source start transferring the packet.
  # The destination will monitor the cntl bits for the EOP indication and deassert ack and enable when EOP is passing

  f.write(pLine)
  f.close()


  f = open('../HDL/common/mgr_noc_cntl_port_input_control_assignments.vh', 'w')
  pLine = ""

  for port in range (0, numOfPorts):
    pLine = pLine + '\n  assign InPortRequestVector[{0}]       = Port_from_NoC[{0}].destinationReq ;'.format(port)
  pLine = pLine + '\n'

  # Port input controller fifo inputs from NoC
  pLine = pLine + '\n  // Port inputs from NoC'.format(port)
  for port in range (0, numOfPorts):
    pLine = pLine + '\n  // NoC port {0}'.format(port)
    pLine = pLine + '\n  assign    mgr__noc__port{0}_fc      = Port_from_NoC[{0}].fifo_almost_full ;'.format(port)
    pLine = pLine + '\n  always @(*)'
    pLine = pLine + '\n    begin '
    pLine = pLine + '\n      Port_from_NoC[{0}].cntl        = noc__mgr__port{0}_cntl               ;'.format(port)
    pLine = pLine + '\n      Port_from_NoC[{0}].data        = noc__mgr__port{0}_data               ;'.format(port)
    pLine = pLine + '\n      Port_from_NoC[{0}].fifo_write  = noc__mgr__port{0}_valid              ;'.format(port)
    pLine = pLine + '\n    end '
    pLine = pLine + '\n'        
  pLine = pLine + '\n'
  f.write(pLine)
  f.close()

  f = open('../HDL/common/mgr_noc_cntl_noc_port_output_control_mask_assignments.vh', 'w')
  pLine = ""

  # Got from butterly simulations
  pLine = pLine + '\n  // Hard-code which nodes can be accessed via this output port'
  for port in range (0, numOfPorts):
    pLine = pLine + '\n  assign Port_to_NoC[{0}].thisPort_destinationMask = sys__mgr__port{0}_destinationMask ; // bitmask indicating which nodes accessed out of this port'.format(port)


  f.write(pLine)
  f.close()

  f = open('../HDL/common/mgr_noc_cntl_noc_port_output_control_wires.vh', 'w')
  pLine = ""

  pLine = pLine + '\n  wire [`MGR_MGR_ID_BITMASK_RANGE ] thisPort_destinationMask  ; // bitmask indicating which nodes accessed out of this port'
  pLine = pLine + '\n'
  pLine = pLine + '\n  wire                            local_OutqReq             ;  // request from local putput queue controller'
  pLine = pLine + '\n  wire [`MGR_MGR_ID_BITMASK_RANGE ] local_OutqReqAddr         ;  // bitmask address of requestor'
  pLine = pLine + '\n  reg                             local_OutqAck             ;'
  pLine = pLine + '\n  reg                             local_OutqReady           ;'
  for port in range (0, numOfPorts):
    pLine = pLine + '\n  // These 3 sources are the 3 sources not the 3 actual ports'
    pLine = pLine + '\n  // e.g. if this instance is port 2, 1=port0, 2=port1, 3=port3 etc.'
    pLine = pLine + '\n  wire                            src{0}_OutqReq             ;  // request from source (port) {0}'.format(port)
    pLine = pLine + '\n  wire [`MGR_MGR_ID_BITMASK_RANGE ] src{0}_OutqReqAddr         ;  // bitmask address of requestor'.format(port)
    pLine = pLine + '\n  reg                             src{0}_OutqAck             ;  // ack back to source (port) input controller'.format(port)
    pLine = pLine + '\n  reg                             src{0}_OutqReady           ;'.format(port)
    pLine = pLine + '\n  // This is the packet bus from the 3 possible sources that will be muxed into the output fifo when the source has been acknowledged'
    pLine = pLine + '\n  // The local packet bus is common but the 3 sources vary based on \"this\" port id'
    pLine = pLine + '\n  wire                                        src{0}_toNoc_valid    ;  // data from source is valid'.format(port)
    pLine = pLine + '\n  wire [`COMMON_STD_INTF_CNTL_RANGE        ]  src{0}_cntl_toNoc     ;'.format(port)
    pLine = pLine + '\n  wire [`MGR_NOC_CONT_NOC_PORT_DATA_RANGE  ]  src{0}_data_toNoc     ;'.format(port)


  f.write(pLine)
  f.close()

  f = open('../HDL/common/mgr_noc_cntl_noc_port_output_control_fsm_state_definitions.vh', 'w')
  pLine = ""

  # 2 states for loca, 2 states for each port and 1 wait state
  numOfPortOutputQueueFsmStateBits = 2+numOfPorts*2+1
  pLine = pLine + '\n//------------------------------------------------'
  pLine = pLine + '\n// MGR_NOC_CONT_NOC_PORT_OUTPUT_CNTL_LOCAL_INPUT_QUEUE_CONTROL_STATE width'
  pLine = pLine + '\n//------------------------------------------------'
  pLine = pLine + '\n`define MGR_NOC_CONT_NOC_PORT_OUTPUT_CNTL_STATE_MSB            {0}'.format(numOfPortOutputQueueFsmStateBits-1)
  pLine = pLine + '\n`define MGR_NOC_CONT_NOC_PORT_OUTPUT_CNTL_STATE_LSB            0'
  pLine = pLine + '\n`define MGR_NOC_CONT_NOC_PORT_OUTPUT_CNTL_STATE_SIZE           (`MGR_NOC_CONT_NOC_PORT_OUTPUT_CNTL_STATE_MSB - `MGR_NOC_CONT_NOC_PORT_OUTPUT_CNTL_STATE_LSB +1)'
  pLine = pLine + '\n`define MGR_NOC_CONT_NOC_PORT_OUTPUT_CNTL_STATE_RANGE           `MGR_NOC_CONT_NOC_PORT_OUTPUT_CNTL_STATE_MSB : `MGR_NOC_CONT_NOC_PORT_OUTPUT_CNTL_STATE_LSB'
  pLine = pLine + '\n'
  pLine = pLine + '\n//------------------------------------------------------------------------------------------------'
  pLine = pLine + '\n//------------------------------------------------'
  pLine = pLine + '\n// MGR_NOC_CONT_NOC_PORT_OUTPUT_CNTL state machine states'
  pLine = pLine + '\n//------------------------------------------------'
  pLine = pLine + '\n'
  pLine = pLine + '\n`define MGR_NOC_CONT_NOC_PORT_OUTPUT_CNTL_WAIT        {0}\'d1'.format(numOfPortOutputQueueFsmStateBits)
  port = 0
  bit = 1
  pLine = pLine + '\n`define MGR_NOC_CONT_NOC_PORT_OUTPUT_CNTL_TRANSFER_LOCAL  {1}\'d{2}'.format(port,numOfPortOutputQueueFsmStateBits,pow(2,bit))
  pLine = pLine + '\n`define MGR_NOC_CONT_NOC_PORT_OUTPUT_CNTL_ACK_LOCAL   {1}\'d{2}'.format(port,numOfPortOutputQueueFsmStateBits,pow(2,bit+1))
  bit=bit+2
  for port in range (0, numOfPorts):
    pLine = pLine + '\n`define MGR_NOC_CONT_NOC_PORT_OUTPUT_CNTL_TRANSFER_PORT{0}  {1}\'d{2}'.format(port,numOfPortOutputQueueFsmStateBits,pow(2,bit))
    pLine = pLine + '\n`define MGR_NOC_CONT_NOC_PORT_OUTPUT_CNTL_ACK_PORT{0}   {1}\'d{2}'.format(port,numOfPortOutputQueueFsmStateBits,pow(2,bit+1))
    bit = bit+2


  f.write(pLine)
  f.close()


  f = open('../HDL/common/mgr_noc_cntl_noc_port_output_control_fsm_state_transitions.vh', 'w')
  pLine = ""
 
  pLine = pLine + '\n           // Round-robin arbiter granting access to the port in the following order: local - 1 - 2 - 3                                         ' 
  pLine = pLine + '\n           // If control packets arrive on a requestor, the requestor decides to send the control packet but then ahs to wait for its next turn '
  pLine = pLine + '\n           // Note: Ports 1-2-3 refer to the 3 ports accessing this port, not the actual ports 1,2,3                                            '       
  pLine = pLine + '\n           // Assume each requestor will only transfer a single packet                                                                          '
  pLine = pLine + '\n           // The requestor deals with prioritizing its own CP or DP packets                                                                    '
  pLine = pLine + '\n           //                                                                                                                                   '
  pLine = pLine + '\n           // The request is directed to a particular port by \'ANDing\' the ports routing bitmask with the destination bitmask                 '
  pLine = pLine + '\n           // If there are multiple ack\'s, the source will wait until all enables are set before reading its fifo for transfer                 '
  pLine = pLine + '\n           // '
  pLine = pLine + '\n           // '
  
  # WAIT
  pLine = pLine + '\n'
  pLine = pLine + '\n           `MGR_NOC_CONT_NOC_PORT_OUTPUT_CNTL_WAIT:'
  pLine = pLine + '\n             nc_port_toNoc_state_next = ( local_OutqReq )  ? `MGR_NOC_CONT_NOC_PORT_OUTPUT_CNTL_TRANSFER_LOCAL  :'
  for port in range (0, numOfPorts):
    pLine = pLine + '\n                                        ( src{0}_OutqReq )  ? `MGR_NOC_CONT_NOC_PORT_OUTPUT_CNTL_TRANSFER_PORT{0}  :'.format(port,)
  pLine = pLine + '\n                                                               `MGR_NOC_CONT_NOC_PORT_OUTPUT_CNTL_WAIT           ; '


  for port in range (0, numOfPorts+1):

    # READ 
    pLine = pLine + '\n' 
    if port == 0:
      pLine = pLine + '\n           `MGR_NOC_CONT_NOC_PORT_OUTPUT_CNTL_TRANSFER_LOCAL:'.format(port)
    else:
      pLine = pLine + '\n           `MGR_NOC_CONT_NOC_PORT_OUTPUT_CNTL_TRANSFER_PORT{0}:'.format(port-1)

    if port == 0:
      pLine = pLine + '\n             nc_port_toNoc_state_next = (local_toNoc_valid && ((local_cntl_toNoc == `COMMON_STD_INTF_CNTL_EOM) || (local_cntl_toNoc == `COMMON_STD_INTF_CNTL_SOM_EOM)))  ? `MGR_NOC_CONT_NOC_PORT_OUTPUT_CNTL_ACK_LOCAL  :'.format(port-1,numOfPorts)
    else:
      pLine = pLine + '\n             nc_port_toNoc_state_next = (src{0}_toNoc_valid && ((src{0}_cntl_toNoc == `COMMON_STD_INTF_CNTL_EOM) || (src{0}_cntl_toNoc == `COMMON_STD_INTF_CNTL_SOM_EOM)))  ? `MGR_NOC_CONT_NOC_PORT_OUTPUT_CNTL_ACK_PORT{0}  :'.format(port-1, port-2)

    if port == 0:
      pLine = pLine + '\n                                                             `MGR_NOC_CONT_NOC_PORT_OUTPUT_CNTL_TRANSFER_LOCAL   ; '.format(port-1)
    else:
      pLine = pLine + '\n                                                             `MGR_NOC_CONT_NOC_PORT_OUTPUT_CNTL_TRANSFER_PORT{0}   ; '.format(port-1)

    # ACK 
    if port != (numOfPorts):
      pLine = pLine + '\n' 
      if port == 0:
        pLine = pLine + '\n           `MGR_NOC_CONT_NOC_PORT_OUTPUT_CNTL_ACK_LOCAL:'.format(port)
        pLine = pLine + '\n             nc_port_toNoc_state_next = ( src0_OutqReq                       )  ? `MGR_NOC_CONT_NOC_PORT_OUTPUT_CNTL_TRANSFER_PORT0     :'.format(port, numOfPorts)
      else:
        pLine = pLine + '\n           `MGR_NOC_CONT_NOC_PORT_OUTPUT_CNTL_ACK_PORT{0}:'.format(port-1)
        pLine = pLine + '\n             nc_port_toNoc_state_next = ( src{0}_OutqReq                       )  ? `MGR_NOC_CONT_NOC_PORT_OUTPUT_CNTL_TRANSFER_PORT{0}     :'.format(port, port-1)

      for nextPort in range (port+2, numOfPorts+1):
        pLine = pLine + '\n                                        ( src{0}_OutqReq                       )  ? `MGR_NOC_CONT_NOC_PORT_OUTPUT_CNTL_TRANSFER_PORT{0}     :'.format(nextPort-1, nextPort-2)
      for nextPort in range (0, port+1):
        if nextPort == 0:
          pLine = pLine + '\n                                        ( local_OutqReq                       )  ? `MGR_NOC_CONT_NOC_PORT_OUTPUT_CNTL_TRANSFER_LOCAL     :'.format(nextPort-1, nextPort-2)
        else:
          pLine = pLine + '\n                                        ( src{0}_OutqReq                       )  ? `MGR_NOC_CONT_NOC_PORT_OUTPUT_CNTL_TRANSFER_PORT{0}     :'.format(nextPort-1, nextPort-2)


      pLine = pLine + '\n                                                                                   `MGR_NOC_CONT_NOC_PORT_OUTPUT_CNTL_WAIT           ; '
    else:
      pLine = pLine + '\n' 
      if port == 0:
        pLine = pLine + '\n           `MGR_NOC_CONT_NOC_PORT_OUTPUT_CNTL_ACK_LOCAL:'.format(port)
      else:                                                                 
        pLine = pLine + '\n           `MGR_NOC_CONT_NOC_PORT_OUTPUT_CNTL_ACK_PORT{0}:'.format(port-1)
      pLine = pLine + '\n             nc_port_toNoc_state_next = ( local_OutqReq                       )  ? `MGR_NOC_CONT_NOC_PORT_OUTPUT_CNTL_TRANSFER_LOCAL     :'.format(port-1, numOfPorts)
      for port in range (1, numOfPorts+1):
        pLine = pLine + '\n                                        ( src{0}_OutqReq                       )  ? `MGR_NOC_CONT_NOC_PORT_OUTPUT_CNTL_TRANSFER_PORT{0}     :'.format(port-1, port-2)
      pLine = pLine + '\n                                                                                   `MGR_NOC_CONT_NOC_PORT_OUTPUT_CNTL_WAIT           ; '

  f.write(pLine)
  f.close()


  f = open('../HDL/common/mgr_noc_cntl_noc_port_output_control_fsm_assignments.vh', 'w')
  pLine = ""

  # Note: Each output port interfaces to the local output queue(s) and 3 other ports. These numbers do not correlate to
  # the 4 actual ports and are dependent on instance number
  # e.g. port 1 connects to local, 0, 2, 3 which correspond to numbers 0,1,2 in this logic
  # The actual connections will be made elsewhere.
  pLine = pLine + '\n        // Note: Each output port interfaces to 3 other ports which are referred to as sources 1-3. These numbers do not correlate to'
  pLine = pLine + '\n        // the 4 actual ports and are dependent on instance number'
  pLine = pLine + '\n        // e.g. port 1 connects to 0,2,3 which correspond to numbers 1,2,3 in this logic'
  pLine = pLine + '\n'
  pLine = pLine + '\n        // wrap the decoded request right back to the source. A packet will not be transferred until all outputs assert ready'
  pLine = pLine + '\n  always @(posedge clk)'
  pLine = pLine + '\n          local_OutqAck  <= local_OutqReq ;'.format(port)
  for port in range (0, numOfPorts):
    pLine = pLine + '\n  always @(posedge clk)'
    pLine = pLine + '\n          src{0}_OutqAck   <= src{0}_OutqReq  ;'.format(port)
  pLine = pLine + '\n'
  pLine = pLine + '\n  always @(*)'
  pLine = pLine + '\n    begin'
  pLine = pLine + '\n      case(nc_port_toNoc_state)'
  pLine = pLine + '\n'
  for port in range (0, numOfPorts+1):
    # READ
    if port == 0:
      pLine = pLine + '\n        `MGR_NOC_CONT_NOC_PORT_OUTPUT_CNTL_TRANSFER_LOCAL:'.format(port-1)
    else:
      pLine = pLine + '\n        `MGR_NOC_CONT_NOC_PORT_OUTPUT_CNTL_TRANSFER_PORT{0}:'.format(port-1)
    pLine = pLine + '\n        begin'
    for nextPort in range (0, port):
      if nextPort == 0:
        pLine = pLine + '\n          local_OutqReady   = 1\'b0  ;'.format(nextPort)
      else:
        pLine = pLine + '\n          src{0}_OutqReady   = 1\'b0  ;'.format(nextPort-1)
    if port == 0:
      pLine = pLine + '\n          local_OutqReady   = ~fifo_almost_full ; // only enable source if fifo is available ;'.format(port)
    else:
      pLine = pLine + '\n          src{0}_OutqReady   = ~fifo_almost_full ; // only enable source if fifo is available ;'.format(port-1)
    for nextPort in range (port+1, numOfPorts+1):
      pLine = pLine + '\n          src{0}_OutqReady   = 1\'b0  ;'.format(nextPort-1)
    pLine = pLine + '\n        end'
    pLine = pLine + '\n'
    # ACK
    if port == 0:
      pLine = pLine + '\n        `MGR_NOC_CONT_NOC_PORT_OUTPUT_CNTL_ACK_LOCAL:'.format(port)
    else:
      pLine = pLine + '\n        `MGR_NOC_CONT_NOC_PORT_OUTPUT_CNTL_ACK_PORT{0}:'.format(port-1)
    pLine = pLine + '\n        begin'
    for nextPort in range (0, port):
      if nextPort == 0:
        pLine = pLine + '\n          local_OutqReady   = 1\'b0  ;'.format(nextPort)
      else:
        pLine = pLine + '\n          src{0}_OutqReady   = 1\'b0  ;'.format(nextPort-1)
    if port == 0:
      pLine = pLine + '\n          local_OutqReady   = ~fifo_almost_full ; // only enable source if fifo is available ;'.format(port)
    else:
      pLine = pLine + '\n          src{0}_OutqReady   = ~fifo_almost_full ; // only enable source if fifo is available ;'.format(port-1)
    for nextPort in range (port+1, numOfPorts+1):
      pLine = pLine + '\n          src{0}_OutqReady   = 1\'b0  ;'.format(nextPort-1)
    pLine = pLine + '\n        end'
    pLine = pLine + '\n'
  # DEFAULT
  pLine = pLine + '\n        default:'
  pLine = pLine + '\n        begin'
  for port in range (0, numOfPorts+1):
    if port == 0:
      pLine = pLine + '\n          local_OutqReady   = 1\'b0  ;'.format(port)
    else:
      pLine = pLine + '\n          src{0}_OutqReady   = 1\'b0  ;'.format(port-1)
  pLine = pLine + '\n        end'
  pLine = pLine + '\n'
  pLine = pLine + '\n      endcase'
  pLine = pLine + '\n    end'
  pLine = pLine + '\n'

  pLine = pLine + '\n  // Mux the acknowledged source onto the output fifo inputs'
  pLine = pLine + '\n  always @(*)'
  pLine = pLine + '\n    begin'
  pLine = pLine + '\n      case(nc_port_toNoc_state)'
  pLine = pLine + '\n'
  for port in range (0, numOfPorts+1):
    # READ
    if port == 0:
      pLine = pLine + '\n        `MGR_NOC_CONT_NOC_PORT_OUTPUT_CNTL_TRANSFER_LOCAL:'.format(port)
      pLine = pLine + '\n          begin'
      pLine = pLine + '\n            fifo_write = local_toNoc_valid ;'
      pLine = pLine + '\n            cntl  = local_cntl_toNoc  ;'
      pLine = pLine + '\n            data  = local_data_toNoc  ;'
      pLine = pLine + '\n          end'
    else:
      pLine = pLine + '\n        `MGR_NOC_CONT_NOC_PORT_OUTPUT_CNTL_TRANSFER_PORT{0}:'.format(port-1)
      pLine = pLine + '\n          begin'
      pLine = pLine + '\n            fifo_write = src{0}_toNoc_valid ;'.format(port-1)
      pLine = pLine + '\n            cntl  = src{0}_cntl_toNoc  ;'.format(port-1)
      pLine = pLine + '\n            data  = src{0}_data_toNoc  ;'.format(port-1)
      pLine = pLine + '\n          end'
    # ACK
    if port == 0:
      pLine = pLine + '\n        `MGR_NOC_CONT_NOC_PORT_OUTPUT_CNTL_ACK_LOCAL:'.format(port)
      pLine = pLine + '\n          begin'
      pLine = pLine + '\n            fifo_write = local_toNoc_valid ;'
      pLine = pLine + '\n            cntl  = local_cntl_toNoc  ;'
      pLine = pLine + '\n            data  = local_data_toNoc  ;'
      pLine = pLine + '\n          end'
    else:
      pLine = pLine + '\n        `MGR_NOC_CONT_NOC_PORT_OUTPUT_CNTL_ACK_PORT{0}:'.format(port-1)
      pLine = pLine + '\n          begin'
      pLine = pLine + '\n            fifo_write = src{0}_toNoc_valid ;'.format(port-1)
      pLine = pLine + '\n            cntl  = src{0}_cntl_toNoc  ;'.format(port-1)
      pLine = pLine + '\n            data  = src{0}_data_toNoc  ;'.format(port-1)
      pLine = pLine + '\n          end'
  pLine = pLine + '\n        default:'
  pLine = pLine + '\n          begin'
  pLine = pLine + '\n            fifo_write = \'d0 ;'.format(port-1)
  pLine = pLine + '\n            cntl  = \'d0 ;'.format(port-1)
  pLine = pLine + '\n            data  = \'d0 ;'.format(port-1)
  pLine = pLine + '\n          end'
  pLine = pLine + '\n'
  pLine = pLine + '\n      endcase'
  pLine = pLine + '\n    end'
  pLine = pLine + '\n'


  f.write(pLine)
  f.close()


  #-------------------------------
  # Local In-Q controller fsm
  # - takes requests from 4 ports (is only HP or LP from the ports)
  # - once selected, the ports input is diercted toward the Cp or Dp port from noc -> cntl (no fifo in-between)

  f = open('../HDL/common/mgr_noc_cntl_noc_local_inq_control_fsm_state_definitions.vh', 'w')
  pLine = ""

  numOfLocalInputQueueFsmStateBits = numOfPorts*3+1
  pLine = pLine + '\n//------------------------------------------------'
  pLine = pLine + '\n// MGR_NOC_CONT_LOCAL_INQ_CNTL_LOCAL_INPUT_QUEUE_CONTROL_STATE width'
  pLine = pLine + '\n//------------------------------------------------'
  pLine = pLine + '\n`define MGR_NOC_CONT_LOCAL_INQ_CNTL_STATE_MSB            {0}'.format(numOfLocalInputQueueFsmStateBits-1)
  pLine = pLine + '\n`define MGR_NOC_CONT_LOCAL_INQ_CNTL_STATE_LSB            0'
  pLine = pLine + '\n`define MGR_NOC_CONT_LOCAL_INQ_CNTL_STATE_SIZE           (`MGR_NOC_CONT_LOCAL_INQ_CNTL_STATE_MSB - `MGR_NOC_CONT_LOCAL_INQ_CNTL_STATE_LSB +1)'
  pLine = pLine + '\n`define MGR_NOC_CONT_LOCAL_INQ_CNTL_STATE_RANGE           `MGR_NOC_CONT_LOCAL_INQ_CNTL_STATE_MSB : `MGR_NOC_CONT_LOCAL_INQ_CNTL_STATE_LSB'
  pLine = pLine + '\n'
  pLine = pLine + '\n//------------------------------------------------------------------------------------------------'
  pLine = pLine + '\n//------------------------------------------------'
  pLine = pLine + '\n// MGR_NOC_CONT_LOCAL_INQ_CNTL state machine states'
  pLine = pLine + '\n//------------------------------------------------'
  pLine = pLine + '\n'
  pLine = pLine + '\n`define MGR_NOC_CONT_LOCAL_INQ_CNTL_WAIT        {0}\'d1'.format(numOfLocalInputQueueFsmStateBits)
  port = 0
  bit = 1
  for port in range (0, numOfPorts):
    pLine = pLine + '\n`define MGR_NOC_CONT_LOCAL_INQ_CNTL_DROP_HEADER{0}            {1}\'d{2}'.format(port,numOfLocalInputQueueFsmStateBits,pow(2,bit))
    pLine = pLine + '\n`define MGR_NOC_CONT_LOCAL_INQ_CNTL_ADD_SOP{0}                {1}\'d{2}'.format(port,numOfLocalInputQueueFsmStateBits,pow(2,bit+1))
    pLine = pLine + '\n`define MGR_NOC_CONT_LOCAL_INQ_CNTL_TRANSFER_PAYLOAD{0}       {1}\'d{2}'.format(port,numOfLocalInputQueueFsmStateBits,pow(2,bit+2))
    bit = bit+3


  f.write(pLine)
  f.close()


  f = open('../HDL/common/mgr_noc_cntl_noc_local_inq_control_fsm_state_transitions.vh', 'w')
  pLine = ""

  pLine = pLine + '\n           `MGR_NOC_CONT_LOCAL_INQ_CNTL_WAIT:'
  pLine = pLine + '\n             nc_local_inq_cntl_state_next = ( port0_localInqReq )  ? `MGR_NOC_CONT_LOCAL_INQ_CNTL_DROP_HEADER0  :'
  for port in range (1, numOfPorts):
    pLine = pLine + '\n                                            ( port{0}_localInqReq )  ? `MGR_NOC_CONT_LOCAL_INQ_CNTL_DROP_HEADER{0}  :'.format(port)
  pLine = pLine + '\n                                                                     `MGR_NOC_CONT_LOCAL_INQ_CNTL_WAIT          ; '


  for port in range (0, numOfPorts):

    pLine = pLine + '\n '
    pLine = pLine + '\n            // NoC packets always have more than one transaction so SOP_EOP will not be seen' 
    pLine = pLine + '\n            // NoCource controller has already read the header to determine the destination mask address, but it will still provide a "fromNoc_valid" signal when it starts transerring tbe entire external NoC packet'
    pLine = pLine + '\n            // When sending to the local in-queue, we need to drop the NoC header so waht for the first "fromNoc_valid" and ignore that transaction'
    pLine = pLine + '\n           `MGR_NOC_CONT_LOCAL_INQ_CNTL_DROP_HEADER{0}:'.format(port)
    pLine = pLine + '\n             nc_local_inq_cntl_state_next = (Port_from_NoC[{0}].fromNoc_valid && (Port_from_NoC[{0}].cntl_fromNoc == `COMMON_STD_INTF_CNTL_SOM))  ? `MGR_NOC_CONT_LOCAL_INQ_CNTL_ADD_SOP{0}      :'.format(port)
    pLine = pLine + '\n                                                                                                                                                      `MGR_NOC_CONT_LOCAL_INQ_CNTL_DROP_HEADER{0}  ; '.format(port)

    if port != (numOfPorts-1):
      pLine = pLine + '\n' 
      pLine = pLine + '\n           // when we transfer a packet between a Port and the In-queue, we will pass the packet to the CNTL block. But we need to strip the external header, this means we need to re-add the SOP indicator ' 
      pLine = pLine + '\n           `MGR_NOC_CONT_LOCAL_INQ_CNTL_ADD_SOP{0}:'.format(port)
      pLine = pLine + '\n             nc_local_inq_cntl_state_next =  (                     Port_from_NoC[{0}].fromNoc_valid && (Port_from_NoC[{0}].cntl_fromNoc != `COMMON_STD_INTF_CNTL_EOM))    ? `MGR_NOC_CONT_LOCAL_INQ_CNTL_TRANSFER_PAYLOAD{0}  :'.format(port)
      for nextPort in range (port+1, numOfPorts):
        pLine = pLine + '\n                                             (port{1}_localInqReq && Port_from_NoC[{0}].fromNoc_valid && (Port_from_NoC[{0}].cntl_fromNoc == `COMMON_STD_INTF_CNTL_EOM))    ? `MGR_NOC_CONT_LOCAL_INQ_CNTL_DROP_HEADER{1}       :  // EOP so go to the next port'.format(port,nextPort)
      for nextPort in range (0, port):
        pLine = pLine + '\n                                             (port{1}_localInqReq && Port_from_NoC[{0}].fromNoc_valid && (Port_from_NoC[{0}].cntl_fromNoc == `COMMON_STD_INTF_CNTL_EOM))    ? `MGR_NOC_CONT_LOCAL_INQ_CNTL_DROP_HEADER{1}       :  // EOP so go to the next port'.format(port,nextPort)
      pLine = pLine + '\n                                             (                     Port_from_NoC[{0}].fromNoc_valid && (Port_from_NoC[{0}].cntl_fromNoc == `COMMON_STD_INTF_CNTL_EOM))    ? `MGR_NOC_CONT_LOCAL_INQ_CNTL_WAIT               :  // EOP so go to the next port'.format(port)
      pLine = pLine + '\n                                                                                                                                                                              `MGR_NOC_CONT_LOCAL_INQ_CNTL_ADD_SOP{0}           ; '.format(port)
    else:
      pLine = pLine + '\n           `MGR_NOC_CONT_LOCAL_INQ_CNTL_ADD_SOP{0}:'.format(port)
      pLine = pLine + '\n             nc_local_inq_cntl_state_next =  (                     Port_from_NoC[{0}].fromNoc_valid && (Port_from_NoC[{0}].cntl_fromNoc != `COMMON_STD_INTF_CNTL_EOM))  ? `MGR_NOC_CONT_LOCAL_INQ_CNTL_TRANSFER_PAYLOAD{0}  :'.format(port)
      for nextPort in range (0, numOfPorts-1):
        pLine = pLine + '\n                                             (port{1}_localInqReq && Port_from_NoC[{0}].fromNoc_valid && (Port_from_NoC[{0}].cntl_fromNoc == `COMMON_STD_INTF_CNTL_EOM))  ? `MGR_NOC_CONT_LOCAL_INQ_CNTL_DROP_HEADER{1}       :  // EOP so go to the next port'.format(port,nextPort)
      pLine = pLine + '\n                                             (                     Port_from_NoC[{0}].fromNoc_valid && (Port_from_NoC[{0}].cntl_fromNoc == `COMMON_STD_INTF_CNTL_EOM))  ? `MGR_NOC_CONT_LOCAL_INQ_CNTL_WAIT               :  // EOP so go to the next port'.format(port,nextPort)
      pLine = pLine + '\n                                                                                                                                                                            `MGR_NOC_CONT_LOCAL_INQ_CNTL_ADD_SOP{0}           ; '.format(port)

    if port != (numOfPorts-1):
      pLine = pLine + '\n' 
      pLine = pLine + '\n           `MGR_NOC_CONT_LOCAL_INQ_CNTL_TRANSFER_PAYLOAD{0}:'.format(port)
      pLine = pLine + '\n             nc_local_inq_cntl_state_next =  (                     Port_from_NoC[{0}].fromNoc_valid && (Port_from_NoC[{0}].cntl_fromNoc != `COMMON_STD_INTF_CNTL_EOM))    ? `MGR_NOC_CONT_LOCAL_INQ_CNTL_TRANSFER_PAYLOAD{0}  :'.format(port)
      for nextPort in range (port+1, numOfPorts):
        pLine = pLine + '\n                                             (port{1}_localInqReq && Port_from_NoC[{0}].fromNoc_valid && (Port_from_NoC[{0}].cntl_fromNoc == `COMMON_STD_INTF_CNTL_EOM))    ? `MGR_NOC_CONT_LOCAL_INQ_CNTL_DROP_HEADER{1}       :  // EOP so go to the next port'.format(port,nextPort)
      for nextPort in range (0, port):
        pLine = pLine + '\n                                             (port{1}_localInqReq && Port_from_NoC[{0}].fromNoc_valid && (Port_from_NoC[{0}].cntl_fromNoc == `COMMON_STD_INTF_CNTL_EOM))    ? `MGR_NOC_CONT_LOCAL_INQ_CNTL_DROP_HEADER{1}       :  // EOP so go to the next port'.format(port,nextPort)
      pLine = pLine + '\n                                             (                     Port_from_NoC[{0}].fromNoc_valid && (Port_from_NoC[{0}].cntl_fromNoc == `COMMON_STD_INTF_CNTL_EOM))    ? `MGR_NOC_CONT_LOCAL_INQ_CNTL_WAIT               :  // EOP so go to the next port'.format(port)
      pLine = pLine + '\n                                                                                                                                                                              `MGR_NOC_CONT_LOCAL_INQ_CNTL_TRANSFER_PAYLOAD{0}  ; '.format(port)
    else:
      pLine = pLine + '\n           `MGR_NOC_CONT_LOCAL_INQ_CNTL_TRANSFER_PAYLOAD{0}:'.format(port)
      pLine = pLine + '\n             nc_local_inq_cntl_state_next =  (                     Port_from_NoC[{0}].fromNoc_valid && (Port_from_NoC[{0}].cntl_fromNoc != `COMMON_STD_INTF_CNTL_EOM))  ? `MGR_NOC_CONT_LOCAL_INQ_CNTL_TRANSFER_PAYLOAD{0}  :'.format(port)
      for nextPort in range (0, numOfPorts-1):
        pLine = pLine + '\n                                             (port{1}_localInqReq && Port_from_NoC[{0}].fromNoc_valid && (Port_from_NoC[{0}].cntl_fromNoc == `COMMON_STD_INTF_CNTL_EOM))  ? `MGR_NOC_CONT_LOCAL_INQ_CNTL_DROP_HEADER{1}       :  // EOP so go to the next port'.format(port,nextPort)
      pLine = pLine + '\n                                             (                     Port_from_NoC[{0}].fromNoc_valid && (Port_from_NoC[{0}].cntl_fromNoc == `COMMON_STD_INTF_CNTL_EOM))  ? `MGR_NOC_CONT_LOCAL_INQ_CNTL_WAIT               :  // EOP so go to the next port'.format(port,nextPort)
      pLine = pLine + '\n                                                                                                                                                                            `MGR_NOC_CONT_LOCAL_INQ_CNTL_TRANSFER_PAYLOAD{0}  ; '.format(port)


  f.write(pLine)
  f.close()


  f = open('../HDL/common/mgr_noc_cntl_noc_local_inq_control_assignments.vh', 'w')
  pLine = ""


  pLine = pLine + '\n  always @(posedge clk)'
  pLine = pLine + '\n    begin'
  pLine = pLine + '\n      '
  pLine = pLine + '\n      noc__locl__cp_valid       <= (reset_poweron ) ? \'d0 :   noc__locl__cp_valid_p1  ; '.format(port)
  pLine = pLine + '\n      noc__locl__cp_cntl        <= (reset_poweron ) ? \'d0 :   noc__locl__cp_cntl_p1   ; '.format(port)
  pLine = pLine + '\n      noc__locl__cp_type        <= (reset_poweron ) ? \'d0 :   noc__locl__cp_type_p1   ; '.format(port)
  pLine = pLine + '\n      noc__locl__cp_ptype       <= (reset_poweron ) ? \'d0 :   noc__locl__cp_ptype_p1  ; '.format(port)
  pLine = pLine + '\n      noc__locl__cp_data        <= (reset_poweron ) ? \'d0 :   noc__locl__cp_data_p1   ; '.format(port)
  pLine = pLine + '\n'                                                                    
  pLine = pLine + '\n      noc__locl__dp_valid       <= (reset_poweron ) ? \'d0 :   noc__locl__dp_valid_p1  ; '.format(port)
  pLine = pLine + '\n      noc__locl__dp_cntl        <= (reset_poweron ) ? \'d0 :   noc__locl__dp_cntl_p1   ; '.format(port)
  pLine = pLine + '\n      noc__locl__dp_type        <= (reset_poweron ) ? \'d0 :   noc__locl__dp_type_p1   ; '.format(port)
  pLine = pLine + '\n      noc__locl__dp_ptype       <= (reset_poweron ) ? \'d0 :   noc__locl__dp_ptype_p1  ; '.format(port)
  pLine = pLine + '\n      noc__locl__dp_data        <= (reset_poweron ) ? \'d0 :   noc__locl__dp_data_p1   ; '.format(port)
  pLine = pLine + '\n      '
  pLine = pLine + '\n      case(nc_local_inq_cntl_state)'
  pLine = pLine + '\n'
  for port in range (0, numOfPorts):
    # READ
    pLine = pLine + '\n        `MGR_NOC_CONT_LOCAL_INQ_CNTL_DROP_HEADER{0}:'.format(port)
    pLine = pLine + '\n          begin'
    pLine = pLine + '\n            noc__locl__cp_mgrId       <= (reset_poweron ) ? \'d0 : Port_from_NoC[{0}].data_fromNoc[`MGR_NOC_CONT_EXTERNAL_1ST_CYCLE_SOURCE_PE_RANGE       ]                                   ; '.format(port)
    pLine = pLine + '\n          end'
    pLine = pLine + '\n        `MGR_NOC_CONT_LOCAL_INQ_CNTL_ADD_SOP{0}:'.format(port)
    pLine = pLine + '\n          begin'
    pLine = pLine + '\n            local_inq_type_fromNoc    <= (reset_poweron ) ? \'d0 : local_inq_type_fromNoc_p1 ;   '
    pLine = pLine + '\n            //noc__locl__cp_laneId      <= (reset_poweron ) ? \'d0 : Port_from_NoC[{0}].data_fromNoc[`MGR_NOC_CONT_EXTERNAL_DMA_REQ_2ND_CYCLE_LANE_ID_RANGE ]                                   ; '.format(port)
    pLine = pLine + '\n            //noc__locl__cp_strmId      <= (reset_poweron ) ? \'d0 : Port_from_NoC[{0}].data_fromNoc[`MGR_NOC_CONT_EXTERNAL_DMA_REQ_2ND_CYCLE_STRM_ID_RANGE ]                                   ; '.format(port)
    pLine = pLine + '\n            //noc__locl__dp_laneId      <= (reset_poweron ) ? \'d0 : Port_from_NoC[{0}].data_fromNoc[`MGR_NOC_CONT_EXTERNAL_DMA_REQ_2ND_CYCLE_LANE_ID_RANGE ]                                   ; '.format(port)
    pLine = pLine + '\n            //noc__locl__dp_strmId      <= (reset_poweron ) ? \'d0 : Port_from_NoC[{0}].data_fromNoc[`MGR_NOC_CONT_EXTERNAL_DMA_REQ_2ND_CYCLE_STRM_ID_RANGE ]                                   ; '.format(port)
    pLine = pLine + '\n          end'
  pLine = pLine + '\n        default:'
  pLine = pLine + '\n          begin'
  pLine = pLine + '\n            local_inq_type_fromNoc    <= (reset_poweron   ) ? \'d0 : local_inq_type_fromNoc ;   '
  pLine = pLine + '\n          end'
  pLine = pLine + '\n'
  pLine = pLine + '\n      endcase'
  pLine = pLine + '\n    end'
  pLine = pLine + '\n'
    
  for port in range (0, numOfPorts):
    pLine = pLine + '\n  // Mask request from Port with this PE\'s mask address'
    pLine = pLine + '\n  assign port{0}_localInqReq      = Port_from_NoC[{0}].destinationReq & |(Port_from_NoC[{0}].destinationReqAddr & thisMgrBitMask)  ;'.format(port)
    pLine = pLine + '\n  always @(posedge clk)'
    pLine = pLine + '\n    port{0}_localInqPriority <= (port{0}_localInqReq) ? Port_from_NoC[{0}].destinationPriority : port{0}_localInqPriority ;'.format(port)
    pLine = pLine + '\n  '
    pLine = pLine + '\n  // Ack and ready back to source ports'
    pLine = pLine + '\n  always @(posedge clk)'
    pLine = pLine + '\n    local_port{0}_OutqAck   <= port{0}_localInqReq ;  // feed request directly back to ack'.format(port)
    pLine = pLine + '\n  assign local_port{0}_OutqReady = ((port{0}_localInqPriority == `MGR_NOC_CONT_EXTERNAL_1ST_CYCLE_PRIORITY_CP) ? locl__noc__cp_ready : locl__noc__dp_ready ) &  // we will transfer the packet directly to the cntl block'.format(port)
    pLine = pLine + '\n                                   ((nc_local_inq_cntl_state == `MGR_NOC_CONT_LOCAL_INQ_CNTL_DROP_HEADER{0}     ) | // only assert ready to source if currently selected for transfer'.format(port)
    pLine = pLine + '\n                                    (nc_local_inq_cntl_state == `MGR_NOC_CONT_LOCAL_INQ_CNTL_ADD_SOP{0}         ) | '.format(port)
    pLine = pLine + '\n                                    (nc_local_inq_cntl_state == `MGR_NOC_CONT_LOCAL_INQ_CNTL_TRANSFER_PAYLOAD{0}) );'.format(port)

  pLine = pLine + '\n  // Mux source packet into the to cntl fifo'
  pLine = pLine + '\n  // Remember, the transferred packet includes the NoC header so the local contrller needs to drop the first transaction'
  pLine = pLine + '\n  always @(*)'
  pLine = pLine + '\n    begin'
  pLine = pLine + '\n      noc__locl__cp_cntl_p1                                                        = \'d0   ; '.format(port)
  pLine = pLine + '\n      noc__locl__cp_type_p1                                                        = \'d0   ; '.format(port)
  pLine = pLine + '\n      noc__locl__cp_ptype_p1                                                       = \'d0   ; '.format(port)
  pLine = pLine + '\n      noc__locl__cp_data_p1                                                        = \'d0   ; '.format(port)
  pLine = pLine + '\n      noc__locl__cp_valid_p1                                                       = \'d0   ; '.format(port)
  pLine = pLine + '\n'     
  pLine = pLine + '\n      noc__locl__dp_cntl_p1                                                        = \'d0   ; '.format(port)
  pLine = pLine + '\n      noc__locl__dp_type_p1                                                        = \'d0   ; '.format(port)
  pLine = pLine + '\n      noc__locl__dp_ptype_p1                                                       = \'d0   ; '.format(port)
  pLine = pLine + '\n      noc__locl__dp_data_p1                                                        = \'d0   ; '.format(port)
  pLine = pLine + '\n      noc__locl__dp_valid_p1                                                       = \'d0   ; '.format(port)
  pLine = pLine + '\n      '
  pLine = pLine + '\n      local_inq_type_fromNoc_p1                                                    = \'d0   ; '.format(port)
  pLine = pLine + '\n      '
  pLine = pLine + '\n      case(nc_local_inq_cntl_state)'
  pLine = pLine + '\n'
  for port in range (0, numOfPorts):
    # READ
    pLine = pLine + '\n        `MGR_NOC_CONT_LOCAL_INQ_CNTL_ADD_SOP{0}:'.format(port)
    pLine = pLine + '\n          begin'
    pLine = pLine + '\n            local_inq_type_fromNoc_p1                                                       = Port_from_NoC[{0}].type_fromNoc   ; '.format(port)
    pLine = pLine + '\n      '
    pLine = pLine + '\n            noc__locl__cp_cntl_p1                                                        = (Port_from_NoC[{0}].cntl_fromNoc == `COMMON_STD_INTF_CNTL_EOM) ? `COMMON_STD_INTF_CNTL_SOM_EOM             : '.format(port)
    pLine = pLine + '\n                                                                                                                                                                     `COMMON_STD_INTF_CNTL_SOM                 ; '.format(port)
    pLine = pLine + '\n            noc__locl__cp_type_p1                                                        = Port_from_NoC[{0}].type_fromNoc                                                                                        ; '.format(port)
    pLine = pLine + '\n            noc__locl__cp_ptype_p1                                                       = Port_from_NoC[{0}].ptype_fromNoc                                                                                        ; '.format(port)
    pLine = pLine + '\n            noc__locl__cp_data_p1[`MGR_NOC_CONT_INTERNAL_DMA_REQ_1ST_CYCLE_ADDRESS_RANGE  ]  = Port_from_NoC[{0}].data_fromNoc[`MGR_NOC_CONT_EXTERNAL_DMA_REQ_2ND_CYCLE_ADDRESS_RANGE ]                                   ; '.format(port)
    pLine = pLine + '\n            noc__locl__cp_data_p1[`MGR_NOC_CONT_INTERNAL_DMA_REQ_1ST_CYCLE_STAGGER_RANGE  ]  = Port_from_NoC[{0}].data_fromNoc[`MGR_NOC_CONT_EXTERNAL_DMA_REQ_2ND_CYCLE_STAGGER_RANGE ]                                   ; '.format(port)
    pLine = pLine + '\n            noc__locl__cp_valid_p1                                                       = (port{0}_localInqPriority != `MGR_NOC_CONT_EXTERNAL_1ST_CYCLE_PRIORITY_CP)                                       ? \'d0                           :'.format(port)
    pLine = pLine + '\n                                                                                              (Port_from_NoC[{0}].fromNoc_valid && (Port_from_NoC[{0}].cntl_fromNoc == `COMMON_STD_INTF_CNTL_SOM))  ? \'d0                           :  // packets from NoC always more than one transaction'.format(port)
    pLine = pLine + '\n                                                                                                                                                                                                             Port_from_NoC[{0}].fromNoc_valid ; '.format(port)
    pLine = pLine + '\n'           
    pLine = pLine + '\n            noc__locl__dp_cntl_p1                                                        = (Port_from_NoC[{0}].cntl_fromNoc == `COMMON_STD_INTF_CNTL_EOM) ? `COMMON_STD_INTF_CNTL_SOM_EOM             : '.format(port)
    pLine = pLine + '\n                                                                                                                                                                     `COMMON_STD_INTF_CNTL_SOM                 ; '.format(port)
    pLine = pLine + '\n            noc__locl__dp_type_p1                                                        = Port_from_NoC[{0}].type_fromNoc                                                                                        ; '.format(port)
    pLine = pLine + '\n            noc__locl__dp_ptype_p1                                                       = Port_from_NoC[{0}].ptype_fromNoc                                                                                       ; '.format(port)
    pLine = pLine + '\n            noc__locl__dp_data_p1                                                        = Port_from_NoC[{0}].data_fromNoc[`MGR_NOC_CONT_EXT_DATA_TO_INT_DATA_RANGE ]                                   ; '.format(port)
    pLine = pLine + '\n            noc__locl__dp_valid_p1                                                       = (port{0}_localInqPriority != `MGR_NOC_CONT_EXTERNAL_1ST_CYCLE_PRIORITY_DP)                                       ? \'d0                           :'.format(port)
    pLine = pLine + '\n                                                                                              (Port_from_NoC[{0}].fromNoc_valid && (Port_from_NoC[{0}].cntl_fromNoc == `COMMON_STD_INTF_CNTL_SOM))  ? \'d0                           :  // packets from NoC always more than one transaction'.format(port)
    pLine = pLine + '\n                                                                                                                                                                                                             Port_from_NoC[{0}].fromNoc_valid ; '.format(port)
    pLine = pLine + '\n          end'
    pLine = pLine + '\n        `MGR_NOC_CONT_LOCAL_INQ_CNTL_TRANSFER_PAYLOAD{0}:'.format(port)
    pLine = pLine + '\n          begin'
    pLine = pLine + '\n            noc__locl__cp_cntl_p1                                                        = Port_from_NoC[{0}].cntl_fromNoc                                    ; '.format(port)
    pLine = pLine + '\n            noc__locl__cp_data_p1[`MGR_NOC_CONT_INTERNAL_DMA_REQ_2ND_CYCLE_PAYLOAD_TYPE_RANGE  ]  = Port_from_NoC[{0}].data_fromNoc[`MGR_NOC_CONT_EXTERNAL_DMA_REQ_3RD_CYCLE_PAYLOAD_TYPE_RANGE ]                                   ; '.format(port)
    pLine = pLine + '\n            noc__locl__cp_data_p1[`MGR_NOC_CONT_INTERNAL_DMA_REQ_2ND_CYCLE_NUM_OF_WORDS_RANGE  ]  = Port_from_NoC[{0}].data_fromNoc[`MGR_NOC_CONT_EXTERNAL_DMA_REQ_3RD_CYCLE_NUM_OF_WORDS_RANGE ]                                   ; '.format(port)
    pLine = pLine + '\n            noc__locl__cp_valid_p1                                                       = (port{0}_localInqPriority != `MGR_NOC_CONT_EXTERNAL_1ST_CYCLE_PRIORITY_CP)                                       ? \'d0                           :'.format(port)
    pLine = pLine + '\n                                                                                              (Port_from_NoC[{0}].fromNoc_valid && (Port_from_NoC[{0}].cntl_fromNoc == `COMMON_STD_INTF_CNTL_SOM))  ? \'d0                           :  // packets from NoC always more than one transaction'.format(port)
    pLine = pLine + '\n                                                                                                                                                                                                             Port_from_NoC[{0}].fromNoc_valid ; '.format(port)
    pLine = pLine + '\n            noc__locl__cp_type_p1                                                        = local_inq_type_fromNoc     ;  // maintain type value through packet transfer '.format(port)
    pLine = pLine + '\n            noc__locl__cp_ptype_p1                                                       = local_inq_ptype_fromNoc     ;  // maintain type value through packet transfer '.format(port)
    pLine = pLine + '\n'           
    pLine = pLine + '\n            noc__locl__dp_cntl_p1                                                        = Port_from_NoC[{0}].cntl_fromNoc                                    ; '.format(port)
    pLine = pLine + '\n            noc__locl__dp_data_p1                                                        = Port_from_NoC[{0}].data_fromNoc[`MGR_NOC_CONT_EXT_DATA_TO_INT_DATA_RANGE ]                                   ; '.format(port)
    pLine = pLine + '\n            noc__locl__dp_valid_p1                                                       = (port{0}_localInqPriority != `MGR_NOC_CONT_EXTERNAL_1ST_CYCLE_PRIORITY_DP)                                       ? \'d0                           :'.format(port)
    pLine = pLine + '\n                                                                                              (Port_from_NoC[{0}].fromNoc_valid && (Port_from_NoC[{0}].cntl_fromNoc == `COMMON_STD_INTF_CNTL_SOM))  ? \'d0                           :  // packets from NoC always more than one transaction'.format(port)
    pLine = pLine + '\n                                                                                                                                                                                                             Port_from_NoC[{0}].fromNoc_valid ; '.format(port)
    pLine = pLine + '\n            noc__locl__dp_type_p1                                                        = local_inq_type_fromNoc     ;  // maintain type value through packet transfer '.format(port)
    pLine = pLine + '\n            noc__locl__dp_ptype_p1                                                       = local_inq_ptype_fromNoc     ;  // maintain type value through packet transfer '.format(port)
    pLine = pLine + '\n          end'
  pLine = pLine + '\n        default:'
  pLine = pLine + '\n          begin'
  pLine = pLine + '\n            local_inq_type_fromNoc_p1                                                       = \'d0   ; '.format(port)
  pLine = pLine + '\n            local_inq_ptype_fromNoc_p1                                                      = \'d0   ; '.format(port)
  pLine = pLine + '\n'
  pLine = pLine + '\n            noc__locl__cp_valid_p1                                                       = \'d0   ; '.format(port)
  pLine = pLine + '\n            noc__locl__cp_cntl_p1                                                        = \'d0   ; '.format(port)
  pLine = pLine + '\n            noc__locl__cp_type_p1                                                        = \'d0   ; '.format(port)
  pLine = pLine + '\n            noc__locl__cp_ptype_p1                                                       = \'d0   ; '.format(port)
  pLine = pLine + '\n            noc__locl__cp_data_p1                                                        = \'d0   ; '.format(port)
  pLine = pLine + '\n'           
  pLine = pLine + '\n            noc__locl__dp_valid_p1                                                       = \'d0   ; '.format(port)
  pLine = pLine + '\n            noc__locl__dp_cntl_p1                                                        = \'d0   ; '.format(port)
  pLine = pLine + '\n            noc__locl__dp_type_p1                                                        = \'d0   ; '.format(port)
  pLine = pLine + '\n            noc__locl__dp_ptype_p1                                                       = \'d0   ; '.format(port)
  pLine = pLine + '\n            noc__locl__dp_data_p1                                                        = \'d0   ; '.format(port)
  pLine = pLine + '\n          end'
  pLine = pLine + '\n'
  pLine = pLine + '\n      endcase'
  pLine = pLine + '\n    end'
  pLine = pLine + '\n'

  f.write(pLine)
  f.close()


  #------------------------------------------------------------------------------------------------------------------------------------------------------
  # Manager Array

  f = open('../HDL/common/system_manager_sys_general_ports.vh', 'w')
  pLine = ""

  for pe in range (0, numOfPe):
    pLine = pLine + '\n            // General control and status                    '.format(pe) 
    pLine = pLine + '\n            mgr{0}__sys__allSynchronized                    ,'.format(pe) 
    pLine = pLine + '\n            sys__mgr{0}__thisSynchronized                   ,'.format(pe) 
    pLine = pLine + '\n            sys__mgr{0}__ready                              ,'.format(pe) 
    pLine = pLine + '\n            sys__mgr{0}__complete                           ,'.format(pe) 
    pLine = pLine + '\n'
    #

  f.write(pLine)
  f.close()

  #--------------------------------------------------
  # Upstream Stack Bus

  f = open('../HDL/common/system_manager_stack_bus_upstream_ports.vh', 'w')
  pLine = ""

  for pe in range (0, numOfPe):
    pLine = pLine + '\n            stu__mgr{0}__valid          ,'.format(pe)
    pLine = pLine + '\n            stu__mgr{0}__cntl           ,'.format(pe) 
    pLine = pLine + '\n            mgr{0}__stu__ready          ,'.format(pe) 
    pLine = pLine + '\n            stu__mgr{0}__type           ,'.format(pe) 
    pLine = pLine + '\n            stu__mgr{0}__data           ,'.format(pe) 
    pLine = pLine + '\n            stu__mgr{0}__oob_data       ,'.format(pe) 
    pLine = pLine + '\n'
  pLine = pLine + '\n'

  f.write(pLine)
  f.close()

  f = open('../HDL/common/system_manager_stack_bus_downstream_ports.vh', 'w')
  pLine = ""

  for pe in range (0, numOfPe):
    #
    pLine = pLine + '\n            //-----------------------------------------------------------'
    pLine = pLine + '\n            // Manager Lane arguments to the PE                          '
    pLine = pLine + '\n'
    for lane in range (0, numOfExecLanes):
      for strm in range (0, 2):
        pLine = pLine + '\n            // manager {0}, lane {1}, stream {2}      '.format(pe,lane,strm) 
        pLine = pLine + '\n            std__mgr{0}__lane{1}_strm{2}_ready       ,'.format(pe,lane,strm)
        pLine = pLine + '\n            mgr{0}__std__lane{1}_strm{2}_cntl        ,'.format(pe,lane,strm) 
        pLine = pLine + '\n            mgr{0}__std__lane{1}_strm{2}_data        ,'.format(pe,lane,strm) 
        pLine = pLine + '\n            mgr{0}__std__lane{1}_strm{2}_data_valid  ,'.format(pe,lane,strm) 
        pLine = pLine + '\n'

  f.write(pLine)
  f.close()

  f = open('../HDL/common/system_manager_stack_bus_downstream_oob_ports.vh', 'w')
  pLine = ""

  for pe in range (0, numOfPe):
    #
    pLine = pLine + '\n            // OOB controls the PE                          '.format(pe) 
    pLine = pLine + '\n            // For now assume OOB is separate to lanes      '.format(pe) 
    pLine = pLine + '\n            mgr{0}__std__oob_cntl                           ,'.format(pe) 
    pLine = pLine + '\n            mgr{0}__std__oob_valid                          ,'.format(pe) 
    pLine = pLine + '\n            std__mgr{0}__oob_ready                          ,'.format(pe) 
    pLine = pLine + '\n            mgr{0}__std__oob_type                           ,'.format(pe) 
    pLine = pLine + '\n            mgr{0}__std__oob_data                           ,'.format(pe) 
    pLine = pLine + '\n'
  f.write(pLine)
  f.close()

  f = open('../../Manager/HDL/common/system_manager_stack_bus_upstream_port_declarations.vh', 'w')
  pLine = ""

  for pe in range (0, numOfPe):
    pLine = pLine + '\n    input                                          stu__mgr{0}__valid          ;'.format(pe)
    pLine = pLine + '\n    input   [`COMMON_STD_INTF_CNTL_RANGE   ]       stu__mgr{0}__cntl           ;'.format(pe) 
    pLine = pLine + '\n    output                                         mgr{0}__stu__ready          ;'.format(pe) 
    pLine = pLine + '\n    input   [`STACK_UP_INTF_TYPE_RANGE     ]       stu__mgr{0}__type           ;'.format(pe) 
    pLine = pLine + '\n    input   [`STACK_UP_INTF_DATA_RANGE     ]       stu__mgr{0}__data           ;'.format(pe) 
    pLine = pLine + '\n    input   [`STACK_UP_INTF_OOB_DATA_RANGE ]       stu__mgr{0}__oob_data       ;'.format(pe) 
    pLine = pLine + '\n'
  pLine = pLine + '\n'

  f.write(pLine)
  f.close()

  f = open('../HDL/common/system_manager_sys_general_port_declarations.vh', 'w')
  pLine = ""

  for pe in range (0, numOfPe):
    pLine = pLine + '\n  // General control and status                                                   '.format(pe) 
    pLine = pLine + '\n  output                                        mgr{0}__sys__allSynchronized     ;'.format(pe) 
    pLine = pLine + '\n  input                                         sys__mgr{0}__thisSynchronized    ;'.format(pe) 
    pLine = pLine + '\n  input                                         sys__mgr{0}__ready               ;'.format(pe) 
    pLine = pLine + '\n  input                                         sys__mgr{0}__complete            ;'.format(pe) 
    #                                                                                                              

  f.write(pLine)
  f.close()


  f = open('../HDL/common/system_manager_stack_bus_downstream_oob_port_declarations.vh', 'w')
  pLine = ""

  for pe in range (0, numOfPe):
    #                                                                                                              
    pLine = pLine + '\n  // OOB controls how the lanes are interpreted                                  '.format(pe) 
    pLine = pLine + '\n  output  [`COMMON_STD_INTF_CNTL_RANGE     ]      mgr{0}__std__oob_cntl            ;'.format(pe) 
    pLine = pLine + '\n  output                                          mgr{0}__std__oob_valid           ;'.format(pe) 
    pLine = pLine + '\n  input                                           std__mgr{0}__oob_ready           ;'.format(pe) 
    pLine = pLine + '\n  output  [`STACK_DOWN_OOB_INTF_TYPE_RANGE ]      mgr{0}__std__oob_type            ;'.format(pe) 
    pLine = pLine + '\n  output  [`STACK_DOWN_OOB_INTF_DATA_RANGE ]      mgr{0}__std__oob_data            ;'.format(pe) 
    #                                                             

  f.write(pLine)
  f.close()

  f = open('../HDL/common/system_manager_stack_bus_downstream_port_declarations.vh', 'w')
  pLine = ""

  for pe in range (0, numOfPe):
    for lane in range (0, numOfExecLanes):
      for strm in range (0, 2):
        pLine = pLine + '\n  input                                         std__mgr{0}__lane{1}_strm{2}_ready       ;'.format(pe,lane,strm)
        pLine = pLine + '\n  output  [`COMMON_STD_INTF_CNTL_RANGE      ]   mgr{0}__std__lane{1}_strm{2}_cntl        ;'.format(pe,lane,strm) 
        pLine = pLine + '\n  output  [`STACK_DOWN_INTF_STRM_DATA_RANGE ]   mgr{0}__std__lane{1}_strm{2}_data        ;'.format(pe,lane,strm) 
        pLine = pLine + '\n  output                                        mgr{0}__std__lane{1}_strm{2}_data_valid  ;'.format(pe,lane,strm) 
        pLine = pLine + '\n'

  f.write(pLine)
  f.close()

  f = open('../HDL/common/system_manager_sys_general_instance_wires.vh', 'w')
  pLine = ""

  for pe in range (0, numOfPe):
    pLine = pLine + '\n  // General control and status                                                 '.format(pe) 
    pLine = pLine + '\n  wire                                        mgr{0}__sys__allSynchronized     ;'.format(pe) 
    pLine = pLine + '\n  wire                                        sys__mgr{0}__thisSynchronized    ;'.format(pe) 
    pLine = pLine + '\n  wire                                        sys__mgr{0}__ready               ;'.format(pe) 
    pLine = pLine + '\n  wire                                        sys__mgr{0}__complete            ;'.format(pe) 
    pLine = pLine + '\n'
    #                                                                                                            

  f.write(pLine)
  f.close()


  f = open('../HDL/common/system_manager_stack_bus_downstream_oob_instance_wires.vh', 'w')
  pLine = ""

  for pe in range (0, numOfPe):
    #                                                                                                            
    pLine = pLine + '\n  // OOB controls how the lanes are interpreted                                '.format(pe) 
    pLine = pLine + '\n  wire[`COMMON_STD_INTF_CNTL_RANGE     ]      mgr{0}__std__oob_cntl            ;'.format(pe) 
    pLine = pLine + '\n  wire                                        mgr{0}__std__oob_valid           ;'.format(pe) 
    pLine = pLine + '\n  wire                                        std__mgr{0}__oob_ready           ;'.format(pe) 
    pLine = pLine + '\n  wire[`STACK_DOWN_OOB_INTF_TYPE_RANGE ]      mgr{0}__std__oob_type            ;'.format(pe) 
    pLine = pLine + '\n  wire[`STACK_DOWN_OOB_INTF_DATA_RANGE ]      mgr{0}__std__oob_data            ;'.format(pe) 
    pLine = pLine + '\n'
    #                                                             
     
  f.write(pLine)
  f.close()

  f = open('../HDL/common/system_manager_stack_bus_downstream_instance_wires.vh', 'w')
  pLine = ""

  for pe in range (0, numOfPe):
    for lane in range (0, numOfExecLanes):
      for strm in range (0, 2):
        pLine = pLine + '\n  wire                                        std__mgr{0}__lane{1}_strm{2}_ready       ;'.format(pe,lane,strm)
        pLine = pLine + '\n  wire [`COMMON_STD_INTF_CNTL_RANGE       ]   mgr{0}__std__lane{1}_strm{2}_cntl        ;'.format(pe,lane,strm) 
        pLine = pLine + '\n  wire [`STACK_DOWN_INTF_STRM_DATA_RANGE  ]   mgr{0}__std__lane{1}_strm{2}_data        ;'.format(pe,lane,strm) 
        pLine = pLine + '\n  wire                                        mgr{0}__std__lane{1}_strm{2}_data_valid  ;'.format(pe,lane,strm) 
        pLine = pLine + '\n'
     
  f.write(pLine)
  f.close()

  f = open('../HDL/common/system_manager_stack_bus_downstream_oob_instance_connections.vh', 'w')
  pLine = ""

  for pe in range (0, numOfPe):
    #                                                                                                                  
    pLine = pLine + '\n  assign  mgr{0}__std__oob_cntl                       =  mgr_inst[{0}].mgr__std__oob_cntl       ;'.format(pe) 
    pLine = pLine + '\n  assign  mgr{0}__std__oob_valid                      =  mgr_inst[{0}].mgr__std__oob_valid      ;'.format(pe) 
    pLine = pLine + '\n  assign  mgr_inst[{0}].std__mgr__oob_ready           =  std__mgr{0}__oob_ready                 ;'.format(pe)
    pLine = pLine + '\n  assign  mgr{0}__std__oob_type                       =  mgr_inst[{0}].mgr__std__oob_type       ;'.format(pe) 
    pLine = pLine + '\n  assign  mgr{0}__std__oob_data                       =  mgr_inst[{0}].mgr__std__oob_data       ;'.format(pe) 
    pLine = pLine + '\n'
  pLine = pLine + '\n'

  f.write(pLine)
  f.close()

  f = open('../HDL/common/system_manager_stack_bus_downstream_instance_connections.vh', 'w')
  pLine = ""

  for pe in range (0, numOfPe):
    for lane in range (0, numOfExecLanes):
      for strm in range (0, 2):
        pLine = pLine + '\n  assign  mgr_inst[{0}].std__mgr__lane{1}_strm{2}_ready   =  std__mgr{0}__lane{1}_strm{2}_ready                  ;'.format(pe,lane,strm)
        pLine = pLine + '\n  assign  mgr{0}__std__lane{1}_strm{2}_cntl               =  mgr_inst[{0}].mgr__std__lane{1}_strm{2}_cntl        ;'.format(pe,lane,strm) 
        pLine = pLine + '\n  assign  mgr{0}__std__lane{1}_strm{2}_data               =  mgr_inst[{0}].mgr__std__lane{1}_strm{2}_data        ;'.format(pe,lane,strm) 
        pLine = pLine + '\n  assign  mgr{0}__std__lane{1}_strm{2}_data_valid         =  mgr_inst[{0}].mgr__std__lane{1}_strm{2}_data_valid  ;'.format(pe,lane,strm) 
        pLine = pLine + '\n'
    pLine = pLine + '\n'
  pLine = pLine + '\n'

  f.write(pLine)
  f.close()

  f = open('../HDL/common/system_manager_stack_bus_upstream_instance_wires.vh', 'w')
  pLine = ""

  for pe in range (0, numOfPe):
    pLine = pLine + '\n    wire                                           stu__mgr{0}__valid          ;'.format(pe)
    pLine = pLine + '\n    wire    [`COMMON_STD_INTF_CNTL_RANGE   ]       stu__mgr{0}__cntl           ;'.format(pe) 
    pLine = pLine + '\n    wire                                           mgr{0}__stu__ready          ;'.format(pe) 
    pLine = pLine + '\n    wire    [`STACK_UP_INTF_TYPE_RANGE     ]       stu__mgr{0}__type           ;'.format(pe) 
    pLine = pLine + '\n    wire    [`STACK_UP_INTF_DATA_RANGE     ]       stu__mgr{0}__data           ;'.format(pe) 
    pLine = pLine + '\n    wire    [`STACK_UP_INTF_OOB_DATA_RANGE ]       stu__mgr{0}__oob_data       ;'.format(pe) 
    pLine = pLine + '\n'
  pLine = pLine + '\n'
     
  f.write(pLine)
  f.close()

  f = open('../HDL/common/system_manager_stack_bus_upstream_instance_connections.vh', 'w')
  pLine = ""

  for pe in range (0, numOfPe):
    pLine = pLine + '\n  assign   mgr_inst[{0}].stu__mgr__valid     =   stu__mgr{0}__valid               ;'.format(pe)
    pLine = pLine + '\n  assign   mgr_inst[{0}].stu__mgr__cntl      =   stu__mgr{0}__cntl                ;'.format(pe)
    pLine = pLine + '\n  assign   mgr{0}__stu__ready                =   mgr_inst[{0}].mgr__stu__ready    ;'.format(pe) 
    pLine = pLine + '\n  assign   mgr_inst[{0}].stu__mgr__type      =   stu__mgr{0}__type                ;'.format(pe)
    pLine = pLine + '\n  assign   mgr_inst[{0}].stu__mgr__data      =   stu__mgr{0}__data                ;'.format(pe)
    pLine = pLine + '\n  assign   mgr_inst[{0}].stu__mgr__oob_data  =   stu__mgr{0}__oob_data            ;'.format(pe)
    pLine = pLine + '\n'
  pLine = pLine + '\n'

  f.write(pLine)
  f.close()


  #------------------------------------------------------------------------------------------------------------------------------------------------------
  # Manager

  #--------------------------------------------------
  # Downstream Stack Bus

  f = open('../HDL/common/manager_stack_bus_downstream_port_declarations.vh', 'w')
  pLine = ""

  #
  for lane in range (0, numOfExecLanes):
    pLine = pLine + '\n  // Lane operand bus                 '.format(lane)
    pLine = pLine + '\n  input                                            std__mgr__lane{0}_strm0_ready       ;'.format(lane)
    pLine = pLine + '\n  output[`COMMON_STD_INTF_CNTL_RANGE       ]       mgr__std__lane{0}_strm0_cntl        ;'.format(lane) 
    pLine = pLine + '\n  output[`STACK_DOWN_INTF_STRM_DATA_RANGE  ]       mgr__std__lane{0}_strm0_data        ;'.format(lane) 
    pLine = pLine + '\n  output                                           mgr__std__lane{0}_strm0_data_valid  ;'.format(lane) 
    pLine = pLine + '\n  input                                            std__mgr__lane{0}_strm1_ready       ;'.format(lane)
    pLine = pLine + '\n  output[`COMMON_STD_INTF_CNTL_RANGE       ]       mgr__std__lane{0}_strm1_cntl        ;'.format(lane) 
    pLine = pLine + '\n  output[`STACK_DOWN_INTF_STRM_DATA_RANGE  ]       mgr__std__lane{0}_strm1_data        ;'.format(lane) 
    pLine = pLine + '\n  output                                           mgr__std__lane{0}_strm1_data_valid  ;'.format(lane) 
    pLine = pLine + '\n'

  f.write(pLine)
  f.close()

  f = open('../HDL/common/manager_stack_bus_downstream_instance_wires.vh', 'w')
  pLine = ""

  #
  for lane in range (0, numOfExecLanes):
    pLine = pLine + '\n  // Lane operand bus                 '.format(lane)
    pLine = pLine + '\n  wire                                           std__mgr__lane{0}_strm0_ready       ;'.format(lane)
    pLine = pLine + '\n  wire [`COMMON_STD_INTF_CNTL_RANGE       ]      mgr__std__lane{0}_strm0_cntl        ;'.format(lane) 
    pLine = pLine + '\n  wire [`STACK_DOWN_INTF_STRM_DATA_RANGE  ]      mgr__std__lane{0}_strm0_data        ;'.format(lane) 
    pLine = pLine + '\n  wire                                           mgr__std__lane{0}_strm0_data_valid  ;'.format(lane) 
    pLine = pLine + '\n  wire                                           std__mgr__lane{0}_strm1_ready       ;'.format(lane)
    pLine = pLine + '\n  wire [`COMMON_STD_INTF_CNTL_RANGE       ]      mgr__std__lane{0}_strm1_cntl        ;'.format(lane) 
    pLine = pLine + '\n  wire [`STACK_DOWN_INTF_STRM_DATA_RANGE  ]      mgr__std__lane{0}_strm1_data        ;'.format(lane) 
    pLine = pLine + '\n  wire                                           mgr__std__lane{0}_strm1_data_valid  ;'.format(lane) 

  f.write(pLine)
  f.close()

  f = open('../HDL/common/manager_stack_bus_downstream_instance_ports.vh', 'w')
  pLine = ""

  #
  for lane in range (0, numOfExecLanes):
    pLine = pLine + '\n               // Lane {0}                 '.format(lane)
    for strm in range (0, 2):
      pLine = pLine + '\n               .std__mgr__lane{0}_strm{1}_ready         ( std__mgr__lane{0}_strm{1}_ready      ),      '.format(lane,strm)
      pLine = pLine + '\n               .mgr__std__lane{0}_strm{1}_cntl          ( mgr__std__lane{0}_strm{1}_cntl       ),      '.format(lane,strm)
      pLine = pLine + '\n               .mgr__std__lane{0}_strm{1}_data          ( mgr__std__lane{0}_strm{1}_data       ),      '.format(lane,strm)
      pLine = pLine + '\n               .mgr__std__lane{0}_strm{1}_data_valid    ( mgr__std__lane{0}_strm{1}_data_valid ),      '.format(lane,strm)
                                             
  f.write(pLine)
  f.close()


  f = open('../HDL/common/manager_stack_bus_downstream_ports.vh', 'w')
  pLine = ""

  for lane in range (0, numOfExecLanes):
    pLine = pLine + '\n            // Lane operand bus                  '.format(lane)
    pLine = pLine + '\n            std__mgr__lane{0}_strm0_ready       ,'.format(lane)
    pLine = pLine + '\n            mgr__std__lane{0}_strm0_cntl        ,'.format(lane) 
    pLine = pLine + '\n            mgr__std__lane{0}_strm0_data        ,'.format(lane) 
    pLine = pLine + '\n            mgr__std__lane{0}_strm0_data_valid  ,'.format(lane) 
    pLine = pLine + '\n            std__mgr__lane{0}_strm1_ready       ,'.format(lane)
    pLine = pLine + '\n            mgr__std__lane{0}_strm1_cntl        ,'.format(lane) 
    pLine = pLine + '\n            mgr__std__lane{0}_strm1_data        ,'.format(lane) 
    pLine = pLine + '\n            mgr__std__lane{0}_strm1_data_valid  ,'.format(lane) 
    pLine = pLine + '\n'

  f.write(pLine)
  f.close()


  # RDP

  f = open('../HDL/common/rdp_cntl_option_tuple_extract.vh', 'w')
  pLine = ""

  #
  #pLine = pLine + '\n  // Search for MW storage tuple in option type fields'
  #pLine = pLine + '\n  assign storagePtr_LocalFifo[0].write    = from_WuDecode_Fifo[0].pipe_read & ((from_WuDecode_Fifo[0].pipe_option_type[0] == PY_WU_INST_OPT_TYPE_MEMORY) | '
  #for tple in range (1, numOfTuplesPerInst-2 ):
  #  pLine = pLine + '\n                                                                               (from_WuDecode_Fifo[0].pipe_option_type[{0}] == PY_WU_INST_OPT_TYPE_MEMORY) |'.format(tple)
  #pLine = pLine + '\n                                                                               (from_WuDecode_Fifo[0].pipe_option_type[{0}] == PY_WU_INST_OPT_TYPE_MEMORY)); // '.format(numOfTuplesPerInst-2)

  #
  pLine = pLine + '\n  // Extract storage ptr - wr_ptrs can only exist in first two tuples because they are extended tuples'
  pLine = pLine + '\n  assign wud_fifo_contains_wr_ptr =   from_WuDecode_Fifo[0].pipe_valid & '
  pLine = pLine + '\n                                    ((from_WuDecode_Fifo[0].pipe_option_type[0] == PY_WU_INST_OPT_TYPE_MEMORY) | '
  for tple in range (1, numOfTuplesPerInst-2 ):
    pLine = pLine + '\n                             (from_WuDecode_Fifo[0].pipe_option_type[{{0}}] == PY_WU_INST_OPT_TYPE_MEMORY) | : '.format(tple)
  pLine = pLine + '\n                                     (from_WuDecode_Fifo[0].pipe_option_type[{0}] == PY_WU_INST_OPT_TYPE_MEMORY)); // '.format(numOfTuplesPerInst-2)

  pLine = pLine + '\n  always @(posedge clk)'
  pLine = pLine + '\n    begin'
  pLine = pLine + '\n      write_storage_ptr_tmp    <= (from_WuDecode_Fifo[0].pipe_read  && (from_WuDecode_Fifo[0].pipe_option_type[0] == PY_WU_INST_OPT_TYPE_MEMORY)) ? {from_WuDecode_Fifo[0].pipe_option_value[0], from_WuDecode_Fifo[0].pipe_option_type[1], from_WuDecode_Fifo[0].pipe_option_value[1]} : '
  for tple in range (1, numOfTuplesPerInst-2 ):
    pLine = pLine + '\n                                  (from_WuDecode_Fifo[0].pipe_read  && (from_WuDecode_Fifo[0].pipe_option_type[{0}] == PY_WU_INST_OPT_TYPE_MEMORY)) ? {{from_WuDecode_Fifo[0].pipe_option_value[0], from_WuDecode_Fifo[0].pipe_option_type[1], from_WuDecode_Fifo[0].pipe_option_value[1]}} : '.format(tple)
  pLine = pLine + '\n                                  (from_WuDecode_Fifo[0].pipe_read  && (from_WuDecode_Fifo[0].pipe_option_type[{0}] == PY_WU_INST_OPT_TYPE_MEMORY)) ? {{from_WuDecode_Fifo[0].pipe_option_value[{0}], from_WuDecode_Fifo[0].pipe_option_type[{1}], from_WuDecode_Fifo[0].pipe_option_value[{1}]}} : '.format(numOfTuplesPerInst-2, numOfTuplesPerInst-1)
  pLine = pLine + '\n                                                                                                                                                     write_storage_ptr_tmp ; '
  pLine = pLine + '\n    end'
                                                                                                                                     

  pLine = pLine + '\n  // Extract Number of valid lanes'
  pLine = pLine + '\n  always @(posedge clk)'
  pLine = pLine + '\n    begin'
  pLine = pLine + '\n      num_of_valid_lanes   <= ( reset_poweron                                                                                                                                                                                    ) ? \'d0                                       :'
  pLine = pLine + '\n                              (from_WuDecode_Fifo[0].pipe_read  && ( from_WuDecode_Fifo[0].pipe_option_type[0] == PY_WU_INST_OPT_TYPE_NUM_OF_LANES)                                                                              ) ? from_WuDecode_Fifo[0].pipe_option_value[0] : '
  for tple in range (1, numOfTuplesPerInst ):
    pLine = pLine + '\n                              (from_WuDecode_Fifo[0].pipe_read  && ((from_WuDecode_Fifo[0].pipe_option_type[{0}] == PY_WU_INST_OPT_TYPE_NUM_OF_LANES) && (from_WuDecode_Fifo[0].pipe_option_type[{1}] != PY_WU_INST_OPT_TYPE_MEMORY))) ? from_WuDecode_Fifo[0].pipe_option_value[{0}] : '.format(tple, tple-1)
  pLine = pLine + '\n                                                                                                                                                                                                                                     num_of_valid_lanes ; // '.format(numOfTuplesPerInst-2, numOfTuplesPerInst-1)
  pLine = pLine + '\n    end'
                                                                                                                                     

  f.write(pLine)
  f.close()

  f = open('../HDL/common/rdp_cntl_create_noc_bitmask_address.vh', 'w')
  pLine = ""

  # Convert mgrId from mgrId bits in descriptor write pointer to a bit field
  pLine = pLine + '\n'
  numOfMgrIdBits = int(math.log(numOfMgr,2))
  pLine = pLine + '\n  // Convert the mgrId of the pointer to a bit mask'
  pLine = pLine + '\n  always @(*)'
  pLine = pLine + '\n    begin'
  pLine = pLine + '\n      case(currPtrManager)'
  for mgr in range (0, numOfMgr):
    pLine = pLine + '\n      {2}\'d{0} :'.format(mgr,numOfMgr,numOfMgrIdBits)
    pLine = pLine + '\n        begin'
    pLine = pLine + '\n          currPtrDestBitMaskAddr = {1}\'b'.format(mgr,numOfMgr)
    for bit in range (0, numOfMgr-1-mgr):
      pLine = pLine + '0'
    pLine = pLine + '1'
    for bit in range (numOfMgr-mgr, numOfMgr):
      pLine = pLine + '0'
    pLine = pLine + '  ; '
    pLine = pLine + '\n        end'
  pLine = pLine + '\n      default:'
  pLine = pLine + '\n        begin'
  pLine = pLine + '\n          currPtrDestBitMaskAddr = {0}\'d0 ; '.format(numOfMgr)
  pLine = pLine + '\n        end'
  pLine = pLine + '\n      endcase'
  pLine = pLine + '\n    end'
  pLine = pLine + '\n'

  f.write(pLine)
  f.close()

