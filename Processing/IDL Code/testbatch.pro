;+
; NAME:
; testbatch.pro
;
; This is a modification of idl_batch_processor which simply compares
; the results of:
; keith's code  (keith_vest.pro), 
; andrew's code (triple_est_latest.pro)
; tobin's code  (tobin_v_est.pro)
;
; The velocity and charge fields are populated with the calculated
; velocity for actual dust particles and -1 for false
; triggers. Estimate source returns a value of 1 if the estimate is
; generated by the first algorithm and 2 if it is generated by the
; second. Esitmate quality returns a 1 if an actual dust particle is
; detected and a 0 for false triggers. Passed returns a value of 1 if
; the particle is determined to have passed the 3rd detector and 0 if
; it did not. NEWSHOT is used to separate dust events.     
;

pro testbatch,verbose=verbose,old_data=old_data,filename=filename,nshots=nshots,start=start,pickfile=pickfile
  q_e = 1.602e-19
  dir=''
  if not keyword_set(filename) then begin
     dir = 'data_hdf5/'
     ;filename = 'New_Database_Query72.hdf5'     ;72 shots -- use /old_data
     ;filename = 'New_Database_Query4224.hdf5'   ;4224 shots -- use /old_data
     ;filename = '2014_03_11_test0.hdf5'         ;1508 shots
     ;filename = '2014_03_11_test0_good.hdf5'    ;hdf5 file containing 53 shots
     ;filename = 'bad_waveform_1.hdf5'           ;hdf5 file containing 1 shot with indexing problem
     ;filename = 'fast_particles_tobin.hdf5'     ;hdf5 file containing 53 shots
     ;filename = '2014_09_16_test0.hdf5'         ;hdf5 file containing 283 shots with large HV spike
     ;filename = '2014_10_10_EricChristian.hdf5' ;hdf5 file containing 2031 shots with large HV spike
     ;filename = '2014_10_18_file1.hdf5'         ;hdf5 file from first gas target run
     ;filename = '2014_10_18_file2.hdf5'         ;hdf5 file from first gas target run
     ;filename = '2014_10_18_file3.hdf5'         ;hdf5 file from first gas target run
     ;filename = '2014_10_18_file4.hdf5'         ;hdf5 file from first gas target run
     ;filename = '2014_10_18_file5.hdf5'         ;hdf5 file from first gas target run
     ;filename = '2014_10_18_file6.hdf5'         ;hdf5 file from first gas target run
     ;filename = '2014_10_18_file7.hdf5'         ;hdf5 file from first gas target run
     ;filename = '2014_10_18_file8.hdf5'         ;hdf5 file from first gas target run
     ;filename = '2014_10_18_file9.hdf5'         ;hdf5 file from first gas target run
     ;filename = '2014_10_18_file10.hdf5'        ;hdf5 file from first gas target run
     ;filename = '2014_11_14_big_particles_few_weird_ones.hdf5'
     filename='2015_02_10_GT80.hdf5' ;hdf5 file with v>80 km/s
  endif
  filename_with_dir = dir+filename
  if keyword_set(pickfile) then begin
     filename_with_dir = dialog_pickfile(/read)
  endif
  file_id = h5f_open(filename_with_dir)
  if not keyword_set(nshots) then nshots =  h5g_get_num_objs(file_id)

  v_a = fltarr(nshots)         ;velocity from Andrew's code (initialized to 0.0)
  v_k = fltarr(nshots)-1       ;velocity from Keith's code (initialized to -1.0)
  v_t = fltarr(nshots)-1       ;velocity from Tobin's code (initialized to -1.0)
  c_a = fltarr(nshots)         ;charge from Andrew's code
  c_k = fltarr(nshots)         ;charge from Keith's code
  c_t = fltarr(nshots)         ;charge from Tobin's code
  q_t = intarr(nshots)         ;quality factor from Tobin's code

  comptime_a = 0.0              ;computation time
  comptime_k = 0.0              ;computation time
  comptime_t = 0.0              ;computation time
  which_vguess_worked = intarr(6)
  if not keyword_set(start) then start=0
  for j = start ,nshots-1 do begin
     print,'Particle = '+s2(j+1)+' of '+s2(nshots)
     shot_index = j
     shot_id = strcompress(string(shot_index),/remove_all)
     result = ccldas_read_shot(file_id, shot_id);, channel='first_detector')
     wv1 = result.first_detector.waveform
     if size(wv1, /N_elements) eq 1 then begin
      print, 'Particle waveform data is corrupted'
      ;result=get_kbrd()
      continue
     endif 

     wv2 = result.second_detector.waveform
     wv3 = result.third_detector.waveform
     dt  = result.first_detector.dt    ;sampling rate [s]
     t   = findgen(n_elements(wv1))*dt ;full timebase [s]

     ;;Call Andrew's code
     t0 = systime(/seconds)
     out_a  = triple_est_latest(wv1,wv2,wv3,dt)
     comptime_a = comptime_a + systime(/seconds)-t0
     v_a(j) = out_a.velocity
     c_a(j) = out_a.charge
     print,'Andrew: v='+s2(v_a(j)/1000.0)+'   c='+s2(c_a(j)/(1000*q_e))

     ;window,2
     ;!p.multi=[0,1,2]
     ;plot,wv1,title='before Keith code'

     ;;Call Keith's code
     t0 = systime(/seconds)
     out_k  = keith_vest(t,wv1,wv2,wv3)
     comptime_k = comptime_k + systime(/seconds)-t0
     v_k(j) = out_k(0)          ;velocity [m/s]
     c_k(j) = out_k(1)          ;charge [C]
     print,'Keith: v='+s2(v_k(j)/1000.0)+'   c='+s2(c_k(j)/(1000*q_e))

     ;kill weird particles from Keith code
     if v_k(j) gt 150000.0 then v_k(j) = 0.0

     ;plot,wv1,title='after Keith code'
     ;result=get_kbrd()
     ;wdelete,2

     ;;Call Tobin's code
     particle_number=j+1        ;for labeling the plots within tobin_v_estimate
     t0 = systime(/seconds)
     out_t  = tobin_v_estimate(wv1,wv2,wv3,dt,verbose=verbose,particle_number=particle_number,old_data=old_data)
     comptime_t = comptime_t + systime(/seconds)-t0
     v_t(j) = out_t(0)          ;velocity
     c_t(j) = out_t(1)          ;charge
     q_t(j) = fix(out_t(2))     ;quality
     if out_t(3) ne -1 then which_vguess_worked(out_t(3)) = which_vguess_worked(out_t(3))+1
     print,'Tobin: v='+s2(v_t(j)/1000.0)+' [km/s]   c='+s2(c_t(j)/(1000*q_e))+' [thousand electrons]   quality='+s2(q_t(j))

     if c_t(j) gt 16000.0*q_e then result=get_kbrd() ;pause if there is a large particle

     if v_t(j) gt 50000.0 then begin
        beep
        result=get_kbrd()       ;pause if a fast one is found
     ;if v_a(j) gt 90000.0 then result=get_kbrd() ;pause if andrew finds a really fast one
     endif

     print
  endfor

  n_found_andrew = n_elements(v_a(where(v_a ne 0.0)))
  n_found_keith  = n_elements(v_k(where(v_k ne -1)))
  n_found_tobin  = n_elements(v_t(where(v_t gt -1))) ;bad particles have v= -2 or -1
  print,'Andrew found '+s2(n_found_andrew)+' good particles'
  print,'Keith  found '+s2(n_found_keith)+' good particles'
  print,'Tobin  found '+s2(n_found_tobin)+' good particles'
  print
  print,'Andrew took an average of '+s2(comptime_a/nshots,sigfigs=4)+' seconds per event'
  print,'Keith  took an average of '+s2(comptime_k/nshots,sigfigs=4)+' seconds per event'
  print,'Tobin  took an average of '+s2(comptime_t/nshots,sigfigs=4)+' seconds per event'

  ;;KEEP TRACK OF PARTICLES THAT KEITH,
  ;;TOBIN, AND/OR ANDREW FOUND, THEN LOOK
  ;;AT THEM INDIVIDUALLY.
  ;;ALSO, FOR THE ODDBALLS, LOOK AT WHICH FILTER WIDTH PRODUCED THEM.
  indices_000 = 0
  indices_001 = 0
  indices_010 = 0
  indices_011 = 0
  indices_100 = 0
  indices_101 = 0
  indices_110 = 0
  indices_111 = 0

  for j=0,n_elements(v_t)-1 do begin
     tester_akt = 0
     if v_a(j) ne  0.0 then tester_akt = tester_akt+100
     if v_k(j) ne -1.0 then tester_akt = tester_akt+10
     if v_t(j) ne -1.0 then tester_akt = tester_akt+1
     case tester_akt of
        000 : indices_000 = [indices_000,j]
        001 : indices_001 = [indices_001,j]
        010 : indices_010 = [indices_010,j]
        011 : indices_011 = [indices_011,j]
        100 : indices_100 = [indices_100,j]
        101 : indices_101 = [indices_101,j]
        110 : indices_110 = [indices_110,j]
        111 : indices_111 = [indices_111,j]
     endcase
  endfor

  ;print,'Particles found by nobody ('+s2(n_elements(indices_000)-1)+'):'
  ;print,indices_000
  print,'Particles found by everyone ('+s2(n_elements(indices_111)-1)+'):'
  print,indices_111
  print,'Particles found by A only ('+s2(n_elements(indices_100)-1)+'):'
  print,indices_100
  print,'Particles found by K only ('+s2(n_elements(indices_010)-1)+'):'
  print,indices_010
  print,'Particles found by T only ('+s2(n_elements(indices_001)-1)+'):'
  print,indices_001
  print,'Particles found by A & K ('+s2(n_elements(indices_110)-1)+'):'
  print,indices_110
  print,'Particles found by A & T ('+s2(n_elements(indices_101)-1)+'):'
  print,indices_101
  print,'Particles found by K & T ('+s2(n_elements(indices_011)-1)+'):'
  print,indices_011


  @definecolors
  window,0,xsize=800,ysize=600
  !p.multi=[0,1,1]
  xr=[0.1,max([max(v_a),max(v_k),max(v_t)])/(1000.0)]
  yr=[0.01,max([max(c_a),max(c_k),max(c_t)])/(1000*q_e)]
  plot,v_k/1000.0,c_k/(1000*q_e),psym=6,$
       xtitle = 'Velocity [km/s]',ytitle='Charge [1000 e-]',$
       xrange=xr,yrange=yr,charsize=1.0,/nodata,/xlog,/ylog
  oplot,v_a/1000.0,c_a/(1000*q_e),psym=5,color=colors.green
  oplot,v_k/1000.0,c_k/(1000*q_e),psym=6,color=colors.red
  oplot,v_t/1000.0,c_t/(1000*q_e),psym=4,color=colors.skyblue
  xyouts,0.13,0.90,/normal,charsize=1.5,$
         'Andrew: '+s2(n_found_andrew)+' particles',color=colors.green
  xyouts,0.13,0.85,/normal,charsize=1.5,$
         'Keith: '+s2(n_found_keith)+' particles',color=colors.red
  xyouts,0.13,0.80,/normal,charsize=1.5,$
         'Tobin: '+s2(n_found_tobin)+' particles',color=colors.skyblue

  print,'which vguess worked:'
  print,which_vguess_worked


end