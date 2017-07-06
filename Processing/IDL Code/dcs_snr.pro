;;Author: William Goode
;;Takes each channel peak value and noise standard deviation. 
;;Calculates signal to noise ratio (SNR) using square of the amplitude ratio.

FUNCTION dcs_SNR, peak_values, channel_standard_deviations, verbose=verbose

  channel_1_snr = (peak_values(0)/channel_standard_deviations(0))^2
  channel_2_snr = (peak_values(1)/channel_standard_deviations(1))^2
  channel_3_snr = (peak_values(2)/channel_standard_deviations(2))^2
  channel_4_snr = (peak_values(3)/channel_standard_deviations(3))^2
  channel_5_snr = (peak_values(4)/channel_standard_deviations(4))^2
  channel_6_snr = (peak_values(5)/channel_standard_deviations(5))^2
  channel_7_snr = (peak_values(6)/channel_standard_deviations(6))^2
  channel_8_snr = (peak_values(7)/channel_standard_deviations(7))^2
  
  SNRs = [channel_1_snr, $
          channel_2_snr, $
          channel_3_snr, $
          channel_4_snr, $
          channel_5_snr, $
          channel_6_snr, $
          channel_7_snr, $
          channel_8_snr]
  
  if keyword_set(verbose) then print, ('channel SNRs'), SNRs
  
  return, SNRs

END