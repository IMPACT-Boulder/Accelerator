;Author: William Goode
;COULOMB lookup table values are based on wire voltage values normalized to 2.

FUNCTION dcs_normalize_2, maxes ;Normalizes max values to 2

  sum_maxes = TOTAL(maxes)

  norm_two = 2/sum_maxes

  normalized_data = maxes * norm_two

  return, normalized_data ;1D array of normalized values
  
END
