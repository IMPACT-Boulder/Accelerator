FUNCTION delta_r, charge, x_position

  rms = 0.005 ;volts
  delta_q = rms/(1.215d13) ;conversion of voltage rms to charge uncertainty
  ;delta_q = 4.2d-16
  qnr = charge/delta_q ;charge to noise ratio
  
  
  x_wire = [-5.0, -2.5, 0.0, 2.5, 5.0]
  x_temp = [x_wire, x_position] ; Append x_postion to array of reference points.
  x_sort = x_temp[SORT(x_temp)] ;Sort in order to place x_postion in between appropriate reference points.
  x_location_index = where(x_sort EQ x_position) ;Find where position relative to reference points
  
  CASE x_location_index(0) OF  ;Determine distance from closest wire.
    0:x_w = abs(x_position - (-7.5))
    1:x_w = abs(x_position - (-2.5))
    2:x_w = abs(x_position - (-2.5))
    3:x_w = abs(x_position - (2.5))
    4:x_w = abs(x_position - (2.5))
    5:x_w = abs(x_position - (7.5))
  ENDCASE
  
  
  ;xr = (150*EXP(-x_w/0.16)) + 1
  
  c_1 = (0.28*EXP(-x_w/0.7)) + 0.1
  
  c_2 = 0.043149*x_w + 0.001
  
  q_1 = c_1 * charge
  
  q_2 = c_2 * charge
  
  xr = q_1/q_2

  d_r = (xr/qnr)*SQRT((1/c_1)^2 + (1/c_2)^2)
  
  return, d_r
  
END