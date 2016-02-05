function create_series, min_in, max_in, points = points, step = step

minimum = double(min_in)
maximum = double(max_in)

step_test   = size(step, /type)
points_test = size(points, /type)

if keyword_set(step) or keyword_set(points) then begin

   if keyword_set(step) then points = floor(((maximum-minimum)/double(step))+1, /L64) $
     else step = (maximum-minimum)/double(points-1)

   if step gt maximum then begin

      print, 'Step must be less than maximum'

   endif else begin

      series = findgen(points)*step + minimum

      return, series

   endelse


endif else begin

   print, 'One of either step size or number of points needs to be specified'

endelse

end
