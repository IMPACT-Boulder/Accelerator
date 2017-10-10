;This is an artificially high value hard-coded in to construct
;reasonable error bars in the positioning algorithm.
;In reality, the ratio (of wire signals) for particles *at* the
;location of a wire, would be infinite.  This finite value is put in
;to make the asymptotic behavior for nearby positions behave.
function ratio_on_wire
  return,25000.0
end
