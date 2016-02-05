pro einzel_opt, acc_v, $
                     needle_v, $
                     process_csv=process_csv, $
                     show=show, $
                     plotgraph= plotgraph
                   
;~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~                                  
; This code takes input values for acceleration voltage and needle voltages, and 
; outputs the optimum Einzel voltage to use.

acc_v=double(acc_v)
needle_v=double(needle_v)

current_dir = FILE_DIRNAME((ROUTINE_INFO('einzel_opt',/source)).path)

file = current_dir + '\data\reduced_data.sav'

IF KEYWORD_SET(process_csv) THEN BEGIN
  data_dir = current_dir + '\data\PelOpt_Step_Results_enzl_0-20kV_resndl_.25.csv'
  
  raw_data = READ_CSV(data_dir, RECORD_START = 1)

  data =  {collected:raw_data.field02, $
          acc_v:raw_data.field03*(-1), $
          enzl_v:raw_data.field04, $
          needle_V:raw_data.field05, $
          radius:raw_data.field11, $
          res_v:raw_data.field07, $
          maxy:raw_data.field13}
          
   SAVE, data, FILENAME = file
ENDIF ELSE RESTORE, file

;~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
;loadct,39
;device, decompose = 0

acc_v = n_elements(acc_v) eq 1 ? acc_v : 3d6
needle_v = n_elements(needle_v) eq 1 ? needle_v : 1.2d4
;~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
;Takes the values of the acceleration voltages and needle voltages and takes the unique
;values of them and sorts them
s1 = SORT(data.acc_v)
s2 = SORT(data.needle_v)

u1 = UNIQ(data.acc_v[s1])
u2 = UNIQ(data.needle_v[s2])

acc_v_u = data.acc_v[s1[u1]]
needle_v_u = data.needle_v[s2[u2]]

;Builds the array of all possible needle and acceleration voltages

n_acc = N_ELEMENTS(acc_v_u)
n_ndl = N_ELEMENTS(needle_v_u)


enzl = DBLARR(n_acc, n_ndl)


;Loops through all possible combinations of needle and acceleration voltages,
;finds the minimum radius spread of the beam, and gets the associated 
;einzel voltage to go with it


FOR i=0, n_acc -1 DO $
  FOR j=0, n_ndl -1 DO BEGIN
  
  ind = WHERE(data.acc_v eq acc_v_u[i] and $
              data.needle_v eq needle_v_u[j] and $
              data.collected eq 100 and $
              data.enzl_v lt needle_v_u[j], count)
              
              
  ind2 = where(data.acc_v eq acc_v and $
               data.needle_v eq needle_v and $
               data.collected eq 100, count2)
               
  IF count2 GT 0 THEN BEGIN      
    abs_min2 = MIN(data.radius[ind2],min_i)               
  ENDIF
  
               
  IF count GT 0 THEN BEGIN      
    abs_min = MIN(data.radius[ind],ii) 

    enzl[i,j] = data.enzl_v[ind[ii]]
  ENDIF ELSE BEGIN
  
   
  PRINT, -1
  ;RETURN, -1  
  ENDELSE
ENDFOR

;Takes the input acceleration or needle voltage, and finds the scaled index of this number
;based on the total number of indicies in each dimension

ii2 = INTERPOL(DINDGEN(n_acc), acc_v_u, acc_v)
jj2 = INTERPOL(DINDGEN(n_ndl),needle_v_u, needle_v)

;Interpolates on the two dimensional grid created of optimum einzel voltages based on
;the scaled index number of the input acceleration and needle voltages. 

enzl_interp = BILINEAR(enzl,ii2,jj2)

;~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
;Graphing Stuff
    IF KEYWORD_SET(plotgraph) then begin
      plot, data.enzl_v[ind2]/1d3, $
            data.radius[ind2], $
        chars=2, xtitle='Einzel Voltage [kV]',ytitle='radius of beam spread'
      oplot, data.enzl_v[ind2[min_i[[0,0]]]]/1d3, !y.crange, linestyle=2

    ENDIF
;    acc_ind = where(data.acc_v eq 1200d3,z)
;
;    plot, data.enzl_v[acc_ind]/1d3, data.radius[acc_ind]
 IF KEYWORD_SET(show) THEN BEGIN
    mn = 1d4
    mx = MAX(enzl)
    levs = DINDGEN(100.)/100.*(mx-mn)+mn
    pos = [.1,.15,.82,.9]
    window, 1
    contour, enzl_interp, acc_v_u/1d3, needle_v_u/1d3,$
      /fill,levels = levs,$
      charsize = 1.5,$
      xtitle = 'V!Dacc!N [kV]',$
      ytitle = 'V!Dneedle!N [kV]',$
      pos = pos, $
      title = 'Optimum Einzel Voltage'

    OPLOT, !x.crange, needle_v[[0,0]]/1d3, linestyle = 2
    OPLOT, acc_v[[0,0]]/1d3,!y.crange, linestyle = 2
    XYOUTS, acc_v/1d3 + .5d2, needle_v/1d3+.5, $
      STRING(enzl_interp,format='(E9.2)'),$
      charsize = 1.5,$
      /data
  
    colorbar_smooth, range=[mn,mx]/1d3,$
      title='Einzel [kV]', $
      format='(D4.1)',$
      bottom = 1,$
      up=254,$
      position = [pos[2]+.03,!y.window[0],pos[2]+.06,!y.window[1]],$
      charsize=1.2, $
      ;  div = 5,$
      /vertical, $
      /right
 ENDIF
;The output of the function is the optimum einzel voltage based on the 
;input of any acceleration and needle voltage.

PRINT, enzl_interp
;RETURN, enzl_interp

END