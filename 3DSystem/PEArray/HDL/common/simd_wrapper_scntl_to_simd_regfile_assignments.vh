
  assign regFile_load[0].lane_result_valid  = scntl__reg__lane0_valid  ;
  assign regFile_load[0].lane_result        = scntl__reg__lane0_data   ;
  assign regFile_load[1].lane_result_valid  = scntl__reg__lane1_valid  ;
  assign regFile_load[1].lane_result        = scntl__reg__lane1_data   ;
  assign regFile_load[2].lane_result_valid  = scntl__reg__lane2_valid  ;
  assign regFile_load[2].lane_result        = scntl__reg__lane2_data   ;
  assign regFile_load[3].lane_result_valid  = scntl__reg__lane3_valid  ;
  assign regFile_load[3].lane_result        = scntl__reg__lane3_data   ;
  assign regFile_load[4].lane_result_valid  = scntl__reg__lane4_valid  ;
  assign regFile_load[4].lane_result        = scntl__reg__lane4_data   ;
  assign regFile_load[5].lane_result_valid  = scntl__reg__lane5_valid  ;
  assign regFile_load[5].lane_result        = scntl__reg__lane5_data   ;
  assign regFile_load[6].lane_result_valid  = scntl__reg__lane6_valid  ;
  assign regFile_load[6].lane_result        = scntl__reg__lane6_data   ;
  assign regFile_load[7].lane_result_valid  = scntl__reg__lane7_valid  ;
  assign regFile_load[7].lane_result        = scntl__reg__lane7_data   ;
  assign regFile_load[8].lane_result_valid  = scntl__reg__lane8_valid  ;
  assign regFile_load[8].lane_result        = scntl__reg__lane8_data   ;
  assign regFile_load[9].lane_result_valid  = scntl__reg__lane9_valid  ;
  assign regFile_load[9].lane_result        = scntl__reg__lane9_data   ;
  assign regFile_load[10].lane_result_valid  = scntl__reg__lane10_valid  ;
  assign regFile_load[10].lane_result        = scntl__reg__lane10_data   ;
  assign regFile_load[11].lane_result_valid  = scntl__reg__lane11_valid  ;
  assign regFile_load[11].lane_result        = scntl__reg__lane11_data   ;
  assign regFile_load[12].lane_result_valid  = scntl__reg__lane12_valid  ;
  assign regFile_load[12].lane_result        = scntl__reg__lane12_data   ;
  assign regFile_load[13].lane_result_valid  = scntl__reg__lane13_valid  ;
  assign regFile_load[13].lane_result        = scntl__reg__lane13_data   ;
  assign regFile_load[14].lane_result_valid  = scntl__reg__lane14_valid  ;
  assign regFile_load[14].lane_result        = scntl__reg__lane14_data   ;
  assign regFile_load[15].lane_result_valid  = scntl__reg__lane15_valid  ;
  assign regFile_load[15].lane_result        = scntl__reg__lane15_data   ;
  assign regFile_load[16].lane_result_valid  = scntl__reg__lane16_valid  ;
  assign regFile_load[16].lane_result        = scntl__reg__lane16_data   ;
  assign regFile_load[17].lane_result_valid  = scntl__reg__lane17_valid  ;
  assign regFile_load[17].lane_result        = scntl__reg__lane17_data   ;
  assign regFile_load[18].lane_result_valid  = scntl__reg__lane18_valid  ;
  assign regFile_load[18].lane_result        = scntl__reg__lane18_data   ;
  assign regFile_load[19].lane_result_valid  = scntl__reg__lane19_valid  ;
  assign regFile_load[19].lane_result        = scntl__reg__lane19_data   ;
  assign regFile_load[20].lane_result_valid  = scntl__reg__lane20_valid  ;
  assign regFile_load[20].lane_result        = scntl__reg__lane20_data   ;
  assign regFile_load[21].lane_result_valid  = scntl__reg__lane21_valid  ;
  assign regFile_load[21].lane_result        = scntl__reg__lane21_data   ;
  assign regFile_load[22].lane_result_valid  = scntl__reg__lane22_valid  ;
  assign regFile_load[22].lane_result        = scntl__reg__lane22_data   ;
  assign regFile_load[23].lane_result_valid  = scntl__reg__lane23_valid  ;
  assign regFile_load[23].lane_result        = scntl__reg__lane23_data   ;
  assign regFile_load[24].lane_result_valid  = scntl__reg__lane24_valid  ;
  assign regFile_load[24].lane_result        = scntl__reg__lane24_data   ;
  assign regFile_load[25].lane_result_valid  = scntl__reg__lane25_valid  ;
  assign regFile_load[25].lane_result        = scntl__reg__lane25_data   ;
  assign regFile_load[26].lane_result_valid  = scntl__reg__lane26_valid  ;
  assign regFile_load[26].lane_result        = scntl__reg__lane26_data   ;
  assign regFile_load[27].lane_result_valid  = scntl__reg__lane27_valid  ;
  assign regFile_load[27].lane_result        = scntl__reg__lane27_data   ;
  assign regFile_load[28].lane_result_valid  = scntl__reg__lane28_valid  ;
  assign regFile_load[28].lane_result        = scntl__reg__lane28_data   ;
  assign regFile_load[29].lane_result_valid  = scntl__reg__lane29_valid  ;
  assign regFile_load[29].lane_result        = scntl__reg__lane29_data   ;
  assign regFile_load[30].lane_result_valid  = scntl__reg__lane30_valid  ;
  assign regFile_load[30].lane_result        = scntl__reg__lane30_data   ;
  assign regFile_load[31].lane_result_valid  = scntl__reg__lane31_valid  ;
  assign regFile_load[31].lane_result        = scntl__reg__lane31_data   ;

  assign reg__scntl__lane0_ready  = 1'b1          ;
  assign reg__scntl__lane1_ready  = 1'b1          ;
  assign reg__scntl__lane2_ready  = 1'b1          ;
  assign reg__scntl__lane3_ready  = 1'b1          ;
  assign reg__scntl__lane4_ready  = 1'b1          ;
  assign reg__scntl__lane5_ready  = 1'b1          ;
  assign reg__scntl__lane6_ready  = 1'b1          ;
  assign reg__scntl__lane7_ready  = 1'b1          ;
  assign reg__scntl__lane8_ready  = 1'b1          ;
  assign reg__scntl__lane9_ready  = 1'b1          ;
  assign reg__scntl__lane10_ready  = 1'b1          ;
  assign reg__scntl__lane11_ready  = 1'b1          ;
  assign reg__scntl__lane12_ready  = 1'b1          ;
  assign reg__scntl__lane13_ready  = 1'b1          ;
  assign reg__scntl__lane14_ready  = 1'b1          ;
  assign reg__scntl__lane15_ready  = 1'b1          ;
  assign reg__scntl__lane16_ready  = 1'b1          ;
  assign reg__scntl__lane17_ready  = 1'b1          ;
  assign reg__scntl__lane18_ready  = 1'b1          ;
  assign reg__scntl__lane19_ready  = 1'b1          ;
  assign reg__scntl__lane20_ready  = 1'b1          ;
  assign reg__scntl__lane21_ready  = 1'b1          ;
  assign reg__scntl__lane22_ready  = 1'b1          ;
  assign reg__scntl__lane23_ready  = 1'b1          ;
  assign reg__scntl__lane24_ready  = 1'b1          ;
  assign reg__scntl__lane25_ready  = 1'b1          ;
  assign reg__scntl__lane26_ready  = 1'b1          ;
  assign reg__scntl__lane27_ready  = 1'b1          ;
  assign reg__scntl__lane28_ready  = 1'b1          ;
  assign reg__scntl__lane29_ready  = 1'b1          ;
  assign reg__scntl__lane30_ready  = 1'b1          ;
  assign reg__scntl__lane31_ready  = 1'b1          ;
