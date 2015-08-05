
function convol_fft_andrew, signal, kernel

  COMPILE_OPT IDL2
  
  s1 = n_elements(signal)
  s2 = n_elements(kernel)
  
  ; FFT size should be a power of 2 for max speed
  size = 2^CEIL(alog10(s1+s2-1)/alog10(2))

  ; Zero-pad signal and kernel
  in1 = fltarr(size)
  in2 = fltarr(size)
  in1[0:s1-1] = signal
  in2[0:s2-1] = kernel
  
  ; Extract the convolution and set the overlapping regions to 0 (like IDL)
  out = fft(in1,-1)
  out *= fft(in2,-1)
  out = real_part(fft(out, 1))
  out *= size
  out = out[(s2/2)+1:(s2/2)+s1]
  out *= -1
  out[0:s2/2] = 0
  out[s1-1-(s2/2):s1-1] = 0
  
  return, out
  
end