
;+
; NAME:
; peaksimple
;
; PURPOSE:
; Identifies peaks in a signal and their maximum heights
;
; CALLING SEQUENCE:
; peak_starts = peaksimple(signal, threshold, heights)
;
; INPUTS:
; signal: A 1D array of floats with the signal
; 
; threshold: Peaks start when the signal rises above this value, and end when
;            the signal drops below it.  If negative, peaks start when the
;            signal drops below the threshold, and end when rising above it.
;            
; maxheights:  On return, will contain the maximum height of each peak,
;              defined as abs(sig[start:end])
; 
; OUTPUTS:
; Returns a 1D array of indices at which each peak begins.
;
;-
function peaksimple, sig, threshold, maxheights

  ; wh is now e.g. [0,0,1,1,1,1,1,0,0]
  if threshold gt 0 then begin
    wh = (sig gt threshold)
  endif else begin
    wh = (sig lt threshold)
  endelse
  
  ins = convol(wh,[-1,1],/edge_wrap) ; Mark the start of each peak with a "1"
  wh_ins = where(ins eq 1)  ; Get the index of each peak start
  if wh_ins[0] eq -1 then return, -1
  
  outs = convol(wh, [1,-1], /edge_wrap) ; Mark peak ends
  wh_outs = where(outs eq 1)
  if wh_outs[0] eq -1 then return, -1
  
  maxheights = fltarr(n_elements(wh_ins))
  for idx=0, n_elements(wh_ins)-1 do begin
    maxheights[idx] = max(abs(sig[wh_ins[idx]:wh_outs[idx]]))
  endfor
  
  return, wh_ins
  
end