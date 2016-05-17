;This takes the full raw waveform and onyl returns the baseline for the channel.

FUNCTION dcs_baseline_calc, channel_

  sample_size = n_elements(channel_)

  channel_max = max(channel_, index_)

  mid_point = sample_size/2  ;this is the index half way through the signal

  fast_baseline = .08 * sample_size ;first 8 percent of the signal
  slow_baseline = .92 * sample_size ;last 8 percent of the signal

  IF (index_ GT mid_point) THEN BEGIN ;if the signal spike is towards the end of the signal ie a slow partical
    baseline = mean(channel_[0:fast_baseline]) ;take the first piece of the signal noise to determine the baseline
  ENDIF ELSE BEGIN
    baseline = mean(channel_[slow_baseline:*]) ;take the last piece if it's a fast particle. This is to avoid including the spike in the mean calculation
  ENDELSE

  return, baseline

END