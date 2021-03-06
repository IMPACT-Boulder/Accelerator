;+
; NAME:
; ccldas_get_nshots
;
; PURPOSE:
; Returns the number of dust events in the hdf5 file.
;
; CALLING SEQUENCE:
; Result = ccldas_get_nshots(file_id)
;
; INPUTS:
; file_id: An hdf5 file reference generated by ccldas_file_open.
;
; OUTPUTS:
; Returns the (integer) number of dust events
;
; MODIFICATION HISTORY:
; Written August 2012 by Spenser Burrows
;-


function ccldas_get_nshots,file_id

  RETURN, H5G_GET_NMEMBERS(file_id,'/')
  
END