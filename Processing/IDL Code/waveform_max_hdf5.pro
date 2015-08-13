FUNCTION Waveform_Max_HDF5 ,file_name

  ;file_name = DIALOG_PICKFILE(FILTER=("*.hdf5")) ;Allows user to navigate to a csv file

  data = ccldas_read_raw_file(file_name)
  waves1 = data.dcs_1.waveform ;pulls waveform data from HDF5 file
  waves2 = data.dcs_2.waveform ;pulls waveform data from HDF5 file
  
  dcs_1_first_plane = waves1[0:3,*]
  dcs_1_second_plane = waves1[4:7,*]
  
  dcs_2_first_plane = waves2[0:3,*]
  dcs_2_second_plane = waves2[4:7,*]
  
  dcs_1_absolute_max_index_first_plane = absolute_max_index(dcs_1_first_plane); This needs to be done for each plane separately
  dcs_1_absolute_max_index_second_plane = absolute_max_index(dcs_1_second_plane)
  
  dcs_2_absolute_max_index_first_plane = absolute_max_index(dcs_2_first_plane)
  dcs_2_absolute_max_index_second_plane = absolute_max_index(dcs_2_second_plane)
  
  print,('dcs 1 first plane'), dcs_1_absolute_max_index_first_plane
  print, ('dcs 1 second plane'), dcs_1_absolute_max_index_second_plane
  print, ('dcs 2 first plane'), dcs_2_absolute_max_index_first_plane
  print, ('dcs 2 second plane'), dcs_2_absolute_max_index_second_plane

  dcs_1_channel_1 = waves1[0, *] ;Each channel from dcs 1 is put into a 1D array
  dcs_1_channel_2 = waves1[1, *]
  dcs_1_channel_3 = waves1[2, *]
  dcs_1_channel_4 = waves1[3, *]
  dcs_1_channel_5 = waves1[4, *]
  dcs_1_channel_6 = waves1[5, *]
  dcs_1_channel_7 = waves1[6, *]
  dcs_1_channel_8 = waves1[7, *]
  
  dcs_2_channel_1 = waves2[0, *] ;Each channel from dcs 2 is put into a 1D array
  dcs_2_channel_2 = waves2[1, *]
  dcs_2_channel_3 = waves2[2, *]
  dcs_2_channel_4 = waves2[3, *]
  dcs_2_channel_5 = waves2[4, *]
  dcs_2_channel_6 = waves2[5, *]
  dcs_2_channel_7 = waves2[6, *]
  dcs_2_channel_8 = waves2[7, *]
  
  ;print, dcs_1_channel_3(dcs_1_absolute_max_index_first_plane)
  ;print, dcs_2_channel_6(dcs_2_absolute_max_index)

  dcs_1_channel_1_adjusted_max = Baseline_Max_2(dcs_1_channel_1, dcs_1_absolute_max_index_first_plane) ;calls the function that calculates max from channel baseline
  dcs_1_channel_2_adjusted_max = Baseline_Max_2(dcs_1_channel_2, dcs_1_absolute_max_index_first_plane)
  dcs_1_channel_3_adjusted_max = Baseline_Max_2(dcs_1_channel_3, dcs_1_absolute_max_index_first_plane)
  dcs_1_channel_4_adjusted_max = Baseline_Max_2(dcs_1_channel_4, dcs_1_absolute_max_index_first_plane)
  dcs_1_channel_5_adjusted_max = Baseline_Max_2(dcs_1_channel_5, dcs_1_absolute_max_index_second_plane)
  dcs_1_channel_6_adjusted_max = Baseline_Max_2(dcs_1_channel_6, dcs_1_absolute_max_index_second_plane)
  dcs_1_channel_7_adjusted_max = Baseline_Max_2(dcs_1_channel_7, dcs_1_absolute_max_index_second_plane)
  dcs_1_channel_8_adjusted_max = Baseline_Max_2(dcs_1_channel_8, dcs_1_absolute_max_index_second_plane)
  
  
  dcs_2_channel_1_adjusted_max = Baseline_Max_2(dcs_2_channel_1, dcs_2_absolute_max_index_first_plane) ;calls the function that calculates max from channel baseline
  dcs_2_channel_2_adjusted_max = Baseline_Max_2(dcs_2_channel_2, dcs_2_absolute_max_index_first_plane)
  dcs_2_channel_3_adjusted_max = Baseline_Max_2(dcs_2_channel_3, dcs_2_absolute_max_index_first_plane)
  dcs_2_channel_4_adjusted_max = Baseline_Max_2(dcs_2_channel_4, dcs_2_absolute_max_index_first_plane)
  dcs_2_channel_5_adjusted_max = Baseline_Max_2(dcs_2_channel_5, dcs_2_absolute_max_index_second_plane)
  dcs_2_channel_6_adjusted_max = Baseline_Max_2(dcs_2_channel_6, dcs_2_absolute_max_index_second_plane)
  dcs_2_channel_7_adjusted_max = Baseline_Max_2(dcs_2_channel_7, dcs_2_absolute_max_index_second_plane)
  dcs_2_channel_8_adjusted_max = Baseline_Max_2(dcs_2_channel_8, dcs_2_absolute_max_index_second_plane)
  
  channel_maxes_array = max_array(  dcs_1_channel_1_adjusted_max, $
                              dcs_1_channel_2_adjusted_max, $
                              dcs_1_channel_3_adjusted_max, $
                              dcs_1_channel_4_adjusted_max, $
                              dcs_1_channel_5_adjusted_max, $
                              dcs_1_channel_6_adjusted_max, $
                              dcs_1_channel_7_adjusted_max, $
                              dcs_1_channel_8_adjusted_max, $
                              dcs_2_channel_1_adjusted_max, $
                              dcs_2_channel_2_adjusted_max, $
                              dcs_2_channel_3_adjusted_max, $
                              dcs_2_channel_4_adjusted_max, $
                              dcs_2_channel_5_adjusted_max, $
                              dcs_2_channel_6_adjusted_max, $
                              dcs_2_channel_7_adjusted_max, $
                              dcs_2_channel_8_adjusted_max)

   
  return, channel_maxes_array ;1D array of channel max values

END

FUNCTION max_array, max_1, max_2, max_3, max_4, max_5, max_6, max_7, max_8, max_9, max_10, max_11, max_12, max_13, max_14, max_15, max_16 ;places each parameter into a 1D array

  channel_maxes = [ max_1, $
                    max_2, $
                    max_3, $
                    max_4, $
                    max_5, $
                    max_6, $
                    max_7, $
                    max_8, $
                    max_9, $
                    max_10,$
                    max_11,$
                    max_12,$
                    max_13,$
                    max_14,$
                    max_15,$
                    max_16]
  
  return, channel_maxes
  
END

FUNCTION absolute_max_index, waves

  channel_1 = waves[0, *]
  channel_2 = waves[1, *]
  channel_3 = waves[2, *]
  channel_4 = waves[3, *]

  channel_maxes = [max(channel_1, index_1), max(channel_2, index_2), max(channel_3, index_3), max(channel_4, index_4)]
  ;print,('channel maxes'),channel_maxes
  channel_max_indexes = [index_1, index_2, index_3, index_4]
  absolute_max_channel = max(channel_maxes, max_index)
  max_index = channel_max_indexes(max_index)



  return, max_index


END