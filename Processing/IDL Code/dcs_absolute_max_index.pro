FUNCTION dcs_absolute_max_index, waves, rank

  channel_1 = waves[0, *]
  channel_2 = waves[1, *]
  channel_3 = waves[2, *]
  channel_4 = waves[3, *]

  channel_1_filt = SMOOTH(waves[0, *], rank)
  channel_2_filt = SMOOTH(waves[1, *], rank)
  channel_3_filt = SMOOTH(waves[2, *], rank)
  channel_4_filt = SMOOTH(waves[3, *], rank)
  
  channel_1_max_index_cheat = max(channel_1_filt, index_1)
  channel_2_max_index_cheat = max(channel_2_filt, index_2)
  channel_3_max_index_cheat = max(channel_3_filt, index_3)
  channel_4_max_index_cheat = max(channel_4_filt, index_4)
  
  channel_1_max = dcs_baseline_max_init(channel_1_filt)
  channel_2_max = dcs_baseline_max_init(channel_2_filt)
  channel_3_max = dcs_baseline_max_init(channel_3_filt)
  channel_4_max = dcs_baseline_max_init(channel_4_filt)

  channel_maxes = [channel_1_max, channel_2_max, channel_3_max, channel_4_max]
  print,('channel maxes'),channel_maxes
  channel_max_indexes = [index_1, index_2, index_3, index_4]
  absolute_max_channel = max(channel_maxes, max_index)
  absolute_max_index = channel_max_indexes(max_index)



  return, absolute_max_index

END