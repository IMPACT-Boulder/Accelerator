;Revisions:
;5 Oct 2017, Added y-components since we were only testing in x-dimension prior to implimentation.
;7 Oct 2017, Replaced square brackets with parenthesis.

pro reconstruct_all_the_ratios,x_row,y_row,x_values,y_values,x_ratios,y_ratios
  ;restore,'/Users/williamgoode/dcs_combined_wire_voltages.sav'
  ;restore,'dcs_combined_wire_voltages.sav'
  restore, '\Users\Clavius\Desktop\Accelerator\Processing\IDL Code\dcs_combined_wire_voltages.sav'

  x_values = dcs_combined_wire_voltages[*,x_row,0]
  y_values = dcs_combined_wire_voltages[y_row,*,1]
  x_ratios = 0.0*x_values       ;just to initialize the array with the correct dimensions
  y_ratios = 0.0*y_values       ;just to initialize the array with the correct dimensions

  wire_1_values = dcs_combined_wire_voltages[*,x_row,2] ; 1x49 array of normalized wire values corresponding to x position by index
  wire_2_values = dcs_combined_wire_voltages[*,x_row,3]
  wire_3_values = dcs_combined_wire_voltages[*,x_row,4]
  wire_4_values = dcs_combined_wire_voltages[*,x_row,5]
  
  wire_5_values = transpose(dcs_combined_wire_voltages[y_row,*,6]) ; 1x49 array of normalized wire values corresponding to y position by index
  wire_6_values = transpose(dcs_combined_wire_voltages[y_row,*,7])
  wire_7_values = transpose(dcs_combined_wire_voltages[y_row,*,8])
  wire_8_values = transpose(dcs_combined_wire_voltages[y_row,*,9])

  ;;Set the wire value for locations exactly on the wire to an
  ;;arbitrarily high value, to make the splines nearby physically
  ;;reasonable.  This value might also be used to identify wire
  ;;strikes later...
  ;;This was originally set to -1 for ID purposes, but changed to a
  ;;high value for spline purposes.
  value_on_wire = -1
  ;ratio_on_wire = 25000.0 ;now in a separate function

  wire_1_values[where(wire_1_values eq 0)] = value_on_wire
  wire_2_values[where(wire_2_values eq 0)] = value_on_wire
  wire_3_values[where(wire_3_values eq 0)] = value_on_wire
  wire_4_values[where(wire_4_values eq 0)] = value_on_wire
  
  wire_5_values[where(wire_5_values eq 0)] = value_on_wire ;This will help identify wire strkike positions since the ratio will be exaclty -1
  wire_6_values[where(wire_6_values eq 0)] = value_on_wire
  wire_7_values[where(wire_7_values eq 0)] = value_on_wire
  wire_8_values[where(wire_8_values eq 0)] = value_on_wire

  ratios_12 = wire_1_values/wire_2_values
  ratios_21 = wire_2_values/wire_1_values
  ratios_23 = wire_2_values/wire_3_values
  ratios_32 = wire_3_values/wire_2_values
  ratios_34 = wire_3_values/wire_4_values
  ratios_43 = wire_4_values/wire_3_values
  
  ratios_56 = wire_5_values/wire_6_values
  ratios_65 = wire_6_values/wire_5_values
  ratios_67 = wire_6_values/wire_7_values
  ratios_76 = wire_7_values/wire_6_values
  ratios_78 = wire_7_values/wire_8_values
  ratios_87 = wire_8_values/wire_7_values

  x_ratios[0 :14] = ratios_12[0 :14]
  x_ratios[14:19] = ratios_21[14:19]
  x_ratios[19:24] = ratios_23[19:24]
  x_ratios[24:29] = ratios_32[24:29]
  x_ratios[29:34] = ratios_34[29:34]
  x_ratios[34:48] = ratios_43[34:48]
  
  y_ratios[0 :14] = ratios_56[0 :14]
  y_ratios[14:19] = ratios_65[14:19]
  y_ratios[19:24] = ratios_67[19:24]
  y_ratios[24:29] = ratios_76[24:29]
  y_ratios[29:34] = ratios_78[29:34]
  y_ratios[34:48] = ratios_87[34:48]


  x_ratios[9] = ratio_on_wire()  ;location of first wire
  x_ratios[19] = ratio_on_wire()  ;location of second wire
  x_ratios[29] = ratio_on_wire()  ;location of third wire
  x_ratios[39] = ratio_on_wire()  ;location of fourth wire
  
  y_ratios[9] = ratio_on_wire()  ;location of first wire
  y_ratios[19] = ratio_on_wire()  ;location of second wire
  y_ratios[29] = ratio_on_wire()  ;location of third wire
  y_ratios[39] = ratio_on_wire()  ;location of fourth wire

  x_ratios[14] = 1.0            ;midway between wires 1 and 2
  x_ratios[24] = 1.0            ;midway between wires 2 and 3
  x_ratios[34] = 1.0            ;midway between wires 3 and 4
  
  y_ratios[14] = 1.0            ;midway between wires 4 and 5
  y_ratios[24] = 1.0            ;midway between wires 5 and 6
  y_ratios[34] = 1.0            ;midway between wires 6 and 7
    
end
