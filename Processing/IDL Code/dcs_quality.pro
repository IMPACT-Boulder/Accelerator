;;Author: William Goode
;;This determines the quality of a dcs waveform based on the signal to noise ratio (SNR) and normalized peak values.
;;The signal to noise ratio indicates the overall strength of the signal while the normalized peak values are 
;;used to determine the relative amount of charge induced amongst the wires. If most or all of the charge is induced on
;;one wire, the quality of the data is lower since this gives less useful information on the particle's postion relative 
;;to the other wires. This program issues a series of demerits for pre-determined criteria. These demerits are subracted
;;from 5 to give the overall quality.

FUNCTION dcs_quality, normalized_peak_values, SNRs, verbose=verbose
  
  demerit = 0

  IF max(SNRs) LT 250 THEN BEGIN
    demerit = demerit + 1
  ENDIF
  
  IF max(SNRs) LT 150 THEN BEGIN
    demerit = demerit + 1
  ENDIF
  
  IF max(SNRs) LT 75 THEN BEGIN
    demerit  = demerit + 1
    if keyword_set(verbose) then print, 'overall weak signal'
  ENDIF
  
  IF max(SNRs) LT 20 THEN BEGIN
    demerit = demerit + 1
    if keyword_set(verbose) then print, 'very weak signal'
  ENDIF
  
  IF max(normalized_peak_values) GT 0.9 THEN BEGIN
    demerit = 4
    if keyword_set(verbose) then print,'close to wire but not exactly a strike'
  ENDIF
  
  quality = 5 -demerit
  
  IF max(normalized_peak_values) GT 0.99 THEN BEGIN
    quality = 0
    if keyword_set(verbose) then print,'wire strike'
  ENDIF

return, quality

END