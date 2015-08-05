;converts number to string with the spaces taken out
;keyword sigfigs allows rounding to set number of shown digits
;keyword digits allows padding of integer or long with leading zeroes
FUNCTION s2,number,sigfigs=sigfigs,digits=digits
  outputstring = string(number)
  FOR j=0,n_elements(number)-1 DO begin
     IF keyword_set(sigfigs) THEN BEGIN
        deci = 10.0^sigfigs
        number(j) = round(number(j)*deci,/L64)/deci
     ENDIF
     outputstring(j) = strcompress(string(number(j)),/remove_all)
     IF keyword_set(sigfigs) THEN BEGIN ;how many places after the decimal
        dot_location = strpos(outputstring(j),'.')
        outputstring(j) = strmid(outputstring(j),0,dot_location+sigfigs+1)
     ENDIF
     IF keyword_set(digits) THEN BEGIN ;pad integers with zeroes
        numberlength = fix(1+alog10(number(j)))
        IF digits GT numberlength THEN BEGIN
           FOR k=0,digits-numberlength-1 DO outputstring(j)='0'+outputstring(j)
        ENDIF
        IF number(j) EQ 0 THEN BEGIN
           outputstring(j)=strmid(outputstring(j),1,strlen(outputstring(j))-1)
        ENDIF
     ENDIF
  ENDFOR 
  return,outputstring
END
