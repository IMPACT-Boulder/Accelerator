function einzel_slice, voltage, $
                       needle = needle
                       show = show

step_count = 50

if keyword_set(needle) then begin
  mn = 10d3
  mx = 20d3 
  title = 'Needle  Vs. Einzel  fixed Acc at ' + string(voltage/1d3, format = '(F5.2)') + ' [kV]
  xtitle = 'Needle Voltage [kV]'

endif else begin
  mn = .5d6
  mx = 3d6
  title = 'Acc Vs. Einzel fixed Needle at ' + string(voltage/1d3, format = '(F5.2)') +  ' [kV]
  xtitle = 'Accelerator Voltage [kV]'

endelse

step = (mx-mn) /step_count  

points = floor(((mx-mn)/double(step))+1, /L64)
series = findgen(points)*step + mn

einzel_array = 0
if keyword_set(show) then begin
  
  for i=0, n_elements(series) -1 do begin
    if keyword_set(needle) then begin
      x = einzel_opt(voltage, series[i])
    
    endif else begin
      x = einzel_opt(series[i], voltage)
      endelse  
    
      einzel_array = [einzel_array,x] 

  endfor
 
einzel_array = einzel_array[1:*]

plot, series/1d3, einzel_array/1d3, $
      chars = 2, xtitle = xtitle, ytitle='Optimum Einzel Voltage [kV]', $
      title = title
endif

maxx = 3d6
minx = .5d6
maxy = 20d3
miny = 10d3

step_x = (maxx - minx) /5
step_y = (maxy - miny) /5

points_x = floor(((maxx - minx)/double(step_x)) + 1, /L64)
points_y = floor(((maxy - miny)/double(step_y)) + 1, /L64)

series_x = findgen(points_x)*step_x + minx
series_y = findgen(points_y)*step_y + miny

m = make_array(n_elements(series_x),n_elements(series_y))

for i=0, n_elements(series_x) -1 do begin
  for j=0, n_elements(series_y) - 1 do begin
    ;z = einzel_opt(series_x[i], series_y[j])
    
    m[i,j] = einzel_opt(series_x[i],series_y[j])
    
  ;  einzel_array = [einzel_array, z]
  
  endfor
endfor
;einzel_array = einzel_array[1:*]


;print, m

surfaceplot = surface(m,texture_interp = 1)
stop
return, -1

end



