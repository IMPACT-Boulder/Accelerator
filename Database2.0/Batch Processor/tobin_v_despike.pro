;This is a routine which goes with tobin_v_estimate.
;This routine check to see whether there is a large spike of pickup
;caused by the deflection plates corrupting the signals, and removes it.
pro tobin_v_despike,wv1,wv2,wv3,dt,verbose=verbose,reallyverbose=reallyverbose,index=index
  ;reallyverbose=1

  t   = findgen(n_elements(wv1))*dt ;full timebase [s]

  peakvalue1 = max(wv1,peakidx1)
  peakvalue2 = max(wv2,peakidx2)
  peakvalue3 = max(wv3,peakidx3)
  lowvalue1  = min(wv1)
  lowvalue2  = min(wv2)
  lowvalue3  = min(wv3)

  zoomlength=800
  zoomidx = peakidx1 + findgen(zoomlength) - zoomlength/2

  yr1 = [lowvalue1,peakvalue1]
  yr2 = [lowvalue2,peakvalue2]
  yr3 = [lowvalue3,peakvalue3]
     

  ;;Set three criteria to test for existence of noise spike:
  ;; 1. Spike must be within 0.5 us on the first two detectors (just
  ;;       finding max of waveform).
  ;; 2. Peak height must be larger than 20x the std. deviation of
  ;;       the full waveform on first two detectors.
  ;; 3. Peak location must be within the middle XX% of the full waveform.
  spike_existence_criteria = [0,0,0]
     
  ;;print,peakidx
  peak_spacing = dt*abs(peakidx1-peakidx2) ;[s]
  ;;print,peak_spacing
  if peak_spacing le 5.0e-7 then spike_existence_criteria(0)=1
  if spike_existence_criteria(0) eq 1 then begin
     if keyword_set(reallyverbose) then print,'1. Spikes are in same location on first two detectors.' 
     sd1 = stddev(wv1)
     sd2 = stddev(wv2)
     ;print,sd1,peakvalue1/sd1
     ;print,sd2,peakvalue2/sd2
     ;if peakvalue1/sd1 gt 20.0 and peakvalue2/sd2 gt 20.0 then spike_existence_criteria(1)=1
     if peakvalue1/sd1 gt 15.0 and peakvalue2/sd2 gt 15.0 then spike_existence_criteria(1)=1
     if spike_existence_criteria(1) eq 1 then begin
        if keyword_set(reallyverbose) then print,'2. Spikes are high enough on first two detectors.' 
        wv1lengthfloat = float(n_elements(wv1))
        if float(peakidx1) gt 0.2*wv1lengthfloat and float(peakidx1) lt 0.8*wv1lengthfloat then spike_existence_criteria(2)=1 
        if spike_existence_criteria(2) eq 1 and keyword_set(reallyverbose) then print,'3. Spikes are not at far beginning or end of waveforms.'
     endif                      ;testing for criteria(1)
  endif                         ;testing for criteria(0)
     
  wv1_despiked = wv1
  wv2_despiked = wv2
  wv3_despiked = wv3
  if total(spike_existence_criteria - [1,1,1]) eq 0 then begin ;Found a spike, now remove it
     if keyword_set(verbose) then print,'Voltage spike found.  Removing it.'
     ;spikelength_s = 25.0*1.0e-6                               ;[s] with of spike-corrupted area
     spikelength_s = 48.0*1.0e-6                               ;[s] with of spike-corrupted area
     spikelength = fix(spikelength_s / dt)                     ;[samples]
     ;;print,dt,spikelength
     ;smoothidx = peakidx1 + indgen(spikelength) - spikelength/3
     smoothidx = peakidx1 + indgen(spikelength) - spikelength/3
;     wv1spike = wv1(smoothidx)
;     wv2spike = wv2(smoothidx)
;     wv3spike = wv3(smoothidx)
;     ;;do the filtering
;     smoother = spikelength/3
;     ;;print,smoother
;     ;for k=0,5 do begin
;     for k=0,15 do begin
;        wv1spike = median(wv1spike,smoother)
;        wv2spike = median(wv2spike,smoother)
;        wv3spike = median(wv3spike,smoother)
;        wv1spike = smooth(wv1spike,smoother)
;        wv2spike = smooth(wv2spike,smoother,/edge_truncate)
;        wv3spike = smooth(wv3spike,smoother)
;     endfor
;     wv1_despiked(smoothidx) = wv1spike
;     wv2_despiked(smoothidx) = wv2spike
;     wv3_despiked(smoothidx) = wv3spike
  endif

;  if keyword_set(verbose) then begin
;     @definecolors
;     window,0,xsize=1200,ysize=800
;     !p.multi=[0,3,3]
;     plot,t,wv1,/xst,title='raw waveform detector 1',charsize=2,yrange=yr1
;     plot,t(zoomidx),wv1(zoomidx),/xst,title='zoom in around peak',charsize=2,yrange=yr1,thick=3
;     oplot,t(zoomidx),wv1_despiked(zoomidx),color=colors.red
;     plot,t(zoomidx),wv1(zoomidx),/xst,title='zoom in around peak',charsize=2,thick=3,$
;          yrange=[min(wv1_despiked),max(wv1_despiked)]
;     oplot,t(zoomidx),wv1_despiked(zoomidx),color=colors.red
;     
;     plot,t,wv2,/xst,title='raw waveform detector 2',charsize=2,yrange=yr2
;     plot,t(zoomidx),wv2(zoomidx),/xst,title='zoom in around peak',charsize=2,yrange=yr2,thick=3
;     oplot,t(zoomidx),wv2_despiked(zoomidx),color=colors.red
;     plot,t(zoomidx),wv2(zoomidx),/xst,title='zoom in around peak',charsize=2,thick=3,$
;          yrange=[min(wv2_despiked),max(wv2_despiked)]
;     oplot,t(zoomidx),wv2_despiked(zoomidx),color=colors.red
;     
;     plot,t,wv3,/xst,title='raw waveform detector 3',charsize=2,yrange=yr3
;     plot,t(zoomidx),wv3(zoomidx),/xst,title='zoom in around peak',charsize=2,yrange=yr3,thick=3
;     oplot,t(zoomidx),wv3_despiked(zoomidx),color=colors.red
;     plot,t(zoomidx),wv3(zoomidx),/xst,title='zoom in around peak',charsize=2,thick=3,$
;          yrange=[min(wv3_despiked),max(wv3_despiked)]
;     oplot,t(zoomidx),wv3_despiked(zoomidx),color=colors.red
;  endif
;
;  wv1 = wv1_despiked
;  wv2 = wv2_despiked
;  ;;wv3 = wv3_despiked
  if n_elements(smoothidx) eq 0 then smoothidx=[0]
  index=smoothidx

end
