
PRO dcs_uncertainty, peak_voltages, charge, coordinates, uncertainty

  charge_inductions = peak_voltages/(1.215d13) ;conversion from voltages to charge using CSA sensitivity
  
  first_plane_charge = charge_inductions[0:3]
  second_plane_charge = charge_inductions[4:7]
  
  ;first_plane_charge[where(first_plane_charge lt 0)] = 0
  
  first_plane_sort_charge = first_plane_charge[REVERSE(sort(first_plane_charge))]
  second_plane_sort_charge = second_plane_charge[REVERSE(sort(second_plane_charge))]
  
  first_q_high = first_plane_sort_charge(0) ;Chargre on nearest wire
  first_q_low = first_plane_sort_charge(1)  ;Charge on second nearest wire
  
  second_q_high = second_plane_sort_charge(0) ;Chargre on nearest wire
  second_q_low = second_plane_sort_charge(1)  ;Charge on second nearest wire
  
  rms = 0.005 ;volts
  
  delta_q = rms/(1.215d13) ;conversion of voltage rms to charge uncertainty
  ;delta_q = 4.2d-16
  qnr = charge/delta_q ;charge to noise ratio
  
  xr = first_q_high/first_q_low ;ratio of near wire charge over second nearst
  yr = second_q_high/second_q_low
  
  xc_1 = first_q_high/charge ;c_1 and c_2 are fractions of the particle's charge on the nearest two wires
  xc_2 = first_q_low/charge
  
  yc_1 = second_q_high/charge ;c_1 and c_2 are fractions of the particle's charge on the nearest two wires
  yc_2 = second_q_low/charge
  
  xdelta_r = (xr/qnr)*SQRT((1/xc_1)^2 + (1/xc_2)^2) ;uncertainty of the ratio using addition in quadriture
  ydelta_r = (yr/qnr)*SQRT((1/yc_1)^2 + (1/yc_2)^2)
  
  dcs_gradient, coordinates, gradient ;calculates dr/dp as a function of position for both x and y
  
  x_gradient = gradient(0)
  y_gradient = gradient(1)
  
  x_uncertainty = abs(xdelta_r/x_gradient)
  y_uncertainty = abs(ydelta_r/y_gradient) 
  
  x_uncertainty_round = round(x_uncertainty/0.001)*0.001
  y_uncertainty_round = round(y_uncertainty/0.001)*0.001
  
  uncertainty = [x_uncertainty_round, y_uncertainty_round]

END