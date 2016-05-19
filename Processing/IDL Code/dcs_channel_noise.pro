;Author: William Goode
;This finds the standard deviation of the noise on each channel.

FUNCTION dcs_channel_noise, waveform, rank

  dcs_channel_1 = SMOOTH(waveform[0, *], rank) ;Each channel from dcs 1 is put into a 1D array
  dcs_channel_2 = SMOOTH(waveform[1, *], rank)
  dcs_channel_3 = SMOOTH(waveform[2, *], rank)
  dcs_channel_4 = SMOOTH(waveform[3, *], rank)
  dcs_channel_5 = SMOOTH(waveform[4, *], rank)
  dcs_channel_6 = SMOOTH(waveform[5, *], rank)
  dcs_channel_7 = SMOOTH(waveform[6, *], rank)
  dcs_channel_8 = SMOOTH(waveform[7, *], rank)
  
  ;Take the first portion of the waveform in order to best establish the noise characteristic.
  sample_size = 0.08 * n_elements(dcs_channel_1)
  
  channel_1_noise = STDDEV(dcs_channel_1[0:sample_size])
  channel_2_noise = STDDEV(dcs_channel_2[0:sample_size])
  channel_3_noise = STDDEV(dcs_channel_3[0:sample_size])
  channel_4_noise = STDDEV(dcs_channel_4[0:sample_size])
  channel_5_noise = STDDEV(dcs_channel_5[0:sample_size])
  channel_6_noise = STDDEV(dcs_channel_6[0:sample_size])
  channel_7_noise = STDDEV(dcs_channel_7[0:sample_size])
  channel_8_noise = STDDEV(dcs_channel_8[0:sample_size])
  
  channel_noise = [channel_1_noise, $
                   channel_2_noise, $
                   channel_3_noise, $
                   channel_4_noise, $
                   channel_5_noise, $
                   channel_6_noise, $
                   channel_7_noise, $
                   channel_8_noise]
                   
  return, channel_noise
  
 END
                   