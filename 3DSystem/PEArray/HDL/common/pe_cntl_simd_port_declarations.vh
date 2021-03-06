
  // Common (Scalar) Register(s)                        
  output[`PE_EXEC_LANE_WIDTH_RANGE]  cntl__simd__rs0   ;
  output[`PE_EXEC_LANE_WIDTH_RANGE]  cntl__simd__rs1   ;

  // Lane Register(s)                                                                 
  output[`PE_EXEC_LANE_WIDTH_RANGE]  cntl__simd__lane_r128  [`PE_NUM_OF_EXEC_LANES ] ;
  output[`PE_EXEC_LANE_WIDTH_RANGE]  cntl__simd__lane_r129  [`PE_NUM_OF_EXEC_LANES ] ;
  output[`PE_EXEC_LANE_WIDTH_RANGE]  cntl__simd__lane_r130  [`PE_NUM_OF_EXEC_LANES ] ;
  output[`PE_EXEC_LANE_WIDTH_RANGE]  cntl__simd__lane_r131  [`PE_NUM_OF_EXEC_LANES ] ;
  output[`PE_EXEC_LANE_WIDTH_RANGE]  cntl__simd__lane_r132  [`PE_NUM_OF_EXEC_LANES ] ;
  output[`PE_EXEC_LANE_WIDTH_RANGE]  cntl__simd__lane_r133  [`PE_NUM_OF_EXEC_LANES ] ;
  output[`PE_EXEC_LANE_WIDTH_RANGE]  cntl__simd__lane_r134  [`PE_NUM_OF_EXEC_LANES ] ;
  output[`PE_EXEC_LANE_WIDTH_RANGE]  cntl__simd__lane_r135  [`PE_NUM_OF_EXEC_LANES ] ;
