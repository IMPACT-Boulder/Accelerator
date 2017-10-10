;derivative of ratio with respect to position
FUNCTION drdp, x_position, y_position, x_row, y_row, verbose=verbose

 ;; if keyword_set(verbose) then begin
     ;;old version, which first constructs the full ratios plot, then
     ;;takes the derivative.  This is a problem at the crossovers, where
     ;;the derivative incorrectly goes to zero.
  ;;   reconstruct_all_the_ratios,row,x_values,x_ratios
     ;Get the map of all the drdx values, then interpolate
  ;;  drdx_coarse_oldmethod = abs(deriv(x_values,x_ratios))
  ;;   drdx_oldmethod = interpol(drdx_coarse_oldmethod,x_values,x_position)
  ;;endif


  ;restore,'/Users/williamgoode/dcs_combined_wire_voltages.sav'
  ;restore,'dcs_combined_wire_voltages.sav'
  restore, '\Users\Clavius\Desktop\Accelerator\Processing\IDL Code\dcs_combined_wire_voltages.sav'

  x_values = dcs_combined_wire_voltages[*,x_row,0]
  x_ratios = 0.0*x_values       ;just to initialize the array with the correct dimensions
  
  y_values = dcs_combined_wire_voltages[y_row,*,1]
  ;y_values = dcs_combined_wire_voltages[*,row,1]
  y_ratios = 0.0*y_values       ;just to initialize the array with the correct dimensions

  wire_1_values = dcs_combined_wire_voltages[*,x_row,2] ; 1x49 array of normalized wire values corresponding to x position by index
  wire_2_values = dcs_combined_wire_voltages[*,x_row,3]
  wire_3_values = dcs_combined_wire_voltages[*,x_row,4]
  wire_4_values = dcs_combined_wire_voltages[*,x_row,5]
  
  wire_5_values = transpose(dcs_combined_wire_voltages[y_row,*,6]) ; 1x49 array of normalized wire values corresponding to x position by index
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
  
  wire_5_values[where(wire_5_values eq 0)] = value_on_wire
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

  ratios_12(9) = ratio_on_wire() ;location of first wire
  ratios_21(19) = ratio_on_wire() ;location of second wire
  ratios_23(19) = ratio_on_wire() ;location of second wire
  ratios_32(29) = ratio_on_wire() ;location of third wire
  ratios_34(29) = ratio_on_wire() ;location of third wire
  ratios_43(39) = ratio_on_wire() ;location of fourth wire
  
  ratios_56( 9) = ratio_on_wire() ;location of first wire
  ratios_65(19) = ratio_on_wire() ;location of second wire
  ratios_67(19) = ratio_on_wire() ;location of second wire
  ratios_76(29) = ratio_on_wire() ;location of third wire
  ratios_78(29) = ratio_on_wire() ;location of third wire
  ratios_87(39) = ratio_on_wire() ;location of fourth wire
  

  drdx_coarse_12 = abs(deriv(x_values,ratios_12))
  drdx_coarse_21 = abs(deriv(x_values,ratios_21))
  drdx_coarse_23 = abs(deriv(x_values,ratios_23))
  drdx_coarse_32 = abs(deriv(x_values,ratios_32))
  drdx_coarse_34 = abs(deriv(x_values,ratios_34))
  drdx_coarse_43 = abs(deriv(x_values,ratios_43))
  
  drdy_coarse_56 = abs(deriv(x_values,ratios_56))
  drdy_coarse_65 = abs(deriv(x_values,ratios_65))
  drdy_coarse_67 = abs(deriv(x_values,ratios_67))
  drdy_coarse_76 = abs(deriv(x_values,ratios_76))
  drdy_coarse_78 = abs(deriv(x_values,ratios_78))
  drdy_coarse_87 = abs(deriv(x_values,ratios_87))

  drdx_coarse = 0.0*drdx_coarse_12 ;just to make the empty array
  drdy_coarse = 0.0*drdy_coarse_56 ;just to make the empty array

  drdx_coarse[0 :14] = abs(drdx_coarse_12[0 :14])
  drdx_coarse[14:19] = abs(drdx_coarse_21[14:19])
  drdx_coarse[19:24] = abs(drdx_coarse_23[19:24])
  drdx_coarse[24:29] = abs(drdx_coarse_32[24:29])
  drdx_coarse[29:34] = abs(drdx_coarse_34[29:34])
  drdx_coarse[34:48] = abs(drdx_coarse_43[34:48])
  
  drdy_coarse[0 :14] = abs(drdy_coarse_56[0 :14])
  drdy_coarse[14:19] = abs(drdy_coarse_65[14:19])
  drdy_coarse[19:24] = abs(drdy_coarse_67[19:24])
  drdy_coarse[24:29] = abs(drdy_coarse_76[24:29])
  drdy_coarse[29:34] = abs(drdy_coarse_78[29:34])
  drdy_coarse[34:48] = abs(drdy_coarse_87[34:48])

  drdx = interpol(drdx_coarse,x_values,x_position)
  drdy = interpol(drdy_coarse,y_values,y_position)


  if keyword_set(verbose) then begin
     !p.multi=[0,1,3]
     window,0,xsize=1400,ysize=800
     cs = 2.0
     yr=[1.0e-2,5.0e4]

     plot,x_values,drdx_coarse_oldmethod,psym=-6,/xst,charsize=cs,/ylog,title='drdx old method',yrange=yr,/yst
     plot,x_values,drdx_coarse_12       ,psym=-6,/xst,charsize=cs,/ylog,title='drdx 12',yrange=yr,/yst
     plot,x_values,drdx_coarse          ,psym=-6,/xst,charsize=cs,/ylog,title='drdx combined',yrange=yr,/yst
     result=get_kbrd()
     plot,x_values,drdx_coarse_oldmethod,psym=-6,/xst,charsize=cs,/ylog,title='drdx old method',yrange=yr,/yst
     plot,x_values,drdx_coarse_21       ,psym=-6,/xst,charsize=cs,/ylog,title='drdx 21',yrange=yr,/yst
     plot,x_values,drdx_coarse          ,psym=-6,/xst,charsize=cs,/ylog,title='drdx combined',yrange=yr,/yst
     result=get_kbrd()
     plot,x_values,drdx_coarse_oldmethod,psym=-6,/xst,charsize=cs,/ylog,title='drdx old method',yrange=yr,/yst
     plot,x_values,drdx_coarse_23       ,psym=-6,/xst,charsize=cs,/ylog,title='drdx 23',yrange=yr,/yst
     plot,x_values,drdx_coarse          ,psym=-6,/xst,charsize=cs,/ylog,title='drdx combined',yrange=yr,/yst
     result=get_kbrd()
     plot,x_values,drdx_coarse_oldmethod,psym=-6,/xst,charsize=cs,/ylog,title='drdx old method',yrange=yr,/yst
     plot,x_values,drdx_coarse_32       ,psym=-6,/xst,charsize=cs,/ylog,title='drdx 32',yrange=yr,/yst
     plot,x_values,drdx_coarse          ,psym=-6,/xst,charsize=cs,/ylog,title='drdx combined',yrange=yr,/yst
     result=get_kbrd()
     plot,x_values,drdx_coarse_oldmethod,psym=-6,/xst,charsize=cs,/ylog,title='drdx old method',yrange=yr,/yst
     plot,x_values,drdx_coarse_34       ,psym=-6,/xst,charsize=cs,/ylog,title='drdx 34',yrange=yr,/yst
     plot,x_values,drdx_coarse          ,psym=-6,/xst,charsize=cs,/ylog,title='drdx combined',yrange=yr,/yst
     result=get_kbrd()
     plot,x_values,drdx_coarse_oldmethod,psym=-6,/xst,charsize=cs,/ylog,title='drdx old method',yrange=yr,/yst
     plot,x_values,drdx_coarse_43       ,psym=-6,/xst,charsize=cs,/ylog,title='drdx 43',yrange=yr,/yst
     plot,x_values,drdx_coarse          ,psym=-6,/xst,charsize=cs,/ylog,title='drdx combined',yrange=yr,/yst
     result=get_kbrd()

  endif



gradients = [drdx, drdy]



  return, gradients                  ;[mm^-1]

END
