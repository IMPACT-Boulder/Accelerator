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
;-


pro idl_batch_processor,folder,storage_folder,old_data=old_data

  there_was_an_error = 0
  catch, error_status
  if error_status ne 0 then begin
     catch,/cancel
     ;PRINT, 'Inside v_estimate_subroutine Error index: ', Error_status
     if keyword_set(verbose) then print,'Error message from within v_estimate_subroutine: ', !ERROR_STATE.MSG
     there_was_an_error = 1
     goto,error_jump_point  ;jump to end and set velocity = -2 to indicate error     
  endif

  input_file_id = folder + '\index.txt';create input file reference
  print,input_file_id
  shots=READ_CSV(input_file_id);read csv for shot index
  shotid=TAG_NAMES(shots);generate tag names   
  nshots=n_elements(shotid);determine number of shots to examine  
  output_file_id = folder + '\results.txt';create output file refe4rence
;  print,shots
  file_exsists=0
  
  
  qthreshold=50;define the quality threshold for the first algorithm

  openw, lun, output_file_id, /get_lun;open output file
  
  i=0
  For i=0,nshots-1 do begin;examine all shots 
    filedata=STRSPLIT(shots.(string(i)),' ',/EXTRACT)
    
    IF filedata[2] eq 0 then begin
      path_folder = folder
    ENDIF ELSE BEGIN path_folder = storage_folder
    ENDELSE 
    IF filedata[2] eq 1 then begin
      files = STRCOMPRESS(path_folder + '\' + filedata[1] +'\' + filedata[0] +'.hdf5' ,/REMOVE_ALL )
    ENDIF ELSE BEGIN 
      files = STRCOMPRESS(path_folder + '\' + filedata[1] +'\' + string(LONG(filedata[0])/1000) + '\' + filedata[0] +'.hdf5' ,/REMOVE_ALL )    
    ENDELSE
    print,'file name:',files
    file_exsists=FILE_TEST(files)
 ;   print, file_exsists
    IF file_exsists eq 1 then begin
      ;get waveforms from hdf5 file
      out = ccldas_read_raw_file(files)
      wv1 = out.first_detector.waveform
      wv2 = out.second_detector.waveform
      wv3 = out.third_detector.waveform
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
        out_k=tobin_v_estimate(wv1,wv2,wv3,dt,old_data=old_data)
        ;print,out_k
          if out_k[0] GT 0 then begin ;print Tobin's results if Tobin's code finds anything 
            printf, lun, 'V', out_k[0]
            printf, lun, 'C', out_k[1]
            printf, lun, 'S', 2
            printf, lun, 'Q', 1
            printf, lun, 'P', out_k[2]/1
            print,out_k,' Tobins code'
          endif  else begin                   ;Call Andrew's code if Keith's doesn't see anything:
            if out_k[0] eq -2 then begin ;print out that Tobin's code had an actual failure so we can find it and correct it
              printf, lun, 'V', out_k[0]
              printf, lun, 'C', -1
              printf, lun, 'S', -1
              printf, lun, 'Q', 0
              printf, lun, 'P', 0
              print,out_k,' Tobins code had an error'
            endif else begin
              out = triple_est_latest(wv1, wv2, wv3, dt,old_data=old_data)
              ;print, out
              ;/Andrew's code.
              if out.quality lt qthreshold then begin ;if Andrew's code failed 
                printf, lun, 'V', -1
                printf, lun, 'C', -1
                printf, lun, 'S', 1
                printf, lun, 'Q', 0
                printf, lun, 'P', 0
                print,'both failed'
              endif  else begin                     ;print Andrew's results if his code worked:
                if out.quality eq 50 then begin
                  printf, lun, 'V', -3
                  printf, lun, 'C', -1
                  printf, lun, 'S', -1
                  printf, lun, 'Q', 0
                  printf, lun, 'P', 0
                  print,'Andrews code had an error'
                endif else begin
                  printf, lun, 'V', out.velocity
                  printf, lun, 'C', out.charge
                  printf, lun, 'S', 1
                  printf, lun, 'Q', 1
                  printf, lun, 'P', out.passed
                  print,out,' Andrews code'
                endelse
              endelse
            endelse
          endelse
        endif else begin
          printf, lun, 'V', -1
          printf, lun, 'C', -1
          printf, lun, 'S', -1
          printf, lun, 'Q', 0
          printf, lun, 'P', 0
          print,'Waveforms are missing or bad'
        endelse    
      ; continueq = DIALOG_MESSAGE('Continue?', /question,/center)
      ;if continueq eq 'No' then break
      endif else begin
        printf, lun, 'V', -1
        printf, lun, 'C', -1
        printf, lun, 'S', -1
        printf, lun, 'Q', 0
        printf, lun, 'P', 0
        print,'File does not exist'
      endelse 
      printf, lun, ','                        ;print ',' to separate shot outputs 
      print,'Iteration number: ',i
  endfor
  free_lun, lun                        ;close file
  
  error_jump_point: ;print,'got to error jump point'
  if there_was_an_error then begin
    if (fstat(lun)).open eq 0 then begin 
      openw, lun, output_file_id, /get_lun
    endif else begin
      free_lun, lun
      openw, lun, output_file_id, /get_lun
    endelse    
    printf, lun, 'V', -5
    printf, lun, 'C', -5
    printf, lun, 'S', -5
    printf, lun, 'Q', 0
    printf, lun, 'P', 0
    printf, lun, ','
    
    free_lun, lun
  endif
  
end
