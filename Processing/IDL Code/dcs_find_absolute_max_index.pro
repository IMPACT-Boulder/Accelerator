;Author: William Goode
;This uses wide window boxcar averaging to find the approximate location of the peak. The original waveform is used to calculate the 
;baseline in order to compare the four wires in the plane.Finder rank is used to locate the peak while rank is used to calculate baseline
;since this is the width used throughout the rest of the positioning routine. The result is the index in the plane at which the particle
;is extimated to be within the plane.

FUNCTION dcs_find_absolute_max_index, waves, rank, finder_rank

  channel_1 = waves[0, *]
  channel_2 = waves[1, *]
  channel_3 = waves[2, *]
  channel_4 = waves[3, *]


  ;p1 = PLOT(channel_3, XRANGE=[900,1100])
  ;p2 = PLOT(channel_3)
  channel_1_low_filt = SMOOTH(channel_1, rank)
  channel_2_low_filt = SMOOTH(channel_2, rank)
  channel_3_low_filt = SMOOTH(channel_3, rank)
  channel_4_low_filt = SMOOTH(channel_4, rank)

  channel_1_baseline = dcs_baseline_calc(channel_1_low_filt)
  channel_2_baseline = dcs_baseline_calc(channel_2_low_filt)
  channel_3_baseline = dcs_baseline_calc(channel_3_low_filt)
  channel_4_baseline = dcs_baseline_calc(channel_4_low_filt)

  channel_1_high_filt = SMOOTH(channel_1, finder_rank)
  channel_2_high_filt = SMOOTH(channel_2, finder_rank)
  channel_3_high_filt = SMOOTH(channel_3, finder_rank)
  channel_4_high_filt = SMOOTH(channel_4, finder_rank)

  channel_1_max = max(channel_1_high_filt, index_1) - channel_1_baseline
  channel_2_max = max(channel_2_high_filt, index_2) - channel_2_baseline
  channel_3_max = max(channel_3_high_filt, index_3) - channel_3_baseline
  channel_4_max = max(channel_4_high_filt, index_4) - channel_4_baseline

  ;channel_maxes = [max(channel_1, index_1), max(channel_2, index_2), max(channel_3, index_3), max(channel_4, index_4)]
  ;channel_maxes = [max(channel_1_filt, index_1), max(channel_2_filt, index_2), max(channel_3_filt, index_3), max(channel_4_filt, index_4)]
  ;print,('channel maxes'),channel_maxes
  channel_maxes = [channel_1_max, channel_2_max, channel_3_max, channel_4_max]
  channel_max_indexes = [index_1, index_2, index_3, index_4]
  absolute_max_channel = max(channel_maxes, max_index);max _index shows which channel has highest max value.
  highest_max_index = channel_max_indexes(max_index);Take index from corresponding channel.

  

  return, highest_max_index

END