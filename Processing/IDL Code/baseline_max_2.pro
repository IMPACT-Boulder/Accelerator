FUNCTION Baseline_Max_2, channel_ ,index_


  channel_max = channel_(index_) ;max signal of each channel along with its index

  channel_baseline_max = adjusted_baseline_max(channel_, channel_max, index_) ;calls the baseline function for each channel

  return, channel_baseline_max


END

FUNCTION adjusted_baseline_max, channel_, channel_max, max_index ;finds the baseline of the channel noise

  sample_size = n_elements(channel_)

  mid_point = sample_size/2  ;this is the index half way through the signal

  fast_baseline = .08 * sample_size ;first 8 percent of the signal
  slow_baseline = .92 * sample_size ;last 8 percent of the signal

  IF (max_index GT mid_point) THEN BEGIN ;if the signal spike is towards the end of the signal ie a slow partical
    baseline = mean(channel_[0:fast_baseline]) ;take the first piece of the signal noise to determine the baseline
  ENDIF ELSE BEGIN
    baseline = mean(channel_[slow_baseline:*]) ;take the last piece if it's a fast particle. This is to avoid including the spike in the mean calculation
  ENDELSE

  adjusted_max = channel_max - baseline ;The true amplitude of the spike is now taken starting at the channel baseline

  return, adjusted_max

END

