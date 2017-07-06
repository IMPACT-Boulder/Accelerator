;Author: William Goode
;This routine first determines the index at which the pariticle is in the wire plane, adjusts for varying baseline, then
;returns a 1D array of 8 peak wire values

FUNCTION dcs_Waveform_Max_HDF5 ,waveform, rank

  dcs_first_plane = waveform[0:3,*]
  dcs_second_plane = waveform[4:7,*]
  
  ;cut window out of original waveform
  time_window = 200
  
  finder_rank = 50
  
  ;sample_size = n_elements(dcs_first_plane[0,*])
  ;midpoint = 0.5 * sample_size
  
  ;Locate the waveform peak using wide window boxcar averaging in order to narrow search on original waveform
  first_plane_waveform_index = dcs_find_absolute_max_index(dcs_first_plane, rank, finder_rank)
  second_plane_waveform_index = dcs_find_absolute_max_index(dcs_second_plane, rank, finder_rank)
  
  ;Check that each wire plane peak value is within a reasonable timeframe. If not, it is probably noise.
  plane_disparity = ABS(first_plane_waveform_index - second_plane_waveform_index)
  ;offset_1 = ABS(first_plane_waveform_index - midpoint)
  ;offset_2 = ABS(second_plane_waveform_index - midpoint)
  tolerance = 100
  
  ;Both wire plane peaks should appear near the middle of the sample set. This checks for noise.
  IF plane_disparity GT tolerance THEN BEGIN
    channel_maxes_array = 0
    ENDIF ELSE BEGIN
    
    ;Cut narrow window around peak location on original waveform
    dcs_first_plane_cut = dcs_first_plane[*, (first_plane_waveform_index - time_window):(first_plane_waveform_index + time_window)]
    dcs_second_plane_cut = dcs_second_plane[*, (second_plane_waveform_index - time_window):(second_plane_waveform_index + time_window)]
    
    ;This uses the narrowed waveform along with the baseline of the full waveform to calculate the peak of the plane i.e. particle in plane
    dcs_absolute_max_index_first_plane = dcs_cut_absolute_max_index(dcs_first_plane_cut, dcs_first_plane, rank)
    dcs_absolute_max_index_second_plane = dcs_cut_absolute_max_index(dcs_second_plane_cut, dcs_second_plane, rank)
    
    ;Transform the index from cut waveform to an index in the full waveform
    final_first_plane_index = first_plane_waveform_index - time_window + dcs_absolute_max_index_first_plane
    final_second_plane_index = second_plane_waveform_index - time_window + dcs_absolute_max_index_second_plane
  
  ;dcs_absolute_max_index_first_plane = dcs_absolute_max_index(dcs_first_plane, rank); This needs to be done for each plane separately
  ;dcs_absolute_max_index_second_plane = dcs_absolute_max_index(dcs_second_plane, rank)
  
  
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
  
    dcs_channel_1_adjusted_max = dcs_Baseline_Max_2(dcs_channel_1, final_first_plane_index) ;calls the function that calculates max from channel baseline
    dcs_channel_2_adjusted_max = dcs_Baseline_Max_2(dcs_channel_2, final_first_plane_index)
    dcs_channel_3_adjusted_max = dcs_Baseline_Max_2(dcs_channel_3, final_first_plane_index)
    dcs_channel_4_adjusted_max = dcs_Baseline_Max_2(dcs_channel_4, final_first_plane_index)
    dcs_channel_5_adjusted_max = dcs_Baseline_Max_2(dcs_channel_5, final_second_plane_index)
    dcs_channel_6_adjusted_max = dcs_Baseline_Max_2(dcs_channel_6, final_second_plane_index)
    dcs_channel_7_adjusted_max = dcs_Baseline_Max_2(dcs_channel_7, final_second_plane_index)
    dcs_channel_8_adjusted_max = dcs_Baseline_Max_2(dcs_channel_8, final_second_plane_index)
  
    channel_maxes_array = [ dcs_channel_1_adjusted_max, $
                          dcs_channel_2_adjusted_max, $
                          dcs_channel_3_adjusted_max, $
                          dcs_channel_4_adjusted_max, $
                          dcs_channel_5_adjusted_max, $
                          dcs_channel_6_adjusted_max, $
                          dcs_channel_7_adjusted_max, $
                          dcs_channel_8_adjusted_max]
                         
   ENDELSE
   
   return, channel_maxes_array ;1D array of channel max values

END