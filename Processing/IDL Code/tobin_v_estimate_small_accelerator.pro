;This is a modification of tobin_v_estimate for use in the small accelerator.
;
function v_estimate_subroutine_small_accelerator,y1,y2,dt,v_guess,$
                               verbose=verbose,$
                               particle_number=particle_number
  there_was_an_error = 0
  catch, error_status
  if error_status ne 0 then begin
     catch,/cancel
     ;PRINT, 'Inside v_estimate_subroutine Error index: ', Error_status
     if keyword_set(verbose) then print,'Error message from within v_estimate_subroutine: ', !ERROR_STATE.MSG
     there_was_an_error = 1
     goto,error_jump_point  ;jump to end and set velocity = -2 to indicate error     
  endif

  badparticle = 0
  demerits    = 0               ;we all start life as angels
  @definecolors
  detector_length = 0.18        ;[m] length of inner tube used for filter width
  returndata = { velocity:float(0),y1peakidx:long(0),y2peakidx:long(0),$
               y1minidx:long(0),y2minidx:long(0),used_alternate_peakroutine:fix(0),$
               quality:fix(0)}


  ;;Use special slow-particle algorithms
  using_special_filter_routine = 1
  ;;;;if not badparticle then begin
  ;;find the leading and trailing edges, and set y#peakidx to
  ;;the midpoint between them.

  smoothing_time = 0.000001     ;[s]
  smoothing_length = long(smoothing_time/dt)
  ;;print,smoothing_length
  yf1 = smooth(y1,2*smoothing_length,/edge_truncate)
  yf1 = smooth(yf1,smoothing_length,/edge_truncate)
  yf1 = 500.0*smooth(deriv(yf1),20*smoothing_length)
  yf2 = smooth(y2,2*smoothing_length,/edge_truncate)
  yf2 = smooth(yf2,smoothing_length,/edge_truncate)
  yf2 = 500.0*smooth(deriv(yf2),20*smoothing_length)

  ;;remove filter artifacts from very beginning and end
  lastidx = n_elements(yf2)-1
  lastgoodidx_basic           = long(0.97*lastidx)
  lastgoodidx_before_zeroes_1 = long(0.97*max(where(y1 ne 0.0)))
  lastgoodidx_before_zeroes_2 = long(0.97*max(where(y2 ne 0.0)))

  lastgoodidx1 = min([lastgoodidx_basic,lastgoodidx_before_zeroes_1])
  lastgoodidx2 = min([lastgoodidx_basic,lastgoodidx_before_zeroes_2])

  firstgoodidx = long(0.03*lastidx)
  yf1(0:firstgoodidx) = mean(yf1)
  yf2(0:firstgoodidx) = mean(yf2)
  yf1(lastgoodidx1+1:lastidx) = mean(yf1)
  yf2(lastgoodidx2+1:lastidx) = mean(yf2)
  
  y1max = max(yf1,y1maxidx)
  y2max = max(yf2,y2maxidx)
  y1min = min(yf1,y1minidx)
  y2min = min(yf2,y2minidx)
  
  y1peakidx = y1minidx          ;(y1maxidx+y1minidx)/2
  y2peakidx = y2minidx          ;(y2maxidx+y2minidx)/2
  ;;;;endif


  ;;calculate velocity
  d_11 = 0.209                  ; length of each detector -- might be wrong, but is only used for consistency check.
  d_12 = 0.3                    ; distance 1->2 [m] 
  v_12 = d_12/(y2peakidx-y1peakidx)/dt
  v_estimate = v_12

  ;;calculate single-detector velocities for consistency check
  v_11 = d_11/(y1maxidx - y1minidx)/dt
  v_22 = d_11/(y2maxidx - y2minidx)/dt


  ;;Test that the two single-detector velocities are consistent
  badparticle_velocity=0
  max_variation  = 0.08         ;this is the full-quality value
  max_variation2 = 0.15         ;this is the looser threshold for still passing but with a quality demerit 
  if v_12 lt 0.0 then badparticle_velocity=1
  tester = max([abs(v_11-v_22)/v_11,abs(v_11-v_22)/v_22])
  ;if keyword_set(verbose) then print,'velocity tester value: '+s2(tester,sigfigs=3)
  if tester gt max_variation then begin     ;failed the toughest threshold
     ;;see if it passes the looser threshold
     if tester gt max_variation2 then begin ;failed the looser threshold
        badparticle_velocity=1
     endif else begin           ;passed the looser threshold
        demerits = demerits+1
        if keyword_set(verbose) then print,'  Demerit from velocity calculation.'
     endelse
  endif
  ;if abs(y3peakidx-lastgoodidx3) le 3 then badparticle_velocity=1 ;artifact at end...
  if badparticle_velocity eq 1 then badparticle=1




  ;;Address problem of mal-formed waveform on detector 3.  This could
  ;;be due to the particle hitting the detector.  This exhibits itself
  ;;by the third detector not having a trailing edge at all, as if it
  ;;loses its charge within the detector length.  Identify this
  ;;"false positive" by looking for consistency between the size of
  ;;the leading and trailing edge (via the derivative).
  ;;***Only do this test if we're on the last pass, with the
  ;;optimized filter function.
  badparticle_asymmetric_waveform = 0
  badparticle_spacing_consistency = 0
  ;if keyword_set(optimized_vguess) then begin
  if not badparticle then begin
     full_length = n_elements(y1)
     zoom0length = 0.75                               ;[m] look at part of waveform near actual signal
     zoom1length = long(zoom0length/v_estimate/dt)    ;[# samples]

     zoom1_minidx = max([y1peakidx - zoom1length/2,0])
     zoom2_minidx = max([y2peakidx - zoom1length/2,0])
     zoom1_maxidx = min([y1peakidx + zoom1length/2,full_length-1])
     zoom2_maxidx = min([y2peakidx + zoom1length/2,full_length-1])
     yzoom1 = y1(zoom1_minidx:zoom1_maxidx)
     yzoom2 = y2(zoom2_minidx:zoom2_maxidx)
     zoom1length = n_elements(yzoom1)    ;the lengths of zoom1-3 may be different...
     zoom2length = n_elements(yzoom2)    ;the lengths of zoom1-3 may be different...

     ;;Create smooth derivative function
     smoothing_length0 = 0.001*2                                 ;[m]
     smoothing_length = long(smoothing_length0/v_estimate/dt)    ;[# samples]
     ;;print,'In check for malformed waveform, smoothing length = '+$
     ;;      s2(smoothing_length)+' samples'

     yzoom1f = smooth(yzoom1,2*smoothing_length,/edge_wrap)
     yzoom1f = smooth(yzoom1f,smoothing_length,/edge_wrap)
     yzoom1f = smooth(deriv(yzoom1f),20*smoothing_length)
     yzoom2f = smooth(yzoom2,2*smoothing_length,/edge_wrap)
     yzoom2f = smooth(yzoom2f,smoothing_length,/edge_wrap)
     yzoom2f = smooth(deriv(yzoom2f),20*smoothing_length)

     ;;Zero out the ends of the waveform to kill artifacts
     yzoom1f(0:20*smoothing_length) = 0
     yzoom1f(zoom1length-1-20*smoothing_length:zoom1length-1) = 0.0
     yzoom2f(0:20*smoothing_length) = 0
     yzoom2f(zoom2length-1-20*smoothing_length:zoom2length-1) = 0.0

     yz1max = max(yzoom1f,yz1maxidx)
     yz2max = max(yzoom2f,yz2maxidx)
     yz1min = min(yzoom1f,yz1minidx)
     yz2min = min(yzoom2f,yz2minidx)

     ;;Check that the waveform is not too asymmetric
     asymmetry_threshold  = 0.2    ;toughest threshold
     asymmetry_threshold2 = 0.5    ;lenient threshold; particle passes but gets 1 demerit
     badparticle_d1 = 0
     badparticle_d2 = 0
     asymmetry1 = abs((yz1max+yz1min)/(yz1max-yz1min))
     asymmetry2 = abs((yz2max+yz2min)/(yz2max-yz2min))

     asymmetry_demerits = 0
     if asymmetry1 gt asymmetry_threshold then begin        ;failed the toughest threshold
        ;;see if it passes the looser threshold
        if asymmetry1 gt asymmetry_threshold2 then begin ;failed the looser threshold
           badparticle_d1 = 1
        endif else begin        ;passes, but gets a demerit
           asymmetry_demerits = 1
        endelse
     endif
     if asymmetry2 gt asymmetry_threshold then begin        ;failed the toughest threshold
        ;;see if it passes the looser threshold
        if asymmetry2 gt asymmetry_threshold2 then begin ;failed the looser threshold
           badparticle_d2 = 1
        endif else begin        ;passes, but gets a demerit
           asymmetry_demerits = 1
        endelse
     endif
     ;;if ANY of them fail the looser threshold, then the particle fails
     if badparticle_d1+badparticle_d2 ge 1 then begin
        ;;print,'failed test of symmetric signal heights'
        badparticle_asymmetric_waveform = 1
        badparticle=1
     endif else begin                               ;otherwise it might have gotten a demerit
        demerits = demerits + asymmetry_demerits    ;maximum 1 for multiple detectors
        if keyword_set(verbose) and asymmetry_demerits eq 1 then print,'  Demerit from asymmetry calculation.'
     endelse

     ;;Check that the locations of the derivative max and min are
     ;;spaced somewhat consistently across the three detectors
     y1peakspacing = yz1maxidx - yz1minidx
     y2peakspacing = yz2maxidx - yz2minidx
     spacingtest_thresh  = 0.2
     spacingtest_thresh2 = 100.0 ;essentially removing this as a failure mode
     spacingtest1 = abs(y2peakspacing-y1peakspacing)/float(y1peakspacing)
     tester = spacingtest1
     if tester gt spacingtest_thresh then begin        ;failed the toughest threshold
        ;;see if it passes the looser threshold
        if tester gt spacingtest_thresh2 then begin ;failed the looser threshold
           ;;print,'failed test of signal-length consistency'
           badparticle_spacing_consistency = 1
           badparticle=1
        endif else begin        ;passed the looser threshold
           demerits = demerits + 1
           if keyword_set(verbose) then print,'  Demerit from signal length consistency.'
        endelse
     endif
     
     if keyword_set(verbose) then begin ;plot the asymmetry calculations
        cs=2.0
        window,0,xsize=900,ysize=800
        !p.multi=[0,1,3]

        ;;Normalize the filtered functions
        norm1 = 0.5*max([abs(max(yzoom1)),abs(min(yzoom1))])/max([abs(max(yzoom1f)),abs(min(yzoom1f))])
        norm2 = 0.5*max([abs(max(yzoom2)),abs(min(yzoom2))])/max([abs(max(yzoom2f)),abs(min(yzoom2f))])
        ;;norm3 = 0.5*max([abs(max(yzoom3)),abs(min(yzoom3))])/max([abs(max(yzoom3f)),abs(min(yzoom3f))])

        if keyword_set(particle_number) then title1='Particle # '+s2(particle_number) else title1=''

        plot,yzoom1,/xst,charsize=cs,title=title1        ;raw waveform
        oplot,yzoom1f*norm1,color=colors.blue,thick=2    ;fast filtered function
        oplot,[0,zoom1length],0*[1,1],color=colors.red
        oplot,[0,zoom1length],yz1max*norm1*[1,1],color=colors.red,linestyle=2
        oplot,[0,zoom1length],yz1min*norm1*[1,1],color=colors.red,linestyle=2
        oplot,yz1minidx*[1,1],[-10,10],color=colors.red,linestyle=2
        oplot,yz1maxidx*[1,1],[-10,10],color=colors.red,linestyle=2
        
        plot,yzoom2,/xst,charsize=cs
        oplot,yzoom2f*norm2,color=colors.blue,thick=2 ;fast filtered function
        oplot,[0,zoom1length],0*[1,1],color=colors.red
        oplot,[0,zoom1length],yz2max*norm2*[1,1],color=colors.red,linestyle=2
        oplot,[0,zoom1length],yz2min*norm2*[1,1],color=colors.red,linestyle=2
        oplot,yz2minidx*[1,1],[-10,10],color=colors.red,linestyle=2
        oplot,yz2maxidx*[1,1],[-10,10],color=colors.red,linestyle=2
        
        xyouts,/normal,0.75,0.73,'Asymmetry = '+s2(asymmetry1,sigfigs=3),charsize=1.5
        xyouts,/normal,0.75,0.40,'Asymmetry = '+s2(asymmetry2,sigfigs=3),charsize=1.5
        ;;xyouts,/normal,0.75,0.06,'Asymmetry = '+s2(asymmetry3,sigfigs=3),charsize=1.5
        
        if badparticle_d1 then begin
           xyouts,/normal,0.75,0.93,'Bad heights',charsize=2.5,charthick=3,color=colors.red
        endif else begin
           xyouts,/normal,0.75,0.93,'Good heights',charsize=2.5,charthick=3,color=colors.green
        endelse
        if badparticle_d2 then begin
           xyouts,/normal,0.75,0.93-.33,'Bad heights',charsize=2.5,charthick=3,color=colors.red
        endif else begin
           xyouts,/normal,0.75,0.93-.33,'Good heights',charsize=2.5,charthick=3,color=colors.green
        endelse
        if badparticle_spacing_consistency then begin
           xyouts,/normal,0.1,0.93-.66,'Inconsistent spacing',charsize=2.5,charthick=3,color=colors.red
        endif else begin
           xyouts,/normal,0.1,0.93-.66,'Consistent spacing ',charsize=2.5,charthick=3,color=colors.green
        endelse
        
        ;;xyouts,/normal,0.1,0.95,'v_guess for filter = '+s2(v_guess),charsize=2,color=colors.orange
     endif                      ;if verbose then do the plot
  endif                         ;if not bad particle then check for bad det3 signal

  quality = 5-demerits          ;possibly up to 3 demerits (velocity, asymmetry, signal lengths)
  if badparticle then quality = 1

  ;;Remove special case: artifact appears at very end of filtered wf3
  ;if float(y3peakidx)/float(n_elements(yf3)) ge 0.98 then badparticle=1

  if keyword_set(verbose) then begin
     cs=2.0
     window,1,xsize=900,ysize=800
     !p.multi=[0,1,3]

     if keyword_set(particle_number) then title1='Particle # '+s2(particle_number) else title1=''

     yr1 = [min(y1),max(y1)]
     yr2 = [min(y2),max(y2)]

     plot,y1,/xst,charsize=cs,title=title1,yrange=yr1;,xrange=1.0e4*[3.5,4.5] ;raw waveform
     oplot,yf1,color=colors.blue,thick=3 ;fast filtered function
     oplot,y1peakidx*[1,1],10*[-1,1],color=colors.red
     if using_special_filter_routine then begin
        oplot,y1minidx*[1,1],10*[-1,1],color=colors.pink,linestyle=1
        oplot,y1maxidx*[1,1],10*[-1,1],color=colors.pink,linestyle=1
     endif

     plot,y2,/xst,charsize=cs,yrange=yr2;,xrange=1.0e4*[3.5,4.5]
     oplot,yf2,color=colors.blue,thick=3  ;fast filtered function
     oplot,y2peakidx*[1,1],10*[-1,1],color=colors.red
     if using_special_filter_routine then begin
        oplot,y2minidx*[1,1],10*[-1,1],color=colors.pink,linestyle=1
        oplot,y2maxidx*[1,1],10*[-1,1],color=colors.pink,linestyle=1
     endif

     if badparticle then begin
        xyouts,/normal,0.95,0.93,'Bad',charsize=3,charthick=3,color=colors.red,alignment=1.0
        if badparticle_velocity then begin
           xyouts,/normal,0.95,0.89,'(bad v estimate)',charsize=2.0,charthick=1,color=colors.red,alignment=1.0
        endif
        if badparticle_asymmetric_waveform then begin
           xyouts,/normal,0.95,0.89,'(malformed waveforms)',charsize=2.0,charthick=1,color=colors.red,alignment=1.0
        endif else begin
           if badparticle_spacing_consistency then begin
              xyouts,/normal,0.95,0.89,'(inconsistent signal lengths)',charsize=2.0,charthick=1,color=colors.red,alignment=1.0
           endif
        endelse
     endif else begin
        xyouts,/normal,0.85,0.93,'Good',charsize=3,charthick=3,color=colors.green
     endelse

     if keyword_set(optimized_vguess) then text1=' (optimized)' else text1=''
     xyouts,/normal,0.1,0.95,'v_guess for filter = '+s2(v_guess)+text1,charsize=2,color=colors.orange
     if using_special_filter_routine then begin
        xyouts,/normal,0.1,0.92,'***Using alternate filter for slow particles***',charsize=2,color=colors.pink
     endif

     ;if keyword_set(verbose) then print,'quality factor right now is '+s2(quality)
     result=get_kbrd()
     device, window_state=openwindows ;delete window 0 if it is open
     if openwindows(0) ne 0 then wdelete,0
  endif

  if badparticle then v_estimate = -1.0

  returndata.quality  = quality
  returndata.velocity  = v_estimate
  ;returndata.charge    = charge
  returndata.y1peakidx = y1peakidx ;this is the midpoint of the signal
  returndata.y2peakidx = y2peakidx ;this is the midpoint of the signal
  returndata.used_alternate_peakroutine = 0
  if using_special_filter_routine then begin
     returndata.used_alternate_peakroutine = 1
     returndata.y1minidx = y1minidx ;this is the beginning of the signal
     returndata.y2minidx = y2minidx ;this is the beginning of the signal
  endif

  error_jump_point: ;print,'got to error jump point'
  if there_was_an_error then returndata.velocity = -2.0

  return,returndata
end

function c_estimate_subroutine,y,dt,velocity,ypeakidx,whichdetector=whichdetector,verbose=verbose,$
                               used_alternate_peakroutine=used_alternate_peakroutine,yminidx=yminidx,$
                               particle_number=particle_number
  case whichdetector of 
     1: det_cal = 2.97d13       ;detector 1 calibration factor [CSA 7; first detector]
     2: det_cal = 3.55d13       ;detector 2 calibration factor [CSA 1; second detector]
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

;;     signal_minidx = yminidx+4*drooplength
;;     signal_maxidx = signal_minidx+drooplength

  smoothing_time = 0.000001     ;[s]
  smoothing_length = long(smoothing_time/dt)
  thing = min(smooth(y,smoothing_length,/edge_truncate),yminidx)

  signal_minidx = yminidx-2*drooplength
  signal_maxidx = yminidx+2*drooplength


  offset_minidx = max([ypeakidx-3*signal_length,0])
  offset_maxidx = max([ypeakidx-signal_length,1])

  ;print,offset_minidx,offset_maxidx

  offset_length     = offset_maxidx-offset_minidx
  new_signal_length = signal_maxidx-signal_minidx

  avgsignal = mean(y(signal_minidx:signal_maxidx))
  offset    = mean(y(offset_minidx:offset_maxidx))
     
  if keyword_set(verbose) then begin ;plot waveforms and sampled part for charge est.
     @definecolors
     first_idx_of_signal_within_zoom = signal_minidx-zoom_minidx
     first_idx_of_offset_within_zoom = offset_minidx-zoom_minidx

     device, window_state=openwindows ;open window 6 if it isn't already open
     if openwindows(6) eq 0 then begin
        window,6,ysize=800
     endif else wset,6
     if whichdetector eq 1 then !p.multi=[0,1,3]

     if keyword_set(particle_number) then title1=', Particle # '+s2(particle_number) else title1=''

     title='Detector '+strcompress(string(whichdetector),/remove_all)+title1
     plot,zoom,charsize=2.0,title=title
     oplot,findgen(new_signal_length)+first_idx_of_signal_within_zoom,$
           y(signal_minidx:signal_maxidx),color=colors.red
     oplot,findgen(offset_length)+first_idx_of_offset_within_zoom,$
           y(offset_minidx:offset_maxidx),color=colors.blue
     oplot,[0,zoom_length-1],avgsignal*[1,1],color=colors.pink
     oplot,[0,zoom_length-1],offset*[1,1],color=colors.skyblue

     if keyword_set(used_alternate_peakroutine) then begin
        xyouts,/normal,0.5,0.95,'**Used alternate filter for peak signal detection**',$
               charsize=1.5,alignment=0.5,color=colors.pink
     endif
  endif                         ;end verbose part
  charge = -1.0*(avgsignal-offset)/det_cal
  return,charge
end

;;Modification 10/16/14 : Added field for quality factor, on a 1-5
;;integer scale (5 is best, 1 is worst)
;;
function tobin_v_estimate_small_accelerator,y1,y2,dt,verbose=verbose,particle_number=particle_number
  @definecolors
  velocitycharge = fltarr(4)    ;set up output data array [velocity,charge,quality,which_vguess_worked]
  quality = 1.0                 ;initialize quality factor

  v_guess = 0.0
  badparticle = 0

  returndata = v_estimate_subroutine_small_accelerator(y1,y2,dt,v_guess,$
                                                       verbose=verbose,$
                                                       particle_number=particle_number)
  velocity = returndata.velocity
  y1peakidx = returndata.y1peakidx
  y2peakidx = returndata.y2peakidx
  quality   = returndata.quality

  if velocity eq -1.0 then badparticle=1
  if velocity eq -2.0 then badparticle=1 ;there was an error in the velocity subroutine

  ;;calculate charge
  if not badparticle then begin
     ;;calculate charge based on first detector
     charge1 = c_estimate_subroutine(y1,dt,velocity,y1peakidx,whichdetector=1,verbose=verbose,$
                                     /used_alternate_peakroutine,$
                                     yminidx=returndata.y1minidx,particle_number=particle_number)
     charge2 = c_estimate_subroutine(y2,dt,velocity,y2peakidx,whichdetector=2,verbose=verbose,$
                                     /used_alternate_peakroutine,$
                                     yminidx=returndata.y2minidx,particle_number=particle_number)

     ;;Test that the three charges are very loosely consistent
     ;;DON'T fail the particle -- just lower its quality rating by 1 point
     max_variation = 0.35
     inconsistent_charge = 0

     print,charge1,charge2
     if abs(charge1-charge2)/abs(charge1) gt max_variation then inconsistent_charge = 1
     if abs(charge2-charge2)/abs(charge2) gt max_variation then inconsistent_charge = 1
     if inconsistent_charge then begin
        if keyword_set(verbose) then print,'  Demerit from charge consistency test.'
        quality = quality-1
     endif

     if not badparticle then begin
        charge = charge2
     endif else begin
        charge = 0.0
     endelse 

     if charge eq 0.0 then velocity = -1.0 ;found bad particle in charge estimate subroutine
  endif else charge = 0.0

  velocitycharge[0] = velocity
  velocitycharge[1] = charge
  velocitycharge[2] = quality             ;1-5 integer

  return,velocitycharge
end
