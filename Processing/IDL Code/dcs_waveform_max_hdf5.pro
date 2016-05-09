FUNCTION dcs_Waveform_Max_HDF5 ,waveform, rank

  ;file_name = DIALOG_PICKFILE(FILTER=("*.hdf5")) ;Allows user to navigate to a csv file
  dcs_first_plane = waveform[0:3,*]
  dcs_second_plane = waveform[4:7,*]
  
  dcs_absolute_max_index_first_plane = dcs_absolute_max_index(dcs_first_plane, rank); This needs to be done for each plane separately
  dcs_absolute_max_index_second_plane = dcs_absolute_max_index(dcs_second_plane, rank)
  
  print,('dcs 1 first plane'), dcs_absolute_max_index_first_plane
  print, ('dcs 1 second plane'), dcs_absolute_max_index_second_plane
  
  dcs_channel_1 = SMOOTH(waveform[0, *], rank) ;Each channel from dcs 1 is put into a 1D array
  dcs_channel_2 = SMOOTH(waveform[1, *], rank)
  dcs_channel_3 = SMOOTH(waveform[2, *], rank)
  dcs_channel_4 = SMOOTH(waveform[3, *], rank)
  dcs_channel_5 = SMOOTH(waveform[4, *], rank)
  dcs_channel_6 = SMOOTH(waveform[5, *], rank)
  dcs_channel_7 = SMOOTH(waveform[6, *], rank)
  dcs_channel_8 = SMOOTH(waveform[7, *], rank)
  
  
  ;print, dcs_1_channel_3(dcs_1_absolute_max_index_first_plane)
  ;print, dcs_2_channel_6(dcs_2_absolute_max_index)
  
  dcs_channel_1_adjusted_max = dcs_Baseline_Max_2(dcs_channel_1, dcs_absolute_max_index_first_plane) ;calls the function that calculates max from channel baseline
  dcs_channel_2_adjusted_max = dcs_Baseline_Max_2(dcs_channel_2, dcs_absolute_max_index_first_plane)
  dcs_channel_3_adjusted_max = dcs_Baseline_Max_2(dcs_channel_3, dcs_absolute_max_index_first_plane)
  dcs_channel_4_adjusted_max = dcs_Baseline_Max_2(dcs_channel_4, dcs_absolute_max_index_first_plane)
  dcs_channel_5_adjusted_max = dcs_Baseline_Max_2(dcs_channel_5, dcs_absolute_max_index_second_plane)
  dcs_channel_6_adjusted_max = dcs_Baseline_Max_2(dcs_channel_6, dcs_absolute_max_index_second_plane)
  dcs_channel_7_adjusted_max = dcs_Baseline_Max_2(dcs_channel_7, dcs_absolute_max_index_second_plane)
  dcs_channel_8_adjusted_max = dcs_Baseline_Max_2(dcs_channel_8, dcs_absolute_max_index_second_plane)
  
  channel_maxes_array = [ dcs_channel_1_adjusted_max, $
                          dcs_channel_2_adjusted_max, $
                          dcs_channel_3_adjusted_max, $
                          dcs_channel_4_adjusted_max, $
                          dcs_channel_5_adjusted_max, $
                          dcs_channel_6_adjusted_max, $
                          dcs_channel_7_adjusted_max, $
                          dcs_channel_8_adjusted_max]

   
  return, channel_maxes_array ;1D array of channel max values

END