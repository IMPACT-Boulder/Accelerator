;This takes the cut waveform as well as the full waveform and smoothing rank. The full waveform is smoothed and used to calculate the true 
;channel baseline. The cut waveform is used to find the true peak. Using both the peak value and the baseline, the index of the plane's 
;maxe value is returned for analysis
;Author: William Goode
;Created: 16 May 2016

FUNCTION dcs_cut_absolute_max_index, cut_waveform, full_waveform,  rank

  channel_1_full = full_waveform[0, *]
  channel_2_full = full_waveform[1, *]
  channel_3_full = full_waveform[2, *]
  channel_4_full = full_waveform[3, *]
  
  channel_1_cut = cut_waveform[0, *]
  channel_2_cut = cut_waveform[1, *]
  channel_3_cut = cut_waveform[2, *]
  channel_4_cut = cut_waveform[3, *]
  
  ;p1 = PLOT(channel_3, XRANGE=[900,1100])
  ;p2 = PLOT(channel_3)
  channel_1_full_filt = SMOOTH(channel_1_full, rank)
  channel_2_full_filt = SMOOTH(channel_2_full, rank)
  channel_3_full_filt = SMOOTH(channel_3_full, rank)
  channel_4_full_filt = SMOOTH(channel_4_full, rank)
  
  channel_1_cut_filt = SMOOTH(channel_1_cut, rank)
  channel_2_cut_filt = SMOOTH(channel_2_cut, rank)
  channel_3_cut_filt = SMOOTH(channel_3_cut, rank)
  channel_4_cut_filt = SMOOTH(channel_4_cut, rank)
  
  ;Find the baseline value for individual channels
  channel_1_full_baseline = dcs_baseline_calc(channel_1_full_filt)
  channel_2_full_baseline = dcs_baseline_calc(channel_2_full_filt)
  channel_3_full_baseline = dcs_baseline_calc(channel_3_full_filt)
  channel_4_full_baseline = dcs_baseline_calc(channel_4_full_filt)

  ;Find the max values by subtracting the baseline from the peak values
  channel_1_cut_max = max(channel_1_cut_filt, index_1) - channel_1_full_baseline ;use this to get the index at peak value for each channel
  channel_2_cut_max = max(channel_2_cut_filt, index_2) - channel_2_full_baseline
  channel_3_cut_max = max(channel_3_cut_filt, index_3) - channel_3_full_baseline
  channel_4_cut_max = max(channel_4_cut_filt, index_4) - channel_4_full_baseline
  
  

  ;channel_maxes = [max(channel_1, index_1), max(channel_2, index_2), max(channel_3, index_3), max(channel_4, index_4)]
  ;channel_maxes = [max(channel_1_filt, index_1), max(channel_2_filt, index_2), max(channel_3_filt, index_3), max(channel_4_filt, index_4)]
  ;print,('channel maxes'),channel_maxes
  channel_maxes = [channel_1_cut_max, channel_2_cut_max, channel_3_cut_max, channel_4_cut_max]
  channel_max_indexes = [index_1, index_2, index_3, index_4]
  absolute_max_channel = max(channel_maxes, max_index)
  max_index = channel_max_indexes(max_index)



  return, max_index

END