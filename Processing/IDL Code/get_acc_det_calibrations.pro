function get_acc_det_calibrations, det_num, megterm = megterm, version = version

;Big Accelerator
;QD1 [CSA 2] 
;QD2 [CSA 3]
;QD3 [CSA 4]

;Small Accelerator
;QD4 [CSA 7] 
;QD5 [CSA 1]

;CSA Numbers 5 and 6 are unused at the moment

;megterm is currently unavailable for the new calibrations.

;Version 0 (latest) is currently as of 1/8/2018 and was a result of David's campaign
; See the paper that David wrote 'beam_det_cal_report.tex' for more information.
;Version 1 is the first version and was a result of Evan's campaign

if not keyword_set(version) then version = 0 ;
;Note that 0 is always the latest. When a new version comes about, change the 
;current to the highest number and make the new version '0'.

case version of
  ;Default is version 0
  0: begin
      ;These are the numbers for the calibration campaign conducted by David James
      ;in 2017 and are changed as of 1/8/2018. These are all in V/C
      case det_num of

        1: cal = 1.97d13 ;+/-0.012E13 V/C - QD 1  
        2: cal = 2.03d13 ;+/-0.032E13     - QD 2
        3: cal = 2.00d13 ;+/-0.042E13     - QD 3
        4: cal = 1.40d13 ;QD 4;Currently uncalibrated as of 1/8/2017!
        5: cal = 1.72d13 ;QD 5;Currently uncalibrated as of 1/8/2017!
         
      endcase
    
     end
     
  1: begin
     
     if keyword_set(megterm) then begin
      ;This is the case for 1 meg Ohm termination.  However, note that the detectors
      ;are terminated at 50 Ohms somewhere.  Scope termination should be 1Meg to keep
      ;the overall termniation at 50 Ohms.

      case det_num of

        1: cal = 2.34d13 ;V/C
        2: cal = 2.54d13
        3: cal = 2.47d13
        4: cal = 2.97d13
        5: cal = 3.55d13
        
      endcase

    endif else begin
      ;This is the nominal case of 50 Ohm termination.  Driven by the FPGA termination.

      case det_num of
        
        1: cal = 1.14d13 ;V/C
        2: cal = 1.24d13
        3: cal = 1.21d13
        4: cal = 1.40d13
        5: cal = 1.72d13 
        
      endcase

    endelse
         
     end
endcase

return, cal

end