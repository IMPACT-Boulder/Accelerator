;;This function returns the fractional index of a spatial coordinate
;;This is used in the DCS interpolator routines such as 
;;dcs_find_coordinates_from_peak_voltages, and assumes a 49-point grid
;;ranging from -12 to +12, indexed from 0 to 48.

function fracidx,x
  return,2.0*(x+12.0)
end
