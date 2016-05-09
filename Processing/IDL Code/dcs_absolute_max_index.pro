FUNCTION dcs_absolute_max_index, waves, rank

  channel_1 = SMOOTH(waves[0, *], rank)
  channel_2 = SMOOTH(waves[1, *], rank)
  channel_3 = SMOOTH(waves[2, *], rank)
  channel_4 = SMOOTH(waves[3, *], rank)

  channel_maxes = [max(channel_1, index_1), max(channel_2, index_2), max(channel_3, index_3), max(channel_4, index_4)]
  print,('channel maxes'),channel_maxes
  channel_max_indexes = [index_1, index_2, index_3, index_4]
  absolute_max_channel = max(channel_maxes, max_index)
  max_index = channel_max_indexes(max_index)



  return, max_index

END