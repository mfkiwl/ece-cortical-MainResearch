
  // PE 0  
      fp_mac_expected_result = 0 ;                
      for (int i0=0; i0<numOfExtWords; i0++)                                                                   
        begin                                                                                                  
          pe0_lane0_strm0[i0]  = (i0 == 0                )  ? $shortrealtobits(11.0) :                   
                                 (i0 == (numOfExtWords-1))  ? $shortrealtobits(44.0) :                   
                                                              $shortrealtobits(2.0*i0) ;                 
          pe0_lane0_strm0[i0]  = (i0 == 0                )  ? $shortrealtobits(22.0) :                   
                                 (i0 == (numOfExtWords-1))  ? $shortrealtobits(33.0) :                   
                                                              $shortrealtobits(1.0*i0) ;                 
          fp_mac_expected_result += $bitstoshortreal(pe0_lane0_strm0[i0]) * $bitstoshortreal(pe0_lane0_strm1[i0]) ;                
        end                                                                                                    
      fp_mac_expected_result = 0 ;                
      for (int i0=0; i0<numOfExtWords; i0++)                                                                   
        begin                                                                                                  
          pe0_lane0_strm1[i0]  = (i0 == 0                )  ? $shortrealtobits(11.0) :                   
                                 (i0 == (numOfExtWords-1))  ? $shortrealtobits(44.0) :                   
                                                              $shortrealtobits(2.0*i0) ;                 
          pe0_lane0_strm1[i0]  = (i0 == 0                )  ? $shortrealtobits(22.0) :                   
                                 (i0 == (numOfExtWords-1))  ? $shortrealtobits(33.0) :                   
                                                              $shortrealtobits(1.0*i0) ;                 
          fp_mac_expected_result += $bitstoshortreal(pe0_lane0_strm0[i0]) * $bitstoshortreal(pe0_lane0_strm1[i0]) ;                
        end                                                                                                    
      fp_mac_expected_result = 0 ;                
      for (int i0=0; i0<numOfExtWords; i0++)                                                                   
        begin                                                                                                  
          pe0_lane1_strm0[i0]  = (i0 == 0                )  ? $shortrealtobits(11.0) :                   
                                 (i0 == (numOfExtWords-1))  ? $shortrealtobits(44.0) :                   
                                                              $shortrealtobits(2.0*i0) ;                 
          pe0_lane1_strm0[i0]  = (i0 == 0                )  ? $shortrealtobits(22.0) :                   
                                 (i0 == (numOfExtWords-1))  ? $shortrealtobits(33.0) :                   
                                                              $shortrealtobits(1.0*i0) ;                 
          fp_mac_expected_result += $bitstoshortreal(pe0_lane1_strm0[i0]) * $bitstoshortreal(pe0_lane1_strm1[i0]) ;                
        end                                                                                                    
      fp_mac_expected_result = 0 ;                
      for (int i0=0; i0<numOfExtWords; i0++)                                                                   
        begin                                                                                                  
          pe0_lane1_strm1[i0]  = (i0 == 0                )  ? $shortrealtobits(11.0) :                   
                                 (i0 == (numOfExtWords-1))  ? $shortrealtobits(44.0) :                   
                                                              $shortrealtobits(2.0*i0) ;                 
          pe0_lane1_strm1[i0]  = (i0 == 0                )  ? $shortrealtobits(22.0) :                   
                                 (i0 == (numOfExtWords-1))  ? $shortrealtobits(33.0) :                   
                                                              $shortrealtobits(1.0*i0) ;                 
          fp_mac_expected_result += $bitstoshortreal(pe0_lane1_strm0[i0]) * $bitstoshortreal(pe0_lane1_strm1[i0]) ;                
        end                                                                                                    
      fp_mac_expected_result = 0 ;                
      for (int i0=0; i0<numOfExtWords; i0++)                                                                   
        begin                                                                                                  
          pe0_lane2_strm0[i0]  = (i0 == 0                )  ? $shortrealtobits(11.0) :                   
                                 (i0 == (numOfExtWords-1))  ? $shortrealtobits(44.0) :                   
                                                              $shortrealtobits(2.0*i0) ;                 
          pe0_lane2_strm0[i0]  = (i0 == 0                )  ? $shortrealtobits(22.0) :                   
                                 (i0 == (numOfExtWords-1))  ? $shortrealtobits(33.0) :                   
                                                              $shortrealtobits(1.0*i0) ;                 
          fp_mac_expected_result += $bitstoshortreal(pe0_lane2_strm0[i0]) * $bitstoshortreal(pe0_lane2_strm1[i0]) ;                
        end                                                                                                    
      fp_mac_expected_result = 0 ;                
      for (int i0=0; i0<numOfExtWords; i0++)                                                                   
        begin                                                                                                  
          pe0_lane2_strm1[i0]  = (i0 == 0                )  ? $shortrealtobits(11.0) :                   
                                 (i0 == (numOfExtWords-1))  ? $shortrealtobits(44.0) :                   
                                                              $shortrealtobits(2.0*i0) ;                 
          pe0_lane2_strm1[i0]  = (i0 == 0                )  ? $shortrealtobits(22.0) :                   
                                 (i0 == (numOfExtWords-1))  ? $shortrealtobits(33.0) :                   
                                                              $shortrealtobits(1.0*i0) ;                 
          fp_mac_expected_result += $bitstoshortreal(pe0_lane2_strm0[i0]) * $bitstoshortreal(pe0_lane2_strm1[i0]) ;                
        end                                                                                                    
      fp_mac_expected_result = 0 ;                
      for (int i0=0; i0<numOfExtWords; i0++)                                                                   
        begin                                                                                                  
          pe0_lane3_strm0[i0]  = (i0 == 0                )  ? $shortrealtobits(11.0) :                   
                                 (i0 == (numOfExtWords-1))  ? $shortrealtobits(44.0) :                   
                                                              $shortrealtobits(2.0*i0) ;                 
          pe0_lane3_strm0[i0]  = (i0 == 0                )  ? $shortrealtobits(22.0) :                   
                                 (i0 == (numOfExtWords-1))  ? $shortrealtobits(33.0) :                   
                                                              $shortrealtobits(1.0*i0) ;                 
          fp_mac_expected_result += $bitstoshortreal(pe0_lane3_strm0[i0]) * $bitstoshortreal(pe0_lane3_strm1[i0]) ;                
        end                                                                                                    
      fp_mac_expected_result = 0 ;                
      for (int i0=0; i0<numOfExtWords; i0++)                                                                   
        begin                                                                                                  
          pe0_lane3_strm1[i0]  = (i0 == 0                )  ? $shortrealtobits(11.0) :                   
                                 (i0 == (numOfExtWords-1))  ? $shortrealtobits(44.0) :                   
                                                              $shortrealtobits(2.0*i0) ;                 
          pe0_lane3_strm1[i0]  = (i0 == 0                )  ? $shortrealtobits(22.0) :                   
                                 (i0 == (numOfExtWords-1))  ? $shortrealtobits(33.0) :                   
                                                              $shortrealtobits(1.0*i0) ;                 
          fp_mac_expected_result += $bitstoshortreal(pe0_lane3_strm0[i0]) * $bitstoshortreal(pe0_lane3_strm1[i0]) ;                
        end                                                                                                    
      fp_mac_expected_result = 0 ;                
      for (int i0=0; i0<numOfExtWords; i0++)                                                                   
        begin                                                                                                  
          pe0_lane4_strm0[i0]  = (i0 == 0                )  ? $shortrealtobits(11.0) :                   
                                 (i0 == (numOfExtWords-1))  ? $shortrealtobits(44.0) :                   
                                                              $shortrealtobits(2.0*i0) ;                 
          pe0_lane4_strm0[i0]  = (i0 == 0                )  ? $shortrealtobits(22.0) :                   
                                 (i0 == (numOfExtWords-1))  ? $shortrealtobits(33.0) :                   
                                                              $shortrealtobits(1.0*i0) ;                 
          fp_mac_expected_result += $bitstoshortreal(pe0_lane4_strm0[i0]) * $bitstoshortreal(pe0_lane4_strm1[i0]) ;                
        end                                                                                                    
      fp_mac_expected_result = 0 ;                
      for (int i0=0; i0<numOfExtWords; i0++)                                                                   
        begin                                                                                                  
          pe0_lane4_strm1[i0]  = (i0 == 0                )  ? $shortrealtobits(11.0) :                   
                                 (i0 == (numOfExtWords-1))  ? $shortrealtobits(44.0) :                   
                                                              $shortrealtobits(2.0*i0) ;                 
          pe0_lane4_strm1[i0]  = (i0 == 0                )  ? $shortrealtobits(22.0) :                   
                                 (i0 == (numOfExtWords-1))  ? $shortrealtobits(33.0) :                   
                                                              $shortrealtobits(1.0*i0) ;                 
          fp_mac_expected_result += $bitstoshortreal(pe0_lane4_strm0[i0]) * $bitstoshortreal(pe0_lane4_strm1[i0]) ;                
        end                                                                                                    
      fp_mac_expected_result = 0 ;                
      for (int i0=0; i0<numOfExtWords; i0++)                                                                   
        begin                                                                                                  
          pe0_lane5_strm0[i0]  = (i0 == 0                )  ? $shortrealtobits(11.0) :                   
                                 (i0 == (numOfExtWords-1))  ? $shortrealtobits(44.0) :                   
                                                              $shortrealtobits(2.0*i0) ;                 
          pe0_lane5_strm0[i0]  = (i0 == 0                )  ? $shortrealtobits(22.0) :                   
                                 (i0 == (numOfExtWords-1))  ? $shortrealtobits(33.0) :                   
                                                              $shortrealtobits(1.0*i0) ;                 
          fp_mac_expected_result += $bitstoshortreal(pe0_lane5_strm0[i0]) * $bitstoshortreal(pe0_lane5_strm1[i0]) ;                
        end                                                                                                    
      fp_mac_expected_result = 0 ;                
      for (int i0=0; i0<numOfExtWords; i0++)                                                                   
        begin                                                                                                  
          pe0_lane5_strm1[i0]  = (i0 == 0                )  ? $shortrealtobits(11.0) :                   
                                 (i0 == (numOfExtWords-1))  ? $shortrealtobits(44.0) :                   
                                                              $shortrealtobits(2.0*i0) ;                 
          pe0_lane5_strm1[i0]  = (i0 == 0                )  ? $shortrealtobits(22.0) :                   
                                 (i0 == (numOfExtWords-1))  ? $shortrealtobits(33.0) :                   
                                                              $shortrealtobits(1.0*i0) ;                 
          fp_mac_expected_result += $bitstoshortreal(pe0_lane5_strm0[i0]) * $bitstoshortreal(pe0_lane5_strm1[i0]) ;                
        end                                                                                                    
      fp_mac_expected_result = 0 ;                
      for (int i0=0; i0<numOfExtWords; i0++)                                                                   
        begin                                                                                                  
          pe0_lane6_strm0[i0]  = (i0 == 0                )  ? $shortrealtobits(11.0) :                   
                                 (i0 == (numOfExtWords-1))  ? $shortrealtobits(44.0) :                   
                                                              $shortrealtobits(2.0*i0) ;                 
          pe0_lane6_strm0[i0]  = (i0 == 0                )  ? $shortrealtobits(22.0) :                   
                                 (i0 == (numOfExtWords-1))  ? $shortrealtobits(33.0) :                   
                                                              $shortrealtobits(1.0*i0) ;                 
          fp_mac_expected_result += $bitstoshortreal(pe0_lane6_strm0[i0]) * $bitstoshortreal(pe0_lane6_strm1[i0]) ;                
        end                                                                                                    
      fp_mac_expected_result = 0 ;                
      for (int i0=0; i0<numOfExtWords; i0++)                                                                   
        begin                                                                                                  
          pe0_lane6_strm1[i0]  = (i0 == 0                )  ? $shortrealtobits(11.0) :                   
                                 (i0 == (numOfExtWords-1))  ? $shortrealtobits(44.0) :                   
                                                              $shortrealtobits(2.0*i0) ;                 
          pe0_lane6_strm1[i0]  = (i0 == 0                )  ? $shortrealtobits(22.0) :                   
                                 (i0 == (numOfExtWords-1))  ? $shortrealtobits(33.0) :                   
                                                              $shortrealtobits(1.0*i0) ;                 
          fp_mac_expected_result += $bitstoshortreal(pe0_lane6_strm0[i0]) * $bitstoshortreal(pe0_lane6_strm1[i0]) ;                
        end                                                                                                    
      fp_mac_expected_result = 0 ;                
      for (int i0=0; i0<numOfExtWords; i0++)                                                                   
        begin                                                                                                  
          pe0_lane7_strm0[i0]  = (i0 == 0                )  ? $shortrealtobits(11.0) :                   
                                 (i0 == (numOfExtWords-1))  ? $shortrealtobits(44.0) :                   
                                                              $shortrealtobits(2.0*i0) ;                 
          pe0_lane7_strm0[i0]  = (i0 == 0                )  ? $shortrealtobits(22.0) :                   
                                 (i0 == (numOfExtWords-1))  ? $shortrealtobits(33.0) :                   
                                                              $shortrealtobits(1.0*i0) ;                 
          fp_mac_expected_result += $bitstoshortreal(pe0_lane7_strm0[i0]) * $bitstoshortreal(pe0_lane7_strm1[i0]) ;                
        end                                                                                                    
      fp_mac_expected_result = 0 ;                
      for (int i0=0; i0<numOfExtWords; i0++)                                                                   
        begin                                                                                                  
          pe0_lane7_strm1[i0]  = (i0 == 0                )  ? $shortrealtobits(11.0) :                   
                                 (i0 == (numOfExtWords-1))  ? $shortrealtobits(44.0) :                   
                                                              $shortrealtobits(2.0*i0) ;                 
          pe0_lane7_strm1[i0]  = (i0 == 0                )  ? $shortrealtobits(22.0) :                   
                                 (i0 == (numOfExtWords-1))  ? $shortrealtobits(33.0) :                   
                                                              $shortrealtobits(1.0*i0) ;                 
          fp_mac_expected_result += $bitstoshortreal(pe0_lane7_strm0[i0]) * $bitstoshortreal(pe0_lane7_strm1[i0]) ;                
        end                                                                                                    
      fp_mac_expected_result = 0 ;                
      for (int i0=0; i0<numOfExtWords; i0++)                                                                   
        begin                                                                                                  
          pe0_lane8_strm0[i0]  = (i0 == 0                )  ? $shortrealtobits(11.0) :                   
                                 (i0 == (numOfExtWords-1))  ? $shortrealtobits(44.0) :                   
                                                              $shortrealtobits(2.0*i0) ;                 
          pe0_lane8_strm0[i0]  = (i0 == 0                )  ? $shortrealtobits(22.0) :                   
                                 (i0 == (numOfExtWords-1))  ? $shortrealtobits(33.0) :                   
                                                              $shortrealtobits(1.0*i0) ;                 
          fp_mac_expected_result += $bitstoshortreal(pe0_lane8_strm0[i0]) * $bitstoshortreal(pe0_lane8_strm1[i0]) ;                
        end                                                                                                    
      fp_mac_expected_result = 0 ;                
      for (int i0=0; i0<numOfExtWords; i0++)                                                                   
        begin                                                                                                  
          pe0_lane8_strm1[i0]  = (i0 == 0                )  ? $shortrealtobits(11.0) :                   
                                 (i0 == (numOfExtWords-1))  ? $shortrealtobits(44.0) :                   
                                                              $shortrealtobits(2.0*i0) ;                 
          pe0_lane8_strm1[i0]  = (i0 == 0                )  ? $shortrealtobits(22.0) :                   
                                 (i0 == (numOfExtWords-1))  ? $shortrealtobits(33.0) :                   
                                                              $shortrealtobits(1.0*i0) ;                 
          fp_mac_expected_result += $bitstoshortreal(pe0_lane8_strm0[i0]) * $bitstoshortreal(pe0_lane8_strm1[i0]) ;                
        end                                                                                                    
      fp_mac_expected_result = 0 ;                
      for (int i0=0; i0<numOfExtWords; i0++)                                                                   
        begin                                                                                                  
          pe0_lane9_strm0[i0]  = (i0 == 0                )  ? $shortrealtobits(11.0) :                   
                                 (i0 == (numOfExtWords-1))  ? $shortrealtobits(44.0) :                   
                                                              $shortrealtobits(2.0*i0) ;                 
          pe0_lane9_strm0[i0]  = (i0 == 0                )  ? $shortrealtobits(22.0) :                   
                                 (i0 == (numOfExtWords-1))  ? $shortrealtobits(33.0) :                   
                                                              $shortrealtobits(1.0*i0) ;                 
          fp_mac_expected_result += $bitstoshortreal(pe0_lane9_strm0[i0]) * $bitstoshortreal(pe0_lane9_strm1[i0]) ;                
        end                                                                                                    
      fp_mac_expected_result = 0 ;                
      for (int i0=0; i0<numOfExtWords; i0++)                                                                   
        begin                                                                                                  
          pe0_lane9_strm1[i0]  = (i0 == 0                )  ? $shortrealtobits(11.0) :                   
                                 (i0 == (numOfExtWords-1))  ? $shortrealtobits(44.0) :                   
                                                              $shortrealtobits(2.0*i0) ;                 
          pe0_lane9_strm1[i0]  = (i0 == 0                )  ? $shortrealtobits(22.0) :                   
                                 (i0 == (numOfExtWords-1))  ? $shortrealtobits(33.0) :                   
                                                              $shortrealtobits(1.0*i0) ;                 
          fp_mac_expected_result += $bitstoshortreal(pe0_lane9_strm0[i0]) * $bitstoshortreal(pe0_lane9_strm1[i0]) ;                
        end                                                                                                    
      fp_mac_expected_result = 0 ;                
      for (int i0=0; i0<numOfExtWords; i0++)                                                                   
        begin                                                                                                  
          pe0_lane10_strm0[i0]  = (i0 == 0                )  ? $shortrealtobits(11.0) :                   
                                 (i0 == (numOfExtWords-1))  ? $shortrealtobits(44.0) :                   
                                                              $shortrealtobits(2.0*i0) ;                 
          pe0_lane10_strm0[i0]  = (i0 == 0                )  ? $shortrealtobits(22.0) :                   
                                 (i0 == (numOfExtWords-1))  ? $shortrealtobits(33.0) :                   
                                                              $shortrealtobits(1.0*i0) ;                 
          fp_mac_expected_result += $bitstoshortreal(pe0_lane10_strm0[i0]) * $bitstoshortreal(pe0_lane10_strm1[i0]) ;                
        end                                                                                                    
      fp_mac_expected_result = 0 ;                
      for (int i0=0; i0<numOfExtWords; i0++)                                                                   
        begin                                                                                                  
          pe0_lane10_strm1[i0]  = (i0 == 0                )  ? $shortrealtobits(11.0) :                   
                                 (i0 == (numOfExtWords-1))  ? $shortrealtobits(44.0) :                   
                                                              $shortrealtobits(2.0*i0) ;                 
          pe0_lane10_strm1[i0]  = (i0 == 0                )  ? $shortrealtobits(22.0) :                   
                                 (i0 == (numOfExtWords-1))  ? $shortrealtobits(33.0) :                   
                                                              $shortrealtobits(1.0*i0) ;                 
          fp_mac_expected_result += $bitstoshortreal(pe0_lane10_strm0[i0]) * $bitstoshortreal(pe0_lane10_strm1[i0]) ;                
        end                                                                                                    
      fp_mac_expected_result = 0 ;                
      for (int i0=0; i0<numOfExtWords; i0++)                                                                   
        begin                                                                                                  
          pe0_lane11_strm0[i0]  = (i0 == 0                )  ? $shortrealtobits(11.0) :                   
                                 (i0 == (numOfExtWords-1))  ? $shortrealtobits(44.0) :                   
                                                              $shortrealtobits(2.0*i0) ;                 
          pe0_lane11_strm0[i0]  = (i0 == 0                )  ? $shortrealtobits(22.0) :                   
                                 (i0 == (numOfExtWords-1))  ? $shortrealtobits(33.0) :                   
                                                              $shortrealtobits(1.0*i0) ;                 
          fp_mac_expected_result += $bitstoshortreal(pe0_lane11_strm0[i0]) * $bitstoshortreal(pe0_lane11_strm1[i0]) ;                
        end                                                                                                    
      fp_mac_expected_result = 0 ;                
      for (int i0=0; i0<numOfExtWords; i0++)                                                                   
        begin                                                                                                  
          pe0_lane11_strm1[i0]  = (i0 == 0                )  ? $shortrealtobits(11.0) :                   
                                 (i0 == (numOfExtWords-1))  ? $shortrealtobits(44.0) :                   
                                                              $shortrealtobits(2.0*i0) ;                 
          pe0_lane11_strm1[i0]  = (i0 == 0                )  ? $shortrealtobits(22.0) :                   
                                 (i0 == (numOfExtWords-1))  ? $shortrealtobits(33.0) :                   
                                                              $shortrealtobits(1.0*i0) ;                 
          fp_mac_expected_result += $bitstoshortreal(pe0_lane11_strm0[i0]) * $bitstoshortreal(pe0_lane11_strm1[i0]) ;                
        end                                                                                                    
      fp_mac_expected_result = 0 ;                
      for (int i0=0; i0<numOfExtWords; i0++)                                                                   
        begin                                                                                                  
          pe0_lane12_strm0[i0]  = (i0 == 0                )  ? $shortrealtobits(11.0) :                   
                                 (i0 == (numOfExtWords-1))  ? $shortrealtobits(44.0) :                   
                                                              $shortrealtobits(2.0*i0) ;                 
          pe0_lane12_strm0[i0]  = (i0 == 0                )  ? $shortrealtobits(22.0) :                   
                                 (i0 == (numOfExtWords-1))  ? $shortrealtobits(33.0) :                   
                                                              $shortrealtobits(1.0*i0) ;                 
          fp_mac_expected_result += $bitstoshortreal(pe0_lane12_strm0[i0]) * $bitstoshortreal(pe0_lane12_strm1[i0]) ;                
        end                                                                                                    
      fp_mac_expected_result = 0 ;                
      for (int i0=0; i0<numOfExtWords; i0++)                                                                   
        begin                                                                                                  
          pe0_lane12_strm1[i0]  = (i0 == 0                )  ? $shortrealtobits(11.0) :                   
                                 (i0 == (numOfExtWords-1))  ? $shortrealtobits(44.0) :                   
                                                              $shortrealtobits(2.0*i0) ;                 
          pe0_lane12_strm1[i0]  = (i0 == 0                )  ? $shortrealtobits(22.0) :                   
                                 (i0 == (numOfExtWords-1))  ? $shortrealtobits(33.0) :                   
                                                              $shortrealtobits(1.0*i0) ;                 
          fp_mac_expected_result += $bitstoshortreal(pe0_lane12_strm0[i0]) * $bitstoshortreal(pe0_lane12_strm1[i0]) ;                
        end                                                                                                    
      fp_mac_expected_result = 0 ;                
      for (int i0=0; i0<numOfExtWords; i0++)                                                                   
        begin                                                                                                  
          pe0_lane13_strm0[i0]  = (i0 == 0                )  ? $shortrealtobits(11.0) :                   
                                 (i0 == (numOfExtWords-1))  ? $shortrealtobits(44.0) :                   
                                                              $shortrealtobits(2.0*i0) ;                 
          pe0_lane13_strm0[i0]  = (i0 == 0                )  ? $shortrealtobits(22.0) :                   
                                 (i0 == (numOfExtWords-1))  ? $shortrealtobits(33.0) :                   
                                                              $shortrealtobits(1.0*i0) ;                 
          fp_mac_expected_result += $bitstoshortreal(pe0_lane13_strm0[i0]) * $bitstoshortreal(pe0_lane13_strm1[i0]) ;                
        end                                                                                                    
      fp_mac_expected_result = 0 ;                
      for (int i0=0; i0<numOfExtWords; i0++)                                                                   
        begin                                                                                                  
          pe0_lane13_strm1[i0]  = (i0 == 0                )  ? $shortrealtobits(11.0) :                   
                                 (i0 == (numOfExtWords-1))  ? $shortrealtobits(44.0) :                   
                                                              $shortrealtobits(2.0*i0) ;                 
          pe0_lane13_strm1[i0]  = (i0 == 0                )  ? $shortrealtobits(22.0) :                   
                                 (i0 == (numOfExtWords-1))  ? $shortrealtobits(33.0) :                   
                                                              $shortrealtobits(1.0*i0) ;                 
          fp_mac_expected_result += $bitstoshortreal(pe0_lane13_strm0[i0]) * $bitstoshortreal(pe0_lane13_strm1[i0]) ;                
        end                                                                                                    
      fp_mac_expected_result = 0 ;                
      for (int i0=0; i0<numOfExtWords; i0++)                                                                   
        begin                                                                                                  
          pe0_lane14_strm0[i0]  = (i0 == 0                )  ? $shortrealtobits(11.0) :                   
                                 (i0 == (numOfExtWords-1))  ? $shortrealtobits(44.0) :                   
                                                              $shortrealtobits(2.0*i0) ;                 
          pe0_lane14_strm0[i0]  = (i0 == 0                )  ? $shortrealtobits(22.0) :                   
                                 (i0 == (numOfExtWords-1))  ? $shortrealtobits(33.0) :                   
                                                              $shortrealtobits(1.0*i0) ;                 
          fp_mac_expected_result += $bitstoshortreal(pe0_lane14_strm0[i0]) * $bitstoshortreal(pe0_lane14_strm1[i0]) ;                
        end                                                                                                    
      fp_mac_expected_result = 0 ;                
      for (int i0=0; i0<numOfExtWords; i0++)                                                                   
        begin                                                                                                  
          pe0_lane14_strm1[i0]  = (i0 == 0                )  ? $shortrealtobits(11.0) :                   
                                 (i0 == (numOfExtWords-1))  ? $shortrealtobits(44.0) :                   
                                                              $shortrealtobits(2.0*i0) ;                 
          pe0_lane14_strm1[i0]  = (i0 == 0                )  ? $shortrealtobits(22.0) :                   
                                 (i0 == (numOfExtWords-1))  ? $shortrealtobits(33.0) :                   
                                                              $shortrealtobits(1.0*i0) ;                 
          fp_mac_expected_result += $bitstoshortreal(pe0_lane14_strm0[i0]) * $bitstoshortreal(pe0_lane14_strm1[i0]) ;                
        end                                                                                                    
      fp_mac_expected_result = 0 ;                
      for (int i0=0; i0<numOfExtWords; i0++)                                                                   
        begin                                                                                                  
          pe0_lane15_strm0[i0]  = (i0 == 0                )  ? $shortrealtobits(11.0) :                   
                                 (i0 == (numOfExtWords-1))  ? $shortrealtobits(44.0) :                   
                                                              $shortrealtobits(2.0*i0) ;                 
          pe0_lane15_strm0[i0]  = (i0 == 0                )  ? $shortrealtobits(22.0) :                   
                                 (i0 == (numOfExtWords-1))  ? $shortrealtobits(33.0) :                   
                                                              $shortrealtobits(1.0*i0) ;                 
          fp_mac_expected_result += $bitstoshortreal(pe0_lane15_strm0[i0]) * $bitstoshortreal(pe0_lane15_strm1[i0]) ;                
        end                                                                                                    
      fp_mac_expected_result = 0 ;                
      for (int i0=0; i0<numOfExtWords; i0++)                                                                   
        begin                                                                                                  
          pe0_lane15_strm1[i0]  = (i0 == 0                )  ? $shortrealtobits(11.0) :                   
                                 (i0 == (numOfExtWords-1))  ? $shortrealtobits(44.0) :                   
                                                              $shortrealtobits(2.0*i0) ;                 
          pe0_lane15_strm1[i0]  = (i0 == 0                )  ? $shortrealtobits(22.0) :                   
                                 (i0 == (numOfExtWords-1))  ? $shortrealtobits(33.0) :                   
                                                              $shortrealtobits(1.0*i0) ;                 
          fp_mac_expected_result += $bitstoshortreal(pe0_lane15_strm0[i0]) * $bitstoshortreal(pe0_lane15_strm1[i0]) ;                
        end                                                                                                    
      fp_mac_expected_result = 0 ;                
      for (int i0=0; i0<numOfExtWords; i0++)                                                                   
        begin                                                                                                  
          pe0_lane16_strm0[i0]  = (i0 == 0                )  ? $shortrealtobits(11.0) :                   
                                 (i0 == (numOfExtWords-1))  ? $shortrealtobits(44.0) :                   
                                                              $shortrealtobits(2.0*i0) ;                 
          pe0_lane16_strm0[i0]  = (i0 == 0                )  ? $shortrealtobits(22.0) :                   
                                 (i0 == (numOfExtWords-1))  ? $shortrealtobits(33.0) :                   
                                                              $shortrealtobits(1.0*i0) ;                 
          fp_mac_expected_result += $bitstoshortreal(pe0_lane16_strm0[i0]) * $bitstoshortreal(pe0_lane16_strm1[i0]) ;                
        end                                                                                                    
      fp_mac_expected_result = 0 ;                
      for (int i0=0; i0<numOfExtWords; i0++)                                                                   
        begin                                                                                                  
          pe0_lane16_strm1[i0]  = (i0 == 0                )  ? $shortrealtobits(11.0) :                   
                                 (i0 == (numOfExtWords-1))  ? $shortrealtobits(44.0) :                   
                                                              $shortrealtobits(2.0*i0) ;                 
          pe0_lane16_strm1[i0]  = (i0 == 0                )  ? $shortrealtobits(22.0) :                   
                                 (i0 == (numOfExtWords-1))  ? $shortrealtobits(33.0) :                   
                                                              $shortrealtobits(1.0*i0) ;                 
          fp_mac_expected_result += $bitstoshortreal(pe0_lane16_strm0[i0]) * $bitstoshortreal(pe0_lane16_strm1[i0]) ;                
        end                                                                                                    
      fp_mac_expected_result = 0 ;                
      for (int i0=0; i0<numOfExtWords; i0++)                                                                   
        begin                                                                                                  
          pe0_lane17_strm0[i0]  = (i0 == 0                )  ? $shortrealtobits(11.0) :                   
                                 (i0 == (numOfExtWords-1))  ? $shortrealtobits(44.0) :                   
                                                              $shortrealtobits(2.0*i0) ;                 
          pe0_lane17_strm0[i0]  = (i0 == 0                )  ? $shortrealtobits(22.0) :                   
                                 (i0 == (numOfExtWords-1))  ? $shortrealtobits(33.0) :                   
                                                              $shortrealtobits(1.0*i0) ;                 
          fp_mac_expected_result += $bitstoshortreal(pe0_lane17_strm0[i0]) * $bitstoshortreal(pe0_lane17_strm1[i0]) ;                
        end                                                                                                    
      fp_mac_expected_result = 0 ;                
      for (int i0=0; i0<numOfExtWords; i0++)                                                                   
        begin                                                                                                  
          pe0_lane17_strm1[i0]  = (i0 == 0                )  ? $shortrealtobits(11.0) :                   
                                 (i0 == (numOfExtWords-1))  ? $shortrealtobits(44.0) :                   
                                                              $shortrealtobits(2.0*i0) ;                 
          pe0_lane17_strm1[i0]  = (i0 == 0                )  ? $shortrealtobits(22.0) :                   
                                 (i0 == (numOfExtWords-1))  ? $shortrealtobits(33.0) :                   
                                                              $shortrealtobits(1.0*i0) ;                 
          fp_mac_expected_result += $bitstoshortreal(pe0_lane17_strm0[i0]) * $bitstoshortreal(pe0_lane17_strm1[i0]) ;                
        end                                                                                                    
      fp_mac_expected_result = 0 ;                
      for (int i0=0; i0<numOfExtWords; i0++)                                                                   
        begin                                                                                                  
          pe0_lane18_strm0[i0]  = (i0 == 0                )  ? $shortrealtobits(11.0) :                   
                                 (i0 == (numOfExtWords-1))  ? $shortrealtobits(44.0) :                   
                                                              $shortrealtobits(2.0*i0) ;                 
          pe0_lane18_strm0[i0]  = (i0 == 0                )  ? $shortrealtobits(22.0) :                   
                                 (i0 == (numOfExtWords-1))  ? $shortrealtobits(33.0) :                   
                                                              $shortrealtobits(1.0*i0) ;                 
          fp_mac_expected_result += $bitstoshortreal(pe0_lane18_strm0[i0]) * $bitstoshortreal(pe0_lane18_strm1[i0]) ;                
        end                                                                                                    
      fp_mac_expected_result = 0 ;                
      for (int i0=0; i0<numOfExtWords; i0++)                                                                   
        begin                                                                                                  
          pe0_lane18_strm1[i0]  = (i0 == 0                )  ? $shortrealtobits(11.0) :                   
                                 (i0 == (numOfExtWords-1))  ? $shortrealtobits(44.0) :                   
                                                              $shortrealtobits(2.0*i0) ;                 
          pe0_lane18_strm1[i0]  = (i0 == 0                )  ? $shortrealtobits(22.0) :                   
                                 (i0 == (numOfExtWords-1))  ? $shortrealtobits(33.0) :                   
                                                              $shortrealtobits(1.0*i0) ;                 
          fp_mac_expected_result += $bitstoshortreal(pe0_lane18_strm0[i0]) * $bitstoshortreal(pe0_lane18_strm1[i0]) ;                
        end                                                                                                    
      fp_mac_expected_result = 0 ;                
      for (int i0=0; i0<numOfExtWords; i0++)                                                                   
        begin                                                                                                  
          pe0_lane19_strm0[i0]  = (i0 == 0                )  ? $shortrealtobits(11.0) :                   
                                 (i0 == (numOfExtWords-1))  ? $shortrealtobits(44.0) :                   
                                                              $shortrealtobits(2.0*i0) ;                 
          pe0_lane19_strm0[i0]  = (i0 == 0                )  ? $shortrealtobits(22.0) :                   
                                 (i0 == (numOfExtWords-1))  ? $shortrealtobits(33.0) :                   
                                                              $shortrealtobits(1.0*i0) ;                 
          fp_mac_expected_result += $bitstoshortreal(pe0_lane19_strm0[i0]) * $bitstoshortreal(pe0_lane19_strm1[i0]) ;                
        end                                                                                                    
      fp_mac_expected_result = 0 ;                
      for (int i0=0; i0<numOfExtWords; i0++)                                                                   
        begin                                                                                                  
          pe0_lane19_strm1[i0]  = (i0 == 0                )  ? $shortrealtobits(11.0) :                   
                                 (i0 == (numOfExtWords-1))  ? $shortrealtobits(44.0) :                   
                                                              $shortrealtobits(2.0*i0) ;                 
          pe0_lane19_strm1[i0]  = (i0 == 0                )  ? $shortrealtobits(22.0) :                   
                                 (i0 == (numOfExtWords-1))  ? $shortrealtobits(33.0) :                   
                                                              $shortrealtobits(1.0*i0) ;                 
          fp_mac_expected_result += $bitstoshortreal(pe0_lane19_strm0[i0]) * $bitstoshortreal(pe0_lane19_strm1[i0]) ;                
        end                                                                                                    
      fp_mac_expected_result = 0 ;                
      for (int i0=0; i0<numOfExtWords; i0++)                                                                   
        begin                                                                                                  
          pe0_lane20_strm0[i0]  = (i0 == 0                )  ? $shortrealtobits(11.0) :                   
                                 (i0 == (numOfExtWords-1))  ? $shortrealtobits(44.0) :                   
                                                              $shortrealtobits(2.0*i0) ;                 
          pe0_lane20_strm0[i0]  = (i0 == 0                )  ? $shortrealtobits(22.0) :                   
                                 (i0 == (numOfExtWords-1))  ? $shortrealtobits(33.0) :                   
                                                              $shortrealtobits(1.0*i0) ;                 
          fp_mac_expected_result += $bitstoshortreal(pe0_lane20_strm0[i0]) * $bitstoshortreal(pe0_lane20_strm1[i0]) ;                
        end                                                                                                    
      fp_mac_expected_result = 0 ;                
      for (int i0=0; i0<numOfExtWords; i0++)                                                                   
        begin                                                                                                  
          pe0_lane20_strm1[i0]  = (i0 == 0                )  ? $shortrealtobits(11.0) :                   
                                 (i0 == (numOfExtWords-1))  ? $shortrealtobits(44.0) :                   
                                                              $shortrealtobits(2.0*i0) ;                 
          pe0_lane20_strm1[i0]  = (i0 == 0                )  ? $shortrealtobits(22.0) :                   
                                 (i0 == (numOfExtWords-1))  ? $shortrealtobits(33.0) :                   
                                                              $shortrealtobits(1.0*i0) ;                 
          fp_mac_expected_result += $bitstoshortreal(pe0_lane20_strm0[i0]) * $bitstoshortreal(pe0_lane20_strm1[i0]) ;                
        end                                                                                                    
      fp_mac_expected_result = 0 ;                
      for (int i0=0; i0<numOfExtWords; i0++)                                                                   
        begin                                                                                                  
          pe0_lane21_strm0[i0]  = (i0 == 0                )  ? $shortrealtobits(11.0) :                   
                                 (i0 == (numOfExtWords-1))  ? $shortrealtobits(44.0) :                   
                                                              $shortrealtobits(2.0*i0) ;                 
          pe0_lane21_strm0[i0]  = (i0 == 0                )  ? $shortrealtobits(22.0) :                   
                                 (i0 == (numOfExtWords-1))  ? $shortrealtobits(33.0) :                   
                                                              $shortrealtobits(1.0*i0) ;                 
          fp_mac_expected_result += $bitstoshortreal(pe0_lane21_strm0[i0]) * $bitstoshortreal(pe0_lane21_strm1[i0]) ;                
        end                                                                                                    
      fp_mac_expected_result = 0 ;                
      for (int i0=0; i0<numOfExtWords; i0++)                                                                   
        begin                                                                                                  
          pe0_lane21_strm1[i0]  = (i0 == 0                )  ? $shortrealtobits(11.0) :                   
                                 (i0 == (numOfExtWords-1))  ? $shortrealtobits(44.0) :                   
                                                              $shortrealtobits(2.0*i0) ;                 
          pe0_lane21_strm1[i0]  = (i0 == 0                )  ? $shortrealtobits(22.0) :                   
                                 (i0 == (numOfExtWords-1))  ? $shortrealtobits(33.0) :                   
                                                              $shortrealtobits(1.0*i0) ;                 
          fp_mac_expected_result += $bitstoshortreal(pe0_lane21_strm0[i0]) * $bitstoshortreal(pe0_lane21_strm1[i0]) ;                
        end                                                                                                    
      fp_mac_expected_result = 0 ;                
      for (int i0=0; i0<numOfExtWords; i0++)                                                                   
        begin                                                                                                  
          pe0_lane22_strm0[i0]  = (i0 == 0                )  ? $shortrealtobits(11.0) :                   
                                 (i0 == (numOfExtWords-1))  ? $shortrealtobits(44.0) :                   
                                                              $shortrealtobits(2.0*i0) ;                 
          pe0_lane22_strm0[i0]  = (i0 == 0                )  ? $shortrealtobits(22.0) :                   
                                 (i0 == (numOfExtWords-1))  ? $shortrealtobits(33.0) :                   
                                                              $shortrealtobits(1.0*i0) ;                 
          fp_mac_expected_result += $bitstoshortreal(pe0_lane22_strm0[i0]) * $bitstoshortreal(pe0_lane22_strm1[i0]) ;                
        end                                                                                                    
      fp_mac_expected_result = 0 ;                
      for (int i0=0; i0<numOfExtWords; i0++)                                                                   
        begin                                                                                                  
          pe0_lane22_strm1[i0]  = (i0 == 0                )  ? $shortrealtobits(11.0) :                   
                                 (i0 == (numOfExtWords-1))  ? $shortrealtobits(44.0) :                   
                                                              $shortrealtobits(2.0*i0) ;                 
          pe0_lane22_strm1[i0]  = (i0 == 0                )  ? $shortrealtobits(22.0) :                   
                                 (i0 == (numOfExtWords-1))  ? $shortrealtobits(33.0) :                   
                                                              $shortrealtobits(1.0*i0) ;                 
          fp_mac_expected_result += $bitstoshortreal(pe0_lane22_strm0[i0]) * $bitstoshortreal(pe0_lane22_strm1[i0]) ;                
        end                                                                                                    
      fp_mac_expected_result = 0 ;                
      for (int i0=0; i0<numOfExtWords; i0++)                                                                   
        begin                                                                                                  
          pe0_lane23_strm0[i0]  = (i0 == 0                )  ? $shortrealtobits(11.0) :                   
                                 (i0 == (numOfExtWords-1))  ? $shortrealtobits(44.0) :                   
                                                              $shortrealtobits(2.0*i0) ;                 
          pe0_lane23_strm0[i0]  = (i0 == 0                )  ? $shortrealtobits(22.0) :                   
                                 (i0 == (numOfExtWords-1))  ? $shortrealtobits(33.0) :                   
                                                              $shortrealtobits(1.0*i0) ;                 
          fp_mac_expected_result += $bitstoshortreal(pe0_lane23_strm0[i0]) * $bitstoshortreal(pe0_lane23_strm1[i0]) ;                
        end                                                                                                    
      fp_mac_expected_result = 0 ;                
      for (int i0=0; i0<numOfExtWords; i0++)                                                                   
        begin                                                                                                  
          pe0_lane23_strm1[i0]  = (i0 == 0                )  ? $shortrealtobits(11.0) :                   
                                 (i0 == (numOfExtWords-1))  ? $shortrealtobits(44.0) :                   
                                                              $shortrealtobits(2.0*i0) ;                 
          pe0_lane23_strm1[i0]  = (i0 == 0                )  ? $shortrealtobits(22.0) :                   
                                 (i0 == (numOfExtWords-1))  ? $shortrealtobits(33.0) :                   
                                                              $shortrealtobits(1.0*i0) ;                 
          fp_mac_expected_result += $bitstoshortreal(pe0_lane23_strm0[i0]) * $bitstoshortreal(pe0_lane23_strm1[i0]) ;                
        end                                                                                                    
      fp_mac_expected_result = 0 ;                
      for (int i0=0; i0<numOfExtWords; i0++)                                                                   
        begin                                                                                                  
          pe0_lane24_strm0[i0]  = (i0 == 0                )  ? $shortrealtobits(11.0) :                   
                                 (i0 == (numOfExtWords-1))  ? $shortrealtobits(44.0) :                   
                                                              $shortrealtobits(2.0*i0) ;                 
          pe0_lane24_strm0[i0]  = (i0 == 0                )  ? $shortrealtobits(22.0) :                   
                                 (i0 == (numOfExtWords-1))  ? $shortrealtobits(33.0) :                   
                                                              $shortrealtobits(1.0*i0) ;                 
          fp_mac_expected_result += $bitstoshortreal(pe0_lane24_strm0[i0]) * $bitstoshortreal(pe0_lane24_strm1[i0]) ;                
        end                                                                                                    
      fp_mac_expected_result = 0 ;                
      for (int i0=0; i0<numOfExtWords; i0++)                                                                   
        begin                                                                                                  
          pe0_lane24_strm1[i0]  = (i0 == 0                )  ? $shortrealtobits(11.0) :                   
                                 (i0 == (numOfExtWords-1))  ? $shortrealtobits(44.0) :                   
                                                              $shortrealtobits(2.0*i0) ;                 
          pe0_lane24_strm1[i0]  = (i0 == 0                )  ? $shortrealtobits(22.0) :                   
                                 (i0 == (numOfExtWords-1))  ? $shortrealtobits(33.0) :                   
                                                              $shortrealtobits(1.0*i0) ;                 
          fp_mac_expected_result += $bitstoshortreal(pe0_lane24_strm0[i0]) * $bitstoshortreal(pe0_lane24_strm1[i0]) ;                
        end                                                                                                    
      fp_mac_expected_result = 0 ;                
      for (int i0=0; i0<numOfExtWords; i0++)                                                                   
        begin                                                                                                  
          pe0_lane25_strm0[i0]  = (i0 == 0                )  ? $shortrealtobits(11.0) :                   
                                 (i0 == (numOfExtWords-1))  ? $shortrealtobits(44.0) :                   
                                                              $shortrealtobits(2.0*i0) ;                 
          pe0_lane25_strm0[i0]  = (i0 == 0                )  ? $shortrealtobits(22.0) :                   
                                 (i0 == (numOfExtWords-1))  ? $shortrealtobits(33.0) :                   
                                                              $shortrealtobits(1.0*i0) ;                 
          fp_mac_expected_result += $bitstoshortreal(pe0_lane25_strm0[i0]) * $bitstoshortreal(pe0_lane25_strm1[i0]) ;                
        end                                                                                                    
      fp_mac_expected_result = 0 ;                
      for (int i0=0; i0<numOfExtWords; i0++)                                                                   
        begin                                                                                                  
          pe0_lane25_strm1[i0]  = (i0 == 0                )  ? $shortrealtobits(11.0) :                   
                                 (i0 == (numOfExtWords-1))  ? $shortrealtobits(44.0) :                   
                                                              $shortrealtobits(2.0*i0) ;                 
          pe0_lane25_strm1[i0]  = (i0 == 0                )  ? $shortrealtobits(22.0) :                   
                                 (i0 == (numOfExtWords-1))  ? $shortrealtobits(33.0) :                   
                                                              $shortrealtobits(1.0*i0) ;                 
          fp_mac_expected_result += $bitstoshortreal(pe0_lane25_strm0[i0]) * $bitstoshortreal(pe0_lane25_strm1[i0]) ;                
        end                                                                                                    
      fp_mac_expected_result = 0 ;                
      for (int i0=0; i0<numOfExtWords; i0++)                                                                   
        begin                                                                                                  
          pe0_lane26_strm0[i0]  = (i0 == 0                )  ? $shortrealtobits(11.0) :                   
                                 (i0 == (numOfExtWords-1))  ? $shortrealtobits(44.0) :                   
                                                              $shortrealtobits(2.0*i0) ;                 
          pe0_lane26_strm0[i0]  = (i0 == 0                )  ? $shortrealtobits(22.0) :                   
                                 (i0 == (numOfExtWords-1))  ? $shortrealtobits(33.0) :                   
                                                              $shortrealtobits(1.0*i0) ;                 
          fp_mac_expected_result += $bitstoshortreal(pe0_lane26_strm0[i0]) * $bitstoshortreal(pe0_lane26_strm1[i0]) ;                
        end                                                                                                    
      fp_mac_expected_result = 0 ;                
      for (int i0=0; i0<numOfExtWords; i0++)                                                                   
        begin                                                                                                  
          pe0_lane26_strm1[i0]  = (i0 == 0                )  ? $shortrealtobits(11.0) :                   
                                 (i0 == (numOfExtWords-1))  ? $shortrealtobits(44.0) :                   
                                                              $shortrealtobits(2.0*i0) ;                 
          pe0_lane26_strm1[i0]  = (i0 == 0                )  ? $shortrealtobits(22.0) :                   
                                 (i0 == (numOfExtWords-1))  ? $shortrealtobits(33.0) :                   
                                                              $shortrealtobits(1.0*i0) ;                 
          fp_mac_expected_result += $bitstoshortreal(pe0_lane26_strm0[i0]) * $bitstoshortreal(pe0_lane26_strm1[i0]) ;                
        end                                                                                                    
      fp_mac_expected_result = 0 ;                
      for (int i0=0; i0<numOfExtWords; i0++)                                                                   
        begin                                                                                                  
          pe0_lane27_strm0[i0]  = (i0 == 0                )  ? $shortrealtobits(11.0) :                   
                                 (i0 == (numOfExtWords-1))  ? $shortrealtobits(44.0) :                   
                                                              $shortrealtobits(2.0*i0) ;                 
          pe0_lane27_strm0[i0]  = (i0 == 0                )  ? $shortrealtobits(22.0) :                   
                                 (i0 == (numOfExtWords-1))  ? $shortrealtobits(33.0) :                   
                                                              $shortrealtobits(1.0*i0) ;                 
          fp_mac_expected_result += $bitstoshortreal(pe0_lane27_strm0[i0]) * $bitstoshortreal(pe0_lane27_strm1[i0]) ;                
        end                                                                                                    
      fp_mac_expected_result = 0 ;                
      for (int i0=0; i0<numOfExtWords; i0++)                                                                   
        begin                                                                                                  
          pe0_lane27_strm1[i0]  = (i0 == 0                )  ? $shortrealtobits(11.0) :                   
                                 (i0 == (numOfExtWords-1))  ? $shortrealtobits(44.0) :                   
                                                              $shortrealtobits(2.0*i0) ;                 
          pe0_lane27_strm1[i0]  = (i0 == 0                )  ? $shortrealtobits(22.0) :                   
                                 (i0 == (numOfExtWords-1))  ? $shortrealtobits(33.0) :                   
                                                              $shortrealtobits(1.0*i0) ;                 
          fp_mac_expected_result += $bitstoshortreal(pe0_lane27_strm0[i0]) * $bitstoshortreal(pe0_lane27_strm1[i0]) ;                
        end                                                                                                    
      fp_mac_expected_result = 0 ;                
      for (int i0=0; i0<numOfExtWords; i0++)                                                                   
        begin                                                                                                  
          pe0_lane28_strm0[i0]  = (i0 == 0                )  ? $shortrealtobits(11.0) :                   
                                 (i0 == (numOfExtWords-1))  ? $shortrealtobits(44.0) :                   
                                                              $shortrealtobits(2.0*i0) ;                 
          pe0_lane28_strm0[i0]  = (i0 == 0                )  ? $shortrealtobits(22.0) :                   
                                 (i0 == (numOfExtWords-1))  ? $shortrealtobits(33.0) :                   
                                                              $shortrealtobits(1.0*i0) ;                 
          fp_mac_expected_result += $bitstoshortreal(pe0_lane28_strm0[i0]) * $bitstoshortreal(pe0_lane28_strm1[i0]) ;                
        end                                                                                                    
      fp_mac_expected_result = 0 ;                
      for (int i0=0; i0<numOfExtWords; i0++)                                                                   
        begin                                                                                                  
          pe0_lane28_strm1[i0]  = (i0 == 0                )  ? $shortrealtobits(11.0) :                   
                                 (i0 == (numOfExtWords-1))  ? $shortrealtobits(44.0) :                   
                                                              $shortrealtobits(2.0*i0) ;                 
          pe0_lane28_strm1[i0]  = (i0 == 0                )  ? $shortrealtobits(22.0) :                   
                                 (i0 == (numOfExtWords-1))  ? $shortrealtobits(33.0) :                   
                                                              $shortrealtobits(1.0*i0) ;                 
          fp_mac_expected_result += $bitstoshortreal(pe0_lane28_strm0[i0]) * $bitstoshortreal(pe0_lane28_strm1[i0]) ;                
        end                                                                                                    
      fp_mac_expected_result = 0 ;                
      for (int i0=0; i0<numOfExtWords; i0++)                                                                   
        begin                                                                                                  
          pe0_lane29_strm0[i0]  = (i0 == 0                )  ? $shortrealtobits(11.0) :                   
                                 (i0 == (numOfExtWords-1))  ? $shortrealtobits(44.0) :                   
                                                              $shortrealtobits(2.0*i0) ;                 
          pe0_lane29_strm0[i0]  = (i0 == 0                )  ? $shortrealtobits(22.0) :                   
                                 (i0 == (numOfExtWords-1))  ? $shortrealtobits(33.0) :                   
                                                              $shortrealtobits(1.0*i0) ;                 
          fp_mac_expected_result += $bitstoshortreal(pe0_lane29_strm0[i0]) * $bitstoshortreal(pe0_lane29_strm1[i0]) ;                
        end                                                                                                    
      fp_mac_expected_result = 0 ;                
      for (int i0=0; i0<numOfExtWords; i0++)                                                                   
        begin                                                                                                  
          pe0_lane29_strm1[i0]  = (i0 == 0                )  ? $shortrealtobits(11.0) :                   
                                 (i0 == (numOfExtWords-1))  ? $shortrealtobits(44.0) :                   
                                                              $shortrealtobits(2.0*i0) ;                 
          pe0_lane29_strm1[i0]  = (i0 == 0                )  ? $shortrealtobits(22.0) :                   
                                 (i0 == (numOfExtWords-1))  ? $shortrealtobits(33.0) :                   
                                                              $shortrealtobits(1.0*i0) ;                 
          fp_mac_expected_result += $bitstoshortreal(pe0_lane29_strm0[i0]) * $bitstoshortreal(pe0_lane29_strm1[i0]) ;                
        end                                                                                                    
      fp_mac_expected_result = 0 ;                
      for (int i0=0; i0<numOfExtWords; i0++)                                                                   
        begin                                                                                                  
          pe0_lane30_strm0[i0]  = (i0 == 0                )  ? $shortrealtobits(11.0) :                   
                                 (i0 == (numOfExtWords-1))  ? $shortrealtobits(44.0) :                   
                                                              $shortrealtobits(2.0*i0) ;                 
          pe0_lane30_strm0[i0]  = (i0 == 0                )  ? $shortrealtobits(22.0) :                   
                                 (i0 == (numOfExtWords-1))  ? $shortrealtobits(33.0) :                   
                                                              $shortrealtobits(1.0*i0) ;                 
          fp_mac_expected_result += $bitstoshortreal(pe0_lane30_strm0[i0]) * $bitstoshortreal(pe0_lane30_strm1[i0]) ;                
        end                                                                                                    
      fp_mac_expected_result = 0 ;                
      for (int i0=0; i0<numOfExtWords; i0++)                                                                   
        begin                                                                                                  
          pe0_lane30_strm1[i0]  = (i0 == 0                )  ? $shortrealtobits(11.0) :                   
                                 (i0 == (numOfExtWords-1))  ? $shortrealtobits(44.0) :                   
                                                              $shortrealtobits(2.0*i0) ;                 
          pe0_lane30_strm1[i0]  = (i0 == 0                )  ? $shortrealtobits(22.0) :                   
                                 (i0 == (numOfExtWords-1))  ? $shortrealtobits(33.0) :                   
                                                              $shortrealtobits(1.0*i0) ;                 
          fp_mac_expected_result += $bitstoshortreal(pe0_lane30_strm0[i0]) * $bitstoshortreal(pe0_lane30_strm1[i0]) ;                
        end                                                                                                    
      fp_mac_expected_result = 0 ;                
      for (int i0=0; i0<numOfExtWords; i0++)                                                                   
        begin                                                                                                  
          pe0_lane31_strm0[i0]  = (i0 == 0                )  ? $shortrealtobits(11.0) :                   
                                 (i0 == (numOfExtWords-1))  ? $shortrealtobits(44.0) :                   
                                                              $shortrealtobits(2.0*i0) ;                 
          pe0_lane31_strm0[i0]  = (i0 == 0                )  ? $shortrealtobits(22.0) :                   
                                 (i0 == (numOfExtWords-1))  ? $shortrealtobits(33.0) :                   
                                                              $shortrealtobits(1.0*i0) ;                 
          fp_mac_expected_result += $bitstoshortreal(pe0_lane31_strm0[i0]) * $bitstoshortreal(pe0_lane31_strm1[i0]) ;                
        end                                                                                                    
      fp_mac_expected_result = 0 ;                
      for (int i0=0; i0<numOfExtWords; i0++)                                                                   
        begin                                                                                                  
          pe0_lane31_strm1[i0]  = (i0 == 0                )  ? $shortrealtobits(11.0) :                   
                                 (i0 == (numOfExtWords-1))  ? $shortrealtobits(44.0) :                   
                                                              $shortrealtobits(2.0*i0) ;                 
          pe0_lane31_strm1[i0]  = (i0 == 0                )  ? $shortrealtobits(22.0) :                   
                                 (i0 == (numOfExtWords-1))  ? $shortrealtobits(33.0) :                   
                                                              $shortrealtobits(1.0*i0) ;                 
          fp_mac_expected_result += $bitstoshortreal(pe0_lane31_strm0[i0]) * $bitstoshortreal(pe0_lane31_strm1[i0]) ;                
        end                                                                                                    
  // PE 1  
      fp_mac_expected_result = 0 ;                
      for (int i0=0; i0<numOfExtWords; i0++)                                                                   
        begin                                                                                                  
          pe1_lane0_strm0[i0]  = (i0 == 0                )  ? $shortrealtobits(11.0) :                   
                                 (i0 == (numOfExtWords-1))  ? $shortrealtobits(44.0) :                   
                                                              $shortrealtobits(2.0*i0) ;                 
          pe1_lane0_strm0[i0]  = (i0 == 0                )  ? $shortrealtobits(22.0) :                   
                                 (i0 == (numOfExtWords-1))  ? $shortrealtobits(33.0) :                   
                                                              $shortrealtobits(1.0*i0) ;                 
          fp_mac_expected_result += $bitstoshortreal(pe1_lane0_strm0[i0]) * $bitstoshortreal(pe1_lane0_strm1[i0]) ;                
        end                                                                                                    
      fp_mac_expected_result = 0 ;                
      for (int i0=0; i0<numOfExtWords; i0++)                                                                   
        begin                                                                                                  
          pe1_lane0_strm1[i0]  = (i0 == 0                )  ? $shortrealtobits(11.0) :                   
                                 (i0 == (numOfExtWords-1))  ? $shortrealtobits(44.0) :                   
                                                              $shortrealtobits(2.0*i0) ;                 
          pe1_lane0_strm1[i0]  = (i0 == 0                )  ? $shortrealtobits(22.0) :                   
                                 (i0 == (numOfExtWords-1))  ? $shortrealtobits(33.0) :                   
                                                              $shortrealtobits(1.0*i0) ;                 
          fp_mac_expected_result += $bitstoshortreal(pe1_lane0_strm0[i0]) * $bitstoshortreal(pe1_lane0_strm1[i0]) ;                
        end                                                                                                    
      fp_mac_expected_result = 0 ;                
      for (int i0=0; i0<numOfExtWords; i0++)                                                                   
        begin                                                                                                  
          pe1_lane1_strm0[i0]  = (i0 == 0                )  ? $shortrealtobits(11.0) :                   
                                 (i0 == (numOfExtWords-1))  ? $shortrealtobits(44.0) :                   
                                                              $shortrealtobits(2.0*i0) ;                 
          pe1_lane1_strm0[i0]  = (i0 == 0                )  ? $shortrealtobits(22.0) :                   
                                 (i0 == (numOfExtWords-1))  ? $shortrealtobits(33.0) :                   
                                                              $shortrealtobits(1.0*i0) ;                 
          fp_mac_expected_result += $bitstoshortreal(pe1_lane1_strm0[i0]) * $bitstoshortreal(pe1_lane1_strm1[i0]) ;                
        end                                                                                                    
      fp_mac_expected_result = 0 ;                
      for (int i0=0; i0<numOfExtWords; i0++)                                                                   
        begin                                                                                                  
          pe1_lane1_strm1[i0]  = (i0 == 0                )  ? $shortrealtobits(11.0) :                   
                                 (i0 == (numOfExtWords-1))  ? $shortrealtobits(44.0) :                   
                                                              $shortrealtobits(2.0*i0) ;                 
          pe1_lane1_strm1[i0]  = (i0 == 0                )  ? $shortrealtobits(22.0) :                   
                                 (i0 == (numOfExtWords-1))  ? $shortrealtobits(33.0) :                   
                                                              $shortrealtobits(1.0*i0) ;                 
          fp_mac_expected_result += $bitstoshortreal(pe1_lane1_strm0[i0]) * $bitstoshortreal(pe1_lane1_strm1[i0]) ;                
        end                                                                                                    
      fp_mac_expected_result = 0 ;                
      for (int i0=0; i0<numOfExtWords; i0++)                                                                   
        begin                                                                                                  
          pe1_lane2_strm0[i0]  = (i0 == 0                )  ? $shortrealtobits(11.0) :                   
                                 (i0 == (numOfExtWords-1))  ? $shortrealtobits(44.0) :                   
                                                              $shortrealtobits(2.0*i0) ;                 
          pe1_lane2_strm0[i0]  = (i0 == 0                )  ? $shortrealtobits(22.0) :                   
                                 (i0 == (numOfExtWords-1))  ? $shortrealtobits(33.0) :                   
                                                              $shortrealtobits(1.0*i0) ;                 
          fp_mac_expected_result += $bitstoshortreal(pe1_lane2_strm0[i0]) * $bitstoshortreal(pe1_lane2_strm1[i0]) ;                
        end                                                                                                    
      fp_mac_expected_result = 0 ;                
      for (int i0=0; i0<numOfExtWords; i0++)                                                                   
        begin                                                                                                  
          pe1_lane2_strm1[i0]  = (i0 == 0                )  ? $shortrealtobits(11.0) :                   
                                 (i0 == (numOfExtWords-1))  ? $shortrealtobits(44.0) :                   
                                                              $shortrealtobits(2.0*i0) ;                 
          pe1_lane2_strm1[i0]  = (i0 == 0                )  ? $shortrealtobits(22.0) :                   
                                 (i0 == (numOfExtWords-1))  ? $shortrealtobits(33.0) :                   
                                                              $shortrealtobits(1.0*i0) ;                 
          fp_mac_expected_result += $bitstoshortreal(pe1_lane2_strm0[i0]) * $bitstoshortreal(pe1_lane2_strm1[i0]) ;                
        end                                                                                                    
      fp_mac_expected_result = 0 ;                
      for (int i0=0; i0<numOfExtWords; i0++)                                                                   
        begin                                                                                                  
          pe1_lane3_strm0[i0]  = (i0 == 0                )  ? $shortrealtobits(11.0) :                   
                                 (i0 == (numOfExtWords-1))  ? $shortrealtobits(44.0) :                   
                                                              $shortrealtobits(2.0*i0) ;                 
          pe1_lane3_strm0[i0]  = (i0 == 0                )  ? $shortrealtobits(22.0) :                   
                                 (i0 == (numOfExtWords-1))  ? $shortrealtobits(33.0) :                   
                                                              $shortrealtobits(1.0*i0) ;                 
          fp_mac_expected_result += $bitstoshortreal(pe1_lane3_strm0[i0]) * $bitstoshortreal(pe1_lane3_strm1[i0]) ;                
        end                                                                                                    
      fp_mac_expected_result = 0 ;                
      for (int i0=0; i0<numOfExtWords; i0++)                                                                   
        begin                                                                                                  
          pe1_lane3_strm1[i0]  = (i0 == 0                )  ? $shortrealtobits(11.0) :                   
                                 (i0 == (numOfExtWords-1))  ? $shortrealtobits(44.0) :                   
                                                              $shortrealtobits(2.0*i0) ;                 
          pe1_lane3_strm1[i0]  = (i0 == 0                )  ? $shortrealtobits(22.0) :                   
                                 (i0 == (numOfExtWords-1))  ? $shortrealtobits(33.0) :                   
                                                              $shortrealtobits(1.0*i0) ;                 
          fp_mac_expected_result += $bitstoshortreal(pe1_lane3_strm0[i0]) * $bitstoshortreal(pe1_lane3_strm1[i0]) ;                
        end                                                                                                    
      fp_mac_expected_result = 0 ;                
      for (int i0=0; i0<numOfExtWords; i0++)                                                                   
        begin                                                                                                  
          pe1_lane4_strm0[i0]  = (i0 == 0                )  ? $shortrealtobits(11.0) :                   
                                 (i0 == (numOfExtWords-1))  ? $shortrealtobits(44.0) :                   
                                                              $shortrealtobits(2.0*i0) ;                 
          pe1_lane4_strm0[i0]  = (i0 == 0                )  ? $shortrealtobits(22.0) :                   
                                 (i0 == (numOfExtWords-1))  ? $shortrealtobits(33.0) :                   
                                                              $shortrealtobits(1.0*i0) ;                 
          fp_mac_expected_result += $bitstoshortreal(pe1_lane4_strm0[i0]) * $bitstoshortreal(pe1_lane4_strm1[i0]) ;                
        end                                                                                                    
      fp_mac_expected_result = 0 ;                
      for (int i0=0; i0<numOfExtWords; i0++)                                                                   
        begin                                                                                                  
          pe1_lane4_strm1[i0]  = (i0 == 0                )  ? $shortrealtobits(11.0) :                   
                                 (i0 == (numOfExtWords-1))  ? $shortrealtobits(44.0) :                   
                                                              $shortrealtobits(2.0*i0) ;                 
          pe1_lane4_strm1[i0]  = (i0 == 0                )  ? $shortrealtobits(22.0) :                   
                                 (i0 == (numOfExtWords-1))  ? $shortrealtobits(33.0) :                   
                                                              $shortrealtobits(1.0*i0) ;                 
          fp_mac_expected_result += $bitstoshortreal(pe1_lane4_strm0[i0]) * $bitstoshortreal(pe1_lane4_strm1[i0]) ;                
        end                                                                                                    
      fp_mac_expected_result = 0 ;                
      for (int i0=0; i0<numOfExtWords; i0++)                                                                   
        begin                                                                                                  
          pe1_lane5_strm0[i0]  = (i0 == 0                )  ? $shortrealtobits(11.0) :                   
                                 (i0 == (numOfExtWords-1))  ? $shortrealtobits(44.0) :                   
                                                              $shortrealtobits(2.0*i0) ;                 
          pe1_lane5_strm0[i0]  = (i0 == 0                )  ? $shortrealtobits(22.0) :                   
                                 (i0 == (numOfExtWords-1))  ? $shortrealtobits(33.0) :                   
                                                              $shortrealtobits(1.0*i0) ;                 
          fp_mac_expected_result += $bitstoshortreal(pe1_lane5_strm0[i0]) * $bitstoshortreal(pe1_lane5_strm1[i0]) ;                
        end                                                                                                    
      fp_mac_expected_result = 0 ;                
      for (int i0=0; i0<numOfExtWords; i0++)                                                                   
        begin                                                                                                  
          pe1_lane5_strm1[i0]  = (i0 == 0                )  ? $shortrealtobits(11.0) :                   
                                 (i0 == (numOfExtWords-1))  ? $shortrealtobits(44.0) :                   
                                                              $shortrealtobits(2.0*i0) ;                 
          pe1_lane5_strm1[i0]  = (i0 == 0                )  ? $shortrealtobits(22.0) :                   
                                 (i0 == (numOfExtWords-1))  ? $shortrealtobits(33.0) :                   
                                                              $shortrealtobits(1.0*i0) ;                 
          fp_mac_expected_result += $bitstoshortreal(pe1_lane5_strm0[i0]) * $bitstoshortreal(pe1_lane5_strm1[i0]) ;                
        end                                                                                                    
      fp_mac_expected_result = 0 ;                
      for (int i0=0; i0<numOfExtWords; i0++)                                                                   
        begin                                                                                                  
          pe1_lane6_strm0[i0]  = (i0 == 0                )  ? $shortrealtobits(11.0) :                   
                                 (i0 == (numOfExtWords-1))  ? $shortrealtobits(44.0) :                   
                                                              $shortrealtobits(2.0*i0) ;                 
          pe1_lane6_strm0[i0]  = (i0 == 0                )  ? $shortrealtobits(22.0) :                   
                                 (i0 == (numOfExtWords-1))  ? $shortrealtobits(33.0) :                   
                                                              $shortrealtobits(1.0*i0) ;                 
          fp_mac_expected_result += $bitstoshortreal(pe1_lane6_strm0[i0]) * $bitstoshortreal(pe1_lane6_strm1[i0]) ;                
        end                                                                                                    
      fp_mac_expected_result = 0 ;                
      for (int i0=0; i0<numOfExtWords; i0++)                                                                   
        begin                                                                                                  
          pe1_lane6_strm1[i0]  = (i0 == 0                )  ? $shortrealtobits(11.0) :                   
                                 (i0 == (numOfExtWords-1))  ? $shortrealtobits(44.0) :                   
                                                              $shortrealtobits(2.0*i0) ;                 
          pe1_lane6_strm1[i0]  = (i0 == 0                )  ? $shortrealtobits(22.0) :                   
                                 (i0 == (numOfExtWords-1))  ? $shortrealtobits(33.0) :                   
                                                              $shortrealtobits(1.0*i0) ;                 
          fp_mac_expected_result += $bitstoshortreal(pe1_lane6_strm0[i0]) * $bitstoshortreal(pe1_lane6_strm1[i0]) ;                
        end                                                                                                    
      fp_mac_expected_result = 0 ;                
      for (int i0=0; i0<numOfExtWords; i0++)                                                                   
        begin                                                                                                  
          pe1_lane7_strm0[i0]  = (i0 == 0                )  ? $shortrealtobits(11.0) :                   
                                 (i0 == (numOfExtWords-1))  ? $shortrealtobits(44.0) :                   
                                                              $shortrealtobits(2.0*i0) ;                 
          pe1_lane7_strm0[i0]  = (i0 == 0                )  ? $shortrealtobits(22.0) :                   
                                 (i0 == (numOfExtWords-1))  ? $shortrealtobits(33.0) :                   
                                                              $shortrealtobits(1.0*i0) ;                 
          fp_mac_expected_result += $bitstoshortreal(pe1_lane7_strm0[i0]) * $bitstoshortreal(pe1_lane7_strm1[i0]) ;                
        end                                                                                                    
      fp_mac_expected_result = 0 ;                
      for (int i0=0; i0<numOfExtWords; i0++)                                                                   
        begin                                                                                                  
          pe1_lane7_strm1[i0]  = (i0 == 0                )  ? $shortrealtobits(11.0) :                   
                                 (i0 == (numOfExtWords-1))  ? $shortrealtobits(44.0) :                   
                                                              $shortrealtobits(2.0*i0) ;                 
          pe1_lane7_strm1[i0]  = (i0 == 0                )  ? $shortrealtobits(22.0) :                   
                                 (i0 == (numOfExtWords-1))  ? $shortrealtobits(33.0) :                   
                                                              $shortrealtobits(1.0*i0) ;                 
          fp_mac_expected_result += $bitstoshortreal(pe1_lane7_strm0[i0]) * $bitstoshortreal(pe1_lane7_strm1[i0]) ;                
        end                                                                                                    
      fp_mac_expected_result = 0 ;                
      for (int i0=0; i0<numOfExtWords; i0++)                                                                   
        begin                                                                                                  
          pe1_lane8_strm0[i0]  = (i0 == 0                )  ? $shortrealtobits(11.0) :                   
                                 (i0 == (numOfExtWords-1))  ? $shortrealtobits(44.0) :                   
                                                              $shortrealtobits(2.0*i0) ;                 
          pe1_lane8_strm0[i0]  = (i0 == 0                )  ? $shortrealtobits(22.0) :                   
                                 (i0 == (numOfExtWords-1))  ? $shortrealtobits(33.0) :                   
                                                              $shortrealtobits(1.0*i0) ;                 
          fp_mac_expected_result += $bitstoshortreal(pe1_lane8_strm0[i0]) * $bitstoshortreal(pe1_lane8_strm1[i0]) ;                
        end                                                                                                    
      fp_mac_expected_result = 0 ;                
      for (int i0=0; i0<numOfExtWords; i0++)                                                                   
        begin                                                                                                  
          pe1_lane8_strm1[i0]  = (i0 == 0                )  ? $shortrealtobits(11.0) :                   
                                 (i0 == (numOfExtWords-1))  ? $shortrealtobits(44.0) :                   
                                                              $shortrealtobits(2.0*i0) ;                 
          pe1_lane8_strm1[i0]  = (i0 == 0                )  ? $shortrealtobits(22.0) :                   
                                 (i0 == (numOfExtWords-1))  ? $shortrealtobits(33.0) :                   
                                                              $shortrealtobits(1.0*i0) ;                 
          fp_mac_expected_result += $bitstoshortreal(pe1_lane8_strm0[i0]) * $bitstoshortreal(pe1_lane8_strm1[i0]) ;                
        end                                                                                                    
      fp_mac_expected_result = 0 ;                
      for (int i0=0; i0<numOfExtWords; i0++)                                                                   
        begin                                                                                                  
          pe1_lane9_strm0[i0]  = (i0 == 0                )  ? $shortrealtobits(11.0) :                   
                                 (i0 == (numOfExtWords-1))  ? $shortrealtobits(44.0) :                   
                                                              $shortrealtobits(2.0*i0) ;                 
          pe1_lane9_strm0[i0]  = (i0 == 0                )  ? $shortrealtobits(22.0) :                   
                                 (i0 == (numOfExtWords-1))  ? $shortrealtobits(33.0) :                   
                                                              $shortrealtobits(1.0*i0) ;                 
          fp_mac_expected_result += $bitstoshortreal(pe1_lane9_strm0[i0]) * $bitstoshortreal(pe1_lane9_strm1[i0]) ;                
        end                                                                                                    
      fp_mac_expected_result = 0 ;                
      for (int i0=0; i0<numOfExtWords; i0++)                                                                   
        begin                                                                                                  
          pe1_lane9_strm1[i0]  = (i0 == 0                )  ? $shortrealtobits(11.0) :                   
                                 (i0 == (numOfExtWords-1))  ? $shortrealtobits(44.0) :                   
                                                              $shortrealtobits(2.0*i0) ;                 
          pe1_lane9_strm1[i0]  = (i0 == 0                )  ? $shortrealtobits(22.0) :                   
                                 (i0 == (numOfExtWords-1))  ? $shortrealtobits(33.0) :                   
                                                              $shortrealtobits(1.0*i0) ;                 
          fp_mac_expected_result += $bitstoshortreal(pe1_lane9_strm0[i0]) * $bitstoshortreal(pe1_lane9_strm1[i0]) ;                
        end                                                                                                    
      fp_mac_expected_result = 0 ;                
      for (int i0=0; i0<numOfExtWords; i0++)                                                                   
        begin                                                                                                  
          pe1_lane10_strm0[i0]  = (i0 == 0                )  ? $shortrealtobits(11.0) :                   
                                 (i0 == (numOfExtWords-1))  ? $shortrealtobits(44.0) :                   
                                                              $shortrealtobits(2.0*i0) ;                 
          pe1_lane10_strm0[i0]  = (i0 == 0                )  ? $shortrealtobits(22.0) :                   
                                 (i0 == (numOfExtWords-1))  ? $shortrealtobits(33.0) :                   
                                                              $shortrealtobits(1.0*i0) ;                 
          fp_mac_expected_result += $bitstoshortreal(pe1_lane10_strm0[i0]) * $bitstoshortreal(pe1_lane10_strm1[i0]) ;                
        end                                                                                                    
      fp_mac_expected_result = 0 ;                
      for (int i0=0; i0<numOfExtWords; i0++)                                                                   
        begin                                                                                                  
          pe1_lane10_strm1[i0]  = (i0 == 0                )  ? $shortrealtobits(11.0) :                   
                                 (i0 == (numOfExtWords-1))  ? $shortrealtobits(44.0) :                   
                                                              $shortrealtobits(2.0*i0) ;                 
          pe1_lane10_strm1[i0]  = (i0 == 0                )  ? $shortrealtobits(22.0) :                   
                                 (i0 == (numOfExtWords-1))  ? $shortrealtobits(33.0) :                   
                                                              $shortrealtobits(1.0*i0) ;                 
          fp_mac_expected_result += $bitstoshortreal(pe1_lane10_strm0[i0]) * $bitstoshortreal(pe1_lane10_strm1[i0]) ;                
        end                                                                                                    
      fp_mac_expected_result = 0 ;                
      for (int i0=0; i0<numOfExtWords; i0++)                                                                   
        begin                                                                                                  
          pe1_lane11_strm0[i0]  = (i0 == 0                )  ? $shortrealtobits(11.0) :                   
                                 (i0 == (numOfExtWords-1))  ? $shortrealtobits(44.0) :                   
                                                              $shortrealtobits(2.0*i0) ;                 
          pe1_lane11_strm0[i0]  = (i0 == 0                )  ? $shortrealtobits(22.0) :                   
                                 (i0 == (numOfExtWords-1))  ? $shortrealtobits(33.0) :                   
                                                              $shortrealtobits(1.0*i0) ;                 
          fp_mac_expected_result += $bitstoshortreal(pe1_lane11_strm0[i0]) * $bitstoshortreal(pe1_lane11_strm1[i0]) ;                
        end                                                                                                    
      fp_mac_expected_result = 0 ;                
      for (int i0=0; i0<numOfExtWords; i0++)                                                                   
        begin                                                                                                  
          pe1_lane11_strm1[i0]  = (i0 == 0                )  ? $shortrealtobits(11.0) :                   
                                 (i0 == (numOfExtWords-1))  ? $shortrealtobits(44.0) :                   
                                                              $shortrealtobits(2.0*i0) ;                 
          pe1_lane11_strm1[i0]  = (i0 == 0                )  ? $shortrealtobits(22.0) :                   
                                 (i0 == (numOfExtWords-1))  ? $shortrealtobits(33.0) :                   
                                                              $shortrealtobits(1.0*i0) ;                 
          fp_mac_expected_result += $bitstoshortreal(pe1_lane11_strm0[i0]) * $bitstoshortreal(pe1_lane11_strm1[i0]) ;                
        end                                                                                                    
      fp_mac_expected_result = 0 ;                
      for (int i0=0; i0<numOfExtWords; i0++)                                                                   
        begin                                                                                                  
          pe1_lane12_strm0[i0]  = (i0 == 0                )  ? $shortrealtobits(11.0) :                   
                                 (i0 == (numOfExtWords-1))  ? $shortrealtobits(44.0) :                   
                                                              $shortrealtobits(2.0*i0) ;                 
          pe1_lane12_strm0[i0]  = (i0 == 0                )  ? $shortrealtobits(22.0) :                   
                                 (i0 == (numOfExtWords-1))  ? $shortrealtobits(33.0) :                   
                                                              $shortrealtobits(1.0*i0) ;                 
          fp_mac_expected_result += $bitstoshortreal(pe1_lane12_strm0[i0]) * $bitstoshortreal(pe1_lane12_strm1[i0]) ;                
        end                                                                                                    
      fp_mac_expected_result = 0 ;                
      for (int i0=0; i0<numOfExtWords; i0++)                                                                   
        begin                                                                                                  
          pe1_lane12_strm1[i0]  = (i0 == 0                )  ? $shortrealtobits(11.0) :                   
                                 (i0 == (numOfExtWords-1))  ? $shortrealtobits(44.0) :                   
                                                              $shortrealtobits(2.0*i0) ;                 
          pe1_lane12_strm1[i0]  = (i0 == 0                )  ? $shortrealtobits(22.0) :                   
                                 (i0 == (numOfExtWords-1))  ? $shortrealtobits(33.0) :                   
                                                              $shortrealtobits(1.0*i0) ;                 
          fp_mac_expected_result += $bitstoshortreal(pe1_lane12_strm0[i0]) * $bitstoshortreal(pe1_lane12_strm1[i0]) ;                
        end                                                                                                    
      fp_mac_expected_result = 0 ;                
      for (int i0=0; i0<numOfExtWords; i0++)                                                                   
        begin                                                                                                  
          pe1_lane13_strm0[i0]  = (i0 == 0                )  ? $shortrealtobits(11.0) :                   
                                 (i0 == (numOfExtWords-1))  ? $shortrealtobits(44.0) :                   
                                                              $shortrealtobits(2.0*i0) ;                 
          pe1_lane13_strm0[i0]  = (i0 == 0                )  ? $shortrealtobits(22.0) :                   
                                 (i0 == (numOfExtWords-1))  ? $shortrealtobits(33.0) :                   
                                                              $shortrealtobits(1.0*i0) ;                 
          fp_mac_expected_result += $bitstoshortreal(pe1_lane13_strm0[i0]) * $bitstoshortreal(pe1_lane13_strm1[i0]) ;                
        end                                                                                                    
      fp_mac_expected_result = 0 ;                
      for (int i0=0; i0<numOfExtWords; i0++)                                                                   
        begin                                                                                                  
          pe1_lane13_strm1[i0]  = (i0 == 0                )  ? $shortrealtobits(11.0) :                   
                                 (i0 == (numOfExtWords-1))  ? $shortrealtobits(44.0) :                   
                                                              $shortrealtobits(2.0*i0) ;                 
          pe1_lane13_strm1[i0]  = (i0 == 0                )  ? $shortrealtobits(22.0) :                   
                                 (i0 == (numOfExtWords-1))  ? $shortrealtobits(33.0) :                   
                                                              $shortrealtobits(1.0*i0) ;                 
          fp_mac_expected_result += $bitstoshortreal(pe1_lane13_strm0[i0]) * $bitstoshortreal(pe1_lane13_strm1[i0]) ;                
        end                                                                                                    
      fp_mac_expected_result = 0 ;                
      for (int i0=0; i0<numOfExtWords; i0++)                                                                   
        begin                                                                                                  
          pe1_lane14_strm0[i0]  = (i0 == 0                )  ? $shortrealtobits(11.0) :                   
                                 (i0 == (numOfExtWords-1))  ? $shortrealtobits(44.0) :                   
                                                              $shortrealtobits(2.0*i0) ;                 
          pe1_lane14_strm0[i0]  = (i0 == 0                )  ? $shortrealtobits(22.0) :                   
                                 (i0 == (numOfExtWords-1))  ? $shortrealtobits(33.0) :                   
                                                              $shortrealtobits(1.0*i0) ;                 
          fp_mac_expected_result += $bitstoshortreal(pe1_lane14_strm0[i0]) * $bitstoshortreal(pe1_lane14_strm1[i0]) ;                
        end                                                                                                    
      fp_mac_expected_result = 0 ;                
      for (int i0=0; i0<numOfExtWords; i0++)                                                                   
        begin                                                                                                  
          pe1_lane14_strm1[i0]  = (i0 == 0                )  ? $shortrealtobits(11.0) :                   
                                 (i0 == (numOfExtWords-1))  ? $shortrealtobits(44.0) :                   
                                                              $shortrealtobits(2.0*i0) ;                 
          pe1_lane14_strm1[i0]  = (i0 == 0                )  ? $shortrealtobits(22.0) :                   
                                 (i0 == (numOfExtWords-1))  ? $shortrealtobits(33.0) :                   
                                                              $shortrealtobits(1.0*i0) ;                 
          fp_mac_expected_result += $bitstoshortreal(pe1_lane14_strm0[i0]) * $bitstoshortreal(pe1_lane14_strm1[i0]) ;                
        end                                                                                                    
      fp_mac_expected_result = 0 ;                
      for (int i0=0; i0<numOfExtWords; i0++)                                                                   
        begin                                                                                                  
          pe1_lane15_strm0[i0]  = (i0 == 0                )  ? $shortrealtobits(11.0) :                   
                                 (i0 == (numOfExtWords-1))  ? $shortrealtobits(44.0) :                   
                                                              $shortrealtobits(2.0*i0) ;                 
          pe1_lane15_strm0[i0]  = (i0 == 0                )  ? $shortrealtobits(22.0) :                   
                                 (i0 == (numOfExtWords-1))  ? $shortrealtobits(33.0) :                   
                                                              $shortrealtobits(1.0*i0) ;                 
          fp_mac_expected_result += $bitstoshortreal(pe1_lane15_strm0[i0]) * $bitstoshortreal(pe1_lane15_strm1[i0]) ;                
        end                                                                                                    
      fp_mac_expected_result = 0 ;                
      for (int i0=0; i0<numOfExtWords; i0++)                                                                   
        begin                                                                                                  
          pe1_lane15_strm1[i0]  = (i0 == 0                )  ? $shortrealtobits(11.0) :                   
                                 (i0 == (numOfExtWords-1))  ? $shortrealtobits(44.0) :                   
                                                              $shortrealtobits(2.0*i0) ;                 
          pe1_lane15_strm1[i0]  = (i0 == 0                )  ? $shortrealtobits(22.0) :                   
                                 (i0 == (numOfExtWords-1))  ? $shortrealtobits(33.0) :                   
                                                              $shortrealtobits(1.0*i0) ;                 
          fp_mac_expected_result += $bitstoshortreal(pe1_lane15_strm0[i0]) * $bitstoshortreal(pe1_lane15_strm1[i0]) ;                
        end                                                                                                    
      fp_mac_expected_result = 0 ;                
      for (int i0=0; i0<numOfExtWords; i0++)                                                                   
        begin                                                                                                  
          pe1_lane16_strm0[i0]  = (i0 == 0                )  ? $shortrealtobits(11.0) :                   
                                 (i0 == (numOfExtWords-1))  ? $shortrealtobits(44.0) :                   
                                                              $shortrealtobits(2.0*i0) ;                 
          pe1_lane16_strm0[i0]  = (i0 == 0                )  ? $shortrealtobits(22.0) :                   
                                 (i0 == (numOfExtWords-1))  ? $shortrealtobits(33.0) :                   
                                                              $shortrealtobits(1.0*i0) ;                 
          fp_mac_expected_result += $bitstoshortreal(pe1_lane16_strm0[i0]) * $bitstoshortreal(pe1_lane16_strm1[i0]) ;                
        end                                                                                                    
      fp_mac_expected_result = 0 ;                
      for (int i0=0; i0<numOfExtWords; i0++)                                                                   
        begin                                                                                                  
          pe1_lane16_strm1[i0]  = (i0 == 0                )  ? $shortrealtobits(11.0) :                   
                                 (i0 == (numOfExtWords-1))  ? $shortrealtobits(44.0) :                   
                                                              $shortrealtobits(2.0*i0) ;                 
          pe1_lane16_strm1[i0]  = (i0 == 0                )  ? $shortrealtobits(22.0) :                   
                                 (i0 == (numOfExtWords-1))  ? $shortrealtobits(33.0) :                   
                                                              $shortrealtobits(1.0*i0) ;                 
          fp_mac_expected_result += $bitstoshortreal(pe1_lane16_strm0[i0]) * $bitstoshortreal(pe1_lane16_strm1[i0]) ;                
        end                                                                                                    
      fp_mac_expected_result = 0 ;                
      for (int i0=0; i0<numOfExtWords; i0++)                                                                   
        begin                                                                                                  
          pe1_lane17_strm0[i0]  = (i0 == 0                )  ? $shortrealtobits(11.0) :                   
                                 (i0 == (numOfExtWords-1))  ? $shortrealtobits(44.0) :                   
                                                              $shortrealtobits(2.0*i0) ;                 
          pe1_lane17_strm0[i0]  = (i0 == 0                )  ? $shortrealtobits(22.0) :                   
                                 (i0 == (numOfExtWords-1))  ? $shortrealtobits(33.0) :                   
                                                              $shortrealtobits(1.0*i0) ;                 
          fp_mac_expected_result += $bitstoshortreal(pe1_lane17_strm0[i0]) * $bitstoshortreal(pe1_lane17_strm1[i0]) ;                
        end                                                                                                    
      fp_mac_expected_result = 0 ;                
      for (int i0=0; i0<numOfExtWords; i0++)                                                                   
        begin                                                                                                  
          pe1_lane17_strm1[i0]  = (i0 == 0                )  ? $shortrealtobits(11.0) :                   
                                 (i0 == (numOfExtWords-1))  ? $shortrealtobits(44.0) :                   
                                                              $shortrealtobits(2.0*i0) ;                 
          pe1_lane17_strm1[i0]  = (i0 == 0                )  ? $shortrealtobits(22.0) :                   
                                 (i0 == (numOfExtWords-1))  ? $shortrealtobits(33.0) :                   
                                                              $shortrealtobits(1.0*i0) ;                 
          fp_mac_expected_result += $bitstoshortreal(pe1_lane17_strm0[i0]) * $bitstoshortreal(pe1_lane17_strm1[i0]) ;                
        end                                                                                                    
      fp_mac_expected_result = 0 ;                
      for (int i0=0; i0<numOfExtWords; i0++)                                                                   
        begin                                                                                                  
          pe1_lane18_strm0[i0]  = (i0 == 0                )  ? $shortrealtobits(11.0) :                   
                                 (i0 == (numOfExtWords-1))  ? $shortrealtobits(44.0) :                   
                                                              $shortrealtobits(2.0*i0) ;                 
          pe1_lane18_strm0[i0]  = (i0 == 0                )  ? $shortrealtobits(22.0) :                   
                                 (i0 == (numOfExtWords-1))  ? $shortrealtobits(33.0) :                   
                                                              $shortrealtobits(1.0*i0) ;                 
          fp_mac_expected_result += $bitstoshortreal(pe1_lane18_strm0[i0]) * $bitstoshortreal(pe1_lane18_strm1[i0]) ;                
        end                                                                                                    
      fp_mac_expected_result = 0 ;                
      for (int i0=0; i0<numOfExtWords; i0++)                                                                   
        begin                                                                                                  
          pe1_lane18_strm1[i0]  = (i0 == 0                )  ? $shortrealtobits(11.0) :                   
                                 (i0 == (numOfExtWords-1))  ? $shortrealtobits(44.0) :                   
                                                              $shortrealtobits(2.0*i0) ;                 
          pe1_lane18_strm1[i0]  = (i0 == 0                )  ? $shortrealtobits(22.0) :                   
                                 (i0 == (numOfExtWords-1))  ? $shortrealtobits(33.0) :                   
                                                              $shortrealtobits(1.0*i0) ;                 
          fp_mac_expected_result += $bitstoshortreal(pe1_lane18_strm0[i0]) * $bitstoshortreal(pe1_lane18_strm1[i0]) ;                
        end                                                                                                    
      fp_mac_expected_result = 0 ;                
      for (int i0=0; i0<numOfExtWords; i0++)                                                                   
        begin                                                                                                  
          pe1_lane19_strm0[i0]  = (i0 == 0                )  ? $shortrealtobits(11.0) :                   
                                 (i0 == (numOfExtWords-1))  ? $shortrealtobits(44.0) :                   
                                                              $shortrealtobits(2.0*i0) ;                 
          pe1_lane19_strm0[i0]  = (i0 == 0                )  ? $shortrealtobits(22.0) :                   
                                 (i0 == (numOfExtWords-1))  ? $shortrealtobits(33.0) :                   
                                                              $shortrealtobits(1.0*i0) ;                 
          fp_mac_expected_result += $bitstoshortreal(pe1_lane19_strm0[i0]) * $bitstoshortreal(pe1_lane19_strm1[i0]) ;                
        end                                                                                                    
      fp_mac_expected_result = 0 ;                
      for (int i0=0; i0<numOfExtWords; i0++)                                                                   
        begin                                                                                                  
          pe1_lane19_strm1[i0]  = (i0 == 0                )  ? $shortrealtobits(11.0) :                   
                                 (i0 == (numOfExtWords-1))  ? $shortrealtobits(44.0) :                   
                                                              $shortrealtobits(2.0*i0) ;                 
          pe1_lane19_strm1[i0]  = (i0 == 0                )  ? $shortrealtobits(22.0) :                   
                                 (i0 == (numOfExtWords-1))  ? $shortrealtobits(33.0) :                   
                                                              $shortrealtobits(1.0*i0) ;                 
          fp_mac_expected_result += $bitstoshortreal(pe1_lane19_strm0[i0]) * $bitstoshortreal(pe1_lane19_strm1[i0]) ;                
        end                                                                                                    
      fp_mac_expected_result = 0 ;                
      for (int i0=0; i0<numOfExtWords; i0++)                                                                   
        begin                                                                                                  
          pe1_lane20_strm0[i0]  = (i0 == 0                )  ? $shortrealtobits(11.0) :                   
                                 (i0 == (numOfExtWords-1))  ? $shortrealtobits(44.0) :                   
                                                              $shortrealtobits(2.0*i0) ;                 
          pe1_lane20_strm0[i0]  = (i0 == 0                )  ? $shortrealtobits(22.0) :                   
                                 (i0 == (numOfExtWords-1))  ? $shortrealtobits(33.0) :                   
                                                              $shortrealtobits(1.0*i0) ;                 
          fp_mac_expected_result += $bitstoshortreal(pe1_lane20_strm0[i0]) * $bitstoshortreal(pe1_lane20_strm1[i0]) ;                
        end                                                                                                    
      fp_mac_expected_result = 0 ;                
      for (int i0=0; i0<numOfExtWords; i0++)                                                                   
        begin                                                                                                  
          pe1_lane20_strm1[i0]  = (i0 == 0                )  ? $shortrealtobits(11.0) :                   
                                 (i0 == (numOfExtWords-1))  ? $shortrealtobits(44.0) :                   
                                                              $shortrealtobits(2.0*i0) ;                 
          pe1_lane20_strm1[i0]  = (i0 == 0                )  ? $shortrealtobits(22.0) :                   
                                 (i0 == (numOfExtWords-1))  ? $shortrealtobits(33.0) :                   
                                                              $shortrealtobits(1.0*i0) ;                 
          fp_mac_expected_result += $bitstoshortreal(pe1_lane20_strm0[i0]) * $bitstoshortreal(pe1_lane20_strm1[i0]) ;                
        end                                                                                                    
      fp_mac_expected_result = 0 ;                
      for (int i0=0; i0<numOfExtWords; i0++)                                                                   
        begin                                                                                                  
          pe1_lane21_strm0[i0]  = (i0 == 0                )  ? $shortrealtobits(11.0) :                   
                                 (i0 == (numOfExtWords-1))  ? $shortrealtobits(44.0) :                   
                                                              $shortrealtobits(2.0*i0) ;                 
          pe1_lane21_strm0[i0]  = (i0 == 0                )  ? $shortrealtobits(22.0) :                   
                                 (i0 == (numOfExtWords-1))  ? $shortrealtobits(33.0) :                   
                                                              $shortrealtobits(1.0*i0) ;                 
          fp_mac_expected_result += $bitstoshortreal(pe1_lane21_strm0[i0]) * $bitstoshortreal(pe1_lane21_strm1[i0]) ;                
        end                                                                                                    
      fp_mac_expected_result = 0 ;                
      for (int i0=0; i0<numOfExtWords; i0++)                                                                   
        begin                                                                                                  
          pe1_lane21_strm1[i0]  = (i0 == 0                )  ? $shortrealtobits(11.0) :                   
                                 (i0 == (numOfExtWords-1))  ? $shortrealtobits(44.0) :                   
                                                              $shortrealtobits(2.0*i0) ;                 
          pe1_lane21_strm1[i0]  = (i0 == 0                )  ? $shortrealtobits(22.0) :                   
                                 (i0 == (numOfExtWords-1))  ? $shortrealtobits(33.0) :                   
                                                              $shortrealtobits(1.0*i0) ;                 
          fp_mac_expected_result += $bitstoshortreal(pe1_lane21_strm0[i0]) * $bitstoshortreal(pe1_lane21_strm1[i0]) ;                
        end                                                                                                    
      fp_mac_expected_result = 0 ;                
      for (int i0=0; i0<numOfExtWords; i0++)                                                                   
        begin                                                                                                  
          pe1_lane22_strm0[i0]  = (i0 == 0                )  ? $shortrealtobits(11.0) :                   
                                 (i0 == (numOfExtWords-1))  ? $shortrealtobits(44.0) :                   
                                                              $shortrealtobits(2.0*i0) ;                 
          pe1_lane22_strm0[i0]  = (i0 == 0                )  ? $shortrealtobits(22.0) :                   
                                 (i0 == (numOfExtWords-1))  ? $shortrealtobits(33.0) :                   
                                                              $shortrealtobits(1.0*i0) ;                 
          fp_mac_expected_result += $bitstoshortreal(pe1_lane22_strm0[i0]) * $bitstoshortreal(pe1_lane22_strm1[i0]) ;                
        end                                                                                                    
      fp_mac_expected_result = 0 ;                
      for (int i0=0; i0<numOfExtWords; i0++)                                                                   
        begin                                                                                                  
          pe1_lane22_strm1[i0]  = (i0 == 0                )  ? $shortrealtobits(11.0) :                   
                                 (i0 == (numOfExtWords-1))  ? $shortrealtobits(44.0) :                   
                                                              $shortrealtobits(2.0*i0) ;                 
          pe1_lane22_strm1[i0]  = (i0 == 0                )  ? $shortrealtobits(22.0) :                   
                                 (i0 == (numOfExtWords-1))  ? $shortrealtobits(33.0) :                   
                                                              $shortrealtobits(1.0*i0) ;                 
          fp_mac_expected_result += $bitstoshortreal(pe1_lane22_strm0[i0]) * $bitstoshortreal(pe1_lane22_strm1[i0]) ;                
        end                                                                                                    
      fp_mac_expected_result = 0 ;                
      for (int i0=0; i0<numOfExtWords; i0++)                                                                   
        begin                                                                                                  
          pe1_lane23_strm0[i0]  = (i0 == 0                )  ? $shortrealtobits(11.0) :                   
                                 (i0 == (numOfExtWords-1))  ? $shortrealtobits(44.0) :                   
                                                              $shortrealtobits(2.0*i0) ;                 
          pe1_lane23_strm0[i0]  = (i0 == 0                )  ? $shortrealtobits(22.0) :                   
                                 (i0 == (numOfExtWords-1))  ? $shortrealtobits(33.0) :                   
                                                              $shortrealtobits(1.0*i0) ;                 
          fp_mac_expected_result += $bitstoshortreal(pe1_lane23_strm0[i0]) * $bitstoshortreal(pe1_lane23_strm1[i0]) ;                
        end                                                                                                    
      fp_mac_expected_result = 0 ;                
      for (int i0=0; i0<numOfExtWords; i0++)                                                                   
        begin                                                                                                  
          pe1_lane23_strm1[i0]  = (i0 == 0                )  ? $shortrealtobits(11.0) :                   
                                 (i0 == (numOfExtWords-1))  ? $shortrealtobits(44.0) :                   
                                                              $shortrealtobits(2.0*i0) ;                 
          pe1_lane23_strm1[i0]  = (i0 == 0                )  ? $shortrealtobits(22.0) :                   
                                 (i0 == (numOfExtWords-1))  ? $shortrealtobits(33.0) :                   
                                                              $shortrealtobits(1.0*i0) ;                 
          fp_mac_expected_result += $bitstoshortreal(pe1_lane23_strm0[i0]) * $bitstoshortreal(pe1_lane23_strm1[i0]) ;                
        end                                                                                                    
      fp_mac_expected_result = 0 ;                
      for (int i0=0; i0<numOfExtWords; i0++)                                                                   
        begin                                                                                                  
          pe1_lane24_strm0[i0]  = (i0 == 0                )  ? $shortrealtobits(11.0) :                   
                                 (i0 == (numOfExtWords-1))  ? $shortrealtobits(44.0) :                   
                                                              $shortrealtobits(2.0*i0) ;                 
          pe1_lane24_strm0[i0]  = (i0 == 0                )  ? $shortrealtobits(22.0) :                   
                                 (i0 == (numOfExtWords-1))  ? $shortrealtobits(33.0) :                   
                                                              $shortrealtobits(1.0*i0) ;                 
          fp_mac_expected_result += $bitstoshortreal(pe1_lane24_strm0[i0]) * $bitstoshortreal(pe1_lane24_strm1[i0]) ;                
        end                                                                                                    
      fp_mac_expected_result = 0 ;                
      for (int i0=0; i0<numOfExtWords; i0++)                                                                   
        begin                                                                                                  
          pe1_lane24_strm1[i0]  = (i0 == 0                )  ? $shortrealtobits(11.0) :                   
                                 (i0 == (numOfExtWords-1))  ? $shortrealtobits(44.0) :                   
                                                              $shortrealtobits(2.0*i0) ;                 
          pe1_lane24_strm1[i0]  = (i0 == 0                )  ? $shortrealtobits(22.0) :                   
                                 (i0 == (numOfExtWords-1))  ? $shortrealtobits(33.0) :                   
                                                              $shortrealtobits(1.0*i0) ;                 
          fp_mac_expected_result += $bitstoshortreal(pe1_lane24_strm0[i0]) * $bitstoshortreal(pe1_lane24_strm1[i0]) ;                
        end                                                                                                    
      fp_mac_expected_result = 0 ;                
      for (int i0=0; i0<numOfExtWords; i0++)                                                                   
        begin                                                                                                  
          pe1_lane25_strm0[i0]  = (i0 == 0                )  ? $shortrealtobits(11.0) :                   
                                 (i0 == (numOfExtWords-1))  ? $shortrealtobits(44.0) :                   
                                                              $shortrealtobits(2.0*i0) ;                 
          pe1_lane25_strm0[i0]  = (i0 == 0                )  ? $shortrealtobits(22.0) :                   
                                 (i0 == (numOfExtWords-1))  ? $shortrealtobits(33.0) :                   
                                                              $shortrealtobits(1.0*i0) ;                 
          fp_mac_expected_result += $bitstoshortreal(pe1_lane25_strm0[i0]) * $bitstoshortreal(pe1_lane25_strm1[i0]) ;                
        end                                                                                                    
      fp_mac_expected_result = 0 ;                
      for (int i0=0; i0<numOfExtWords; i0++)                                                                   
        begin                                                                                                  
          pe1_lane25_strm1[i0]  = (i0 == 0                )  ? $shortrealtobits(11.0) :                   
                                 (i0 == (numOfExtWords-1))  ? $shortrealtobits(44.0) :                   
                                                              $shortrealtobits(2.0*i0) ;                 
          pe1_lane25_strm1[i0]  = (i0 == 0                )  ? $shortrealtobits(22.0) :                   
                                 (i0 == (numOfExtWords-1))  ? $shortrealtobits(33.0) :                   
                                                              $shortrealtobits(1.0*i0) ;                 
          fp_mac_expected_result += $bitstoshortreal(pe1_lane25_strm0[i0]) * $bitstoshortreal(pe1_lane25_strm1[i0]) ;                
        end                                                                                                    
      fp_mac_expected_result = 0 ;                
      for (int i0=0; i0<numOfExtWords; i0++)                                                                   
        begin                                                                                                  
          pe1_lane26_strm0[i0]  = (i0 == 0                )  ? $shortrealtobits(11.0) :                   
                                 (i0 == (numOfExtWords-1))  ? $shortrealtobits(44.0) :                   
                                                              $shortrealtobits(2.0*i0) ;                 
          pe1_lane26_strm0[i0]  = (i0 == 0                )  ? $shortrealtobits(22.0) :                   
                                 (i0 == (numOfExtWords-1))  ? $shortrealtobits(33.0) :                   
                                                              $shortrealtobits(1.0*i0) ;                 
          fp_mac_expected_result += $bitstoshortreal(pe1_lane26_strm0[i0]) * $bitstoshortreal(pe1_lane26_strm1[i0]) ;                
        end                                                                                                    
      fp_mac_expected_result = 0 ;                
      for (int i0=0; i0<numOfExtWords; i0++)                                                                   
        begin                                                                                                  
          pe1_lane26_strm1[i0]  = (i0 == 0                )  ? $shortrealtobits(11.0) :                   
                                 (i0 == (numOfExtWords-1))  ? $shortrealtobits(44.0) :                   
                                                              $shortrealtobits(2.0*i0) ;                 
          pe1_lane26_strm1[i0]  = (i0 == 0                )  ? $shortrealtobits(22.0) :                   
                                 (i0 == (numOfExtWords-1))  ? $shortrealtobits(33.0) :                   
                                                              $shortrealtobits(1.0*i0) ;                 
          fp_mac_expected_result += $bitstoshortreal(pe1_lane26_strm0[i0]) * $bitstoshortreal(pe1_lane26_strm1[i0]) ;                
        end                                                                                                    
      fp_mac_expected_result = 0 ;                
      for (int i0=0; i0<numOfExtWords; i0++)                                                                   
        begin                                                                                                  
          pe1_lane27_strm0[i0]  = (i0 == 0                )  ? $shortrealtobits(11.0) :                   
                                 (i0 == (numOfExtWords-1))  ? $shortrealtobits(44.0) :                   
                                                              $shortrealtobits(2.0*i0) ;                 
          pe1_lane27_strm0[i0]  = (i0 == 0                )  ? $shortrealtobits(22.0) :                   
                                 (i0 == (numOfExtWords-1))  ? $shortrealtobits(33.0) :                   
                                                              $shortrealtobits(1.0*i0) ;                 
          fp_mac_expected_result += $bitstoshortreal(pe1_lane27_strm0[i0]) * $bitstoshortreal(pe1_lane27_strm1[i0]) ;                
        end                                                                                                    
      fp_mac_expected_result = 0 ;                
      for (int i0=0; i0<numOfExtWords; i0++)                                                                   
        begin                                                                                                  
          pe1_lane27_strm1[i0]  = (i0 == 0                )  ? $shortrealtobits(11.0) :                   
                                 (i0 == (numOfExtWords-1))  ? $shortrealtobits(44.0) :                   
                                                              $shortrealtobits(2.0*i0) ;                 
          pe1_lane27_strm1[i0]  = (i0 == 0                )  ? $shortrealtobits(22.0) :                   
                                 (i0 == (numOfExtWords-1))  ? $shortrealtobits(33.0) :                   
                                                              $shortrealtobits(1.0*i0) ;                 
          fp_mac_expected_result += $bitstoshortreal(pe1_lane27_strm0[i0]) * $bitstoshortreal(pe1_lane27_strm1[i0]) ;                
        end                                                                                                    
      fp_mac_expected_result = 0 ;                
      for (int i0=0; i0<numOfExtWords; i0++)                                                                   
        begin                                                                                                  
          pe1_lane28_strm0[i0]  = (i0 == 0                )  ? $shortrealtobits(11.0) :                   
                                 (i0 == (numOfExtWords-1))  ? $shortrealtobits(44.0) :                   
                                                              $shortrealtobits(2.0*i0) ;                 
          pe1_lane28_strm0[i0]  = (i0 == 0                )  ? $shortrealtobits(22.0) :                   
                                 (i0 == (numOfExtWords-1))  ? $shortrealtobits(33.0) :                   
                                                              $shortrealtobits(1.0*i0) ;                 
          fp_mac_expected_result += $bitstoshortreal(pe1_lane28_strm0[i0]) * $bitstoshortreal(pe1_lane28_strm1[i0]) ;                
        end                                                                                                    
      fp_mac_expected_result = 0 ;                
      for (int i0=0; i0<numOfExtWords; i0++)                                                                   
        begin                                                                                                  
          pe1_lane28_strm1[i0]  = (i0 == 0                )  ? $shortrealtobits(11.0) :                   
                                 (i0 == (numOfExtWords-1))  ? $shortrealtobits(44.0) :                   
                                                              $shortrealtobits(2.0*i0) ;                 
          pe1_lane28_strm1[i0]  = (i0 == 0                )  ? $shortrealtobits(22.0) :                   
                                 (i0 == (numOfExtWords-1))  ? $shortrealtobits(33.0) :                   
                                                              $shortrealtobits(1.0*i0) ;                 
          fp_mac_expected_result += $bitstoshortreal(pe1_lane28_strm0[i0]) * $bitstoshortreal(pe1_lane28_strm1[i0]) ;                
        end                                                                                                    
      fp_mac_expected_result = 0 ;                
      for (int i0=0; i0<numOfExtWords; i0++)                                                                   
        begin                                                                                                  
          pe1_lane29_strm0[i0]  = (i0 == 0                )  ? $shortrealtobits(11.0) :                   
                                 (i0 == (numOfExtWords-1))  ? $shortrealtobits(44.0) :                   
                                                              $shortrealtobits(2.0*i0) ;                 
          pe1_lane29_strm0[i0]  = (i0 == 0                )  ? $shortrealtobits(22.0) :                   
                                 (i0 == (numOfExtWords-1))  ? $shortrealtobits(33.0) :                   
                                                              $shortrealtobits(1.0*i0) ;                 
          fp_mac_expected_result += $bitstoshortreal(pe1_lane29_strm0[i0]) * $bitstoshortreal(pe1_lane29_strm1[i0]) ;                
        end                                                                                                    
      fp_mac_expected_result = 0 ;                
      for (int i0=0; i0<numOfExtWords; i0++)                                                                   
        begin                                                                                                  
          pe1_lane29_strm1[i0]  = (i0 == 0                )  ? $shortrealtobits(11.0) :                   
                                 (i0 == (numOfExtWords-1))  ? $shortrealtobits(44.0) :                   
                                                              $shortrealtobits(2.0*i0) ;                 
          pe1_lane29_strm1[i0]  = (i0 == 0                )  ? $shortrealtobits(22.0) :                   
                                 (i0 == (numOfExtWords-1))  ? $shortrealtobits(33.0) :                   
                                                              $shortrealtobits(1.0*i0) ;                 
          fp_mac_expected_result += $bitstoshortreal(pe1_lane29_strm0[i0]) * $bitstoshortreal(pe1_lane29_strm1[i0]) ;                
        end                                                                                                    
      fp_mac_expected_result = 0 ;                
      for (int i0=0; i0<numOfExtWords; i0++)                                                                   
        begin                                                                                                  
          pe1_lane30_strm0[i0]  = (i0 == 0                )  ? $shortrealtobits(11.0) :                   
                                 (i0 == (numOfExtWords-1))  ? $shortrealtobits(44.0) :                   
                                                              $shortrealtobits(2.0*i0) ;                 
          pe1_lane30_strm0[i0]  = (i0 == 0                )  ? $shortrealtobits(22.0) :                   
                                 (i0 == (numOfExtWords-1))  ? $shortrealtobits(33.0) :                   
                                                              $shortrealtobits(1.0*i0) ;                 
          fp_mac_expected_result += $bitstoshortreal(pe1_lane30_strm0[i0]) * $bitstoshortreal(pe1_lane30_strm1[i0]) ;                
        end                                                                                                    
      fp_mac_expected_result = 0 ;                
      for (int i0=0; i0<numOfExtWords; i0++)                                                                   
        begin                                                                                                  
          pe1_lane30_strm1[i0]  = (i0 == 0                )  ? $shortrealtobits(11.0) :                   
                                 (i0 == (numOfExtWords-1))  ? $shortrealtobits(44.0) :                   
                                                              $shortrealtobits(2.0*i0) ;                 
          pe1_lane30_strm1[i0]  = (i0 == 0                )  ? $shortrealtobits(22.0) :                   
                                 (i0 == (numOfExtWords-1))  ? $shortrealtobits(33.0) :                   
                                                              $shortrealtobits(1.0*i0) ;                 
          fp_mac_expected_result += $bitstoshortreal(pe1_lane30_strm0[i0]) * $bitstoshortreal(pe1_lane30_strm1[i0]) ;                
        end                                                                                                    
      fp_mac_expected_result = 0 ;                
      for (int i0=0; i0<numOfExtWords; i0++)                                                                   
        begin                                                                                                  
          pe1_lane31_strm0[i0]  = (i0 == 0                )  ? $shortrealtobits(11.0) :                   
                                 (i0 == (numOfExtWords-1))  ? $shortrealtobits(44.0) :                   
                                                              $shortrealtobits(2.0*i0) ;                 
          pe1_lane31_strm0[i0]  = (i0 == 0                )  ? $shortrealtobits(22.0) :                   
                                 (i0 == (numOfExtWords-1))  ? $shortrealtobits(33.0) :                   
                                                              $shortrealtobits(1.0*i0) ;                 
          fp_mac_expected_result += $bitstoshortreal(pe1_lane31_strm0[i0]) * $bitstoshortreal(pe1_lane31_strm1[i0]) ;                
        end                                                                                                    
      fp_mac_expected_result = 0 ;                
      for (int i0=0; i0<numOfExtWords; i0++)                                                                   
        begin                                                                                                  
          pe1_lane31_strm1[i0]  = (i0 == 0                )  ? $shortrealtobits(11.0) :                   
                                 (i0 == (numOfExtWords-1))  ? $shortrealtobits(44.0) :                   
                                                              $shortrealtobits(2.0*i0) ;                 
          pe1_lane31_strm1[i0]  = (i0 == 0                )  ? $shortrealtobits(22.0) :                   
                                 (i0 == (numOfExtWords-1))  ? $shortrealtobits(33.0) :                   
                                                              $shortrealtobits(1.0*i0) ;                 
          fp_mac_expected_result += $bitstoshortreal(pe1_lane31_strm0[i0]) * $bitstoshortreal(pe1_lane31_strm1[i0]) ;                
        end                                                                                                    
  // PE 2  
      fp_mac_expected_result = 0 ;                
      for (int i0=0; i0<numOfExtWords; i0++)                                                                   
        begin                                                                                                  
          pe2_lane0_strm0[i0]  = (i0 == 0                )  ? $shortrealtobits(11.0) :                   
                                 (i0 == (numOfExtWords-1))  ? $shortrealtobits(44.0) :                   
                                                              $shortrealtobits(2.0*i0) ;                 
          pe2_lane0_strm0[i0]  = (i0 == 0                )  ? $shortrealtobits(22.0) :                   
                                 (i0 == (numOfExtWords-1))  ? $shortrealtobits(33.0) :                   
                                                              $shortrealtobits(1.0*i0) ;                 
          fp_mac_expected_result += $bitstoshortreal(pe2_lane0_strm0[i0]) * $bitstoshortreal(pe2_lane0_strm1[i0]) ;                
        end                                                                                                    
      fp_mac_expected_result = 0 ;                
      for (int i0=0; i0<numOfExtWords; i0++)                                                                   
        begin                                                                                                  
          pe2_lane0_strm1[i0]  = (i0 == 0                )  ? $shortrealtobits(11.0) :                   
                                 (i0 == (numOfExtWords-1))  ? $shortrealtobits(44.0) :                   
                                                              $shortrealtobits(2.0*i0) ;                 
          pe2_lane0_strm1[i0]  = (i0 == 0                )  ? $shortrealtobits(22.0) :                   
                                 (i0 == (numOfExtWords-1))  ? $shortrealtobits(33.0) :                   
                                                              $shortrealtobits(1.0*i0) ;                 
          fp_mac_expected_result += $bitstoshortreal(pe2_lane0_strm0[i0]) * $bitstoshortreal(pe2_lane0_strm1[i0]) ;                
        end                                                                                                    
      fp_mac_expected_result = 0 ;                
      for (int i0=0; i0<numOfExtWords; i0++)                                                                   
        begin                                                                                                  
          pe2_lane1_strm0[i0]  = (i0 == 0                )  ? $shortrealtobits(11.0) :                   
                                 (i0 == (numOfExtWords-1))  ? $shortrealtobits(44.0) :                   
                                                              $shortrealtobits(2.0*i0) ;                 
          pe2_lane1_strm0[i0]  = (i0 == 0                )  ? $shortrealtobits(22.0) :                   
                                 (i0 == (numOfExtWords-1))  ? $shortrealtobits(33.0) :                   
                                                              $shortrealtobits(1.0*i0) ;                 
          fp_mac_expected_result += $bitstoshortreal(pe2_lane1_strm0[i0]) * $bitstoshortreal(pe2_lane1_strm1[i0]) ;                
        end                                                                                                    
      fp_mac_expected_result = 0 ;                
      for (int i0=0; i0<numOfExtWords; i0++)                                                                   
        begin                                                                                                  
          pe2_lane1_strm1[i0]  = (i0 == 0                )  ? $shortrealtobits(11.0) :                   
                                 (i0 == (numOfExtWords-1))  ? $shortrealtobits(44.0) :                   
                                                              $shortrealtobits(2.0*i0) ;                 
          pe2_lane1_strm1[i0]  = (i0 == 0                )  ? $shortrealtobits(22.0) :                   
                                 (i0 == (numOfExtWords-1))  ? $shortrealtobits(33.0) :                   
                                                              $shortrealtobits(1.0*i0) ;                 
          fp_mac_expected_result += $bitstoshortreal(pe2_lane1_strm0[i0]) * $bitstoshortreal(pe2_lane1_strm1[i0]) ;                
        end                                                                                                    
      fp_mac_expected_result = 0 ;                
      for (int i0=0; i0<numOfExtWords; i0++)                                                                   
        begin                                                                                                  
          pe2_lane2_strm0[i0]  = (i0 == 0                )  ? $shortrealtobits(11.0) :                   
                                 (i0 == (numOfExtWords-1))  ? $shortrealtobits(44.0) :                   
                                                              $shortrealtobits(2.0*i0) ;                 
          pe2_lane2_strm0[i0]  = (i0 == 0                )  ? $shortrealtobits(22.0) :                   
                                 (i0 == (numOfExtWords-1))  ? $shortrealtobits(33.0) :                   
                                                              $shortrealtobits(1.0*i0) ;                 
          fp_mac_expected_result += $bitstoshortreal(pe2_lane2_strm0[i0]) * $bitstoshortreal(pe2_lane2_strm1[i0]) ;                
        end                                                                                                    
      fp_mac_expected_result = 0 ;                
      for (int i0=0; i0<numOfExtWords; i0++)                                                                   
        begin                                                                                                  
          pe2_lane2_strm1[i0]  = (i0 == 0                )  ? $shortrealtobits(11.0) :                   
                                 (i0 == (numOfExtWords-1))  ? $shortrealtobits(44.0) :                   
                                                              $shortrealtobits(2.0*i0) ;                 
          pe2_lane2_strm1[i0]  = (i0 == 0                )  ? $shortrealtobits(22.0) :                   
                                 (i0 == (numOfExtWords-1))  ? $shortrealtobits(33.0) :                   
                                                              $shortrealtobits(1.0*i0) ;                 
          fp_mac_expected_result += $bitstoshortreal(pe2_lane2_strm0[i0]) * $bitstoshortreal(pe2_lane2_strm1[i0]) ;                
        end                                                                                                    
      fp_mac_expected_result = 0 ;                
      for (int i0=0; i0<numOfExtWords; i0++)                                                                   
        begin                                                                                                  
          pe2_lane3_strm0[i0]  = (i0 == 0                )  ? $shortrealtobits(11.0) :                   
                                 (i0 == (numOfExtWords-1))  ? $shortrealtobits(44.0) :                   
                                                              $shortrealtobits(2.0*i0) ;                 
          pe2_lane3_strm0[i0]  = (i0 == 0                )  ? $shortrealtobits(22.0) :                   
                                 (i0 == (numOfExtWords-1))  ? $shortrealtobits(33.0) :                   
                                                              $shortrealtobits(1.0*i0) ;                 
          fp_mac_expected_result += $bitstoshortreal(pe2_lane3_strm0[i0]) * $bitstoshortreal(pe2_lane3_strm1[i0]) ;                
        end                                                                                                    
      fp_mac_expected_result = 0 ;                
      for (int i0=0; i0<numOfExtWords; i0++)                                                                   
        begin                                                                                                  
          pe2_lane3_strm1[i0]  = (i0 == 0                )  ? $shortrealtobits(11.0) :                   
                                 (i0 == (numOfExtWords-1))  ? $shortrealtobits(44.0) :                   
                                                              $shortrealtobits(2.0*i0) ;                 
          pe2_lane3_strm1[i0]  = (i0 == 0                )  ? $shortrealtobits(22.0) :                   
                                 (i0 == (numOfExtWords-1))  ? $shortrealtobits(33.0) :                   
                                                              $shortrealtobits(1.0*i0) ;                 
          fp_mac_expected_result += $bitstoshortreal(pe2_lane3_strm0[i0]) * $bitstoshortreal(pe2_lane3_strm1[i0]) ;                
        end                                                                                                    
      fp_mac_expected_result = 0 ;                
      for (int i0=0; i0<numOfExtWords; i0++)                                                                   
        begin                                                                                                  
          pe2_lane4_strm0[i0]  = (i0 == 0                )  ? $shortrealtobits(11.0) :                   
                                 (i0 == (numOfExtWords-1))  ? $shortrealtobits(44.0) :                   
                                                              $shortrealtobits(2.0*i0) ;                 
          pe2_lane4_strm0[i0]  = (i0 == 0                )  ? $shortrealtobits(22.0) :                   
                                 (i0 == (numOfExtWords-1))  ? $shortrealtobits(33.0) :                   
                                                              $shortrealtobits(1.0*i0) ;                 
          fp_mac_expected_result += $bitstoshortreal(pe2_lane4_strm0[i0]) * $bitstoshortreal(pe2_lane4_strm1[i0]) ;                
        end                                                                                                    
      fp_mac_expected_result = 0 ;                
      for (int i0=0; i0<numOfExtWords; i0++)                                                                   
        begin                                                                                                  
          pe2_lane4_strm1[i0]  = (i0 == 0                )  ? $shortrealtobits(11.0) :                   
                                 (i0 == (numOfExtWords-1))  ? $shortrealtobits(44.0) :                   
                                                              $shortrealtobits(2.0*i0) ;                 
          pe2_lane4_strm1[i0]  = (i0 == 0                )  ? $shortrealtobits(22.0) :                   
                                 (i0 == (numOfExtWords-1))  ? $shortrealtobits(33.0) :                   
                                                              $shortrealtobits(1.0*i0) ;                 
          fp_mac_expected_result += $bitstoshortreal(pe2_lane4_strm0[i0]) * $bitstoshortreal(pe2_lane4_strm1[i0]) ;                
        end                                                                                                    
      fp_mac_expected_result = 0 ;                
      for (int i0=0; i0<numOfExtWords; i0++)                                                                   
        begin                                                                                                  
          pe2_lane5_strm0[i0]  = (i0 == 0                )  ? $shortrealtobits(11.0) :                   
                                 (i0 == (numOfExtWords-1))  ? $shortrealtobits(44.0) :                   
                                                              $shortrealtobits(2.0*i0) ;                 
          pe2_lane5_strm0[i0]  = (i0 == 0                )  ? $shortrealtobits(22.0) :                   
                                 (i0 == (numOfExtWords-1))  ? $shortrealtobits(33.0) :                   
                                                              $shortrealtobits(1.0*i0) ;                 
          fp_mac_expected_result += $bitstoshortreal(pe2_lane5_strm0[i0]) * $bitstoshortreal(pe2_lane5_strm1[i0]) ;                
        end                                                                                                    
      fp_mac_expected_result = 0 ;                
      for (int i0=0; i0<numOfExtWords; i0++)                                                                   
        begin                                                                                                  
          pe2_lane5_strm1[i0]  = (i0 == 0                )  ? $shortrealtobits(11.0) :                   
                                 (i0 == (numOfExtWords-1))  ? $shortrealtobits(44.0) :                   
                                                              $shortrealtobits(2.0*i0) ;                 
          pe2_lane5_strm1[i0]  = (i0 == 0                )  ? $shortrealtobits(22.0) :                   
                                 (i0 == (numOfExtWords-1))  ? $shortrealtobits(33.0) :                   
                                                              $shortrealtobits(1.0*i0) ;                 
          fp_mac_expected_result += $bitstoshortreal(pe2_lane5_strm0[i0]) * $bitstoshortreal(pe2_lane5_strm1[i0]) ;                
        end                                                                                                    
      fp_mac_expected_result = 0 ;                
      for (int i0=0; i0<numOfExtWords; i0++)                                                                   
        begin                                                                                                  
          pe2_lane6_strm0[i0]  = (i0 == 0                )  ? $shortrealtobits(11.0) :                   
                                 (i0 == (numOfExtWords-1))  ? $shortrealtobits(44.0) :                   
                                                              $shortrealtobits(2.0*i0) ;                 
          pe2_lane6_strm0[i0]  = (i0 == 0                )  ? $shortrealtobits(22.0) :                   
                                 (i0 == (numOfExtWords-1))  ? $shortrealtobits(33.0) :                   
                                                              $shortrealtobits(1.0*i0) ;                 
          fp_mac_expected_result += $bitstoshortreal(pe2_lane6_strm0[i0]) * $bitstoshortreal(pe2_lane6_strm1[i0]) ;                
        end                                                                                                    
      fp_mac_expected_result = 0 ;                
      for (int i0=0; i0<numOfExtWords; i0++)                                                                   
        begin                                                                                                  
          pe2_lane6_strm1[i0]  = (i0 == 0                )  ? $shortrealtobits(11.0) :                   
                                 (i0 == (numOfExtWords-1))  ? $shortrealtobits(44.0) :                   
                                                              $shortrealtobits(2.0*i0) ;                 
          pe2_lane6_strm1[i0]  = (i0 == 0                )  ? $shortrealtobits(22.0) :                   
                                 (i0 == (numOfExtWords-1))  ? $shortrealtobits(33.0) :                   
                                                              $shortrealtobits(1.0*i0) ;                 
          fp_mac_expected_result += $bitstoshortreal(pe2_lane6_strm0[i0]) * $bitstoshortreal(pe2_lane6_strm1[i0]) ;                
        end                                                                                                    
      fp_mac_expected_result = 0 ;                
      for (int i0=0; i0<numOfExtWords; i0++)                                                                   
        begin                                                                                                  
          pe2_lane7_strm0[i0]  = (i0 == 0                )  ? $shortrealtobits(11.0) :                   
                                 (i0 == (numOfExtWords-1))  ? $shortrealtobits(44.0) :                   
                                                              $shortrealtobits(2.0*i0) ;                 
          pe2_lane7_strm0[i0]  = (i0 == 0                )  ? $shortrealtobits(22.0) :                   
                                 (i0 == (numOfExtWords-1))  ? $shortrealtobits(33.0) :                   
                                                              $shortrealtobits(1.0*i0) ;                 
          fp_mac_expected_result += $bitstoshortreal(pe2_lane7_strm0[i0]) * $bitstoshortreal(pe2_lane7_strm1[i0]) ;                
        end                                                                                                    
      fp_mac_expected_result = 0 ;                
      for (int i0=0; i0<numOfExtWords; i0++)                                                                   
        begin                                                                                                  
          pe2_lane7_strm1[i0]  = (i0 == 0                )  ? $shortrealtobits(11.0) :                   
                                 (i0 == (numOfExtWords-1))  ? $shortrealtobits(44.0) :                   
                                                              $shortrealtobits(2.0*i0) ;                 
          pe2_lane7_strm1[i0]  = (i0 == 0                )  ? $shortrealtobits(22.0) :                   
                                 (i0 == (numOfExtWords-1))  ? $shortrealtobits(33.0) :                   
                                                              $shortrealtobits(1.0*i0) ;                 
          fp_mac_expected_result += $bitstoshortreal(pe2_lane7_strm0[i0]) * $bitstoshortreal(pe2_lane7_strm1[i0]) ;                
        end                                                                                                    
      fp_mac_expected_result = 0 ;                
      for (int i0=0; i0<numOfExtWords; i0++)                                                                   
        begin                                                                                                  
          pe2_lane8_strm0[i0]  = (i0 == 0                )  ? $shortrealtobits(11.0) :                   
                                 (i0 == (numOfExtWords-1))  ? $shortrealtobits(44.0) :                   
                                                              $shortrealtobits(2.0*i0) ;                 
          pe2_lane8_strm0[i0]  = (i0 == 0                )  ? $shortrealtobits(22.0) :                   
                                 (i0 == (numOfExtWords-1))  ? $shortrealtobits(33.0) :                   
                                                              $shortrealtobits(1.0*i0) ;                 
          fp_mac_expected_result += $bitstoshortreal(pe2_lane8_strm0[i0]) * $bitstoshortreal(pe2_lane8_strm1[i0]) ;                
        end                                                                                                    
      fp_mac_expected_result = 0 ;                
      for (int i0=0; i0<numOfExtWords; i0++)                                                                   
        begin                                                                                                  
          pe2_lane8_strm1[i0]  = (i0 == 0                )  ? $shortrealtobits(11.0) :                   
                                 (i0 == (numOfExtWords-1))  ? $shortrealtobits(44.0) :                   
                                                              $shortrealtobits(2.0*i0) ;                 
          pe2_lane8_strm1[i0]  = (i0 == 0                )  ? $shortrealtobits(22.0) :                   
                                 (i0 == (numOfExtWords-1))  ? $shortrealtobits(33.0) :                   
                                                              $shortrealtobits(1.0*i0) ;                 
          fp_mac_expected_result += $bitstoshortreal(pe2_lane8_strm0[i0]) * $bitstoshortreal(pe2_lane8_strm1[i0]) ;                
        end                                                                                                    
      fp_mac_expected_result = 0 ;                
      for (int i0=0; i0<numOfExtWords; i0++)                                                                   
        begin                                                                                                  
          pe2_lane9_strm0[i0]  = (i0 == 0                )  ? $shortrealtobits(11.0) :                   
                                 (i0 == (numOfExtWords-1))  ? $shortrealtobits(44.0) :                   
                                                              $shortrealtobits(2.0*i0) ;                 
          pe2_lane9_strm0[i0]  = (i0 == 0                )  ? $shortrealtobits(22.0) :                   
                                 (i0 == (numOfExtWords-1))  ? $shortrealtobits(33.0) :                   
                                                              $shortrealtobits(1.0*i0) ;                 
          fp_mac_expected_result += $bitstoshortreal(pe2_lane9_strm0[i0]) * $bitstoshortreal(pe2_lane9_strm1[i0]) ;                
        end                                                                                                    
      fp_mac_expected_result = 0 ;                
      for (int i0=0; i0<numOfExtWords; i0++)                                                                   
        begin                                                                                                  
          pe2_lane9_strm1[i0]  = (i0 == 0                )  ? $shortrealtobits(11.0) :                   
                                 (i0 == (numOfExtWords-1))  ? $shortrealtobits(44.0) :                   
                                                              $shortrealtobits(2.0*i0) ;                 
          pe2_lane9_strm1[i0]  = (i0 == 0                )  ? $shortrealtobits(22.0) :                   
                                 (i0 == (numOfExtWords-1))  ? $shortrealtobits(33.0) :                   
                                                              $shortrealtobits(1.0*i0) ;                 
          fp_mac_expected_result += $bitstoshortreal(pe2_lane9_strm0[i0]) * $bitstoshortreal(pe2_lane9_strm1[i0]) ;                
        end                                                                                                    
      fp_mac_expected_result = 0 ;                
      for (int i0=0; i0<numOfExtWords; i0++)                                                                   
        begin                                                                                                  
          pe2_lane10_strm0[i0]  = (i0 == 0                )  ? $shortrealtobits(11.0) :                   
                                 (i0 == (numOfExtWords-1))  ? $shortrealtobits(44.0) :                   
                                                              $shortrealtobits(2.0*i0) ;                 
          pe2_lane10_strm0[i0]  = (i0 == 0                )  ? $shortrealtobits(22.0) :                   
                                 (i0 == (numOfExtWords-1))  ? $shortrealtobits(33.0) :                   
                                                              $shortrealtobits(1.0*i0) ;                 
          fp_mac_expected_result += $bitstoshortreal(pe2_lane10_strm0[i0]) * $bitstoshortreal(pe2_lane10_strm1[i0]) ;                
        end                                                                                                    
      fp_mac_expected_result = 0 ;                
      for (int i0=0; i0<numOfExtWords; i0++)                                                                   
        begin                                                                                                  
          pe2_lane10_strm1[i0]  = (i0 == 0                )  ? $shortrealtobits(11.0) :                   
                                 (i0 == (numOfExtWords-1))  ? $shortrealtobits(44.0) :                   
                                                              $shortrealtobits(2.0*i0) ;                 
          pe2_lane10_strm1[i0]  = (i0 == 0                )  ? $shortrealtobits(22.0) :                   
                                 (i0 == (numOfExtWords-1))  ? $shortrealtobits(33.0) :                   
                                                              $shortrealtobits(1.0*i0) ;                 
          fp_mac_expected_result += $bitstoshortreal(pe2_lane10_strm0[i0]) * $bitstoshortreal(pe2_lane10_strm1[i0]) ;                
        end                                                                                                    
      fp_mac_expected_result = 0 ;                
      for (int i0=0; i0<numOfExtWords; i0++)                                                                   
        begin                                                                                                  
          pe2_lane11_strm0[i0]  = (i0 == 0                )  ? $shortrealtobits(11.0) :                   
                                 (i0 == (numOfExtWords-1))  ? $shortrealtobits(44.0) :                   
                                                              $shortrealtobits(2.0*i0) ;                 
          pe2_lane11_strm0[i0]  = (i0 == 0                )  ? $shortrealtobits(22.0) :                   
                                 (i0 == (numOfExtWords-1))  ? $shortrealtobits(33.0) :                   
                                                              $shortrealtobits(1.0*i0) ;                 
          fp_mac_expected_result += $bitstoshortreal(pe2_lane11_strm0[i0]) * $bitstoshortreal(pe2_lane11_strm1[i0]) ;                
        end                                                                                                    
      fp_mac_expected_result = 0 ;                
      for (int i0=0; i0<numOfExtWords; i0++)                                                                   
        begin                                                                                                  
          pe2_lane11_strm1[i0]  = (i0 == 0                )  ? $shortrealtobits(11.0) :                   
                                 (i0 == (numOfExtWords-1))  ? $shortrealtobits(44.0) :                   
                                                              $shortrealtobits(2.0*i0) ;                 
          pe2_lane11_strm1[i0]  = (i0 == 0                )  ? $shortrealtobits(22.0) :                   
                                 (i0 == (numOfExtWords-1))  ? $shortrealtobits(33.0) :                   
                                                              $shortrealtobits(1.0*i0) ;                 
          fp_mac_expected_result += $bitstoshortreal(pe2_lane11_strm0[i0]) * $bitstoshortreal(pe2_lane11_strm1[i0]) ;                
        end                                                                                                    
      fp_mac_expected_result = 0 ;                
      for (int i0=0; i0<numOfExtWords; i0++)                                                                   
        begin                                                                                                  
          pe2_lane12_strm0[i0]  = (i0 == 0                )  ? $shortrealtobits(11.0) :                   
                                 (i0 == (numOfExtWords-1))  ? $shortrealtobits(44.0) :                   
                                                              $shortrealtobits(2.0*i0) ;                 
          pe2_lane12_strm0[i0]  = (i0 == 0                )  ? $shortrealtobits(22.0) :                   
                                 (i0 == (numOfExtWords-1))  ? $shortrealtobits(33.0) :                   
                                                              $shortrealtobits(1.0*i0) ;                 
          fp_mac_expected_result += $bitstoshortreal(pe2_lane12_strm0[i0]) * $bitstoshortreal(pe2_lane12_strm1[i0]) ;                
        end                                                                                                    
      fp_mac_expected_result = 0 ;                
      for (int i0=0; i0<numOfExtWords; i0++)                                                                   
        begin                                                                                                  
          pe2_lane12_strm1[i0]  = (i0 == 0                )  ? $shortrealtobits(11.0) :                   
                                 (i0 == (numOfExtWords-1))  ? $shortrealtobits(44.0) :                   
                                                              $shortrealtobits(2.0*i0) ;                 
          pe2_lane12_strm1[i0]  = (i0 == 0                )  ? $shortrealtobits(22.0) :                   
                                 (i0 == (numOfExtWords-1))  ? $shortrealtobits(33.0) :                   
                                                              $shortrealtobits(1.0*i0) ;                 
          fp_mac_expected_result += $bitstoshortreal(pe2_lane12_strm0[i0]) * $bitstoshortreal(pe2_lane12_strm1[i0]) ;                
        end                                                                                                    
      fp_mac_expected_result = 0 ;                
      for (int i0=0; i0<numOfExtWords; i0++)                                                                   
        begin                                                                                                  
          pe2_lane13_strm0[i0]  = (i0 == 0                )  ? $shortrealtobits(11.0) :                   
                                 (i0 == (numOfExtWords-1))  ? $shortrealtobits(44.0) :                   
                                                              $shortrealtobits(2.0*i0) ;                 
          pe2_lane13_strm0[i0]  = (i0 == 0                )  ? $shortrealtobits(22.0) :                   
                                 (i0 == (numOfExtWords-1))  ? $shortrealtobits(33.0) :                   
                                                              $shortrealtobits(1.0*i0) ;                 
          fp_mac_expected_result += $bitstoshortreal(pe2_lane13_strm0[i0]) * $bitstoshortreal(pe2_lane13_strm1[i0]) ;                
        end                                                                                                    
      fp_mac_expected_result = 0 ;                
      for (int i0=0; i0<numOfExtWords; i0++)                                                                   
        begin                                                                                                  
          pe2_lane13_strm1[i0]  = (i0 == 0                )  ? $shortrealtobits(11.0) :                   
                                 (i0 == (numOfExtWords-1))  ? $shortrealtobits(44.0) :                   
                                                              $shortrealtobits(2.0*i0) ;                 
          pe2_lane13_strm1[i0]  = (i0 == 0                )  ? $shortrealtobits(22.0) :                   
                                 (i0 == (numOfExtWords-1))  ? $shortrealtobits(33.0) :                   
                                                              $shortrealtobits(1.0*i0) ;                 
          fp_mac_expected_result += $bitstoshortreal(pe2_lane13_strm0[i0]) * $bitstoshortreal(pe2_lane13_strm1[i0]) ;                
        end                                                                                                    
      fp_mac_expected_result = 0 ;                
      for (int i0=0; i0<numOfExtWords; i0++)                                                                   
        begin                                                                                                  
          pe2_lane14_strm0[i0]  = (i0 == 0                )  ? $shortrealtobits(11.0) :                   
                                 (i0 == (numOfExtWords-1))  ? $shortrealtobits(44.0) :                   
                                                              $shortrealtobits(2.0*i0) ;                 
          pe2_lane14_strm0[i0]  = (i0 == 0                )  ? $shortrealtobits(22.0) :                   
                                 (i0 == (numOfExtWords-1))  ? $shortrealtobits(33.0) :                   
                                                              $shortrealtobits(1.0*i0) ;                 
          fp_mac_expected_result += $bitstoshortreal(pe2_lane14_strm0[i0]) * $bitstoshortreal(pe2_lane14_strm1[i0]) ;                
        end                                                                                                    
      fp_mac_expected_result = 0 ;                
      for (int i0=0; i0<numOfExtWords; i0++)                                                                   
        begin                                                                                                  
          pe2_lane14_strm1[i0]  = (i0 == 0                )  ? $shortrealtobits(11.0) :                   
                                 (i0 == (numOfExtWords-1))  ? $shortrealtobits(44.0) :                   
                                                              $shortrealtobits(2.0*i0) ;                 
          pe2_lane14_strm1[i0]  = (i0 == 0                )  ? $shortrealtobits(22.0) :                   
                                 (i0 == (numOfExtWords-1))  ? $shortrealtobits(33.0) :                   
                                                              $shortrealtobits(1.0*i0) ;                 
          fp_mac_expected_result += $bitstoshortreal(pe2_lane14_strm0[i0]) * $bitstoshortreal(pe2_lane14_strm1[i0]) ;                
        end                                                                                                    
      fp_mac_expected_result = 0 ;                
      for (int i0=0; i0<numOfExtWords; i0++)                                                                   
        begin                                                                                                  
          pe2_lane15_strm0[i0]  = (i0 == 0                )  ? $shortrealtobits(11.0) :                   
                                 (i0 == (numOfExtWords-1))  ? $shortrealtobits(44.0) :                   
                                                              $shortrealtobits(2.0*i0) ;                 
          pe2_lane15_strm0[i0]  = (i0 == 0                )  ? $shortrealtobits(22.0) :                   
                                 (i0 == (numOfExtWords-1))  ? $shortrealtobits(33.0) :                   
                                                              $shortrealtobits(1.0*i0) ;                 
          fp_mac_expected_result += $bitstoshortreal(pe2_lane15_strm0[i0]) * $bitstoshortreal(pe2_lane15_strm1[i0]) ;                
        end                                                                                                    
      fp_mac_expected_result = 0 ;                
      for (int i0=0; i0<numOfExtWords; i0++)                                                                   
        begin                                                                                                  
          pe2_lane15_strm1[i0]  = (i0 == 0                )  ? $shortrealtobits(11.0) :                   
                                 (i0 == (numOfExtWords-1))  ? $shortrealtobits(44.0) :                   
                                                              $shortrealtobits(2.0*i0) ;                 
          pe2_lane15_strm1[i0]  = (i0 == 0                )  ? $shortrealtobits(22.0) :                   
                                 (i0 == (numOfExtWords-1))  ? $shortrealtobits(33.0) :                   
                                                              $shortrealtobits(1.0*i0) ;                 
          fp_mac_expected_result += $bitstoshortreal(pe2_lane15_strm0[i0]) * $bitstoshortreal(pe2_lane15_strm1[i0]) ;                
        end                                                                                                    
      fp_mac_expected_result = 0 ;                
      for (int i0=0; i0<numOfExtWords; i0++)                                                                   
        begin                                                                                                  
          pe2_lane16_strm0[i0]  = (i0 == 0                )  ? $shortrealtobits(11.0) :                   
                                 (i0 == (numOfExtWords-1))  ? $shortrealtobits(44.0) :                   
                                                              $shortrealtobits(2.0*i0) ;                 
          pe2_lane16_strm0[i0]  = (i0 == 0                )  ? $shortrealtobits(22.0) :                   
                                 (i0 == (numOfExtWords-1))  ? $shortrealtobits(33.0) :                   
                                                              $shortrealtobits(1.0*i0) ;                 
          fp_mac_expected_result += $bitstoshortreal(pe2_lane16_strm0[i0]) * $bitstoshortreal(pe2_lane16_strm1[i0]) ;                
        end                                                                                                    
      fp_mac_expected_result = 0 ;                
      for (int i0=0; i0<numOfExtWords; i0++)                                                                   
        begin                                                                                                  
          pe2_lane16_strm1[i0]  = (i0 == 0                )  ? $shortrealtobits(11.0) :                   
                                 (i0 == (numOfExtWords-1))  ? $shortrealtobits(44.0) :                   
                                                              $shortrealtobits(2.0*i0) ;                 
          pe2_lane16_strm1[i0]  = (i0 == 0                )  ? $shortrealtobits(22.0) :                   
                                 (i0 == (numOfExtWords-1))  ? $shortrealtobits(33.0) :                   
                                                              $shortrealtobits(1.0*i0) ;                 
          fp_mac_expected_result += $bitstoshortreal(pe2_lane16_strm0[i0]) * $bitstoshortreal(pe2_lane16_strm1[i0]) ;                
        end                                                                                                    
      fp_mac_expected_result = 0 ;                
      for (int i0=0; i0<numOfExtWords; i0++)                                                                   
        begin                                                                                                  
          pe2_lane17_strm0[i0]  = (i0 == 0                )  ? $shortrealtobits(11.0) :                   
                                 (i0 == (numOfExtWords-1))  ? $shortrealtobits(44.0) :                   
                                                              $shortrealtobits(2.0*i0) ;                 
          pe2_lane17_strm0[i0]  = (i0 == 0                )  ? $shortrealtobits(22.0) :                   
                                 (i0 == (numOfExtWords-1))  ? $shortrealtobits(33.0) :                   
                                                              $shortrealtobits(1.0*i0) ;                 
          fp_mac_expected_result += $bitstoshortreal(pe2_lane17_strm0[i0]) * $bitstoshortreal(pe2_lane17_strm1[i0]) ;                
        end                                                                                                    
      fp_mac_expected_result = 0 ;                
      for (int i0=0; i0<numOfExtWords; i0++)                                                                   
        begin                                                                                                  
          pe2_lane17_strm1[i0]  = (i0 == 0                )  ? $shortrealtobits(11.0) :                   
                                 (i0 == (numOfExtWords-1))  ? $shortrealtobits(44.0) :                   
                                                              $shortrealtobits(2.0*i0) ;                 
          pe2_lane17_strm1[i0]  = (i0 == 0                )  ? $shortrealtobits(22.0) :                   
                                 (i0 == (numOfExtWords-1))  ? $shortrealtobits(33.0) :                   
                                                              $shortrealtobits(1.0*i0) ;                 
          fp_mac_expected_result += $bitstoshortreal(pe2_lane17_strm0[i0]) * $bitstoshortreal(pe2_lane17_strm1[i0]) ;                
        end                                                                                                    
      fp_mac_expected_result = 0 ;                
      for (int i0=0; i0<numOfExtWords; i0++)                                                                   
        begin                                                                                                  
          pe2_lane18_strm0[i0]  = (i0 == 0                )  ? $shortrealtobits(11.0) :                   
                                 (i0 == (numOfExtWords-1))  ? $shortrealtobits(44.0) :                   
                                                              $shortrealtobits(2.0*i0) ;                 
          pe2_lane18_strm0[i0]  = (i0 == 0                )  ? $shortrealtobits(22.0) :                   
                                 (i0 == (numOfExtWords-1))  ? $shortrealtobits(33.0) :                   
                                                              $shortrealtobits(1.0*i0) ;                 
          fp_mac_expected_result += $bitstoshortreal(pe2_lane18_strm0[i0]) * $bitstoshortreal(pe2_lane18_strm1[i0]) ;                
        end                                                                                                    
      fp_mac_expected_result = 0 ;                
      for (int i0=0; i0<numOfExtWords; i0++)                                                                   
        begin                                                                                                  
          pe2_lane18_strm1[i0]  = (i0 == 0                )  ? $shortrealtobits(11.0) :                   
                                 (i0 == (numOfExtWords-1))  ? $shortrealtobits(44.0) :                   
                                                              $shortrealtobits(2.0*i0) ;                 
          pe2_lane18_strm1[i0]  = (i0 == 0                )  ? $shortrealtobits(22.0) :                   
                                 (i0 == (numOfExtWords-1))  ? $shortrealtobits(33.0) :                   
                                                              $shortrealtobits(1.0*i0) ;                 
          fp_mac_expected_result += $bitstoshortreal(pe2_lane18_strm0[i0]) * $bitstoshortreal(pe2_lane18_strm1[i0]) ;                
        end                                                                                                    
      fp_mac_expected_result = 0 ;                
      for (int i0=0; i0<numOfExtWords; i0++)                                                                   
        begin                                                                                                  
          pe2_lane19_strm0[i0]  = (i0 == 0                )  ? $shortrealtobits(11.0) :                   
                                 (i0 == (numOfExtWords-1))  ? $shortrealtobits(44.0) :                   
                                                              $shortrealtobits(2.0*i0) ;                 
          pe2_lane19_strm0[i0]  = (i0 == 0                )  ? $shortrealtobits(22.0) :                   
                                 (i0 == (numOfExtWords-1))  ? $shortrealtobits(33.0) :                   
                                                              $shortrealtobits(1.0*i0) ;                 
          fp_mac_expected_result += $bitstoshortreal(pe2_lane19_strm0[i0]) * $bitstoshortreal(pe2_lane19_strm1[i0]) ;                
        end                                                                                                    
      fp_mac_expected_result = 0 ;                
      for (int i0=0; i0<numOfExtWords; i0++)                                                                   
        begin                                                                                                  
          pe2_lane19_strm1[i0]  = (i0 == 0                )  ? $shortrealtobits(11.0) :                   
                                 (i0 == (numOfExtWords-1))  ? $shortrealtobits(44.0) :                   
                                                              $shortrealtobits(2.0*i0) ;                 
          pe2_lane19_strm1[i0]  = (i0 == 0                )  ? $shortrealtobits(22.0) :                   
                                 (i0 == (numOfExtWords-1))  ? $shortrealtobits(33.0) :                   
                                                              $shortrealtobits(1.0*i0) ;                 
          fp_mac_expected_result += $bitstoshortreal(pe2_lane19_strm0[i0]) * $bitstoshortreal(pe2_lane19_strm1[i0]) ;                
        end                                                                                                    
      fp_mac_expected_result = 0 ;                
      for (int i0=0; i0<numOfExtWords; i0++)                                                                   
        begin                                                                                                  
          pe2_lane20_strm0[i0]  = (i0 == 0                )  ? $shortrealtobits(11.0) :                   
                                 (i0 == (numOfExtWords-1))  ? $shortrealtobits(44.0) :                   
                                                              $shortrealtobits(2.0*i0) ;                 
          pe2_lane20_strm0[i0]  = (i0 == 0                )  ? $shortrealtobits(22.0) :                   
                                 (i0 == (numOfExtWords-1))  ? $shortrealtobits(33.0) :                   
                                                              $shortrealtobits(1.0*i0) ;                 
          fp_mac_expected_result += $bitstoshortreal(pe2_lane20_strm0[i0]) * $bitstoshortreal(pe2_lane20_strm1[i0]) ;                
        end                                                                                                    
      fp_mac_expected_result = 0 ;                
      for (int i0=0; i0<numOfExtWords; i0++)                                                                   
        begin                                                                                                  
          pe2_lane20_strm1[i0]  = (i0 == 0                )  ? $shortrealtobits(11.0) :                   
                                 (i0 == (numOfExtWords-1))  ? $shortrealtobits(44.0) :                   
                                                              $shortrealtobits(2.0*i0) ;                 
          pe2_lane20_strm1[i0]  = (i0 == 0                )  ? $shortrealtobits(22.0) :                   
                                 (i0 == (numOfExtWords-1))  ? $shortrealtobits(33.0) :                   
                                                              $shortrealtobits(1.0*i0) ;                 
          fp_mac_expected_result += $bitstoshortreal(pe2_lane20_strm0[i0]) * $bitstoshortreal(pe2_lane20_strm1[i0]) ;                
        end                                                                                                    
      fp_mac_expected_result = 0 ;                
      for (int i0=0; i0<numOfExtWords; i0++)                                                                   
        begin                                                                                                  
          pe2_lane21_strm0[i0]  = (i0 == 0                )  ? $shortrealtobits(11.0) :                   
                                 (i0 == (numOfExtWords-1))  ? $shortrealtobits(44.0) :                   
                                                              $shortrealtobits(2.0*i0) ;                 
          pe2_lane21_strm0[i0]  = (i0 == 0                )  ? $shortrealtobits(22.0) :                   
                                 (i0 == (numOfExtWords-1))  ? $shortrealtobits(33.0) :                   
                                                              $shortrealtobits(1.0*i0) ;                 
          fp_mac_expected_result += $bitstoshortreal(pe2_lane21_strm0[i0]) * $bitstoshortreal(pe2_lane21_strm1[i0]) ;                
        end                                                                                                    
      fp_mac_expected_result = 0 ;                
      for (int i0=0; i0<numOfExtWords; i0++)                                                                   
        begin                                                                                                  
          pe2_lane21_strm1[i0]  = (i0 == 0                )  ? $shortrealtobits(11.0) :                   
                                 (i0 == (numOfExtWords-1))  ? $shortrealtobits(44.0) :                   
                                                              $shortrealtobits(2.0*i0) ;                 
          pe2_lane21_strm1[i0]  = (i0 == 0                )  ? $shortrealtobits(22.0) :                   
                                 (i0 == (numOfExtWords-1))  ? $shortrealtobits(33.0) :                   
                                                              $shortrealtobits(1.0*i0) ;                 
          fp_mac_expected_result += $bitstoshortreal(pe2_lane21_strm0[i0]) * $bitstoshortreal(pe2_lane21_strm1[i0]) ;                
        end                                                                                                    
      fp_mac_expected_result = 0 ;                
      for (int i0=0; i0<numOfExtWords; i0++)                                                                   
        begin                                                                                                  
          pe2_lane22_strm0[i0]  = (i0 == 0                )  ? $shortrealtobits(11.0) :                   
                                 (i0 == (numOfExtWords-1))  ? $shortrealtobits(44.0) :                   
                                                              $shortrealtobits(2.0*i0) ;                 
          pe2_lane22_strm0[i0]  = (i0 == 0                )  ? $shortrealtobits(22.0) :                   
                                 (i0 == (numOfExtWords-1))  ? $shortrealtobits(33.0) :                   
                                                              $shortrealtobits(1.0*i0) ;                 
          fp_mac_expected_result += $bitstoshortreal(pe2_lane22_strm0[i0]) * $bitstoshortreal(pe2_lane22_strm1[i0]) ;                
        end                                                                                                    
      fp_mac_expected_result = 0 ;                
      for (int i0=0; i0<numOfExtWords; i0++)                                                                   
        begin                                                                                                  
          pe2_lane22_strm1[i0]  = (i0 == 0                )  ? $shortrealtobits(11.0) :                   
                                 (i0 == (numOfExtWords-1))  ? $shortrealtobits(44.0) :                   
                                                              $shortrealtobits(2.0*i0) ;                 
          pe2_lane22_strm1[i0]  = (i0 == 0                )  ? $shortrealtobits(22.0) :                   
                                 (i0 == (numOfExtWords-1))  ? $shortrealtobits(33.0) :                   
                                                              $shortrealtobits(1.0*i0) ;                 
          fp_mac_expected_result += $bitstoshortreal(pe2_lane22_strm0[i0]) * $bitstoshortreal(pe2_lane22_strm1[i0]) ;                
        end                                                                                                    
      fp_mac_expected_result = 0 ;                
      for (int i0=0; i0<numOfExtWords; i0++)                                                                   
        begin                                                                                                  
          pe2_lane23_strm0[i0]  = (i0 == 0                )  ? $shortrealtobits(11.0) :                   
                                 (i0 == (numOfExtWords-1))  ? $shortrealtobits(44.0) :                   
                                                              $shortrealtobits(2.0*i0) ;                 
          pe2_lane23_strm0[i0]  = (i0 == 0                )  ? $shortrealtobits(22.0) :                   
                                 (i0 == (numOfExtWords-1))  ? $shortrealtobits(33.0) :                   
                                                              $shortrealtobits(1.0*i0) ;                 
          fp_mac_expected_result += $bitstoshortreal(pe2_lane23_strm0[i0]) * $bitstoshortreal(pe2_lane23_strm1[i0]) ;                
        end                                                                                                    
      fp_mac_expected_result = 0 ;                
      for (int i0=0; i0<numOfExtWords; i0++)                                                                   
        begin                                                                                                  
          pe2_lane23_strm1[i0]  = (i0 == 0                )  ? $shortrealtobits(11.0) :                   
                                 (i0 == (numOfExtWords-1))  ? $shortrealtobits(44.0) :                   
                                                              $shortrealtobits(2.0*i0) ;                 
          pe2_lane23_strm1[i0]  = (i0 == 0                )  ? $shortrealtobits(22.0) :                   
                                 (i0 == (numOfExtWords-1))  ? $shortrealtobits(33.0) :                   
                                                              $shortrealtobits(1.0*i0) ;                 
          fp_mac_expected_result += $bitstoshortreal(pe2_lane23_strm0[i0]) * $bitstoshortreal(pe2_lane23_strm1[i0]) ;                
        end                                                                                                    
      fp_mac_expected_result = 0 ;                
      for (int i0=0; i0<numOfExtWords; i0++)                                                                   
        begin                                                                                                  
          pe2_lane24_strm0[i0]  = (i0 == 0                )  ? $shortrealtobits(11.0) :                   
                                 (i0 == (numOfExtWords-1))  ? $shortrealtobits(44.0) :                   
                                                              $shortrealtobits(2.0*i0) ;                 
          pe2_lane24_strm0[i0]  = (i0 == 0                )  ? $shortrealtobits(22.0) :                   
                                 (i0 == (numOfExtWords-1))  ? $shortrealtobits(33.0) :                   
                                                              $shortrealtobits(1.0*i0) ;                 
          fp_mac_expected_result += $bitstoshortreal(pe2_lane24_strm0[i0]) * $bitstoshortreal(pe2_lane24_strm1[i0]) ;                
        end                                                                                                    
      fp_mac_expected_result = 0 ;                
      for (int i0=0; i0<numOfExtWords; i0++)                                                                   
        begin                                                                                                  
          pe2_lane24_strm1[i0]  = (i0 == 0                )  ? $shortrealtobits(11.0) :                   
                                 (i0 == (numOfExtWords-1))  ? $shortrealtobits(44.0) :                   
                                                              $shortrealtobits(2.0*i0) ;                 
          pe2_lane24_strm1[i0]  = (i0 == 0                )  ? $shortrealtobits(22.0) :                   
                                 (i0 == (numOfExtWords-1))  ? $shortrealtobits(33.0) :                   
                                                              $shortrealtobits(1.0*i0) ;                 
          fp_mac_expected_result += $bitstoshortreal(pe2_lane24_strm0[i0]) * $bitstoshortreal(pe2_lane24_strm1[i0]) ;                
        end                                                                                                    
      fp_mac_expected_result = 0 ;                
      for (int i0=0; i0<numOfExtWords; i0++)                                                                   
        begin                                                                                                  
          pe2_lane25_strm0[i0]  = (i0 == 0                )  ? $shortrealtobits(11.0) :                   
                                 (i0 == (numOfExtWords-1))  ? $shortrealtobits(44.0) :                   
                                                              $shortrealtobits(2.0*i0) ;                 
          pe2_lane25_strm0[i0]  = (i0 == 0                )  ? $shortrealtobits(22.0) :                   
                                 (i0 == (numOfExtWords-1))  ? $shortrealtobits(33.0) :                   
                                                              $shortrealtobits(1.0*i0) ;                 
          fp_mac_expected_result += $bitstoshortreal(pe2_lane25_strm0[i0]) * $bitstoshortreal(pe2_lane25_strm1[i0]) ;                
        end                                                                                                    
      fp_mac_expected_result = 0 ;                
      for (int i0=0; i0<numOfExtWords; i0++)                                                                   
        begin                                                                                                  
          pe2_lane25_strm1[i0]  = (i0 == 0                )  ? $shortrealtobits(11.0) :                   
                                 (i0 == (numOfExtWords-1))  ? $shortrealtobits(44.0) :                   
                                                              $shortrealtobits(2.0*i0) ;                 
          pe2_lane25_strm1[i0]  = (i0 == 0                )  ? $shortrealtobits(22.0) :                   
                                 (i0 == (numOfExtWords-1))  ? $shortrealtobits(33.0) :                   
                                                              $shortrealtobits(1.0*i0) ;                 
          fp_mac_expected_result += $bitstoshortreal(pe2_lane25_strm0[i0]) * $bitstoshortreal(pe2_lane25_strm1[i0]) ;                
        end                                                                                                    
      fp_mac_expected_result = 0 ;                
      for (int i0=0; i0<numOfExtWords; i0++)                                                                   
        begin                                                                                                  
          pe2_lane26_strm0[i0]  = (i0 == 0                )  ? $shortrealtobits(11.0) :                   
                                 (i0 == (numOfExtWords-1))  ? $shortrealtobits(44.0) :                   
                                                              $shortrealtobits(2.0*i0) ;                 
          pe2_lane26_strm0[i0]  = (i0 == 0                )  ? $shortrealtobits(22.0) :                   
                                 (i0 == (numOfExtWords-1))  ? $shortrealtobits(33.0) :                   
                                                              $shortrealtobits(1.0*i0) ;                 
          fp_mac_expected_result += $bitstoshortreal(pe2_lane26_strm0[i0]) * $bitstoshortreal(pe2_lane26_strm1[i0]) ;                
        end                                                                                                    
      fp_mac_expected_result = 0 ;                
      for (int i0=0; i0<numOfExtWords; i0++)                                                                   
        begin                                                                                                  
          pe2_lane26_strm1[i0]  = (i0 == 0                )  ? $shortrealtobits(11.0) :                   
                                 (i0 == (numOfExtWords-1))  ? $shortrealtobits(44.0) :                   
                                                              $shortrealtobits(2.0*i0) ;                 
          pe2_lane26_strm1[i0]  = (i0 == 0                )  ? $shortrealtobits(22.0) :                   
                                 (i0 == (numOfExtWords-1))  ? $shortrealtobits(33.0) :                   
                                                              $shortrealtobits(1.0*i0) ;                 
          fp_mac_expected_result += $bitstoshortreal(pe2_lane26_strm0[i0]) * $bitstoshortreal(pe2_lane26_strm1[i0]) ;                
        end                                                                                                    
      fp_mac_expected_result = 0 ;                
      for (int i0=0; i0<numOfExtWords; i0++)                                                                   
        begin                                                                                                  
          pe2_lane27_strm0[i0]  = (i0 == 0                )  ? $shortrealtobits(11.0) :                   
                                 (i0 == (numOfExtWords-1))  ? $shortrealtobits(44.0) :                   
                                                              $shortrealtobits(2.0*i0) ;                 
          pe2_lane27_strm0[i0]  = (i0 == 0                )  ? $shortrealtobits(22.0) :                   
                                 (i0 == (numOfExtWords-1))  ? $shortrealtobits(33.0) :                   
                                                              $shortrealtobits(1.0*i0) ;                 
          fp_mac_expected_result += $bitstoshortreal(pe2_lane27_strm0[i0]) * $bitstoshortreal(pe2_lane27_strm1[i0]) ;                
        end                                                                                                    
      fp_mac_expected_result = 0 ;                
      for (int i0=0; i0<numOfExtWords; i0++)                                                                   
        begin                                                                                                  
          pe2_lane27_strm1[i0]  = (i0 == 0                )  ? $shortrealtobits(11.0) :                   
                                 (i0 == (numOfExtWords-1))  ? $shortrealtobits(44.0) :                   
                                                              $shortrealtobits(2.0*i0) ;                 
          pe2_lane27_strm1[i0]  = (i0 == 0                )  ? $shortrealtobits(22.0) :                   
                                 (i0 == (numOfExtWords-1))  ? $shortrealtobits(33.0) :                   
                                                              $shortrealtobits(1.0*i0) ;                 
          fp_mac_expected_result += $bitstoshortreal(pe2_lane27_strm0[i0]) * $bitstoshortreal(pe2_lane27_strm1[i0]) ;                
        end                                                                                                    
      fp_mac_expected_result = 0 ;                
      for (int i0=0; i0<numOfExtWords; i0++)                                                                   
        begin                                                                                                  
          pe2_lane28_strm0[i0]  = (i0 == 0                )  ? $shortrealtobits(11.0) :                   
                                 (i0 == (numOfExtWords-1))  ? $shortrealtobits(44.0) :                   
                                                              $shortrealtobits(2.0*i0) ;                 
          pe2_lane28_strm0[i0]  = (i0 == 0                )  ? $shortrealtobits(22.0) :                   
                                 (i0 == (numOfExtWords-1))  ? $shortrealtobits(33.0) :                   
                                                              $shortrealtobits(1.0*i0) ;                 
          fp_mac_expected_result += $bitstoshortreal(pe2_lane28_strm0[i0]) * $bitstoshortreal(pe2_lane28_strm1[i0]) ;                
        end                                                                                                    
      fp_mac_expected_result = 0 ;                
      for (int i0=0; i0<numOfExtWords; i0++)                                                                   
        begin                                                                                                  
          pe2_lane28_strm1[i0]  = (i0 == 0                )  ? $shortrealtobits(11.0) :                   
                                 (i0 == (numOfExtWords-1))  ? $shortrealtobits(44.0) :                   
                                                              $shortrealtobits(2.0*i0) ;                 
          pe2_lane28_strm1[i0]  = (i0 == 0                )  ? $shortrealtobits(22.0) :                   
                                 (i0 == (numOfExtWords-1))  ? $shortrealtobits(33.0) :                   
                                                              $shortrealtobits(1.0*i0) ;                 
          fp_mac_expected_result += $bitstoshortreal(pe2_lane28_strm0[i0]) * $bitstoshortreal(pe2_lane28_strm1[i0]) ;                
        end                                                                                                    
      fp_mac_expected_result = 0 ;                
      for (int i0=0; i0<numOfExtWords; i0++)                                                                   
        begin                                                                                                  
          pe2_lane29_strm0[i0]  = (i0 == 0                )  ? $shortrealtobits(11.0) :                   
                                 (i0 == (numOfExtWords-1))  ? $shortrealtobits(44.0) :                   
                                                              $shortrealtobits(2.0*i0) ;                 
          pe2_lane29_strm0[i0]  = (i0 == 0                )  ? $shortrealtobits(22.0) :                   
                                 (i0 == (numOfExtWords-1))  ? $shortrealtobits(33.0) :                   
                                                              $shortrealtobits(1.0*i0) ;                 
          fp_mac_expected_result += $bitstoshortreal(pe2_lane29_strm0[i0]) * $bitstoshortreal(pe2_lane29_strm1[i0]) ;                
        end                                                                                                    
      fp_mac_expected_result = 0 ;                
      for (int i0=0; i0<numOfExtWords; i0++)                                                                   
        begin                                                                                                  
          pe2_lane29_strm1[i0]  = (i0 == 0                )  ? $shortrealtobits(11.0) :                   
                                 (i0 == (numOfExtWords-1))  ? $shortrealtobits(44.0) :                   
                                                              $shortrealtobits(2.0*i0) ;                 
          pe2_lane29_strm1[i0]  = (i0 == 0                )  ? $shortrealtobits(22.0) :                   
                                 (i0 == (numOfExtWords-1))  ? $shortrealtobits(33.0) :                   
                                                              $shortrealtobits(1.0*i0) ;                 
          fp_mac_expected_result += $bitstoshortreal(pe2_lane29_strm0[i0]) * $bitstoshortreal(pe2_lane29_strm1[i0]) ;                
        end                                                                                                    
      fp_mac_expected_result = 0 ;                
      for (int i0=0; i0<numOfExtWords; i0++)                                                                   
        begin                                                                                                  
          pe2_lane30_strm0[i0]  = (i0 == 0                )  ? $shortrealtobits(11.0) :                   
                                 (i0 == (numOfExtWords-1))  ? $shortrealtobits(44.0) :                   
                                                              $shortrealtobits(2.0*i0) ;                 
          pe2_lane30_strm0[i0]  = (i0 == 0                )  ? $shortrealtobits(22.0) :                   
                                 (i0 == (numOfExtWords-1))  ? $shortrealtobits(33.0) :                   
                                                              $shortrealtobits(1.0*i0) ;                 
          fp_mac_expected_result += $bitstoshortreal(pe2_lane30_strm0[i0]) * $bitstoshortreal(pe2_lane30_strm1[i0]) ;                
        end                                                                                                    
      fp_mac_expected_result = 0 ;                
      for (int i0=0; i0<numOfExtWords; i0++)                                                                   
        begin                                                                                                  
          pe2_lane30_strm1[i0]  = (i0 == 0                )  ? $shortrealtobits(11.0) :                   
                                 (i0 == (numOfExtWords-1))  ? $shortrealtobits(44.0) :                   
                                                              $shortrealtobits(2.0*i0) ;                 
          pe2_lane30_strm1[i0]  = (i0 == 0                )  ? $shortrealtobits(22.0) :                   
                                 (i0 == (numOfExtWords-1))  ? $shortrealtobits(33.0) :                   
                                                              $shortrealtobits(1.0*i0) ;                 
          fp_mac_expected_result += $bitstoshortreal(pe2_lane30_strm0[i0]) * $bitstoshortreal(pe2_lane30_strm1[i0]) ;                
        end                                                                                                    
      fp_mac_expected_result = 0 ;                
      for (int i0=0; i0<numOfExtWords; i0++)                                                                   
        begin                                                                                                  
          pe2_lane31_strm0[i0]  = (i0 == 0                )  ? $shortrealtobits(11.0) :                   
                                 (i0 == (numOfExtWords-1))  ? $shortrealtobits(44.0) :                   
                                                              $shortrealtobits(2.0*i0) ;                 
          pe2_lane31_strm0[i0]  = (i0 == 0                )  ? $shortrealtobits(22.0) :                   
                                 (i0 == (numOfExtWords-1))  ? $shortrealtobits(33.0) :                   
                                                              $shortrealtobits(1.0*i0) ;                 
          fp_mac_expected_result += $bitstoshortreal(pe2_lane31_strm0[i0]) * $bitstoshortreal(pe2_lane31_strm1[i0]) ;                
        end                                                                                                    
      fp_mac_expected_result = 0 ;                
      for (int i0=0; i0<numOfExtWords; i0++)                                                                   
        begin                                                                                                  
          pe2_lane31_strm1[i0]  = (i0 == 0                )  ? $shortrealtobits(11.0) :                   
                                 (i0 == (numOfExtWords-1))  ? $shortrealtobits(44.0) :                   
                                                              $shortrealtobits(2.0*i0) ;                 
          pe2_lane31_strm1[i0]  = (i0 == 0                )  ? $shortrealtobits(22.0) :                   
                                 (i0 == (numOfExtWords-1))  ? $shortrealtobits(33.0) :                   
                                                              $shortrealtobits(1.0*i0) ;                 
          fp_mac_expected_result += $bitstoshortreal(pe2_lane31_strm0[i0]) * $bitstoshortreal(pe2_lane31_strm1[i0]) ;                
        end                                                                                                    
  // PE 3  
      fp_mac_expected_result = 0 ;                
      for (int i0=0; i0<numOfExtWords; i0++)                                                                   
        begin                                                                                                  
          pe3_lane0_strm0[i0]  = (i0 == 0                )  ? $shortrealtobits(11.0) :                   
                                 (i0 == (numOfExtWords-1))  ? $shortrealtobits(44.0) :                   
                                                              $shortrealtobits(2.0*i0) ;                 
          pe3_lane0_strm0[i0]  = (i0 == 0                )  ? $shortrealtobits(22.0) :                   
                                 (i0 == (numOfExtWords-1))  ? $shortrealtobits(33.0) :                   
                                                              $shortrealtobits(1.0*i0) ;                 
          fp_mac_expected_result += $bitstoshortreal(pe3_lane0_strm0[i0]) * $bitstoshortreal(pe3_lane0_strm1[i0]) ;                
        end                                                                                                    
      fp_mac_expected_result = 0 ;                
      for (int i0=0; i0<numOfExtWords; i0++)                                                                   
        begin                                                                                                  
          pe3_lane0_strm1[i0]  = (i0 == 0                )  ? $shortrealtobits(11.0) :                   
                                 (i0 == (numOfExtWords-1))  ? $shortrealtobits(44.0) :                   
                                                              $shortrealtobits(2.0*i0) ;                 
          pe3_lane0_strm1[i0]  = (i0 == 0                )  ? $shortrealtobits(22.0) :                   
                                 (i0 == (numOfExtWords-1))  ? $shortrealtobits(33.0) :                   
                                                              $shortrealtobits(1.0*i0) ;                 
          fp_mac_expected_result += $bitstoshortreal(pe3_lane0_strm0[i0]) * $bitstoshortreal(pe3_lane0_strm1[i0]) ;                
        end                                                                                                    
      fp_mac_expected_result = 0 ;                
      for (int i0=0; i0<numOfExtWords; i0++)                                                                   
        begin                                                                                                  
          pe3_lane1_strm0[i0]  = (i0 == 0                )  ? $shortrealtobits(11.0) :                   
                                 (i0 == (numOfExtWords-1))  ? $shortrealtobits(44.0) :                   
                                                              $shortrealtobits(2.0*i0) ;                 
          pe3_lane1_strm0[i0]  = (i0 == 0                )  ? $shortrealtobits(22.0) :                   
                                 (i0 == (numOfExtWords-1))  ? $shortrealtobits(33.0) :                   
                                                              $shortrealtobits(1.0*i0) ;                 
          fp_mac_expected_result += $bitstoshortreal(pe3_lane1_strm0[i0]) * $bitstoshortreal(pe3_lane1_strm1[i0]) ;                
        end                                                                                                    
      fp_mac_expected_result = 0 ;                
      for (int i0=0; i0<numOfExtWords; i0++)                                                                   
        begin                                                                                                  
          pe3_lane1_strm1[i0]  = (i0 == 0                )  ? $shortrealtobits(11.0) :                   
                                 (i0 == (numOfExtWords-1))  ? $shortrealtobits(44.0) :                   
                                                              $shortrealtobits(2.0*i0) ;                 
          pe3_lane1_strm1[i0]  = (i0 == 0                )  ? $shortrealtobits(22.0) :                   
                                 (i0 == (numOfExtWords-1))  ? $shortrealtobits(33.0) :                   
                                                              $shortrealtobits(1.0*i0) ;                 
          fp_mac_expected_result += $bitstoshortreal(pe3_lane1_strm0[i0]) * $bitstoshortreal(pe3_lane1_strm1[i0]) ;                
        end                                                                                                    
      fp_mac_expected_result = 0 ;                
      for (int i0=0; i0<numOfExtWords; i0++)                                                                   
        begin                                                                                                  
          pe3_lane2_strm0[i0]  = (i0 == 0                )  ? $shortrealtobits(11.0) :                   
                                 (i0 == (numOfExtWords-1))  ? $shortrealtobits(44.0) :                   
                                                              $shortrealtobits(2.0*i0) ;                 
          pe3_lane2_strm0[i0]  = (i0 == 0                )  ? $shortrealtobits(22.0) :                   
                                 (i0 == (numOfExtWords-1))  ? $shortrealtobits(33.0) :                   
                                                              $shortrealtobits(1.0*i0) ;                 
          fp_mac_expected_result += $bitstoshortreal(pe3_lane2_strm0[i0]) * $bitstoshortreal(pe3_lane2_strm1[i0]) ;                
        end                                                                                                    
      fp_mac_expected_result = 0 ;                
      for (int i0=0; i0<numOfExtWords; i0++)                                                                   
        begin                                                                                                  
          pe3_lane2_strm1[i0]  = (i0 == 0                )  ? $shortrealtobits(11.0) :                   
                                 (i0 == (numOfExtWords-1))  ? $shortrealtobits(44.0) :                   
                                                              $shortrealtobits(2.0*i0) ;                 
          pe3_lane2_strm1[i0]  = (i0 == 0                )  ? $shortrealtobits(22.0) :                   
                                 (i0 == (numOfExtWords-1))  ? $shortrealtobits(33.0) :                   
                                                              $shortrealtobits(1.0*i0) ;                 
          fp_mac_expected_result += $bitstoshortreal(pe3_lane2_strm0[i0]) * $bitstoshortreal(pe3_lane2_strm1[i0]) ;                
        end                                                                                                    
      fp_mac_expected_result = 0 ;                
      for (int i0=0; i0<numOfExtWords; i0++)                                                                   
        begin                                                                                                  
          pe3_lane3_strm0[i0]  = (i0 == 0                )  ? $shortrealtobits(11.0) :                   
                                 (i0 == (numOfExtWords-1))  ? $shortrealtobits(44.0) :                   
                                                              $shortrealtobits(2.0*i0) ;                 
          pe3_lane3_strm0[i0]  = (i0 == 0                )  ? $shortrealtobits(22.0) :                   
                                 (i0 == (numOfExtWords-1))  ? $shortrealtobits(33.0) :                   
                                                              $shortrealtobits(1.0*i0) ;                 
          fp_mac_expected_result += $bitstoshortreal(pe3_lane3_strm0[i0]) * $bitstoshortreal(pe3_lane3_strm1[i0]) ;                
        end                                                                                                    
      fp_mac_expected_result = 0 ;                
      for (int i0=0; i0<numOfExtWords; i0++)                                                                   
        begin                                                                                                  
          pe3_lane3_strm1[i0]  = (i0 == 0                )  ? $shortrealtobits(11.0) :                   
                                 (i0 == (numOfExtWords-1))  ? $shortrealtobits(44.0) :                   
                                                              $shortrealtobits(2.0*i0) ;                 
          pe3_lane3_strm1[i0]  = (i0 == 0                )  ? $shortrealtobits(22.0) :                   
                                 (i0 == (numOfExtWords-1))  ? $shortrealtobits(33.0) :                   
                                                              $shortrealtobits(1.0*i0) ;                 
          fp_mac_expected_result += $bitstoshortreal(pe3_lane3_strm0[i0]) * $bitstoshortreal(pe3_lane3_strm1[i0]) ;                
        end                                                                                                    
      fp_mac_expected_result = 0 ;                
      for (int i0=0; i0<numOfExtWords; i0++)                                                                   
        begin                                                                                                  
          pe3_lane4_strm0[i0]  = (i0 == 0                )  ? $shortrealtobits(11.0) :                   
                                 (i0 == (numOfExtWords-1))  ? $shortrealtobits(44.0) :                   
                                                              $shortrealtobits(2.0*i0) ;                 
          pe3_lane4_strm0[i0]  = (i0 == 0                )  ? $shortrealtobits(22.0) :                   
                                 (i0 == (numOfExtWords-1))  ? $shortrealtobits(33.0) :                   
                                                              $shortrealtobits(1.0*i0) ;                 
          fp_mac_expected_result += $bitstoshortreal(pe3_lane4_strm0[i0]) * $bitstoshortreal(pe3_lane4_strm1[i0]) ;                
        end                                                                                                    
      fp_mac_expected_result = 0 ;                
      for (int i0=0; i0<numOfExtWords; i0++)                                                                   
        begin                                                                                                  
          pe3_lane4_strm1[i0]  = (i0 == 0                )  ? $shortrealtobits(11.0) :                   
                                 (i0 == (numOfExtWords-1))  ? $shortrealtobits(44.0) :                   
                                                              $shortrealtobits(2.0*i0) ;                 
          pe3_lane4_strm1[i0]  = (i0 == 0                )  ? $shortrealtobits(22.0) :                   
                                 (i0 == (numOfExtWords-1))  ? $shortrealtobits(33.0) :                   
                                                              $shortrealtobits(1.0*i0) ;                 
          fp_mac_expected_result += $bitstoshortreal(pe3_lane4_strm0[i0]) * $bitstoshortreal(pe3_lane4_strm1[i0]) ;                
        end                                                                                                    
      fp_mac_expected_result = 0 ;                
      for (int i0=0; i0<numOfExtWords; i0++)                                                                   
        begin                                                                                                  
          pe3_lane5_strm0[i0]  = (i0 == 0                )  ? $shortrealtobits(11.0) :                   
                                 (i0 == (numOfExtWords-1))  ? $shortrealtobits(44.0) :                   
                                                              $shortrealtobits(2.0*i0) ;                 
          pe3_lane5_strm0[i0]  = (i0 == 0                )  ? $shortrealtobits(22.0) :                   
                                 (i0 == (numOfExtWords-1))  ? $shortrealtobits(33.0) :                   
                                                              $shortrealtobits(1.0*i0) ;                 
          fp_mac_expected_result += $bitstoshortreal(pe3_lane5_strm0[i0]) * $bitstoshortreal(pe3_lane5_strm1[i0]) ;                
        end                                                                                                    
      fp_mac_expected_result = 0 ;                
      for (int i0=0; i0<numOfExtWords; i0++)                                                                   
        begin                                                                                                  
          pe3_lane5_strm1[i0]  = (i0 == 0                )  ? $shortrealtobits(11.0) :                   
                                 (i0 == (numOfExtWords-1))  ? $shortrealtobits(44.0) :                   
                                                              $shortrealtobits(2.0*i0) ;                 
          pe3_lane5_strm1[i0]  = (i0 == 0                )  ? $shortrealtobits(22.0) :                   
                                 (i0 == (numOfExtWords-1))  ? $shortrealtobits(33.0) :                   
                                                              $shortrealtobits(1.0*i0) ;                 
          fp_mac_expected_result += $bitstoshortreal(pe3_lane5_strm0[i0]) * $bitstoshortreal(pe3_lane5_strm1[i0]) ;                
        end                                                                                                    
      fp_mac_expected_result = 0 ;                
      for (int i0=0; i0<numOfExtWords; i0++)                                                                   
        begin                                                                                                  
          pe3_lane6_strm0[i0]  = (i0 == 0                )  ? $shortrealtobits(11.0) :                   
                                 (i0 == (numOfExtWords-1))  ? $shortrealtobits(44.0) :                   
                                                              $shortrealtobits(2.0*i0) ;                 
          pe3_lane6_strm0[i0]  = (i0 == 0                )  ? $shortrealtobits(22.0) :                   
                                 (i0 == (numOfExtWords-1))  ? $shortrealtobits(33.0) :                   
                                                              $shortrealtobits(1.0*i0) ;                 
          fp_mac_expected_result += $bitstoshortreal(pe3_lane6_strm0[i0]) * $bitstoshortreal(pe3_lane6_strm1[i0]) ;                
        end                                                                                                    
      fp_mac_expected_result = 0 ;                
      for (int i0=0; i0<numOfExtWords; i0++)                                                                   
        begin                                                                                                  
          pe3_lane6_strm1[i0]  = (i0 == 0                )  ? $shortrealtobits(11.0) :                   
                                 (i0 == (numOfExtWords-1))  ? $shortrealtobits(44.0) :                   
                                                              $shortrealtobits(2.0*i0) ;                 
          pe3_lane6_strm1[i0]  = (i0 == 0                )  ? $shortrealtobits(22.0) :                   
                                 (i0 == (numOfExtWords-1))  ? $shortrealtobits(33.0) :                   
                                                              $shortrealtobits(1.0*i0) ;                 
          fp_mac_expected_result += $bitstoshortreal(pe3_lane6_strm0[i0]) * $bitstoshortreal(pe3_lane6_strm1[i0]) ;                
        end                                                                                                    
      fp_mac_expected_result = 0 ;                
      for (int i0=0; i0<numOfExtWords; i0++)                                                                   
        begin                                                                                                  
          pe3_lane7_strm0[i0]  = (i0 == 0                )  ? $shortrealtobits(11.0) :                   
                                 (i0 == (numOfExtWords-1))  ? $shortrealtobits(44.0) :                   
                                                              $shortrealtobits(2.0*i0) ;                 
          pe3_lane7_strm0[i0]  = (i0 == 0                )  ? $shortrealtobits(22.0) :                   
                                 (i0 == (numOfExtWords-1))  ? $shortrealtobits(33.0) :                   
                                                              $shortrealtobits(1.0*i0) ;                 
          fp_mac_expected_result += $bitstoshortreal(pe3_lane7_strm0[i0]) * $bitstoshortreal(pe3_lane7_strm1[i0]) ;                
        end                                                                                                    
      fp_mac_expected_result = 0 ;                
      for (int i0=0; i0<numOfExtWords; i0++)                                                                   
        begin                                                                                                  
          pe3_lane7_strm1[i0]  = (i0 == 0                )  ? $shortrealtobits(11.0) :                   
                                 (i0 == (numOfExtWords-1))  ? $shortrealtobits(44.0) :                   
                                                              $shortrealtobits(2.0*i0) ;                 
          pe3_lane7_strm1[i0]  = (i0 == 0                )  ? $shortrealtobits(22.0) :                   
                                 (i0 == (numOfExtWords-1))  ? $shortrealtobits(33.0) :                   
                                                              $shortrealtobits(1.0*i0) ;                 
          fp_mac_expected_result += $bitstoshortreal(pe3_lane7_strm0[i0]) * $bitstoshortreal(pe3_lane7_strm1[i0]) ;                
        end                                                                                                    
      fp_mac_expected_result = 0 ;                
      for (int i0=0; i0<numOfExtWords; i0++)                                                                   
        begin                                                                                                  
          pe3_lane8_strm0[i0]  = (i0 == 0                )  ? $shortrealtobits(11.0) :                   
                                 (i0 == (numOfExtWords-1))  ? $shortrealtobits(44.0) :                   
                                                              $shortrealtobits(2.0*i0) ;                 
          pe3_lane8_strm0[i0]  = (i0 == 0                )  ? $shortrealtobits(22.0) :                   
                                 (i0 == (numOfExtWords-1))  ? $shortrealtobits(33.0) :                   
                                                              $shortrealtobits(1.0*i0) ;                 
          fp_mac_expected_result += $bitstoshortreal(pe3_lane8_strm0[i0]) * $bitstoshortreal(pe3_lane8_strm1[i0]) ;                
        end                                                                                                    
      fp_mac_expected_result = 0 ;                
      for (int i0=0; i0<numOfExtWords; i0++)                                                                   
        begin                                                                                                  
          pe3_lane8_strm1[i0]  = (i0 == 0                )  ? $shortrealtobits(11.0) :                   
                                 (i0 == (numOfExtWords-1))  ? $shortrealtobits(44.0) :                   
                                                              $shortrealtobits(2.0*i0) ;                 
          pe3_lane8_strm1[i0]  = (i0 == 0                )  ? $shortrealtobits(22.0) :                   
                                 (i0 == (numOfExtWords-1))  ? $shortrealtobits(33.0) :                   
                                                              $shortrealtobits(1.0*i0) ;                 
          fp_mac_expected_result += $bitstoshortreal(pe3_lane8_strm0[i0]) * $bitstoshortreal(pe3_lane8_strm1[i0]) ;                
        end                                                                                                    
      fp_mac_expected_result = 0 ;                
      for (int i0=0; i0<numOfExtWords; i0++)                                                                   
        begin                                                                                                  
          pe3_lane9_strm0[i0]  = (i0 == 0                )  ? $shortrealtobits(11.0) :                   
                                 (i0 == (numOfExtWords-1))  ? $shortrealtobits(44.0) :                   
                                                              $shortrealtobits(2.0*i0) ;                 
          pe3_lane9_strm0[i0]  = (i0 == 0                )  ? $shortrealtobits(22.0) :                   
                                 (i0 == (numOfExtWords-1))  ? $shortrealtobits(33.0) :                   
                                                              $shortrealtobits(1.0*i0) ;                 
          fp_mac_expected_result += $bitstoshortreal(pe3_lane9_strm0[i0]) * $bitstoshortreal(pe3_lane9_strm1[i0]) ;                
        end                                                                                                    
      fp_mac_expected_result = 0 ;                
      for (int i0=0; i0<numOfExtWords; i0++)                                                                   
        begin                                                                                                  
          pe3_lane9_strm1[i0]  = (i0 == 0                )  ? $shortrealtobits(11.0) :                   
                                 (i0 == (numOfExtWords-1))  ? $shortrealtobits(44.0) :                   
                                                              $shortrealtobits(2.0*i0) ;                 
          pe3_lane9_strm1[i0]  = (i0 == 0                )  ? $shortrealtobits(22.0) :                   
                                 (i0 == (numOfExtWords-1))  ? $shortrealtobits(33.0) :                   
                                                              $shortrealtobits(1.0*i0) ;                 
          fp_mac_expected_result += $bitstoshortreal(pe3_lane9_strm0[i0]) * $bitstoshortreal(pe3_lane9_strm1[i0]) ;                
        end                                                                                                    
      fp_mac_expected_result = 0 ;                
      for (int i0=0; i0<numOfExtWords; i0++)                                                                   
        begin                                                                                                  
          pe3_lane10_strm0[i0]  = (i0 == 0                )  ? $shortrealtobits(11.0) :                   
                                 (i0 == (numOfExtWords-1))  ? $shortrealtobits(44.0) :                   
                                                              $shortrealtobits(2.0*i0) ;                 
          pe3_lane10_strm0[i0]  = (i0 == 0                )  ? $shortrealtobits(22.0) :                   
                                 (i0 == (numOfExtWords-1))  ? $shortrealtobits(33.0) :                   
                                                              $shortrealtobits(1.0*i0) ;                 
          fp_mac_expected_result += $bitstoshortreal(pe3_lane10_strm0[i0]) * $bitstoshortreal(pe3_lane10_strm1[i0]) ;                
        end                                                                                                    
      fp_mac_expected_result = 0 ;                
      for (int i0=0; i0<numOfExtWords; i0++)                                                                   
        begin                                                                                                  
          pe3_lane10_strm1[i0]  = (i0 == 0                )  ? $shortrealtobits(11.0) :                   
                                 (i0 == (numOfExtWords-1))  ? $shortrealtobits(44.0) :                   
                                                              $shortrealtobits(2.0*i0) ;                 
          pe3_lane10_strm1[i0]  = (i0 == 0                )  ? $shortrealtobits(22.0) :                   
                                 (i0 == (numOfExtWords-1))  ? $shortrealtobits(33.0) :                   
                                                              $shortrealtobits(1.0*i0) ;                 
          fp_mac_expected_result += $bitstoshortreal(pe3_lane10_strm0[i0]) * $bitstoshortreal(pe3_lane10_strm1[i0]) ;                
        end                                                                                                    
      fp_mac_expected_result = 0 ;                
      for (int i0=0; i0<numOfExtWords; i0++)                                                                   
        begin                                                                                                  
          pe3_lane11_strm0[i0]  = (i0 == 0                )  ? $shortrealtobits(11.0) :                   
                                 (i0 == (numOfExtWords-1))  ? $shortrealtobits(44.0) :                   
                                                              $shortrealtobits(2.0*i0) ;                 
          pe3_lane11_strm0[i0]  = (i0 == 0                )  ? $shortrealtobits(22.0) :                   
                                 (i0 == (numOfExtWords-1))  ? $shortrealtobits(33.0) :                   
                                                              $shortrealtobits(1.0*i0) ;                 
          fp_mac_expected_result += $bitstoshortreal(pe3_lane11_strm0[i0]) * $bitstoshortreal(pe3_lane11_strm1[i0]) ;                
        end                                                                                                    
      fp_mac_expected_result = 0 ;                
      for (int i0=0; i0<numOfExtWords; i0++)                                                                   
        begin                                                                                                  
          pe3_lane11_strm1[i0]  = (i0 == 0                )  ? $shortrealtobits(11.0) :                   
                                 (i0 == (numOfExtWords-1))  ? $shortrealtobits(44.0) :                   
                                                              $shortrealtobits(2.0*i0) ;                 
          pe3_lane11_strm1[i0]  = (i0 == 0                )  ? $shortrealtobits(22.0) :                   
                                 (i0 == (numOfExtWords-1))  ? $shortrealtobits(33.0) :                   
                                                              $shortrealtobits(1.0*i0) ;                 
          fp_mac_expected_result += $bitstoshortreal(pe3_lane11_strm0[i0]) * $bitstoshortreal(pe3_lane11_strm1[i0]) ;                
        end                                                                                                    
      fp_mac_expected_result = 0 ;                
      for (int i0=0; i0<numOfExtWords; i0++)                                                                   
        begin                                                                                                  
          pe3_lane12_strm0[i0]  = (i0 == 0                )  ? $shortrealtobits(11.0) :                   
                                 (i0 == (numOfExtWords-1))  ? $shortrealtobits(44.0) :                   
                                                              $shortrealtobits(2.0*i0) ;                 
          pe3_lane12_strm0[i0]  = (i0 == 0                )  ? $shortrealtobits(22.0) :                   
                                 (i0 == (numOfExtWords-1))  ? $shortrealtobits(33.0) :                   
                                                              $shortrealtobits(1.0*i0) ;                 
          fp_mac_expected_result += $bitstoshortreal(pe3_lane12_strm0[i0]) * $bitstoshortreal(pe3_lane12_strm1[i0]) ;                
        end                                                                                                    
      fp_mac_expected_result = 0 ;                
      for (int i0=0; i0<numOfExtWords; i0++)                                                                   
        begin                                                                                                  
          pe3_lane12_strm1[i0]  = (i0 == 0                )  ? $shortrealtobits(11.0) :                   
                                 (i0 == (numOfExtWords-1))  ? $shortrealtobits(44.0) :                   
                                                              $shortrealtobits(2.0*i0) ;                 
          pe3_lane12_strm1[i0]  = (i0 == 0                )  ? $shortrealtobits(22.0) :                   
                                 (i0 == (numOfExtWords-1))  ? $shortrealtobits(33.0) :                   
                                                              $shortrealtobits(1.0*i0) ;                 
          fp_mac_expected_result += $bitstoshortreal(pe3_lane12_strm0[i0]) * $bitstoshortreal(pe3_lane12_strm1[i0]) ;                
        end                                                                                                    
      fp_mac_expected_result = 0 ;                
      for (int i0=0; i0<numOfExtWords; i0++)                                                                   
        begin                                                                                                  
          pe3_lane13_strm0[i0]  = (i0 == 0                )  ? $shortrealtobits(11.0) :                   
                                 (i0 == (numOfExtWords-1))  ? $shortrealtobits(44.0) :                   
                                                              $shortrealtobits(2.0*i0) ;                 
          pe3_lane13_strm0[i0]  = (i0 == 0                )  ? $shortrealtobits(22.0) :                   
                                 (i0 == (numOfExtWords-1))  ? $shortrealtobits(33.0) :                   
                                                              $shortrealtobits(1.0*i0) ;                 
          fp_mac_expected_result += $bitstoshortreal(pe3_lane13_strm0[i0]) * $bitstoshortreal(pe3_lane13_strm1[i0]) ;                
        end                                                                                                    
      fp_mac_expected_result = 0 ;                
      for (int i0=0; i0<numOfExtWords; i0++)                                                                   
        begin                                                                                                  
          pe3_lane13_strm1[i0]  = (i0 == 0                )  ? $shortrealtobits(11.0) :                   
                                 (i0 == (numOfExtWords-1))  ? $shortrealtobits(44.0) :                   
                                                              $shortrealtobits(2.0*i0) ;                 
          pe3_lane13_strm1[i0]  = (i0 == 0                )  ? $shortrealtobits(22.0) :                   
                                 (i0 == (numOfExtWords-1))  ? $shortrealtobits(33.0) :                   
                                                              $shortrealtobits(1.0*i0) ;                 
          fp_mac_expected_result += $bitstoshortreal(pe3_lane13_strm0[i0]) * $bitstoshortreal(pe3_lane13_strm1[i0]) ;                
        end                                                                                                    
      fp_mac_expected_result = 0 ;                
      for (int i0=0; i0<numOfExtWords; i0++)                                                                   
        begin                                                                                                  
          pe3_lane14_strm0[i0]  = (i0 == 0                )  ? $shortrealtobits(11.0) :                   
                                 (i0 == (numOfExtWords-1))  ? $shortrealtobits(44.0) :                   
                                                              $shortrealtobits(2.0*i0) ;                 
          pe3_lane14_strm0[i0]  = (i0 == 0                )  ? $shortrealtobits(22.0) :                   
                                 (i0 == (numOfExtWords-1))  ? $shortrealtobits(33.0) :                   
                                                              $shortrealtobits(1.0*i0) ;                 
          fp_mac_expected_result += $bitstoshortreal(pe3_lane14_strm0[i0]) * $bitstoshortreal(pe3_lane14_strm1[i0]) ;                
        end                                                                                                    
      fp_mac_expected_result = 0 ;                
      for (int i0=0; i0<numOfExtWords; i0++)                                                                   
        begin                                                                                                  
          pe3_lane14_strm1[i0]  = (i0 == 0                )  ? $shortrealtobits(11.0) :                   
                                 (i0 == (numOfExtWords-1))  ? $shortrealtobits(44.0) :                   
                                                              $shortrealtobits(2.0*i0) ;                 
          pe3_lane14_strm1[i0]  = (i0 == 0                )  ? $shortrealtobits(22.0) :                   
                                 (i0 == (numOfExtWords-1))  ? $shortrealtobits(33.0) :                   
                                                              $shortrealtobits(1.0*i0) ;                 
          fp_mac_expected_result += $bitstoshortreal(pe3_lane14_strm0[i0]) * $bitstoshortreal(pe3_lane14_strm1[i0]) ;                
        end                                                                                                    
      fp_mac_expected_result = 0 ;                
      for (int i0=0; i0<numOfExtWords; i0++)                                                                   
        begin                                                                                                  
          pe3_lane15_strm0[i0]  = (i0 == 0                )  ? $shortrealtobits(11.0) :                   
                                 (i0 == (numOfExtWords-1))  ? $shortrealtobits(44.0) :                   
                                                              $shortrealtobits(2.0*i0) ;                 
          pe3_lane15_strm0[i0]  = (i0 == 0                )  ? $shortrealtobits(22.0) :                   
                                 (i0 == (numOfExtWords-1))  ? $shortrealtobits(33.0) :                   
                                                              $shortrealtobits(1.0*i0) ;                 
          fp_mac_expected_result += $bitstoshortreal(pe3_lane15_strm0[i0]) * $bitstoshortreal(pe3_lane15_strm1[i0]) ;                
        end                                                                                                    
      fp_mac_expected_result = 0 ;                
      for (int i0=0; i0<numOfExtWords; i0++)                                                                   
        begin                                                                                                  
          pe3_lane15_strm1[i0]  = (i0 == 0                )  ? $shortrealtobits(11.0) :                   
                                 (i0 == (numOfExtWords-1))  ? $shortrealtobits(44.0) :                   
                                                              $shortrealtobits(2.0*i0) ;                 
          pe3_lane15_strm1[i0]  = (i0 == 0                )  ? $shortrealtobits(22.0) :                   
                                 (i0 == (numOfExtWords-1))  ? $shortrealtobits(33.0) :                   
                                                              $shortrealtobits(1.0*i0) ;                 
          fp_mac_expected_result += $bitstoshortreal(pe3_lane15_strm0[i0]) * $bitstoshortreal(pe3_lane15_strm1[i0]) ;                
        end                                                                                                    
      fp_mac_expected_result = 0 ;                
      for (int i0=0; i0<numOfExtWords; i0++)                                                                   
        begin                                                                                                  
          pe3_lane16_strm0[i0]  = (i0 == 0                )  ? $shortrealtobits(11.0) :                   
                                 (i0 == (numOfExtWords-1))  ? $shortrealtobits(44.0) :                   
                                                              $shortrealtobits(2.0*i0) ;                 
          pe3_lane16_strm0[i0]  = (i0 == 0                )  ? $shortrealtobits(22.0) :                   
                                 (i0 == (numOfExtWords-1))  ? $shortrealtobits(33.0) :                   
                                                              $shortrealtobits(1.0*i0) ;                 
          fp_mac_expected_result += $bitstoshortreal(pe3_lane16_strm0[i0]) * $bitstoshortreal(pe3_lane16_strm1[i0]) ;                
        end                                                                                                    
      fp_mac_expected_result = 0 ;                
      for (int i0=0; i0<numOfExtWords; i0++)                                                                   
        begin                                                                                                  
          pe3_lane16_strm1[i0]  = (i0 == 0                )  ? $shortrealtobits(11.0) :                   
                                 (i0 == (numOfExtWords-1))  ? $shortrealtobits(44.0) :                   
                                                              $shortrealtobits(2.0*i0) ;                 
          pe3_lane16_strm1[i0]  = (i0 == 0                )  ? $shortrealtobits(22.0) :                   
                                 (i0 == (numOfExtWords-1))  ? $shortrealtobits(33.0) :                   
                                                              $shortrealtobits(1.0*i0) ;                 
          fp_mac_expected_result += $bitstoshortreal(pe3_lane16_strm0[i0]) * $bitstoshortreal(pe3_lane16_strm1[i0]) ;                
        end                                                                                                    
      fp_mac_expected_result = 0 ;                
      for (int i0=0; i0<numOfExtWords; i0++)                                                                   
        begin                                                                                                  
          pe3_lane17_strm0[i0]  = (i0 == 0                )  ? $shortrealtobits(11.0) :                   
                                 (i0 == (numOfExtWords-1))  ? $shortrealtobits(44.0) :                   
                                                              $shortrealtobits(2.0*i0) ;                 
          pe3_lane17_strm0[i0]  = (i0 == 0                )  ? $shortrealtobits(22.0) :                   
                                 (i0 == (numOfExtWords-1))  ? $shortrealtobits(33.0) :                   
                                                              $shortrealtobits(1.0*i0) ;                 
          fp_mac_expected_result += $bitstoshortreal(pe3_lane17_strm0[i0]) * $bitstoshortreal(pe3_lane17_strm1[i0]) ;                
        end                                                                                                    
      fp_mac_expected_result = 0 ;                
      for (int i0=0; i0<numOfExtWords; i0++)                                                                   
        begin                                                                                                  
          pe3_lane17_strm1[i0]  = (i0 == 0                )  ? $shortrealtobits(11.0) :                   
                                 (i0 == (numOfExtWords-1))  ? $shortrealtobits(44.0) :                   
                                                              $shortrealtobits(2.0*i0) ;                 
          pe3_lane17_strm1[i0]  = (i0 == 0                )  ? $shortrealtobits(22.0) :                   
                                 (i0 == (numOfExtWords-1))  ? $shortrealtobits(33.0) :                   
                                                              $shortrealtobits(1.0*i0) ;                 
          fp_mac_expected_result += $bitstoshortreal(pe3_lane17_strm0[i0]) * $bitstoshortreal(pe3_lane17_strm1[i0]) ;                
        end                                                                                                    
      fp_mac_expected_result = 0 ;                
      for (int i0=0; i0<numOfExtWords; i0++)                                                                   
        begin                                                                                                  
          pe3_lane18_strm0[i0]  = (i0 == 0                )  ? $shortrealtobits(11.0) :                   
                                 (i0 == (numOfExtWords-1))  ? $shortrealtobits(44.0) :                   
                                                              $shortrealtobits(2.0*i0) ;                 
          pe3_lane18_strm0[i0]  = (i0 == 0                )  ? $shortrealtobits(22.0) :                   
                                 (i0 == (numOfExtWords-1))  ? $shortrealtobits(33.0) :                   
                                                              $shortrealtobits(1.0*i0) ;                 
          fp_mac_expected_result += $bitstoshortreal(pe3_lane18_strm0[i0]) * $bitstoshortreal(pe3_lane18_strm1[i0]) ;                
        end                                                                                                    
      fp_mac_expected_result = 0 ;                
      for (int i0=0; i0<numOfExtWords; i0++)                                                                   
        begin                                                                                                  
          pe3_lane18_strm1[i0]  = (i0 == 0                )  ? $shortrealtobits(11.0) :                   
                                 (i0 == (numOfExtWords-1))  ? $shortrealtobits(44.0) :                   
                                                              $shortrealtobits(2.0*i0) ;                 
          pe3_lane18_strm1[i0]  = (i0 == 0                )  ? $shortrealtobits(22.0) :                   
                                 (i0 == (numOfExtWords-1))  ? $shortrealtobits(33.0) :                   
                                                              $shortrealtobits(1.0*i0) ;                 
          fp_mac_expected_result += $bitstoshortreal(pe3_lane18_strm0[i0]) * $bitstoshortreal(pe3_lane18_strm1[i0]) ;                
        end                                                                                                    
      fp_mac_expected_result = 0 ;                
      for (int i0=0; i0<numOfExtWords; i0++)                                                                   
        begin                                                                                                  
          pe3_lane19_strm0[i0]  = (i0 == 0                )  ? $shortrealtobits(11.0) :                   
                                 (i0 == (numOfExtWords-1))  ? $shortrealtobits(44.0) :                   
                                                              $shortrealtobits(2.0*i0) ;                 
          pe3_lane19_strm0[i0]  = (i0 == 0                )  ? $shortrealtobits(22.0) :                   
                                 (i0 == (numOfExtWords-1))  ? $shortrealtobits(33.0) :                   
                                                              $shortrealtobits(1.0*i0) ;                 
          fp_mac_expected_result += $bitstoshortreal(pe3_lane19_strm0[i0]) * $bitstoshortreal(pe3_lane19_strm1[i0]) ;                
        end                                                                                                    
      fp_mac_expected_result = 0 ;                
      for (int i0=0; i0<numOfExtWords; i0++)                                                                   
        begin                                                                                                  
          pe3_lane19_strm1[i0]  = (i0 == 0                )  ? $shortrealtobits(11.0) :                   
                                 (i0 == (numOfExtWords-1))  ? $shortrealtobits(44.0) :                   
                                                              $shortrealtobits(2.0*i0) ;                 
          pe3_lane19_strm1[i0]  = (i0 == 0                )  ? $shortrealtobits(22.0) :                   
                                 (i0 == (numOfExtWords-1))  ? $shortrealtobits(33.0) :                   
                                                              $shortrealtobits(1.0*i0) ;                 
          fp_mac_expected_result += $bitstoshortreal(pe3_lane19_strm0[i0]) * $bitstoshortreal(pe3_lane19_strm1[i0]) ;                
        end                                                                                                    
      fp_mac_expected_result = 0 ;                
      for (int i0=0; i0<numOfExtWords; i0++)                                                                   
        begin                                                                                                  
          pe3_lane20_strm0[i0]  = (i0 == 0                )  ? $shortrealtobits(11.0) :                   
                                 (i0 == (numOfExtWords-1))  ? $shortrealtobits(44.0) :                   
                                                              $shortrealtobits(2.0*i0) ;                 
          pe3_lane20_strm0[i0]  = (i0 == 0                )  ? $shortrealtobits(22.0) :                   
                                 (i0 == (numOfExtWords-1))  ? $shortrealtobits(33.0) :                   
                                                              $shortrealtobits(1.0*i0) ;                 
          fp_mac_expected_result += $bitstoshortreal(pe3_lane20_strm0[i0]) * $bitstoshortreal(pe3_lane20_strm1[i0]) ;                
        end                                                                                                    
      fp_mac_expected_result = 0 ;                
      for (int i0=0; i0<numOfExtWords; i0++)                                                                   
        begin                                                                                                  
          pe3_lane20_strm1[i0]  = (i0 == 0                )  ? $shortrealtobits(11.0) :                   
                                 (i0 == (numOfExtWords-1))  ? $shortrealtobits(44.0) :                   
                                                              $shortrealtobits(2.0*i0) ;                 
          pe3_lane20_strm1[i0]  = (i0 == 0                )  ? $shortrealtobits(22.0) :                   
                                 (i0 == (numOfExtWords-1))  ? $shortrealtobits(33.0) :                   
                                                              $shortrealtobits(1.0*i0) ;                 
          fp_mac_expected_result += $bitstoshortreal(pe3_lane20_strm0[i0]) * $bitstoshortreal(pe3_lane20_strm1[i0]) ;                
        end                                                                                                    
      fp_mac_expected_result = 0 ;                
      for (int i0=0; i0<numOfExtWords; i0++)                                                                   
        begin                                                                                                  
          pe3_lane21_strm0[i0]  = (i0 == 0                )  ? $shortrealtobits(11.0) :                   
                                 (i0 == (numOfExtWords-1))  ? $shortrealtobits(44.0) :                   
                                                              $shortrealtobits(2.0*i0) ;                 
          pe3_lane21_strm0[i0]  = (i0 == 0                )  ? $shortrealtobits(22.0) :                   
                                 (i0 == (numOfExtWords-1))  ? $shortrealtobits(33.0) :                   
                                                              $shortrealtobits(1.0*i0) ;                 
          fp_mac_expected_result += $bitstoshortreal(pe3_lane21_strm0[i0]) * $bitstoshortreal(pe3_lane21_strm1[i0]) ;                
        end                                                                                                    
      fp_mac_expected_result = 0 ;                
      for (int i0=0; i0<numOfExtWords; i0++)                                                                   
        begin                                                                                                  
          pe3_lane21_strm1[i0]  = (i0 == 0                )  ? $shortrealtobits(11.0) :                   
                                 (i0 == (numOfExtWords-1))  ? $shortrealtobits(44.0) :                   
                                                              $shortrealtobits(2.0*i0) ;                 
          pe3_lane21_strm1[i0]  = (i0 == 0                )  ? $shortrealtobits(22.0) :                   
                                 (i0 == (numOfExtWords-1))  ? $shortrealtobits(33.0) :                   
                                                              $shortrealtobits(1.0*i0) ;                 
          fp_mac_expected_result += $bitstoshortreal(pe3_lane21_strm0[i0]) * $bitstoshortreal(pe3_lane21_strm1[i0]) ;                
        end                                                                                                    
      fp_mac_expected_result = 0 ;                
      for (int i0=0; i0<numOfExtWords; i0++)                                                                   
        begin                                                                                                  
          pe3_lane22_strm0[i0]  = (i0 == 0                )  ? $shortrealtobits(11.0) :                   
                                 (i0 == (numOfExtWords-1))  ? $shortrealtobits(44.0) :                   
                                                              $shortrealtobits(2.0*i0) ;                 
          pe3_lane22_strm0[i0]  = (i0 == 0                )  ? $shortrealtobits(22.0) :                   
                                 (i0 == (numOfExtWords-1))  ? $shortrealtobits(33.0) :                   
                                                              $shortrealtobits(1.0*i0) ;                 
          fp_mac_expected_result += $bitstoshortreal(pe3_lane22_strm0[i0]) * $bitstoshortreal(pe3_lane22_strm1[i0]) ;                
        end                                                                                                    
      fp_mac_expected_result = 0 ;                
      for (int i0=0; i0<numOfExtWords; i0++)                                                                   
        begin                                                                                                  
          pe3_lane22_strm1[i0]  = (i0 == 0                )  ? $shortrealtobits(11.0) :                   
                                 (i0 == (numOfExtWords-1))  ? $shortrealtobits(44.0) :                   
                                                              $shortrealtobits(2.0*i0) ;                 
          pe3_lane22_strm1[i0]  = (i0 == 0                )  ? $shortrealtobits(22.0) :                   
                                 (i0 == (numOfExtWords-1))  ? $shortrealtobits(33.0) :                   
                                                              $shortrealtobits(1.0*i0) ;                 
          fp_mac_expected_result += $bitstoshortreal(pe3_lane22_strm0[i0]) * $bitstoshortreal(pe3_lane22_strm1[i0]) ;                
        end                                                                                                    
      fp_mac_expected_result = 0 ;                
      for (int i0=0; i0<numOfExtWords; i0++)                                                                   
        begin                                                                                                  
          pe3_lane23_strm0[i0]  = (i0 == 0                )  ? $shortrealtobits(11.0) :                   
                                 (i0 == (numOfExtWords-1))  ? $shortrealtobits(44.0) :                   
                                                              $shortrealtobits(2.0*i0) ;                 
          pe3_lane23_strm0[i0]  = (i0 == 0                )  ? $shortrealtobits(22.0) :                   
                                 (i0 == (numOfExtWords-1))  ? $shortrealtobits(33.0) :                   
                                                              $shortrealtobits(1.0*i0) ;                 
          fp_mac_expected_result += $bitstoshortreal(pe3_lane23_strm0[i0]) * $bitstoshortreal(pe3_lane23_strm1[i0]) ;                
        end                                                                                                    
      fp_mac_expected_result = 0 ;                
      for (int i0=0; i0<numOfExtWords; i0++)                                                                   
        begin                                                                                                  
          pe3_lane23_strm1[i0]  = (i0 == 0                )  ? $shortrealtobits(11.0) :                   
                                 (i0 == (numOfExtWords-1))  ? $shortrealtobits(44.0) :                   
                                                              $shortrealtobits(2.0*i0) ;                 
          pe3_lane23_strm1[i0]  = (i0 == 0                )  ? $shortrealtobits(22.0) :                   
                                 (i0 == (numOfExtWords-1))  ? $shortrealtobits(33.0) :                   
                                                              $shortrealtobits(1.0*i0) ;                 
          fp_mac_expected_result += $bitstoshortreal(pe3_lane23_strm0[i0]) * $bitstoshortreal(pe3_lane23_strm1[i0]) ;                
        end                                                                                                    
      fp_mac_expected_result = 0 ;                
      for (int i0=0; i0<numOfExtWords; i0++)                                                                   
        begin                                                                                                  
          pe3_lane24_strm0[i0]  = (i0 == 0                )  ? $shortrealtobits(11.0) :                   
                                 (i0 == (numOfExtWords-1))  ? $shortrealtobits(44.0) :                   
                                                              $shortrealtobits(2.0*i0) ;                 
          pe3_lane24_strm0[i0]  = (i0 == 0                )  ? $shortrealtobits(22.0) :                   
                                 (i0 == (numOfExtWords-1))  ? $shortrealtobits(33.0) :                   
                                                              $shortrealtobits(1.0*i0) ;                 
          fp_mac_expected_result += $bitstoshortreal(pe3_lane24_strm0[i0]) * $bitstoshortreal(pe3_lane24_strm1[i0]) ;                
        end                                                                                                    
      fp_mac_expected_result = 0 ;                
      for (int i0=0; i0<numOfExtWords; i0++)                                                                   
        begin                                                                                                  
          pe3_lane24_strm1[i0]  = (i0 == 0                )  ? $shortrealtobits(11.0) :                   
                                 (i0 == (numOfExtWords-1))  ? $shortrealtobits(44.0) :                   
                                                              $shortrealtobits(2.0*i0) ;                 
          pe3_lane24_strm1[i0]  = (i0 == 0                )  ? $shortrealtobits(22.0) :                   
                                 (i0 == (numOfExtWords-1))  ? $shortrealtobits(33.0) :                   
                                                              $shortrealtobits(1.0*i0) ;                 
          fp_mac_expected_result += $bitstoshortreal(pe3_lane24_strm0[i0]) * $bitstoshortreal(pe3_lane24_strm1[i0]) ;                
        end                                                                                                    
      fp_mac_expected_result = 0 ;                
      for (int i0=0; i0<numOfExtWords; i0++)                                                                   
        begin                                                                                                  
          pe3_lane25_strm0[i0]  = (i0 == 0                )  ? $shortrealtobits(11.0) :                   
                                 (i0 == (numOfExtWords-1))  ? $shortrealtobits(44.0) :                   
                                                              $shortrealtobits(2.0*i0) ;                 
          pe3_lane25_strm0[i0]  = (i0 == 0                )  ? $shortrealtobits(22.0) :                   
                                 (i0 == (numOfExtWords-1))  ? $shortrealtobits(33.0) :                   
                                                              $shortrealtobits(1.0*i0) ;                 
          fp_mac_expected_result += $bitstoshortreal(pe3_lane25_strm0[i0]) * $bitstoshortreal(pe3_lane25_strm1[i0]) ;                
        end                                                                                                    
      fp_mac_expected_result = 0 ;                
      for (int i0=0; i0<numOfExtWords; i0++)                                                                   
        begin                                                                                                  
          pe3_lane25_strm1[i0]  = (i0 == 0                )  ? $shortrealtobits(11.0) :                   
                                 (i0 == (numOfExtWords-1))  ? $shortrealtobits(44.0) :                   
                                                              $shortrealtobits(2.0*i0) ;                 
          pe3_lane25_strm1[i0]  = (i0 == 0                )  ? $shortrealtobits(22.0) :                   
                                 (i0 == (numOfExtWords-1))  ? $shortrealtobits(33.0) :                   
                                                              $shortrealtobits(1.0*i0) ;                 
          fp_mac_expected_result += $bitstoshortreal(pe3_lane25_strm0[i0]) * $bitstoshortreal(pe3_lane25_strm1[i0]) ;                
        end                                                                                                    
      fp_mac_expected_result = 0 ;                
      for (int i0=0; i0<numOfExtWords; i0++)                                                                   
        begin                                                                                                  
          pe3_lane26_strm0[i0]  = (i0 == 0                )  ? $shortrealtobits(11.0) :                   
                                 (i0 == (numOfExtWords-1))  ? $shortrealtobits(44.0) :                   
                                                              $shortrealtobits(2.0*i0) ;                 
          pe3_lane26_strm0[i0]  = (i0 == 0                )  ? $shortrealtobits(22.0) :                   
                                 (i0 == (numOfExtWords-1))  ? $shortrealtobits(33.0) :                   
                                                              $shortrealtobits(1.0*i0) ;                 
          fp_mac_expected_result += $bitstoshortreal(pe3_lane26_strm0[i0]) * $bitstoshortreal(pe3_lane26_strm1[i0]) ;                
        end                                                                                                    
      fp_mac_expected_result = 0 ;                
      for (int i0=0; i0<numOfExtWords; i0++)                                                                   
        begin                                                                                                  
          pe3_lane26_strm1[i0]  = (i0 == 0                )  ? $shortrealtobits(11.0) :                   
                                 (i0 == (numOfExtWords-1))  ? $shortrealtobits(44.0) :                   
                                                              $shortrealtobits(2.0*i0) ;                 
          pe3_lane26_strm1[i0]  = (i0 == 0                )  ? $shortrealtobits(22.0) :                   
                                 (i0 == (numOfExtWords-1))  ? $shortrealtobits(33.0) :                   
                                                              $shortrealtobits(1.0*i0) ;                 
          fp_mac_expected_result += $bitstoshortreal(pe3_lane26_strm0[i0]) * $bitstoshortreal(pe3_lane26_strm1[i0]) ;                
        end                                                                                                    
      fp_mac_expected_result = 0 ;                
      for (int i0=0; i0<numOfExtWords; i0++)                                                                   
        begin                                                                                                  
          pe3_lane27_strm0[i0]  = (i0 == 0                )  ? $shortrealtobits(11.0) :                   
                                 (i0 == (numOfExtWords-1))  ? $shortrealtobits(44.0) :                   
                                                              $shortrealtobits(2.0*i0) ;                 
          pe3_lane27_strm0[i0]  = (i0 == 0                )  ? $shortrealtobits(22.0) :                   
                                 (i0 == (numOfExtWords-1))  ? $shortrealtobits(33.0) :                   
                                                              $shortrealtobits(1.0*i0) ;                 
          fp_mac_expected_result += $bitstoshortreal(pe3_lane27_strm0[i0]) * $bitstoshortreal(pe3_lane27_strm1[i0]) ;                
        end                                                                                                    
      fp_mac_expected_result = 0 ;                
      for (int i0=0; i0<numOfExtWords; i0++)                                                                   
        begin                                                                                                  
          pe3_lane27_strm1[i0]  = (i0 == 0                )  ? $shortrealtobits(11.0) :                   
                                 (i0 == (numOfExtWords-1))  ? $shortrealtobits(44.0) :                   
                                                              $shortrealtobits(2.0*i0) ;                 
          pe3_lane27_strm1[i0]  = (i0 == 0                )  ? $shortrealtobits(22.0) :                   
                                 (i0 == (numOfExtWords-1))  ? $shortrealtobits(33.0) :                   
                                                              $shortrealtobits(1.0*i0) ;                 
          fp_mac_expected_result += $bitstoshortreal(pe3_lane27_strm0[i0]) * $bitstoshortreal(pe3_lane27_strm1[i0]) ;                
        end                                                                                                    
      fp_mac_expected_result = 0 ;                
      for (int i0=0; i0<numOfExtWords; i0++)                                                                   
        begin                                                                                                  
          pe3_lane28_strm0[i0]  = (i0 == 0                )  ? $shortrealtobits(11.0) :                   
                                 (i0 == (numOfExtWords-1))  ? $shortrealtobits(44.0) :                   
                                                              $shortrealtobits(2.0*i0) ;                 
          pe3_lane28_strm0[i0]  = (i0 == 0                )  ? $shortrealtobits(22.0) :                   
                                 (i0 == (numOfExtWords-1))  ? $shortrealtobits(33.0) :                   
                                                              $shortrealtobits(1.0*i0) ;                 
          fp_mac_expected_result += $bitstoshortreal(pe3_lane28_strm0[i0]) * $bitstoshortreal(pe3_lane28_strm1[i0]) ;                
        end                                                                                                    
      fp_mac_expected_result = 0 ;                
      for (int i0=0; i0<numOfExtWords; i0++)                                                                   
        begin                                                                                                  
          pe3_lane28_strm1[i0]  = (i0 == 0                )  ? $shortrealtobits(11.0) :                   
                                 (i0 == (numOfExtWords-1))  ? $shortrealtobits(44.0) :                   
                                                              $shortrealtobits(2.0*i0) ;                 
          pe3_lane28_strm1[i0]  = (i0 == 0                )  ? $shortrealtobits(22.0) :                   
                                 (i0 == (numOfExtWords-1))  ? $shortrealtobits(33.0) :                   
                                                              $shortrealtobits(1.0*i0) ;                 
          fp_mac_expected_result += $bitstoshortreal(pe3_lane28_strm0[i0]) * $bitstoshortreal(pe3_lane28_strm1[i0]) ;                
        end                                                                                                    
      fp_mac_expected_result = 0 ;                
      for (int i0=0; i0<numOfExtWords; i0++)                                                                   
        begin                                                                                                  
          pe3_lane29_strm0[i0]  = (i0 == 0                )  ? $shortrealtobits(11.0) :                   
                                 (i0 == (numOfExtWords-1))  ? $shortrealtobits(44.0) :                   
                                                              $shortrealtobits(2.0*i0) ;                 
          pe3_lane29_strm0[i0]  = (i0 == 0                )  ? $shortrealtobits(22.0) :                   
                                 (i0 == (numOfExtWords-1))  ? $shortrealtobits(33.0) :                   
                                                              $shortrealtobits(1.0*i0) ;                 
          fp_mac_expected_result += $bitstoshortreal(pe3_lane29_strm0[i0]) * $bitstoshortreal(pe3_lane29_strm1[i0]) ;                
        end                                                                                                    
      fp_mac_expected_result = 0 ;                
      for (int i0=0; i0<numOfExtWords; i0++)                                                                   
        begin                                                                                                  
          pe3_lane29_strm1[i0]  = (i0 == 0                )  ? $shortrealtobits(11.0) :                   
                                 (i0 == (numOfExtWords-1))  ? $shortrealtobits(44.0) :                   
                                                              $shortrealtobits(2.0*i0) ;                 
          pe3_lane29_strm1[i0]  = (i0 == 0                )  ? $shortrealtobits(22.0) :                   
                                 (i0 == (numOfExtWords-1))  ? $shortrealtobits(33.0) :                   
                                                              $shortrealtobits(1.0*i0) ;                 
          fp_mac_expected_result += $bitstoshortreal(pe3_lane29_strm0[i0]) * $bitstoshortreal(pe3_lane29_strm1[i0]) ;                
        end                                                                                                    
      fp_mac_expected_result = 0 ;                
      for (int i0=0; i0<numOfExtWords; i0++)                                                                   
        begin                                                                                                  
          pe3_lane30_strm0[i0]  = (i0 == 0                )  ? $shortrealtobits(11.0) :                   
                                 (i0 == (numOfExtWords-1))  ? $shortrealtobits(44.0) :                   
                                                              $shortrealtobits(2.0*i0) ;                 
          pe3_lane30_strm0[i0]  = (i0 == 0                )  ? $shortrealtobits(22.0) :                   
                                 (i0 == (numOfExtWords-1))  ? $shortrealtobits(33.0) :                   
                                                              $shortrealtobits(1.0*i0) ;                 
          fp_mac_expected_result += $bitstoshortreal(pe3_lane30_strm0[i0]) * $bitstoshortreal(pe3_lane30_strm1[i0]) ;                
        end                                                                                                    
      fp_mac_expected_result = 0 ;                
      for (int i0=0; i0<numOfExtWords; i0++)                                                                   
        begin                                                                                                  
          pe3_lane30_strm1[i0]  = (i0 == 0                )  ? $shortrealtobits(11.0) :                   
                                 (i0 == (numOfExtWords-1))  ? $shortrealtobits(44.0) :                   
                                                              $shortrealtobits(2.0*i0) ;                 
          pe3_lane30_strm1[i0]  = (i0 == 0                )  ? $shortrealtobits(22.0) :                   
                                 (i0 == (numOfExtWords-1))  ? $shortrealtobits(33.0) :                   
                                                              $shortrealtobits(1.0*i0) ;                 
          fp_mac_expected_result += $bitstoshortreal(pe3_lane30_strm0[i0]) * $bitstoshortreal(pe3_lane30_strm1[i0]) ;                
        end                                                                                                    
      fp_mac_expected_result = 0 ;                
      for (int i0=0; i0<numOfExtWords; i0++)                                                                   
        begin                                                                                                  
          pe3_lane31_strm0[i0]  = (i0 == 0                )  ? $shortrealtobits(11.0) :                   
                                 (i0 == (numOfExtWords-1))  ? $shortrealtobits(44.0) :                   
                                                              $shortrealtobits(2.0*i0) ;                 
          pe3_lane31_strm0[i0]  = (i0 == 0                )  ? $shortrealtobits(22.0) :                   
                                 (i0 == (numOfExtWords-1))  ? $shortrealtobits(33.0) :                   
                                                              $shortrealtobits(1.0*i0) ;                 
          fp_mac_expected_result += $bitstoshortreal(pe3_lane31_strm0[i0]) * $bitstoshortreal(pe3_lane31_strm1[i0]) ;                
        end                                                                                                    
      fp_mac_expected_result = 0 ;                
      for (int i0=0; i0<numOfExtWords; i0++)                                                                   
        begin                                                                                                  
          pe3_lane31_strm1[i0]  = (i0 == 0                )  ? $shortrealtobits(11.0) :                   
                                 (i0 == (numOfExtWords-1))  ? $shortrealtobits(44.0) :                   
                                                              $shortrealtobits(2.0*i0) ;                 
          pe3_lane31_strm1[i0]  = (i0 == 0                )  ? $shortrealtobits(22.0) :                   
                                 (i0 == (numOfExtWords-1))  ? $shortrealtobits(33.0) :                   
                                                              $shortrealtobits(1.0*i0) ;                 
          fp_mac_expected_result += $bitstoshortreal(pe3_lane31_strm0[i0]) * $bitstoshortreal(pe3_lane31_strm1[i0]) ;                
        end                                                                                                    