;This is a routine which goes with tobin_v_estimate.
;This routine check to see whether there is a large spike of pickup
;caused by the deflection plates corrupting the signals, and removes it.

;Revised 10/13/14:  This routine now just *identifies* the spike and its
;width, so that tobin_v_estimate can use those indices to squash the
;filtered waveforms (rather than trying to squash the spike in the
;raw waveforms and fool the filter).
;
;Note: The values of spikeindices identify which part of the filtered
;waveform to squash, which is wider than the width of the spike itself.

pro tobin_v_despike,wv1,wv2,wv3,dt,v_guess,thereisaspike,$
                    spike_peakidx,spike_indices,$
                    verbose=verbose,reallyverbose=reallyverbose
  ;reallyverbose=1

  t   = findgen(n_elements(wv1))*dt ;full timebase [s]
  peakvalue1 = max(wv1,peakidx1)
  peakvalue2 = max(wv2,peakidx2)
  peakvalue3 = max(wv3,peakidx3)
  lowvalue1  = min(wv1)
  lowvalue2  = min(wv2)
  lowvalue3  = min(wv3)

  ;zoomlength=800
  ;zoomidx = peakidx1 + findgen(zoomlength) - zoomlength/2

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
  thereisaspike = 0
     
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
     
  ;;New treatment as of 10/13/14: just identify spike (existence,
  ;;location, width) but don't remove it.


  ;Make squashed width based on v_guess



  if total(spike_existence_criteria - [1,1,1]) eq 0 then begin ;Found a spike, now remove it
     if keyword_set(verbose) then print,'Voltage spike found.'
     thereisaspike = 1          ;existence
     spike_peakidx = peakidx1    ;location
     extrawidth = 0
     if v_guess ge 15000.0 then begin            ;where relevant, add extra squashed indices to right
        search_width_s = 10.0 * 1.0e-6 ;[s] width of area to search within 
        search_width   = long(search_width_s/dt) ;[samples]
        search_region  = spike_peakidx + lindgen(search_width) - search_width/2
        spikypart = wv1(search_region)
        ;spikypart = smooth(spikypart,5)
        spike_indices0 = search_region(0) + where(spikypart ge 0.2 *max(spikypart))
        halfidx1 = min(spike_indices0)
        halfidx2 = max(spike_indices0)

        extrawidth = 40*(max(spike_indices0)-min(spike_indices0))
     endif

     ;;add extra indices to left and right of spike based on velocity
     ;;filter widths, not necessarily anything having to do with the spike
     ;;squashtime_s  = 8.0*1.0e-6 ;[s] how much to squash around spike
     squashtime_s = 0.8/v_guess
     squashtime    = long(squashtime_s/dt) ;[samples]
     spike_indices = spike_peakidx - squashtime/2 + indgen(squashtime+extrawidth)
  endif

  if keyword_set(verbose) and thereisaspike then begin
     @definecolors
     zoomlength=100             ;300
     zoomidx = peakidx1 + findgen(zoomlength) - zoomlength/2

     window,0,xsize=1200,ysize=800
     !p.multi=[0,3,3]
     plot,t,wv1,/xst,title='raw waveform detector 1',charsize=2,yrange=yr1
     plot,t(zoomidx),wv1(zoomidx),/xst,title='zoom in around peak',charsize=2,yrange=yr1,thick=3
     oplot,t(spike_indices),wv1(spike_indices),color=colors.red
     plot,t(zoomidx),wv1(zoomidx),/xst,title='zoom in around peak',charsize=2,thick=3;,yrange=[]
     oplot,t(spike_indices),wv1(spike_indices),color=colors.red
     
     plot,t,wv2,/xst,title='raw waveform detector 2',charsize=2,yrange=yr2
     plot,t(zoomidx),wv2(zoomidx),/xst,title='zoom in around peak',charsize=2,yrange=yr2,thick=3
     oplot,t(spike_indices),wv2(spike_indices),color=colors.red
     plot,t(zoomidx),wv2(zoomidx),/xst,title='zoom in around peak',charsize=2,thick=3;,yrange=[]
     oplot,t(spike_indices),wv2(spike_indices),color=colors.red
     
     plot,t,wv3,/xst,title='raw waveform detector 3',charsize=2,yrange=yr3
     plot,t(zoomidx),wv3(zoomidx),/xst,title='zoom in around peak',charsize=2,yrange=yr3,thick=3
     oplot,t(spike_indices),wv3(spike_indices),color=colors.red
     plot,t(zoomidx),wv3(zoomidx),/xst,title='zoom in around peak',charsize=2,thick=3;,yrange=[]
     oplot,t(spike_indices),wv3(spike_indices),color=colors.red
  endif

end
