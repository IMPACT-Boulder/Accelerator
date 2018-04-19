
PRO dcs_uncertainty, peak_voltages, charge, coordinates, uncertainty

  ;charge_inductions = peak_voltages/(1.215d13) ;conversion from voltages to charge using CSA sensitivity
  
  ;first_plane_charge = charge_inductions[0:3]
  ;second_plane_charge = charge_inductions[4:7]
  
  ;first_plane_charge[where(first_plane_charge lt 0)] = 0
  
  ;first_plane_sort_charge = first_plane_charge[REVERSE(sort(first_plane_charge))]
  ;second_plane_sort_charge = second_plane_charge[REVERSE(sort(second_plane_charge))]
  
  ;first_q_high = first_plane_sort_charge(0) ;Chargre on nearest wire
  ;first_q_low = first_plane_sort_charge(1)  ;Charge on second nearest wire
  
  ;second_q_high = second_plane_sort_charge(0) ;Chargre on nearest wire
  ;second_q_low = second_plane_sort_charge(1)  ;Charge on second nearest wire
  
  x_position = coordinates(0)
  y_position = coordinates(1)
  
  x_row = dcs_row(y_position)
  y_row = dcs_row(x_position)
  ;x_row = 24
  ;y_row = 24
  
  rms = 0.005 ;volts
  
  ratio_values = ratio(x_position, y_position, x_row, y_row)
  x_ratio = ratio_values(0)
  y_ratio = ratio_values(1)
  
  ;x_ratio(i)  = ratio(x_position, y_position, x_row, y_row)  ;[no units]
  gradient = dRdp(x_position, y_position, x_row, y_row)  ;[mm^-1]
  x_gradient = gradient(0)
  y_gradient = gradient(1)
  x_d_R      = delta_r(charge, x_position) ;[no units]
  y_d_R      = delta_r(charge, y_position) ;[no units]
  x_abs_dist = abs_distance_to_wire(x_position)
  y_abs_dist = abs_distance_to_wire(y_position)
  x_sigma = min([ x_abs_dist , x_d_R/abs(x_gradient) ])
  y_sigma = min([ y_abs_dist , y_d_R/abs(y_gradient) ])
  
  ;The following checks for close-to-wire passes.
  ;This means we don't know on which side the particle passed.
  IF x_abs_dist LT 0.5 THEN BEGIN
    x_sigma = 2*x_abs_dist
  END
  
  IF y_abs_dist LT 0.5 THEN BEGIN
    y_sigma = 2*y_abs_dist
 END
  
  x_uncertainty = x_sigma
  y_uncertainty = y_sigma 
  
  x_uncertainty_round = round(x_uncertainty/0.001)*0.001
  y_uncertainty_round = round(y_uncertainty/0.001)*0.001
  
  uncertainty = [x_uncertainty_round, y_uncertainty_round]

END