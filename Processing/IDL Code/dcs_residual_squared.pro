FUNCTION dcs_residual_squared, measurement_array, expected_values_array ;sums the difference between expected and measured squared between two 1D arrays

residual_squared_values = TOTAL((measurement_array-expected_values_array)^2)

return, residual_squared_values

END