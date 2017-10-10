;This calculates the absolute distance to the nearest wire.
FUNCTION abs_distance_to_wire, x_position

  x_wire = [-7.5, -2.5, 2.5, 7.5]
  dist_to_wires = abs(x_position-x_wire)
  min_distance = min(dist_to_wires)

  return, min_distance
  
END
