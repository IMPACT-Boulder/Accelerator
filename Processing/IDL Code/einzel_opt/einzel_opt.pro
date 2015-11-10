FUNCTION einzel_opt, acc_v, $
                     needle_v, $
                     process_csv = process_csv, $
                     show=show

;~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
; This code takes input values for acceleration voltage and needle voltages, and 
; outputs the optimum Einzel voltage to use. The acceleration voltages range from
; 500,000 to 3,000,000 in steps of 100,000 and the needle voltages range from 
; 12,000 to 20,000 in steps of 1,000. 
; 
; 
; keyword process_CSV will take the CSV file in, truncate unnecessary data, and save to a
; .sav file. 
; 
; keyword show will show a plot of ABSMAX against Einzel Voltage and will show the minimum
;~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~



;~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
;
;; Sets the "current directory" to the location of the einzel_opt function"

current_dir = FILE_DIRNAME((ROUTINE_INFO('einzel_opt',/source, /functions)).path)

file = current_dir + '\data\reduced_data.sav'


;~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
;; Executes if process_csv is set
;; Reads in the CSV file and cuts off unwanted data, saves as .sav file type"

IF KEYWORD_SET(process_csv) then begin
  
  data_dir = current_dir + '\data\PelOpt_Step_Results_enzl_0-20kV_resndl_.25.csv'

  raw_data = READ_CSV(data_dir, RECORD_START = 1)

  new_structure = {collected:raw_data.field02, $
                   acc_v:raw_data.field03, $
                   enzl_v:raw_data.field04, $
                   needle_v:raw_data.field05, $
                   absmax:raw_data.field11}
                 
  SAVE, new_structure, FILENAME = file  
ENDIF ELSE RESTORE, file
;~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

;;
;; Takes the acceleration voltages and changes them from negative to positive
new_acc_v =  new_structure.acc_v * (-1)

;~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
;;
;; Find element in new_structure that matches input
;; acceleration and needle voltage, creates sublist of matches
ind = WHERE(new_acc_v eq acc_v and $
            new_structure.needle_v eq needle_v and $
            new_structure.collected eq 100 and $
            new_structure.enzl_v lt needle_v, count)

;;
;; Locate the value that minimizes the einzel value within sublist
IF count GT 0 THEN BEGIN
  abs_min = MIN(new_structure.absmax[ind],ii)
  
  ;;
  ;; Plot if requested
  IF KEYWORD_SET(show) then begin
    plot, new_structure.enzl_v[ind]/1d3, $
          new_structure.absmax[ind], $
      chars=2, xtitle='Einzel Voltage [kV]',ytitle='ABS Max'
    oplot, new_structure.enzl_v[ind[ii[[0,0]]]]/1d3, !y.crange, linestyle=2
  ENDIF 

  ;;
  ;; Return einzel voltage
  RETURN, new_structure.enzl_v[ind[ii]]
ENDIF ELSE BEGIN
  ;;
  ;; Show no combinations found
  print, 'No combinations found for the given values, Acceleration Voltages' + $
         ' range from 500,000 to 3,000,000 in steps of 100,000 and Needle Voltages' + $
         ' range from 12,000 to 20,000 in steps of 1,000'

  RETURN, -1
ENDELSE
END