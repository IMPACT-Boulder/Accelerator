;;This is the error function for comparing a given array of wire
;;values to the 8 wire-value maps (voltage vs. x and y for a given
;;wire).
;;
;;This is used in the DCS interpolator
;;dcs_find_coordinates_from_peak_voltages
;;
;; x   : The x-coordinate on the maps where we are comparing
;; y   : The y-coordinate on the maps where we are comparing
;; 
;;combined_wiremap : 49x49x10 array of x-coordinates, y-coordinates,
;;and 8 layers of voltage values for wires 1-8
;;
;;datavalues       : 8-element array of wire values to compare to
function errorfunction_wires,x,y,combined_wiremap,datavalues
  interpolated_datavalues = dblarr(8)
  for j=0,7 do begin
     single_wiremap = combined_wiremap(*,*,j+2)
     interpolated_datavalues(j) = interpolate(single_wiremap,fracidx(x),fracidx(y),/double,cubic=-0.5)
  endfor
  return,total(abs(datavalues-interpolated_datavalues))
end
