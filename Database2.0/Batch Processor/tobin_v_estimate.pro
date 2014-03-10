;This routine uses a fast version of optimized filter function
;constructed of boxcar smooths.
;
;Should we do two or three smoothing functions (fast and slow width)?
;Perhaps go through twice and revise the filter width to optimize it?
;First try a generic width
;If successful, use that first estimate to re-estimate a filter
;function of custom width and re-convolve.
;
;Try a series of several widths, and see if *any* give a good particle.
;If any of them do, use their derived velocity as a final width to
;make a last pass.
function v_estimate_subroutine,y1,y2,y3,dt,v_guess,verbose=verbose
  @definecolors
  detector_length = 0.18        ;[m] length of inner tube used for filter width
  ;;returndata might or might not include a charge estimate from this subroutine.
  ;returndata = { velocity:float(0),charge:float(0),y1peakidx:long(0),y2peakidx:long(0),y3peakidx:long(0)}
  returndata = { velocity:float(0),y1peakidx:long(0),y2peakidx:long(0),y3peakidx:long(0)}

  ;create filter of width somewhat wider than v_guess
  width1 = long(detector_length/v_guess/dt)
  yf1 = -3.0*(smooth(y1,width1,/edge_truncate)-smooth(y1,3*width1,/edge_truncate)) ;imperfect but fast
  yf2 = -3.0*(smooth(y2,width1,/edge_truncate)-smooth(y2,3*width1,/edge_truncate)) ;imperfect but fast
  yf3 = -3.0*(smooth(y3,width1,/edge_truncate)-smooth(y3,3*width1,/edge_truncate)) ;imperfect but fast

  ;remove filter artifacts from very beginning and end
  lastidx = n_elements(yf3)-1
  lastgoodidx_basic           = long(0.97*lastidx)
  lastgoodidx_before_zeroes_1 = long(0.97*max(where(y1 ne 0.0)))
  lastgoodidx_before_zeroes_2 = long(0.97*max(where(y2 ne 0.0)))
  lastgoodidx_before_zeroes_3 = long(0.97*max(where(y3 ne 0.0)))

  lastgoodidx1 = min([lastgoodidx_basic,lastgoodidx_before_zeroes_1])
  lastgoodidx2 = min([lastgoodidx_basic,lastgoodidx_before_zeroes_2])
  lastgoodidx3 = min([lastgoodidx_basic,lastgoodidx_before_zeroes_3])

  ;print,lastgoodidx1
  ;print,lastgoodidx2
  ;print,lastgoodidx3

  firstgoodidx = long(0.03*lastidx)
  yf1(0:firstgoodidx) = mean(yf1)
  yf2(0:firstgoodidx) = mean(yf2)
  yf3(0:firstgoodidx) = mean(yf3)
  yf1(lastgoodidx1+1:lastidx) = mean(yf1)
  yf2(lastgoodidx2+1:lastidx) = mean(yf2)
  yf3(lastgoodidx3+1:lastidx) = mean(yf3)

  y1max = max(yf1,y1peakidx)
  y2max = max(yf2,y2peakidx)
  y3max = max(yf3,y3peakidx)

  ;;calculate velocity
  d_12 = 0.6                    ; distance 1->2 [m]
  ;d_23 = 5.022                  ; distance 2->3 [m] (old)
  d_23 = 3.24485                ; distance 2->3 [m]
  d_13 = d_23+d_12              ; distance 1->3 [m]
 
  v_12 = d_12/(y2peakidx-y1peakidx)/dt
  v_23 = d_23/(y3peakidx-y2peakidx)/dt
  v_13 = d_13/(y3peakidx-y1peakidx)/dt
  v_estimate = v_13

  ;;Test that the three velocities are consistent
  badparticle = 0
  max_variation = 0.08;1
  if v_12 lt 0.0 then badparticle=1
  if v_23 lt 0.0 then badparticle=1
  if v_13 lt 0.0 then badparticle=1
  if abs(v_12-v_13)/v_13 gt max_variation then badparticle=1
  if abs(v_23-v_13)/v_13 gt max_variation then badparticle=1
  if abs(y3peakidx-lastgoodidx3) le 3 then badparticle=1 ;artifact at end...

  ;print,y1
  ;result=get_kbrd()

  ;print,y3peakidx,lastgoodidx
  
  ;;Remove special case: artifact appears at very end of filtered wf3
  ;if float(y3peakidx)/float(n_elements(yf3)) ge 0.98 then badparticle=1

  if keyword_set(verbose) then begin
     cs=2.0
     window,1,xsize=900,ysize=800
     !p.multi=[0,1,3]

     plot,y1,/xst,charsize=cs   ;raw waveform
     oplot,yf1,color=colors.blue,thick=3 ;fast filtered function
     oplot,y1peakidx*[1,1],10*[-1,1],color=colors.red

     plot,y2,/xst,charsize=cs
     oplot,yf2,color=colors.blue,thick=3  ;fast filtered function
     oplot,y2peakidx*[1,1],10*[-1,1],color=colors.red

     plot,y3,/xst,charsize=cs
     oplot,yf3,color=colors.blue,thick=3  ;fast filtered function
     oplot,y3peakidx*[1,1],10*[-1,1],color=colors.red

     if badparticle then begin
        xyouts,/normal,0.85,0.93,'Bad',charsize=3,charthick=3,color=colors.red
     endif else begin
        xyouts,/normal,0.85,0.93,'Good',charsize=3,charthick=3,color=colors.green
     endelse

     xyouts,/normal,0.1,0.95,'v_guess = '+s2(v_guess),charsize=2,color=colors.orange
     result=get_kbrd()
     print,result
  endif

  ;;Measure the charge from the peak of the convolved waveform... (reliable?)
  ;charge = 0.0
  ;if not badparticle then begin
  ;   det3_cal = 1.21e13
  ;   charge=0.5*(max(yf3)-mean(yf3))/(det3_cal) ;WHY the factor of 0.5?
  ;endif

  if badparticle then v_estimate = -1.0

  returndata.velocity  = v_estimate
  ;returndata.charge    = charge
  returndata.y1peakidx = y1peakidx
  returndata.y2peakidx = y2peakidx
  returndata.y3peakidx = y3peakidx
  return,returndata
end

function c_estimate_subroutine,y,dt,velocity,ypeakidx,whichdetector=whichdetector,verbose=verbose
  case whichdetector of 
     1: det_cal = 1.14e13       ;detector 1 calibration factor [CSA 2]
     2: det_cal = 1.24e13       ;detector 2 calibration factor [CSA 3]
     3: det_cal = 1.21e13       ;detector 3 calibration factor [CSA 4]
  endcase

  detector_length = 0.16        ;residence time sampled for charge measurement
  signal_length = long(detector_length/velocity/dt)
  zoom_length   = 8L*signal_length
  full_length   = n_elements(y)

  drooptime   = 5.0e-6          ;decay time for detector amplifiers
  drooplength = long(drooptime/dt)
     
  zoom_minidx = max([ypeakidx - zoom_length/2,0])
  zoom_maxidx = min([ypeakidx + zoom_length/2,full_length-1])
  zoom = y(zoom_minidx:zoom_maxidx)

  signal_minidx = max([ypeakidx-signal_length/2,0])
  ;;This only samples the beginning of a long, drooping signal to get the charge.
  signal_maxidx = min([ypeakidx+signal_length/2,signal_minidx+drooplength])

  offset_minidx = max([ypeakidx-3*signal_length,0])
  offset_maxidx = max([ypeakidx-signal_length,0])

  offset_length     = offset_maxidx-offset_minidx
  new_signal_length = signal_maxidx-signal_minidx

  avgsignal = mean(y(signal_minidx:signal_maxidx))
  offset    = mean(y(offset_minidx:offset_maxidx))
     
  if keyword_set(verbose) then begin ;plot waveforms and sampled part for charge est.
     @definecolors
     first_idx_of_signal_within_zoom = signal_minidx-zoom_minidx
     first_idx_of_offset_within_zoom = offset_minidx-zoom_minidx

     device, window_state=openwindows ;open window 6 if it isnt already open
     if openwindows(6) eq 0 then begin
        window,6,ysize=800
     endif else wset,6
     if whichdetector eq 1 then !p.multi=[0,1,3]

     title='Detector '+strcompress(string(whichdetector),/remove_all)
     plot,zoom,charsize=2.0,title=title
     oplot,findgen(new_signal_length)+first_idx_of_signal_within_zoom,$
           y(signal_minidx:signal_maxidx),color=colors.red
     oplot,findgen(offset_length)+first_idx_of_offset_within_zoom,$
           y(offset_minidx:offset_maxidx),color=colors.blue
     oplot,[0,zoom_length-1],avgsignal*[1,1],color=colors.pink
     oplot,[0,zoom_length-1],offset*[1,1],color=colors.skyblue
       endif                         ;end verbose part
  charge = -1.0*(avgsignal-offset)/det_cal
  return,charge
end

function tobin_v_estimate,y1,y2,y3,dt,verbose=verbose
  @definecolors
  velocitycharge = fltarr(4)    ;set up output data array [velocity,charge,which_vguess_worked]

  ;cycle through until a good particle is found or we run out of tries
  v_guess = 1000.0*[100,50,20,10,5,2] ;[m/s] takes 0.0379 sec avg.
  v_guess = 1000.0*[100,50,20,10,5]   ;[m/s] takes 0.0322 sec avg.
  v_guess = 1000.0*[100,50,20,5]      ;[m/s] takes 0.0253 sec avg.

  ;;MIGHT BE ABLE TO REDUCE THE NUMBER OF SLOW VELOCITIES AND STILL
  ;;GET GOOD RESULTS (Because of the strong signals and the droop)
  done = 0
  j=0
  while not done do begin
     returndata = v_estimate_subroutine(y1,y2,y3,dt,v_guess(j),verbose=verbose)
     velocity = returndata.velocity
     if j eq n_elements(v_guess)-1 then begin ;ran out of tries
        badparticle=1
        done = 1
     endif
     if velocity ne -1.0 then begin ;found a good one (even on last try)
        badparticle=0
        done=1
        which_vguess_worked = j
     end
     j = j+1
  endwhile
  if badparticle then which_vguess_worked = -1

  if not badparticle then begin ;run through one last time with best velocity filter
     v_guess = velocity         ;[m/s]
     returndata = v_estimate_subroutine(y1,y2,y3,dt,v_guess,verbose=verbose)
     velocity = returndata.velocity
     y1peakidx = returndata.y1peakidx
     y2peakidx = returndata.y2peakidx
     y3peakidx = returndata.y3peakidx
     ;smoothcharge = returndata.charge
     if velocity eq -1.0 then badparticle=1
  endif

  ;;calculate charge
  if not badparticle then begin
     ;;calculate charge based on first detector
     charge1 = c_estimate_subroutine(y1,dt,velocity,y1peakidx,whichdetector=1,verbose=verbose)
     charge2 = c_estimate_subroutine(y2,dt,velocity,y2peakidx,whichdetector=2,verbose=verbose)
     charge3 = c_estimate_subroutine(y3,dt,velocity,y3peakidx,whichdetector=3,verbose=verbose)

     ;;Test that the three charges are very loosely consistent
     max_variation = 0.35
     if abs(charge1-charge3)/charge3 gt max_variation then badparticle=1
     if abs(charge2-charge3)/charge3 gt max_variation then badparticle=1

     if badparticle then begin
        print,'failed charge test'
        print,abs(charge1-charge3)/charge3,abs(charge2-charge3)/charge3
     endif

     if not badparticle then begin
        charge = charge3
     endif else begin
        charge = 0.0
     endelse 

     if charge eq 0.0 then velocity = -1.0 ;found bad particle in charge estimate subroutine
  endif else charge = 0.0

  ;;use this comparison only if charge is estimated in velocity
  ;;subroutine also
  ;if not badparticle then print,'smoothcharge/charge = '+s2(smoothcharge/charge)

  velocitycharge[0] = velocity
  velocitycharge[1] = charge
  velocitycharge[2] = which_vguess_worked ;for debugging purposes only
  velocitycharge[3] = not badparticle
  return,velocitycharge
end
