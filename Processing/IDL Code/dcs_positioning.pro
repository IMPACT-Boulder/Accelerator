PRO DCS_POSITIONING
  CD, '../../../../../../../../Users/Clavius/Desktop/Dual DCS First Run'
  file_name = DIALOG_PICKFILE(FILTER=("*.hdf5")) ;Allows user to navigate to hdf5 file
  out = ccldas_read_raw_file(file_name)
  file1 = out.dcs_1.waveform
  file2 = out.dcs_2.waveform
  dcs_1_values = DCS_POSITIONING(file1)
  dcs_2_values = DCS_POSITIONING(file2)
  print, [dcs_1_values, dcs_2_values]
  
END


FUNCTION DCS_POSITIONING, waveform, x_correction, y_correction; This will eventually be changed to a function that returns xy values
  dcs_maxes = dcs_Waveform_Max_HDF5(waveform);1x16 array from both dcs
  
  dcs_normalized_data = dcs_normalize_2(dcs_maxes);1x8 array
  
  dcs_look_up_table_file = dcs_look_up_tables(dcs_maxes);structure of 8 individual 1x625 arrays
  dcs_coordinate_table_file = dcs_coordinate_tables(dcs_maxes);structure of 2 individual 1x625 arrays
  
  dcs_look_up_values = transpose([[dcs_look_up_table_file.(0)], $ ;8x625 2D array
                    [dcs_look_up_table_file.(1)], $
                    [dcs_look_up_table_file.(2)], $
                    [dcs_look_up_table_file.(3)], $
                    [dcs_look_up_table_file.(4)], $
                    [dcs_look_up_table_file.(5)], $
                    [dcs_look_up_table_file.(6)], $
                    [dcs_look_up_table_file.(7)]])
                  
  dcs_coordinate_values = transpose([[dcs_coordinate_table_file.(0)],[dcs_coordinate_table_file.(1)]])   ;2x625 2D array
  
  dcs_diff_squared = fltarr(625) ;initialize the array to hold differences squared i.e. error
  
  For i=0, 624 DO BEGIN ;loops through each row of look_up_values array to compute sum of differences squared and places result in each index of diff_squared
    dcs_diff_squared(i) = dcs_error(dcs_normalized_data, dcs_look_up_values(*,i))
  Endfor
  
  dcs_min_diff_squared = min(dcs_diff_squared, dcs_min_index_diff_squared) ;finds the row in the look up table producing the least error
  print,('dcs min diff squared'), dcs_min_diff_squared
  
  IF dcs_min_diff_squared LT 0.15 THEN BEGIN ;sets a limit on error to avoid what is likely from noise
    dcs_xy_values = dcs_coordinate_values(*,dcs_min_index_diff_squared) ;finds the row on the coordinate values with matching index to coresponding look up values row
    dcs_xy_values_corrected = dcs_xy_values - [x_correction, y_correction] ;corrected dcs x y values correction is dcs center to beamline center in dcs coordinate system
    ;print, ('dcs 1 maxes'), dcs_1_maxes
  ENDIF ELSE BEGIN 
    dcs_xy_values_corrected = [-99, -99] 
  ENDELSE; This will be changed to a return value when dcs_positioning is called as a function
  
  dcs_coordinates = dcs_xy_values_corrected
  
  return, dcs_coordinates

END
