FUNCTION dcs_absolute_max_index, waves

  channel_1 = waves[0, *]
  channel_2 = waves[1, *]
  channel_3 = waves[2, *]
  channel_4 = waves[3, *]

  channel_maxes = [max(channel_1, index_1), max(channel_2, index_2), max(channel_3, index_3), max(channel_4, index_4)]
  print,('channel maxes'),channel_maxes
  channel_max_indexes = [index_1, index_2, index_3, index_4]
  absolute_max_channel = max(channel_maxes, max_index)
  max_index = channel_max_indexes(max_index)



  return, max_index

END