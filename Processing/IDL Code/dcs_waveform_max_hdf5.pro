FUNCTION dcs_Waveform_Max_HDF5 ,file_name

  ;file_name = DIALOG_PICKFILE(FILTER=("*.hdf5")) ;Allows user to navigate to a csv file
  
  data = ccldas_read_raw_file(file_name)
  
  waves1 = data.dcs_1.waveform ;pulls waveform data from HDF5 file
  waves2 = data.dcs_2.waveform ;pulls waveform data from HDF5 file
  
  dcs_1_first_plane = waves1[0:3,*]
  dcs_1_second_plane = waves1[4:7,*]
  
  dcs_2_first_plane = waves2[0:3,*]
  dcs_2_second_plane = waves2[4:7,*]
  
  dcs_1_absolute_max_index_first_plane = dcs_absolute_max_index(dcs_1_first_plane); This needs to be done for each plane separately
  dcs_1_absolute_max_index_second_plane = dcs_absolute_max_index(dcs_1_second_plane)
  
  dcs_2_absolute_max_index_first_plane = dcs_absolute_max_index(dcs_2_first_plane)
  dcs_2_absolute_max_index_second_plane = dcs_absolute_max_index(dcs_2_second_plane)
  
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
  
  dcs_1_channel_1_adjusted_max = dcs_Baseline_Max_2(dcs_1_channel_1, dcs_1_absolute_max_index_first_plane) ;calls the function that calculates max from channel baseline
  dcs_1_channel_2_adjusted_max = dcs_Baseline_Max_2(dcs_1_channel_2, dcs_1_absolute_max_index_first_plane)
  dcs_1_channel_3_adjusted_max = dcs_Baseline_Max_2(dcs_1_channel_3, dcs_1_absolute_max_index_first_plane)
  dcs_1_channel_4_adjusted_max = dcs_Baseline_Max_2(dcs_1_channel_4, dcs_1_absolute_max_index_first_plane)
  dcs_1_channel_5_adjusted_max = dcs_Baseline_Max_2(dcs_1_channel_5, dcs_1_absolute_max_index_second_plane)
  dcs_1_channel_6_adjusted_max = dcs_Baseline_Max_2(dcs_1_channel_6, dcs_1_absolute_max_index_second_plane)
  dcs_1_channel_7_adjusted_max = dcs_Baseline_Max_2(dcs_1_channel_7, dcs_1_absolute_max_index_second_plane)
  dcs_1_channel_8_adjusted_max = dcs_Baseline_Max_2(dcs_1_channel_8, dcs_1_absolute_max_index_second_plane)
  
  dcs_2_channel_1_adjusted_max = dcs_Baseline_Max_2(dcs_2_channel_1, dcs_2_absolute_max_index_first_plane) ;calls the function that calculates max from channel baseline
  dcs_2_channel_2_adjusted_max = dcs_Baseline_Max_2(dcs_2_channel_2, dcs_2_absolute_max_index_first_plane)
  dcs_2_channel_3_adjusted_max = dcs_Baseline_Max_2(dcs_2_channel_3, dcs_2_absolute_max_index_first_plane)
  dcs_2_channel_4_adjusted_max = dcs_Baseline_Max_2(dcs_2_channel_4, dcs_2_absolute_max_index_first_plane)
  dcs_2_channel_5_adjusted_max = dcs_Baseline_Max_2(dcs_2_channel_5, dcs_2_absolute_max_index_second_plane)
  dcs_2_channel_6_adjusted_max = dcs_Baseline_Max_2(dcs_2_channel_6, dcs_2_absolute_max_index_second_plane)
  dcs_2_channel_7_adjusted_max = dcs_Baseline_Max_2(dcs_2_channel_7, dcs_2_absolute_max_index_second_plane)
  dcs_2_channel_8_adjusted_max = dcs_Baseline_Max_2(dcs_2_channel_8, dcs_2_absolute_max_index_second_plane)
  
  channel_maxes_array = [ dcs_1_channel_1_adjusted_max, $
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
                          dcs_2_channel_8_adjusted_max]

   
  return, channel_maxes_array ;1D array of channel max values

END