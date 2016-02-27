;+
; NAME:
; idl_batch_processor
;
; PURPOSE:
; This procedure opens an index text file of trigger waveforms, analyzes the waveform .hdf5 files in given in the index using two different algorithms, 
; then generates a results text file with charge, velocity, and 3rd detector passing information for the given shots.
;
;
; CALLING SEQUENCE:
; idl_batch_processor,folder,weird_termination=weird_termination
;
; INPUTS:
; folder: A string with the location of the folder containing the hdf5 files to be opened and a labview generated csv index file. This folder is also where 
; the results text file will be created.
;
; weird_termination (kw, optional): a number to account for non-standard termination on the third detector 
;
; OUTPUTS:
; idl_batch_processor creates a results text file populated with the results of the data analysis algorithms for each shot specified in the labview 
; generated index csv file. The results for each shot are formatted as follows: 
;           
; 
;          Velocity:       5430.71
;          Charge:  1.02928e-015
;          Estimate Source:        1
;          Estimate Quality:        1
;          Passed:        1
;          NEWSHOT
;          Velocity:       -1
;          Charge:       -1
;          Estimate Source:        2
;          Estimate Quality:        0
;          Passed:        0
;          NEWSHOT
;    
; The velocity and charge fields are populated with the calculated velocity for actual dust particles and -1 for false triggers. Estimate source returns 
; a value of 1 if the estimate is generated by the first algorithm and 2 if it is generated by the second. Esitmate quality returns a 1 if an actual 
; dust particle is detected and a 0 for false triggers. Passed returns a value of 1 if the particle is determined to have passed the 3rd detector and 0 if 
; it did not. NEWSHOT is used to separate dust events.    
;
; PROCEDURE:
; An CSV index file named "index.txt" containing dust events needs to be generated before running this program. This index file is generated by 
; the labview vi "batch processor.vi" using information retreived from the ccldas database. The results text file is then read by the same labview vi
; and used to update the database. batch processor.vi calls this program from the idl command line, so direct interaction with this procedure by users 
; is not necessary under normal circumstances.
; 
; 
;
; MODIFICATION HISTORY:
; Written September 2012 by Spenser Burrows
; Edited November 2014 by Forrest Barnes
; Edited June 2015 by Forrest Barnes


pro idl_batch_processor,path_folder
  
  there_was_an_error = 0
  catch, error_status
  if error_status ne 0 then begin
    catch,/cancel
    ;PRINT, 'Inside v_estimate_subroutine Error index: ', Error_status
    print,'Error message from within v_estimate_subroutine: ', !ERROR_STATE.MSG
    there_was_an_error = 1
    goto,error_jump_point  ;jump to end and set velocity = -2 to indicate error
  endif
  
  x_1_correction = 0 ;corrections based on measurement from beamline to dcs center in dcs coordinate system in mm.
  y_1_correction = -2.4
  x_2_correction = 1.5
  y_2_correction = 0
  
  last_old_particle=1664759 ;id_dust_event of the last particle run on the old acc length.
  
  input_file_id = path_folder + '\index.txt';create input file reference
  print,input_file_id
  shots=READ_CSV(input_file_id);read csv for shot index
  shotid=TAG_NAMES(shots);generate tag names
  nshots=n_elements(shotid);determine number of shots to examine
  output_file_id = path_folder + '\results.txt';create output file reference
  ;print,shots
  file_exists=0
  
  qthreshold=50;define the quality threshold for the first algorithm
  
  openw, lun, output_file_id, /get_lun;open output file
  
  i=0
  For i=0,nshots-1 do begin;examine all shots 
    there_was_a_line_error = 0
    catch, line_error_status
    if line_error_status ne 0 then begin
      catch,/cancel
      print,'Error message from within v_estimate_subroutine: ', !ERROR_STATE.MSG
      there_was_a_line_error = 1
      goto,line_error_jump_point
    endif
    id_dust_event = ULONG64(shots.(STRING(i)))
    
    file = STRCOMPRESS(path_folder + '\' + string(id_dust_event/1000) + '\' + string(id_dust_event) +'.hdf5' ,/REMOVE_ALL)
    
    print,'file name:',file
    file_exists=FILE_TEST(file)
 ;   print, file_exists
    IF file_exists eq 1 then begin
      ;get waveforms from hdf5 file
      out = ccldas_read_raw_file(file)
      wv1 = out.first_detector.waveform
      wv2 = out.second_detector.waveform
      wv3 = out.third_detector.waveform
      dcs1 = out.dcs_1
      dcs2 = out.dcs_2
      wv1size = SIZE(wv1,/N_ELEMENTS)
      print,wv1size,'test2'
      wv2size = SIZE(wv2,/N_ELEMENTS)
      print,wv2size,'test2'
      wv3size = SIZE(wv3,/N_ELEMENTS)
      print,wv3size,'test2'
      
      IF wv1size - wv2size lt 100 and wv2size - wv3size lt 100 Then begin
        dt = out.first_detector.dt
        x = findgen(n_elements(wv1))*dt;*1e6
        loadct, 39
        
        ;Call Tobin's code:0
        ;Particle number 1664759
        out_k=tobin_v_estimate(wv1,wv2,wv3,dt,old_data=(id_dust_event le last_old_particle))
        ;print,out_k
        if out_k[0] GT 0 && out_k[1] GT 0 && out_k[2] GT 1 then begin ;print Tobin's results if Tobin's code finds anything
          printf, lun, 'V', out_k[0]
          printf, lun, 'C', out_k[1]
          printf, lun, 'Q', out_k[2]
          print,out_k,' Tobins code'
        endif  else begin                   ;Call Andrew's code if Keith's doesn't see anything:
          if out_k[0] eq -2 then begin ;print out that Tobin's code had an actual failure so we can find it and correct it
            printf, lun, 'V', out_k[0]
            printf, lun, 'C', -1
            printf, lun, 'Q', -2
            print,out_k,' Tobins code had an error'
          endif else begin
            out_k = triple_est_latest(wv1, wv2, wv3, dt,old_data=(id_dust_event le last_old_particle))
            ;print, out
            ;/Andrew's code.
            if out_k.quality lt qthreshold then begin ;if Andrew's code failed 
              printf, lun, 'V', -1
              printf, lun, 'C', -1
              printf, lun, 'Q', 0
              print,'both failed'
            endif  else begin
              if out_k.quality eq 50 then begin
                printf, lun, 'V', -3
                printf, lun, 'C', -1
                printf, lun, 'Q', -1
                print,'Andrews code had an error'
              endif else begin  ;print Andrew's results if his code worked:
                printf, lun, 'V', out_k.velocity
                printf, lun, 'C', out_k.charge
                printf, lun, 'Q', 1
                print,out_k,' Andrews code'
              endelse
            endelse
          endelse
        endelse
      endif else begin
        printf, lun, 'V', -1
        printf, lun, 'C', -1
        printf, lun, 'Q', -3
        print,'Waveforms are missing or bad'
      endelse
     
      ;Makes sure dcs_1 and dcs_2 are structs (type 8) rather than ints (type 2)
      IF size(dcs1, /type) eq 8 and size(dcs2, /type) eq 8 then begin
        dcs_1_position = dcs_positioning(dcs1.waveform, x_1_correction, y_1_correction)
        dcs_2_position = dcs_positioning(dcs2.waveform, x_2_correction, y_2_correction)
        printf, lun, 'X1', dcs_1_position[0]
        printf, lun, 'Y1', dcs_1_position[1]
        printf, lun, 'X2', dcs_2_position[0]
        printf, lun, 'Y2', dcs_2_position[1]
      endif else begin
        printf, lun, 'X1', -99
        printf, lun, 'Y1', -99
        printf, lun, 'X2', -99
        printf, lun, 'Y2', -99
      endelse
    endif else begin
      printf, lun, 'V', -1
      printf, lun, 'C', -1
      printf, lun, 'Q', -4
      printf, lun, 'X1', -99
      printf, lun, 'Y1', -99
      printf, lun, 'X2', -99
      printf, lun, 'Y2', -99
      print,'File does not exist'
    endelse
    ; This is a -5 error. This usually means that there's something
    ; wrong with the DCS part of the hdf5 file.
    line_error_jump_point:
    if there_was_a_line_error then begin
      if (fstat(lun)).open eq 0 then begin
        goto, error_jump_point
      endif
      printf, lun, 'V', -5
      printf, lun, 'C', -5
      printf, lun, 'Q', -5
      printf, lun, 'X1', -99
      printf, lun, 'Y1', -99
      printf, lun, 'X2', -99
      printf, lun, 'Y2', -99
    endif
    printf, lun, ','                        ;print ',' to separate shot outputs
    print,'Iteration number: ',i
  endfor
  free_lun, lun                        ;close file
  
  ; This is the worst kind of error. If you see a -6 error in the database,
  ; it may be a good idea to contact someone who does software development.
  ; It means something crazy happened before we even started processing the
  ; data, or something worse than crazy happened while we were processing data.
  error_jump_point:
  if there_was_an_error then begin
    if (fstat(lun)).open eq 0 then begin
      openw, lun, output_file_id, /get_lun
    endif else begin
      free_lun, lun
      openw, lun, output_file_id, /get_lun
    endelse
    printf, lun, 'V', -6
    printf, lun, 'C', -6
    printf, lun, 'Q', -6
    printf, lun, 'X1', -99
    printf, lun, 'Y1', -99
    printf, lun, 'X2', -99
    printf, lun, 'Y2', -99
    printf, lun, ','
    print,'IDL Batch Processor failed'
    free_lun, lun
  endif
end
