 FUNCTION ratio, x_position, y_position, x_row, y_row

   ;reconstruct_all_the_ratios, x_position, row, x_values, x_ratios
   reconstruct_all_the_ratios, x_row,y_row,x_values,y_values,x_ratios,y_ratios

   x_ratio_value = interpol(x_ratios,x_values,x_position)
   
   y_ratio_value = interpol(y_ratios,y_values,y_position)
   
   ratio_values = [x_ratio_value, y_ratio_value]

   ;;Depending on the position, interpolate over a specific subregion...
   ;;[This didn't work, since the splining always had problems...)
   ;;if x_position le -7.5                        then x_ratio_value = interpol(x_ratios[ 0: 9],x_values[ 0: 9],x_position, /quadratic);10 pts
   ;;if x_position ge -7.5 and x_position le -2.5 then x_ratio_value = interpol(x_ratios[ 9:19],x_values[ 9:19],x_position, /quadratic);11 pts
   ;;if x_position ge -2.5 and x_position le  2.5 then x_ratio_value = interpol(x_ratios[19:29],x_values[19:29],x_position, /quadratic);11 pts
   ;;if x_position ge  2.5 and x_position le  7.5 then x_ratio_value = interpol(x_ratios[29:39],x_values[29:39],x_position, /quadratic);11 pts
   ;;if x_position ge  7.5                        then x_ratio_value = interpol(x_ratios[39:48],x_values[39:48],x_position, /quadratic);10 pts

   ;;plot,x_values,x_ratios,psym=-6,symsize=0.5,/xst,title='within ratio.pro'
   ;;oplot,x_position*[1,1],x_ratio_value*[1,1],psym=6,symsize=0.5,thick=3
   ;;if x_position le -7.5                        then print,'interpolating left of the first wire'
   ;;if x_position ge -7.5 and x_position le -2.5 then print,'interpolating between wires 1 and 2'
   ;;result=get_kbrd()

   ;;print
   ;;print,x_values[0:8]
   ;;print,x_ratios[0:8]
   ;;result=get_kbrd()

   return, ratio_values

END
