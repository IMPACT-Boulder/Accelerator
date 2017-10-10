;Author: William Goode
;Date: 5 OCt 2017
;This functions takes the coordinate either from the y-axis for x-position or x-axis for y-positon and computes the row from whcih the look-up table array should be read. 
;Revisions:


FUNCTION dcs_row, coordinate, verbose=verbose

;There have been issues allowing the use of findgen with keywors. This is why cooridinates are listed.
  ;coordinate_grid = findgen(49, START=-12.0, INCREMENT=0.5) ;This is a 1x49 array of coordinates arranged in 0.5 mm increments just like the look-up table
  coordinate_grid = [-12.0000, -11.5000, -11.0000, -10.5000, -10.0000, -9.50000, -9.00000, -8.50000, -8.00000, -7.50000, -7.00000, -6.50000, $
                      -6.00000, -5.50000, -5.00000, -4.50000, -4.00000, -3.50000, -3.00000, -2.50000, -2.00000, -1.50000, -1.00000, -0.500000, $
                       0.00000, 0.500000, 1.00000, 1.50000, 2.00000, 2.50000, 3.00000, 3.50000, 4.00000, 4.50000, 5.00000, 5.50000, 6.00000, $
                       6.50000, 7.00000, 7.50000, 8.00000, 8.50000, 9.00000, 9.50000, 10.0000, 10.5000, 11.0000, 11.5000, 12.0000]
              
  distance_from_nearest_grid_point = 0.0*coordinate_grid ;Initialize array of the same dimensions as coordinate_grid
  
  FOR i=0, 48 do begin ;Build 1x49 array of distances to each grid point
    distance_from_nearest_grid_point(i) = abs(coordinate - coordinate_grid(i))
  ENDFOR

nearest = min(distance_from_nearest_grid_point, index) ;Select the min distance and we have the index corresponding to best grid point. This our row.

;print, nearest

row = index

return, row

if keyword_set(verbose) then print, row

END