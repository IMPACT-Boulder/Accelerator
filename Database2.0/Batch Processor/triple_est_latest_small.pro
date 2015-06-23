;+
; THIS CODE DOES NOT WORK.
; This code can be revived, but it must first be fixed so bad particles
; aren't treated as good ones. This will be difficult to do without a
; third detector.
;
; NAME:
; triple_est_latest_small
;
; PURPOSE:
; Performs velocity and peak voltage estimation using triple coincidence,
; by convolving the three input signals with an edge-detection kernel
;
; CALLING SEQUENCE:
; params = triple_est_latest_small(sig1, sig2, dt)
;
; INPUTS:
; sig(1,2):  Signals from the two beamline detectors (1D float arrays)
; dt:        Time interval for signals in seconds
; cal:       Optional final detector calibration (50 ohm) in V/C.  
;            If not supplied, a default value for CSA 4 will be applied.
;            
; OUTPUTS:
; Return value: A structure with the following fields:
; 
;   .velocity: Particle velocity in m/s
;   
;   .charge:  Charge measurement in coulombs from final detector.
;                 
;   .quality:   0: Velocity/charge fit failed
;              50: Error was thrown
;             100: Full 3-detector fit succeeded
;
;-
function triple_est_latest_small, sig1_x, sig2_x, dt, cal=cal, verbose=verbose

  COMPILE_OPT IDL2
  
  there_was_an_error = 0
  catch, error_status
  IF error_status NE 0 THEN BEGIN
     catch, /cancel 
     ;PRINT, 'Inside v_estimate_subroutine Error index: ', Error_status
     if keyword_set(verbose) then print, 'Error message from triple_est_latest_small: ', !ERROR_STATE.MSG
     there_was_an_error = 1
     goto, error_jump_point  ;jump to end and set velocity = -3 to indicate error    
  ENDIF
  
  FINAL_DET_CAL = 1.21e13
  if keyword_set(cal) then FINAL_DET_CAL = cal
  
  vb = keyword_set(verbose)
  
  out = { velocity: float(0), charge: float(0), quality: fix(0), $
          idx1: long(0), idx2: long(0)}
  
  D_12 = .3        ; distance 1->2 in m
  
  TH = -2.0             ; Peak threshold for convolved signal
  
  k = replicate(-1,2000)  ; Step kernel
  k[1000:*] = 1
  
  sig1 = convol_fft_andrew(sig1_x,k)
  peaks_1 = peaksimple(sig1, TH, max_p1)
  
  ; No particle detected; bail out
  if peaks_1[0] eq -1 then goto, failed
  
  sig2 = convol_fft_andrew(sig2_x,k)
  peaks_2 = peaksimple(sig2, TH, max_p2)

  ; No particle detected; bail out
  if peaks_2[0] eq -1 then goto, failed
  
  n = n_elements(peaks_1)
  
  if vb then print, 'P1 -> ', peaks_1
  if vb then print, 'P2 -> ', peaks_2
  
  ; For each peak on the 1st detector, look for
  ; matching events on the 2nd detector
  v = -1
  for idx_1=0, n-1 do begin
    
    ; vectors of possible velocities from 1st & 2nd detector
    vcan_1 = D_12/((peaks_3[idx_3]-peaks_1)*dt)
    vcan_2 = D_23/((peaks_1[idx_1]-peaks_2)*dt)
    
    if vb then print, 'V1 (raw) -> ', vcan_1
    if vb then begin print, 'V2 (raw) -> ', vcan_2
     
      print, 'mxmxmxm', max_p1
      print, 'mxmxmxm', max_p2
    endif
    ; require amplitude to match within 50%
    ;wh_1 = where(abs((max_p1-max_p3[idx_3])/max_p3[idx_3]) lt 0.5)
    wh_2 = where(abs((max_p2-max_p1[idx_1])/max_p1[idx_1]) lt 0.5)
   
    if wh_1[0] eq -1 then continue  ; no matches -> go to next peak on 3rd det
    if wh_2[0] eq -1 then continue
     
    vcan_1 = vcan_1[wh_1]
    vcan_2 = vcan_2[wh_2]

    ;if vb then print, 'V1 (amp) -> ', vcan_1
    if vb then print, 'V2 (amp) -> ', vcan_2
    
    ; throw out negative velocities
    wh_1 = where(vcan_1 gt 0)
    wh_2 = where(vcan_2 gt 0)
    
    ;if wh_1[0] eq -1 then continue
    if wh_2[0] eq -1 then continue
    
    ;vcan_1 = vcan_1[wh_1]
    vcan_2 = vcan_2[wh_2]

    ;if vb then print, 'V1 (neg) -> ', vcan_1
    if vb then print, 'V2 (neg) -> ', vcan_2
    
    ; Find the first pair of velocities which match within 10%
    for idx_v1=0, n_elements(vcan_1)-1 do begin
      for idx_v2=0, n_elements(vcan_2)-1 do begin
        wh = abs((vcan_1[idx_v1]-vcan_2[idx_v2])/vcan_2[idx_v2]) lt 0.1
        if wh then begin
          v = mean([vcan_1[idx_v1],vcan_2[idx_v2]])
          goto, exit_loop
        endif
      endfor
    endfor ; 1st & 2nd detector loop
    
  endfor ; third detector loop
  exit_loop:
  
  if v eq -1 then begin
    out.velocity = -1
    out.quality = 0
    out.idx1 = 0
    out.idx2 = 0
  endif else begin ; No matches on any 3rd detector peak
  
    out.velocity = v
    out.quality = 100
    out.idx1 = out.idx3-((D_13/v)/dt)
    out.idx2 = out.idx3-((D_23/v)/dt)
  
    ; Begin charge estimation

    sig3 = smooth(sig3_x,100)
    sig3_start = peaks_3[idx_3] ; index near beginning of detector signal
  
    ; Compute the signal height relative to the local signal,
    ; in case of low-frequency noise or offset
    bstart = sig3_start-200
    if bstart lt 0 then bstart = 0
    base = median(sig3[bstart:sig3_start])
  
    pstop = sig3_start+2000
    if pstop gt (n_elements(sig3)-1) then pstop = n_elements(sig3)-1
    vpeak = max(abs(sig3[sig3_start:pstop]-base))

    if vb then print, 'Base -> ', base
    if vb then print, 'Height -> ', vpeak

    out.charge = vpeak/FINAL_DET_CAL
  endelse
  
  error_jump_point: ;print,'got to error jump point'
  
  if there_was_an_error then begin
    out.velocity = -3.0
    out.quality = 50
    ;out.idx3 = 0
    out.idx1 = 0
    out.idx2 = 0
  endif
  
  failed:
  ;print, 'Fit failed', peaks_3
  return, out
  
end