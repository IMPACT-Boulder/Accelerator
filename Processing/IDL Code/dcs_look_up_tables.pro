FUNCTION dcs_look_up_tables, maxes ;determines the quadrant of the measurement then reads in coresponding look-up table files for expected normalized values

  file_array=STRSPLIT(STRCOMPRESS(!PATH), ';', /EXTRACT)
  origin_path = STRTRIM(file_array[N_ELEMENTS(file_array)-1])
  CD, origin_path
  CD, '../../Device IO/DCS/Simulation data'
  CD, CURRENT=file

  left = maxes[0:1] ;left 2 wires

  right = maxes[2:3] ;right 2 wires

  bottom = maxes[4:5] ;bottom 2 wires

  top = maxes[6:7] ;top 2 wires

  IF TOTAL(right) gt TOTAL(left) AND TOTAL(top) gt TOTAL(bottom) THEN BEGIN
    look_up_table_file = READ_CSV(file+'/pos_pos.csv') ;first quadrant
  ENDIF
  
  IF TOTAL(left) gt TOTAL(right) AND TOTAL(bottom) gt TOTAL(top) THEN BEGIN
    look_up_table_file = READ_CSV(file+'/neg_neg.csv') ;third quadrant
  ENDIF
  
  IF TOTAL(left) gt TOTAL(right) AND TOTAL(top) gt TOTAL(bottom) THEN BEGIN
    look_up_table_file = READ_CSV(file+'/neg_pos.csv') ;second quadrant
  ENDIF
  
  IF TOTAL(right) gt TOTAL(left) AND TOTAL(bottom) gt TOTAL(top) THEN BEGIN
    look_up_table_file = READ_CSV(file+'/pos_neg.csv') ;fourth quadrant
  ENDIF
  
  return, look_up_table_file

END
