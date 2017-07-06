;;Author: William Goode

;;COULOMB data values are based on wire voltage values normalized to 2 (i.e. each wire plane is normalized to 1)

FUNCTION dcs_normalize_2, maxes ;Normalizes max values to 2

  first_plane_maxes = maxes[0:3]
  second_plane_maxes = maxes[4:7]
  
  ;Take negtive values and set them to 0 since they are likely random noise
  first_plane_maxes(where(first_plane_maxes le 0.00)) = 0
  second_plane_maxes(where(second_plane_maxes le 0.00)) = 0
  
  first_plane_sum = TOTAL(first_plane_maxes)
  first_plane_norm = 1/first_plane_sum
  normalized_first_plane = first_plane_maxes * first_plane_norm
  
  second_plane_sum = TOTAL(second_plane_maxes)
  second_plane_norm = 1/second_plane_sum
  normalized_second_plane = second_plane_maxes * second_plane_norm
  
  normalized_data = [normalized_first_plane, normalized_second_plane]
  
  
  return, normalized_data ;1D array of normalized values
  
END
