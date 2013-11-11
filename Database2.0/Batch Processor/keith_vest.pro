function keith_vest,x,y1,y2,y4,y3=y3

  !EXCEPT = 0
  DEVICE, DECOMPOSED = 0
  LOADCT, 12, /silent
  DEBUG_MODE = 'No' ;Yes to show plots
  
  pellV = 2.0e6 & pellVstr = string(pellV) ;set pelletron voltage
  data = FLTARR(5) ;set up data array
  
  sy = SMOOTH(y4,10,/EDGE_MIRROR,/NAN)
  offset = mean(sy[0:2000]) ;find the charge using smoothed data, remove offset
  sminvoltage = (MIN(sy,schargepos))
  scharge = ABS((sminvoltage-offset)/1.21e13)
  schargestring = 'Charge =' + STRING(scharge) + ' C'
  
  ;find 3rd, set ch1 and ch2 to zero for all points after 3rd
  minlast = min(sy,minpointlast)
  y1[minpointlast:*] = 0
  y2[minpointlast:*] = 0
  
  dy1 = smooth(deriv(smooth(y1,150,/EDGE_MIRROR,/NAN)),170,/EDGE_MIRROR,/NAN)
  dy2 = smooth(deriv(smooth(y2,150,/EDGE_MIRROR,/NAN)),170,/EDGE_MIRROR,/NAN)
  dy4 = smooth(deriv(smooth(y4,150,/EDGE_MIRROR,/NAN)),170,/EDGE_MIRROR,/NAN)
  
  min1 = min(dy1,minpoint1)
  min2 = min(dy2,minpoint2)
  min4 = min(dy4,minpoint4)
  
  velocity = .6/(x[minpoint2]-x[minpoint1])
  
  ;start conditions for "good" signals
  a = 'ok'
  b = 'ok'
  c = 'ok'
  d = 'ok'
  e = 'ok'
  f = 'ok'
  
  ;make sure derive on ch3 is somewhat symmetric
  deroff = mean(dy4[0:2000])
  symval = -(max(dy4)-deroff)/(min(dy4)+deroff)
  if (symval ge 2.03) or (symval le 0.900) then a = 'bssym'
  
  ;make sure signal is bigger than stddev of derivative
  devdy4 = stddev(dy4)
  maxdy4 = max(dy4)
  mindy4 = min(dy4)
  if (maxdy4 le 5*devdy4) or (mindy4 ge -5*devdy4) then b = 'bssmall'
  
  ;check that charges are all similar
  if stddev([min(dy1),min(dy2),min(dy4)]) ge .0003 then f = 'bsqcomp'
  
  ;make sure last detector is in correct place
  guess = (8.3*(minpoint2-minpoint1)+minpoint2) & guessrange = 1500
  if (guess lt minpoint4-guessrange) or (guess gt minpoint4+guessrange) then e = 'no third'
  
  ;make sure signal points in the right direction
  if (velocity le 0) or (velocity ge 'Infinity') then c = 'too slow'
  
  ;check for doubles on third
  if minpoint4 le n_elements(dy4)-3001 then begin
    if min(dy4[minpoint4+3000:*]) lt -10*stddev(dy4[0:1000]) then d = 'double1'
    if min(dy4[0:minpoint4-2000]) lt -10*stddev(dy4[0:1000]) then d = 'double2'
  endif
  
  ;plot each signal
  if DEBUG_MODE eq 'Yes' then begin
    xrangelow=minpoint1-1000
    ;xrangehigh=minpoint2+1000
    xrangehigh=schargepos+1000
    
    if xrangelow le 0 then xrangelow = minpoint1
    if xrangehigh ge n_elements(x) then xrangehigh = schargepos
    
    Window, 0
    plot, x , y1 + .3 $
      ,yrange = [min(y1)-.15,max(y1)+.4] $
      ,color = 0 $
      ,background = 255 $
      ,title  = 'Dust Accelerator Signal' $
      ,XTITLE = 'Time (s)' $
      ,YTITLE = 'Volts (V)' $
      ,xrange = [x[xrangelow],x[xrangehigh]]
    oplot, x, y2 + .15, color = 207
    oplot, x, y4, color = 100
    oplot, [x[minpoint1],x[minpoint1]],[-sminvoltage*10000,sminvoltage*10000], LINESTYLE = 0, COLOR = 16
    oplot, [x[minpoint2],x[minpoint2]],[-sminvoltage*10000,sminvoltage*10000], LINESTYLE = 0, COLOR = 16
    plots, x[schargepos], sminvoltage, color = 16, psym = 2, symsize = 2
    XYOUTS, 100,115, 'Velocity =' + string(velocity) + 'm/s', COLOR = 0, CHARSIZE = 1.2, /DEVICE
    XYOUTS, 100,100, schargestring,  COLOR = 0, CHARSIZE = 1.2, /DEVICE
    XYOUTS, 400,115, 'shape condition:   ' + a +' ' + b + ' ' + f, COLOR = 0, CHARSIZE = 1.2, /DEVICE
    XYOUTS, 400,100,  'ref condition:     ' + c, COLOR = 0, CHARSIZE = 1.2, /DEVICE
    XYOUTS, 400, 85,  'signal3 condition: ' + e, COLOR = 0, CHARSIZE = 1.2, /DEVICE
    XYOUTS, 400, 70,  'doub condition:    ' + d, COLOR = 0, CHARSIZE = 1.2, /DEVICE
    
    Window,2
    plot,  dy1+ 1.2*max(dy1), yrange = [2.2*min(dy1),2.2*max(dy1)]
    oplot, dy2
    oplot, dy4- 1.2*max(dy1)
    oplot, [guess,guess],[min2*10000,-min2*10000], LINESTYLE = 0, COLOR = 192
    oplot, [minpoint4-guessrange,minpoint4-guessrange],[min2*10000,-min2*10000], LINESTYLE = 0, COLOR = 100
    oplot, [minpoint4+guessrange,minpoint4+guessrange],[min2*10000,-min2*10000], LINESTYLE = 0, COLOR = 100
  endif
  
  
  doub = 0
  if d ne 'ok' then doub = 1
  
  if (a eq 'ok') and (b eq 'ok') and (c eq 'ok') and (f eq 'ok') and (e eq 'ok') then begin
    data[0] = velocity
    data[1] = scharge
    data[2] = 2*PellV*scharge/(velocity^2)
    data[3] = 1
    data[4] = doub
  endif else begin
    data[0] = -1
    data[1] = -1
    data[2] = -1
    data[3] = 0
    data[4] = doub
  endelse
  return,data
end