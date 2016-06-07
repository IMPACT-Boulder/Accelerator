;;Author: William Goode
;;This routine works as part of the batch processor in order to plot xy-coordinates for dcs_1 and dcs_2.
;;This takes a series of waveforms from dcs 1 and 2 and determines the closest match to COULOMB data look-up tables
;;XY values are returned for dcs 1 and 2 in the form of a 1D array.
PRO DCS_POSITIONING
  CD, '../../../../../../../../Users/Clavius/Desktop/Dual DCS First Run'
  file_name = DIALOG_PICKFILE(FILTER=("*.hdf5")) ;Allows user to navigate to hdf5 file
  out = ccldas_read_raw_file(file_name)
  file1 = out.dcs_1.waveform
  file2 = out.dcs_2.waveform
  dcs_1_values = DCS_POSITIONING(file1)
  dcs_2_values = DCS_POSITIONING(file2)
  print, [dcs_1_values, dcs_2_values]
  
END


FUNCTION DCS_POSITIONING, waveform, x_correction, y_correction, velocity, plot_anyway=plot_anyway, verbose=verbose; This will eventually be changed to a function that returns xy values
IF velocity GT 0 || keyword_set(plot_anyway) THEN BEGIN ;plot_anyway is used when there is no velocity found for the particle but 
  IF velocity GT 0 THEN BEGIN                           ; user wishes to plot with dcs anyway.
    window_size = -0.00131*velocity + 10.6
    rank = window_size
  ENDIF ELSE BEGIN
      rank = 6
      if keyword_set(verbose) then print, 'Not using velocity!'
  ENDELSE
  
  if keyword_set(verbose) then print, 'rank',rank
  
  dcs_maxes = dcs_Waveform_Max_HDF5(waveform, rank);1x16 array from both dcs
  
  highest_dcs_max = max(dcs_maxes, highest_dcs_max_index) ;finds the maximum peak voltage after adjustments in order to determine quality of the signal
  max_channel_number = highest_dcs_max_index
  channel_noise_sd = dcs_channel_noise(waveform, rank)
  amplitude_threshold = 4.5 * channel_noise_sd(max_channel_number)
  
  ;Check that the peak stands out from noise
  IF highest_dcs_max GE amplitude_threshold && mean(dcs_maxes) NE 0 THEN BEGIN ;0.04 is typically the lowest clear particle signal observed in dcs waveforms. This may be adjusted in the future.
    dcs_normalized_data = dcs_normalize_2(dcs_maxes);1x8 array
    ;call dcs_find_coordinates_from_peak_voltages here 
    dcs_find_coordinates_from_peak_voltages, dcs_normalized_data, dcs_xy_values
    dcs_xy_values_corrected = dcs_xy_values - [x_correction, y_correction]
    
    ;Quality Determination
    SNRs = dcs_SNR(dcs_maxes, channel_noise_sd); 1x8 array of singnal to noise ratios for each channel
    
    dcs_estimate_quality = dcs_quality(dcs_normalized_data, SNRs, /verbose) 
    
    dcs_coordinates = [dcs_xy_values_corrected, dcs_estimate_quality]
    if keyword_set(verbose) then print, 'dcs_coordinates ', dcs_coordinates, 'dcs_quality', dcs_estimate_quality
  ENDIF ELSE BEGIN
    dcs_xy_values = [-99,-99]
    dcs_estimate_quality = 0
    dcs_coordinates = [dcs_xy_values, dcs_estimate_quality]
  ENDELSE
  
  ENDIF ELSE BEGIN
    dcs_xy_values = [-99,-99]
    dcs_estimate_quality = 0
    dcs_coordinates = [dcs_xy_values, dcs_estimate_quality]
  ENDELSE
  
  return, dcs_coordinates ;[mm] xy position

END
