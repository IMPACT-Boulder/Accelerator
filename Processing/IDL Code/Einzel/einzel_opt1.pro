pro einzel_opt1, acc_v, $
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

;;
;; Set defaults
acc_v = n_elements(acc_v) eq 1 ? acc_v : 3d6
needle_v = n_elements(needle_v) eq 1 ? needle_v : 1.2d4

;~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
;
;; Sets the "current directory" to the location of the einzel_opt function"

current_dir = FILE_DIRNAME((ROUTINE_INFO('einzel_opt1',/source)).path)

file = current_dir + '\data\reduced_data.sav'

;~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
;; Executes if process_csv is set
;; Reads in the CSV file and cuts off unwanted data, saves as .sav file type"

;IF KEYWORD_SET(process_csv) then begin

  data_dir = current_dir + '\data\PelOpt_Step_Results_enzl_0-20kV_resndl_.25.csv'

  raw_data = READ_CSV(data_dir, RECORD_START = 1)

  new_structure = {collected:raw_data.field02, $
                   acc_v:raw_data.field03, $
                   enzl_v:raw_data.field04, $
                   needle_v:raw_data.field05, $
                   absmax:raw_data.field11}
                                 
  SAVE, new_structure, FILENAME = file  
;ENDIF ELSE 
RESTORE, file
;~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

;;
;; Takes the acceleration voltages and changes them from negative to positive
new_acc_v =  new_structure.acc_v * (-1)

;~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
;;
;; Find element in new_structure that matches input
;; acceleration and needle voltage, creates sublist of matches
acc_v_u = new_acc_v[(sort(new_acc_v))[uniq(new_acc_v[sort(new_acc_v)])]]
needle_v_u = new_structure.needle_v[(sort(new_structure.needle_v))[uniq(new_structure.needle_v[sort(new_structure.needle_v)])]]
n_acc = n_elements(acc_v_u)
n_ndl = n_elements(needle_v_u)
enzl = dblarr(n_acc,n_ndl)
for i=0,n_acc-1 do for j=0,n_ndl-1 do begin

  ind = WHERE(new_acc_v eq acc_v_u[i] and $
              new_structure.needle_v eq needle_v_u[j] and $
              new_structure.collected eq 100 and $
              new_structure.enzl_v lt needle_v_u[j], count)
  
  ind2 = WHERE(new_structure.collected eq 100 and $
               new_structure.enzl_v lt needle_v_u[j], count2)
  
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
  
    
    enzl[i,j] = new_structure.enzl_v[ind[ii]]
  ENDIF ELSE BEGIN
    ;;
    ;; Show no combinations found
    print, 'No combinations found for the given values, Acceleration Voltages' + $
           ' range from 500,000 to 3,000,000 in steps of 100,000 and Needle Voltages' + $
           ' range from 12,000 to 20,000 in steps of 1,000'
  
    RETURN 
  ENDELSE                    
endfor
  
;;
;; Show contour
mn = 1d4;min(enzl(where(enzl gt 0)))
mx = max(enzl)
levs = dindgen(100.)/100.*(mx-mn)+mn
pos = [.1,.15,.85,.9]
contour, enzl, acc_v_u/1d3, needle_v_u/1d3,$
  /fill, levels=levs,$
  charsize = 1.5,$
  xtitle = 'V!Dacc!N [kV]',$
  ytitle = 'V!Dneedle!N [kV]',$
  pos = pos

;;
;; Test interpolation
ii = interpol(dindgen(n_acc),acc_v_u,acc_v)
jj = interpol(dindgen(n_ndl),needle_v_u,needle_v)
enzl_interp = bilinear(enzl,ii,jj)
oplot, !x.crange, needle_v[[0,0]]/1d3, linestyle = 2
oplot, acc_v[[0,0]]/1d3,!y.crange, linestyle = 2
xyouts, acc_v/1d3, needle_v/1d3, $
  string(enzl_interp,format='(E9.2)'),$
  charsize = 1.5,$
  /data

  
  ; return, -1
END