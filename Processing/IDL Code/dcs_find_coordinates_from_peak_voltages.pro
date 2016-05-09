;;This routine is part of the analysis of DCS data.  The raw data from
;;8 wires is reduced to 8 peak values, and further reduced to two
;;RATIOS: one between the highest and second-highest peak in plane 1,
;;and one between the highest and second-highest peak in plane 2.
;;
;;Given these ratios from the data, we need to find where in the x-y
;;plane we get the best match to the COULOMB simulation output.
;;
;;COULOMB is calculated on a 49x49 grid with 0.5 mm steps between x/y
;;locations.  This is not fine enough for our purposes, so we want to
;;interpolate.
;;
;; f1xy  is a 3-d array: 49 x 49 x 3
;;       (*,*,0) are the x-coordinates
;;       (*,*,1) are the y-coordinates
;;       (*,*,2) are the data values (for example, the relevant plane-1 ratio)
;; f2xy  is a second, similar 3-d array
;; data1 is the data value to locate within f1xy
;; data2 is the data value to locate within f2xy


pro dcs_find_coordinates_from_peak_voltages,wire_peak_values,xyout,$
   verbose=verbose,target_xy=target_xy
   
;;x_hi_v=x_hi_v,x_2hi_v=x_2hi_v,x_hi_idx=x_hi_idx,x_2hi_idx=x_2hi_idx,$
;;y_hi_v=y_hi_v,y_2hi_v=y_2hi_v,y_hi_idx=y_hi_idx,y_2hi_idx=y_2hi_idx,$

  ;;Restore file with all of the wire voltage data.  This is a
  ;;(49x49x10 array): (*,*,0) : x-coordinates [mm]
  ;;                  (*,*,1) : y-coordinates [mm]
  ;;                  (*,*,2) : wire 1 voltages vs. x/y from COULOMB
  ;;                  (*,*,9) : wire 8 voltages vs. x/y from COULOMB
  ;restore,'/Users/williamgoode/dcs_combined_wire_voltages.sav',verbose=verbose
  restore,'\Users\Clavius\Desktop\Accelerator\Processing\IDL Code\dcs_combined_wire_voltages.sav',verbose=verbose
  xmap = dcs_combined_wire_voltages[*,*,0]
  ymap = dcs_combined_wire_voltages[*,*,1]
  print, 'I have the table'
  ;;Do the straightforward matching to the COULOMB output, quantized
  ;;to a 0.5 mm grid.  This will be used as a starting point for the
  ;;interpolated search.
  coarse_errormap = dblarr(49,49)
  for i=0,48 do begin
     for j=0,48 do begin
        coulomb_output = dcs_combined_wire_voltages[i,j,2:9]
        coarse_errormap(i,j) = total(abs(wire_peak_values-coulomb_output))
     endfor
  endfor
  ;contour,coarse_errormap,xmap,ymap,/fill,nlevels=200
  thing = min(coarse_errormap,bestidx)
  x1best = xmap[bestidx]
  y1best = ymap[bestidx]

  ;;Could stop here if we didn't want to bother with the interpolation...

  ;;Make plots of search procedure
  if keyword_set(verbose) then begin 
     if not keyword_set(target_xy) then target_xy=[0.0,0.0]
     x1 = target_xy(0)
     y1 = target_xy(1)

     window,0,xsize=1400,ysize=700
     xr = [-12,12]
     zr = [1.0e-5,1000]

     !p.multi = [0,4,2]
     for j=0,1 do begin
        for i=0,3 do begin
           wire_index = i+4*j
           t1 = 'voltage on wire '+s2(wire_index+1)
           loadct,1,/silent
           contour,dcs_combined_wire_voltages(*,*,wire_index+2),xmap,ymap,title=t1,$
                   /fill,nlevels=100,xrange=xr,yrange=xr,/xst,/yst,charsize=2.0
           @definecolors
           oplot,xmap,ymap,psym=3,color=colors.yellow
           oplot,x1*[1,1],y1*[1,1],psym=6,color=colors.green,symsize=0.5,thick=3
        endfor
     endfor
     
     plot_errormap = 1
     if plot_errormap eq 1 then begin 
        window,4,xpos=400,xsize=800,ysize=800
        !p.multi=[0,1,1]
        errormap1 = dblarr(49,49)
        for i=0,48 do begin
           for j=0,48 do begin
              errormap1(i,j) = errorfunction_wires(xmap(i,j),ymap(i,j),dcs_combined_wire_voltages,wire_peak_values)
           endfor
        endfor

        loadct,1,/silent
        contour,errormap1,xmap,ymap,title='Error map',$
                /fill,nlevels=100,xrange=xr,yrange=xr,/xst,/yst,/zst;,zrange=[0,10]
        @definecolors
        oplot,xmap,ymap,psym=3,color=colors.yellow
        oplot,x1*[1,1],y1*[1,1],psym=6,color=colors.green,symsize=0.5,thick=3

     endif
  endif

  xlo = -12.0
  xhi = 12.0
  ylo = -12.0
  yhi = 12.0

  stepsize = 0.2;3.0                ;[mm] initial step size
  stepsize_threshold = 0.0001   ;[mm]
  error_array = dblarr(9)       ;nine-element array of calculated errors at each step

  if keyword_set(verbose) then begin ;plot starting point
     print,x1best,y1best,stepsize
     wset,0
     for j=0,1 do begin
        for i=0,3 do begin
           wire_index = i+4*j
           plot_location = 8-wire_index
           !p.multi=[plot_location,4,2]
           plot,[0,0],[0,0],xrange=[-12,12],yrange=[-12,12],/xst,/yst,$
                charsize=2,/nodata
           oplot,x1best*[1,1],y1best*[1,1],$
                 psym=6,color=colors.red,symsize=0.5,thick=3
        endfor
     endfor

     if plot_errormap eq 1 then begin
        wset,4
        !p.multi=[1,1,1]
        plot,[0,0],[0,0],xrange=[-12,12],yrange=[-12,12],/xst,/yst,$
             /nodata
        oplot,x1best*[1,1],y1best*[1,1],psym=6,color=colors.red,symsize=0.2,thick=3
     endif
  endif

  while stepsize gt stepsize_threshold do begin ;loop until optimized...
     xplus  = min([x1best+stepsize,xhi]) ;don't run over the edge!
     xminus = max([x1best-stepsize,xlo]) ;don't run over the edge!
     yplus  = min([y1best+stepsize,yhi]) ;don't run over the edge!
     yminus = max([y1best-stepsize,ylo]) ;don't run over the edge!
    
     error_array(0) = errorfunction_wires(xminus,yplus ,dcs_combined_wire_voltages,wire_peak_values) ;NW
     error_array(1) = errorfunction_wires(x1best,yplus ,dcs_combined_wire_voltages,wire_peak_values) ;N
     error_array(2) = errorfunction_wires(xplus ,yplus ,dcs_combined_wire_voltages,wire_peak_values) ;NE
     error_array(3) = errorfunction_wires(xminus,y1best,dcs_combined_wire_voltages,wire_peak_values) ;W
     error_array(4) = errorfunction_wires(x1best,y1best,dcs_combined_wire_voltages,wire_peak_values) ;Center
     error_array(5) = errorfunction_wires(xplus ,y1best,dcs_combined_wire_voltages,wire_peak_values) ;E
     error_array(6) = errorfunction_wires(xminus,yminus,dcs_combined_wire_voltages,wire_peak_values) ;SW
     error_array(7) = errorfunction_wires(x1best,yminus,dcs_combined_wire_voltages,wire_peak_values) ;S
     error_array(8) = errorfunction_wires(xplus ,yminus,dcs_combined_wire_voltages,wire_peak_values) ;SE
    
     result = min(error_array,bestidx)  
     if min(error_array) eq error_array(4) then bestidx=4 ;takes care of edge issues...
     case bestidx of
        0:begin
           x1best = xminus
           y1best = yplus
        end
        1: y1best = yplus
        2:begin
           x1best = xplus
           y1best = yplus
        end
        3: x1best = xminus
        4: stepsize = 0.5*stepsize
        5: x1best = xplus
        6:begin
           x1best = xminus
           y1best = yminus
        end
        7: y1best = yminus
        8:begin
           x1best = xplus
           y1best = yminus
        end
     endcase

     if keyword_set(verbose) then begin ;plot the search walk
        print,x1best,y1best,stepsize,min(error_array)
        wait,0.1

        wset,0
        for j=0,1 do begin
           for i=0,3 do begin
              wire_index = i+4*j
              plot_location = 8-wire_index
              !p.multi=[plot_location,4,2]
              plot,[0,0],[0,0],xrange=[-12,12],yrange=[-12,12],/xst,/yst,$
                   charsize=2,/nodata
              oplot,x1best*[1,1],y1best*[1,1],$
                    psym=6,color=colors.red,symsize=0.5,thick=3
           endfor
        endfor

        if plot_errormap eq 1 then begin
           wset,4
           !p.multi=[1,1,1]
           plot,[0,0],[0,0],xrange=[-12,12],yrange=[-12,12],/xst,/yst,$
                /nodata
           oplot,x1best*[1,1],y1best*[1,1],psym=6,color=colors.red,symsize=0.2,thick=3
        endif
     endif
  endwhile

  xyout = [x1best,y1best]
  
end

