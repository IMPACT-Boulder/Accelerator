PRO dcs_gradient, coordinates, gradients, graph=graph

restore,'\Users\Clavius\Desktop\Accelerator\Processing\IDL Code\dcs_combined_wire_voltages.sav'

x_values = dcs_combined_wire_voltages[*,0,0] ;1x49 array of range of x positions from -12 to 12 in increments of 0.5 mm
y_values = dcs_combined_wire_voltages[0,*,1]

wire_1_values = dcs_combined_wire_voltages[*,0,2] ; 1x49 array of normalized wire values corresponding to x position by index
wire_2_values = dcs_combined_wire_voltages[*,0,3]
wire_3_values = dcs_combined_wire_voltages[*,0,4]
wire_4_values = dcs_combined_wire_voltages[*,0,5]

wire_5_values = dcs_combined_wire_voltages[0,*,6] ; 1x49 array of normalized wire values corresponding to y position by index
wire_6_values = dcs_combined_wire_voltages[0,*,7]
wire_7_values = dcs_combined_wire_voltages[0,*,8]
wire_8_values = dcs_combined_wire_voltages[0,*,9]

wire_1_values[where(wire_1_values eq 0)] = -1 ;This will help identify wire strkike positions since the ratio will be exaclty -1
wire_2_values[where(wire_2_values eq 0)] = -1
wire_3_values[where(wire_3_values eq 0)] = -1
wire_4_values[where(wire_4_values eq 0)] = -1

wire_5_values[where(wire_5_values eq 0)] = -1 ;This will help identify wire strkike positions since the ratio will be exaclty -1
wire_6_values[where(wire_6_values eq 0)] = -1
wire_7_values[where(wire_7_values eq 0)] = -1
wire_8_values[where(wire_8_values eq 0)] = -1

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

x_position = coordinates(0)
y_position = coordinates(1)

x_wire = [-5.0, -2.5, 0.0, 2.5, 5.0] ;wire positions are from -7.5 to 7.5. This is a range of reference points.
y_wire = [-5.0, -2.5, 0.0, 2.5, 5.0]

x_temp = [x_wire, x_position] ; Append x_postion to array of reference points.
y_temp = [y_wire, y_position]

x_sort = x_temp[SORT(x_temp)] ;Sort in order to place x_postion in between appropriate reference points. 
y_sort = y_temp[SORT(y_temp)]

x_location_index = where(x_sort EQ x_position) ;Find where position relative to reference points
y_location_index = where(y_sort EQ y_position)

CASE x_location_index(0) OF  ;This uses x_box_low as an indication of where the x_position is relative to the wires in order to determine the approriate ratio.
  0: x_ratios = ratios_12
  1: x_ratios = ratios_21
  2: x_ratios = ratios_23
  3: x_ratios = ratios_32
  4: x_ratios = ratios_34
  5: x_ratios = ratios_43
ENDCASE

CASE y_location_index(0) OF  ;This uses x_box_low as an indication of where the x_position is relative to the wires in order to determine the approriate ratio.
  0: y_ratios = ratios_56
  1: y_ratios = ratios_65
  2: y_ratios = ratios_67
  3: y_ratios = ratios_76
  4: y_ratios = ratios_78
  5: y_ratios = ratios_87
ENDCASE

x_ratio_value = interpol(x_ratios,x_values,x_position)
y_ratio_value = interpol(y_ratios,y_values,y_position)

if keyword_set(graph) then begin
  CASE x_location_index(0) OF  ;This uses x_box_low as an indication of where the x_position is relative to the wires in order to determine the approriate ratio.
    0: p1 = plot(x_values, x_ratios, XRANGE = [-7.5,-2.5], title='Ratio vs. x from Coulomb')
       
    1: p1 = plot(x_values, x_ratios, XRANGE = [-7.5,-2.5], title='Ratio vs. x from Coulomb')
       
    2: p1 = plot(x_values, x_ratios, XRANGE = [-2.5,2.5], title='Ratio vs. x from Coulomb')
       
    3: p1 = plot(x_values, x_ratios, XRANGE = [-2.5,2.5], title='Ratio vs. x from Coulomb')
       
    4: p1 = plot(x_values, x_ratios, XRANGE = [2.5,7.5], title='Ratio vs. x from Coulomb')
           
    5: p1 = plot(x_values, x_ratios, XRANGE = [2.5,7.5], title='Ratio vs. x from Coulomb')
       
  ENDCASE
  p2 = plot(x_position*[1,1],x_ratio_value*[1,1],symbol='square',/overplot)
endif

if keyword_set(graph) then begin
  CASE y_location_index(0) OF  ;This uses x_box_low as an indication of where the x_position is relative to the wires in order to determine the approriate ratio.
    0: p3 = plot(y_values, y_ratios, XRANGE = [-7.5,-2.5], title='Ratio vs. y from Coulomb')

    1: p3 = plot(y_values, y_ratios, XRANGE = [-7.5,-2.5], title='Ratio vs. y from Coulomb')

    2: p3 = plot(y_values, y_ratios, XRANGE = [-2.5,2.5], title='Ratio vs. y from Coulomb')

    3: p3 = plot(y_values, y_ratios, XRANGE = [-2.5,2.5], title='Ratio vs. y from Coulomb')

    4: p3 = plot(y_values, y_ratios, XRANGE = [2.5,7.5], title='Ratio vs. y from Coulomb')

    5: p3 = plot(y_values, y_ratios, XRANGE = [2.5,7.5], title='Ratio vs. y from Coulomb')

  ENDCASE
  p4 = plot(y_position*[1,1],y_ratio_value*[1,1],symbol='square',/overplot)
endif

delta = 0.001
x_ratio_high = interpol(x_ratios,x_values,x_position+delta)
x_ratio_low  = interpol(x_ratios,x_values,x_position-delta)

y_ratio_high = interpol(y_ratios,y_values,y_position+delta)
y_ratio_low = interpol(y_ratios,y_values,y_position-delta)

drdx = (x_ratio_high - x_ratio_low)/(2.0*delta)

drdy = (y_ratio_high - y_ratio_low)/(2.0*delta)

print,'ratio right here is:'
print,x_ratio_value
print,'drdx [mm^-1]:'
print,drdx

print,'drdy [mm^-1]:'
print,drdy

gradients = [drdx, drdy]

END