PRO DCS_POSITIONING
  CD, '../../../../../../../../Users/Clavius/Desktop/Dual DCS First Run'
  file_name = DIALOG_PICKFILE(FILTER=("*.hdf5")) ;Allows user to navigate to hdf5 file
  dcs_coordinate_values = DCS_POSITIONING(file_name)
  print, dcs_coordinate_values
  
END


FUNCTION DCS_POSITIONING, filename ; This will eventually be changed to a function that returns xy values
  print,filename
  maxes = dcs_Waveform_Max_HDF5(filename);1x16 array from both dcs 1 and dcs 2
  dcs_1_maxes = maxes[0:7]
  dcs_2_maxes = maxes[8:15]
  
  dcs_1_normalized_data = dcs_normalize_2(dcs_1_maxes);1x8 array
  dcs_2_normalized_data = dcs_normalize_2(dcs_2_maxes);1x8 array
  
  dcs_1_look_up_table_file = dcs_look_up_tables(dcs_1_maxes);structure of 8 individual 1x625 arrays
  dcs_1_coordinate_table_file = dcs_coordinate_tables(dcs_1_maxes);structure of 2 individual 1x625 arrays
  
  dcs_2_look_up_table_file = dcs_look_up_tables(dcs_2_maxes);structure of 8 individual 1x625 arrays
  dcs_2_coordinate_table_file = dcs_coordinate_tables(dcs_2_maxes);structure of 2 individual 1x625 arrays
  
  dcs_1_look_up_values = transpose([[dcs_1_look_up_table_file.(0)], $ ;8x625 2D array
                    [dcs_1_look_up_table_file.(1)], $
                    [dcs_1_look_up_table_file.(2)], $
                    [dcs_1_look_up_table_file.(3)], $
                    [dcs_1_look_up_table_file.(4)], $
                    [dcs_1_look_up_table_file.(5)], $
                    [dcs_1_look_up_table_file.(6)], $
                    [dcs_1_look_up_table_file.(7)]])
                  
  dcs_1_coordinate_values = transpose([[dcs_1_coordinate_table_file.(0)],[dcs_1_coordinate_table_file.(1)]])   ;2x625 2D array
  
  dcs_2_look_up_values = transpose([[dcs_2_look_up_table_file.(0)], $ ;8x625 2D array
                    [dcs_2_look_up_table_file.(1)], $
                    [dcs_2_look_up_table_file.(2)], $
                    [dcs_2_look_up_table_file.(3)], $
                    [dcs_2_look_up_table_file.(4)], $
                    [dcs_2_look_up_table_file.(5)], $
                    [dcs_2_look_up_table_file.(6)], $
                    [dcs_2_look_up_table_file.(7)]])
  
  dcs_2_coordinate_values = transpose([[dcs_2_coordinate_table_file.(0)],[dcs_2_coordinate_table_file.(1)]])   ;2x625 2D array
  
  dcs_1_diff_squared = fltarr(625) ;initialize the array to hold differences squared i.e. error
  dcs_2_diff_squared = fltarr(625)
  
  For i=0, 624 DO BEGIN ;loops through each row of look_up_values array to compute sum of differences squared and places result in each index of diff_squared
    dcs_1_diff_squared(i) = dcs_residual_squared(dcs_1_normalized_data,dcs_1_look_up_values(*,i)) 
  Endfor
  
  For i=0, 624 DO BEGIN ;loops through each row of look_up_values array to compute sum of differences squared and places result in each index of diff_squared
    dcs_2_diff_squared(i) = dcs_residual_squared(dcs_2_normalized_data,dcs_2_look_up_values(*,i))
  Endfor
  
  dcs_1_min_diff_squared = min(dcs_1_diff_squared, dcs_1_min_index_diff_squared) ;finds the row in the look up table producing the least error
  print,('dcs 1 min diff squared'), dcs_1_min_diff_squared
  
  dcs_2_min_diff_squared = min(dcs_2_diff_squared, dcs_2_min_index_diff_squared) ;finds the row in the look up table producing the least error
  print,('dcs 2 min diff squared'), dcs_2_min_diff_squared
  
  
  IF dcs_1_min_diff_squared LT 0.2 THEN BEGIN ;sets a limit on error to avoid what is likely from noise
    dcs_1_xy_values = dcs_1_coordinate_values(*,dcs_1_min_index_diff_squared) ;finds the row on the coordinate values with matching index to coresponding look up values row
    ;print, ('dcs 1 maxes'), dcs_1_maxes
  ENDIF ELSE BEGIN 
    dcs_1_xy_values = [-99, -99] 
  ENDELSE; This will be changed to a return value when dcs_positioning is called as a function
  
  IF dcs_2_min_diff_squared LT 0.2 THEN BEGIN ;sets a limit on error to avoid what is likely from noise
    dcs_2_xy_values = dcs_2_coordinate_values(*,dcs_2_min_index_diff_squared) ;finds the row on the coordinate values with matching index to coresponding look up values row
  ENDIF ELSE BEGIN
    dcs_2_xy_values = [-99, -99]
  ENDELSE; This will be changed to a return value when dcs_positioning is called as a function
  
  dcs_coordinates = [dcs_1_xy_values, dcs_2_xy_values]
  
  return, dcs_coordinates

END

FUNCTION dcs_normalize_2, maxes ;Normalizes max values to 2

  sum_maxes = TOTAL(maxes)

  norm_two = 2/sum_maxes

  normalized_data = maxes * norm_two

  return, normalized_data ;1D array of normalized values
  
END

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