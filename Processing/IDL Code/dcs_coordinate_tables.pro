FUNCTION dcs_coordinate_tables, maxes ;determins quadrant of measurement then reads in coresponding xy coordinate csv file
  
  file_array=STRSPLIT(STRCOMPRESS(!PATH), ';', /EXTRACT)
  origin_path = STRTRIM(file_array[N_ELEMENTS(file_array)-1])
  CD, origin_path
  CD, '../../Device IO/DCS/Simulation data'
  CD, CURRENT=file
  
  left = maxes[0:1]

  right = maxes[2:3]

  bottom = maxes[4:5]

  top = maxes[6:7]

  IF TOTAL(right) gt TOTAL(left) AND TOTAL(top) gt TOTAL(bottom) THEN BEGIN
    coordinate_table_file = READ_CSV(file+'/pos_pos_xy.csv')
  ENDIF

  IF TOTAL(left) gt TOTAL(right) AND TOTAL(bottom) gt TOTAL(top) THEN BEGIN
    coordinate_table_file = READ_CSV(file+'/neg_neg_xy.csv')
  ENDIF

  IF TOTAL(left) gt TOTAL(right) AND TOTAL(top) gt TOTAL(bottom) THEN BEGIN
    coordinate_table_file = READ_CSV(file+'/neg_pos_xy.csv')
  ENDIF

  IF TOTAL(right) gt TOTAL(left) AND TOTAL(bottom) gt TOTAL(top) THEN BEGIN
    coordinate_table_file = READ_CSV(file+'/pos_neg_xy.csv')
  ENDIF
  
  return, coordinate_table_file

END
