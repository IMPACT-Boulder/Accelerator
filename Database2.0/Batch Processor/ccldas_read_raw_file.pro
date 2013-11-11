;+
; NAME:
; ccldas_read_raw_file
;
; PURPOSE:
; This function opens and reads an .hdf5 raw signal file generated by the CCLDAS database system.
;
;
; CALLING SEQUENCE:
; signals = ccldas_read_raw_file('filename',info=info)
;
; INPUTS:
; filename: A string with the location of the hdf5 file to be opened.
;
; info (kw, optional):  A struct with some metadata describing the file
;     info.timestamp:       UNIX timestamp with milliseconds since Jan 1 1970
;     info.version_number:  Integer file version.  Currently only "1" supported.
;
; OUTPUTS:
; ccldas_file_open returns a signals struct of all signals structs.
; Populated signal structs each have signal_metadata, dt,hardware_id,offset,signal_length, and waveform entires. 
; If no detector is present for a given signal, the corrisponding entry in the signals struct will return  
; a 'No signal from (DETECTOR NAME).' string instead.

; OUTPUTS:
;   
;    A SIGNALS struct with the following fields:
;   .first_detector       Waveform struct (see below) or -1 if not in file
;   .second_detector      Waveform struct (see below) or -1 if not in file
;   .third_detector       Waveform struct (see below) or -1 if not in file
;   .psu                  Waveform struct (see below) or -1 if not in file
;   .lecroy_ch1           Waveform struct (see below) or -1 if not in file
;   .lecroy_ch2           Waveform struct (see below) or -1 if not in file
;   .lecroy_ch3           Waveform struct (see below) or -1 if not in file
;   .lecroy_ch4           Waveform struct (see below) or -1 if not in file
;    
; WAVEFORM STRUCT FIELDS:
; 
;   .waveform       Array of single-precision floats with trace data
;   .dt             Time spacing of waveform points in seconds
;   .offset         Time value of first waveform point, in seconds
;   .hardware_id    Identifies the signal source: 1-6 for CSAs, 0 for other
;
; PROCEDURE:
; Straightforward. A syntax example would be: t=ccldas_read_raw_file('FILE PATH',info=info)
;
; MODIFICATION HISTORY:
; Written August 2012 by Spenser Burrows
;-

function ccldas_read_raw_file,filename,info=info
  
  ; Argument validation
  ON_ERROR, 2
  
  ;definitions 
  file_id=H5F_OPEN(filename);open file reference
  shot_group_id = H5G_OPEN(file_id,'/')
  nsignals = H5G_GET_NMEMBERS(file_id,'/')
  detector_name=['first_detector', $
                'second_detector', $
                'third_detector', $
                'lecroy_ch1', $
                'lecroy_ch2', $
                'lecroy_ch3', $ 
                'lecroy_ch4', $
                'psu']
  info={timestamp:long64(0),version_number:long(0)}
  info_names=STRLOWCASE(tag_names(info))
  
    ; intitialize detector channels to -1  
    first_detector = -1
    second_detector = -1
    third_detector = -1
    lecroy_ch1 = -1
    lecroy_ch2 = -1
    lecroy_ch3 = -1
    lecroy_ch4 = -1
    psu = -1
        
      ;get file info
      for i=0,1 do begin
        attribute_id=H5A_OPEN_NAME(shot_group_id,info_names[i])
        info.(i)=H5A_READ(attribute_id)
        H5A_close,attribute_id
      endfor
      
      ;make sure you're looking at an actual file
      IF H5I_GET_TYPE(file_id) NE "FILE" THEN BEGIN
         MESSAGE, "Invalid file_id"
      ENDIF
  
        ; Get all the signals:
        ; Loop over each dataset in the group, and:
        ; (1) dump its attributes into signal_meta
        ; (2) dump the raw data into a waveform
        ; (3) place it in the correct variable
              
        FOR i=0,nsignals-1 DO BEGIN 
          
          dataset_id = STRLOWCASE(H5G_GET_MEMBER_NAME(file_id,'/',i))
          signal_id = H5D_OPEN(shot_group_id, dataset_id)
          dimension = H5D_GET_STORAGE_SIZE(signal_id)
          print,dimension, 'test'
          IF dimension ne 0 then begin
          ;print,dataset_id ;sanity check to make sure all detectors are getting looked at
          signal_metadata={signal_metadata, dt:float(0),hardware_id:long(0),offset:float(0),signal_length:long(0)} 
          signal_metadata_length=n_tags(signal_metadata); number of metadata entries
        
              for j=0,signal_metadata_length-1 DO BEGIN ;grabs signal metadata
              idl_signal_names=STRLOWCASE(tag_names(signal_metadata))
              atribute_id= H5A_OPEN_NAME(signal_id,idl_signal_names[j])
              signal_metadata.(j)=H5A_READ(atribute_id) 
               H5A_close,atribute_id
               ;print,idl_signal_names(j),' value ',signal_metadata.(j),' stored as ', idl_signal_names(j); metadata sanity check
              endfor
              j=0
              
              
              waveform=H5D_READ(signal_id)
              
              
        endif else begin
        waveform=  FLTARR(2,2)
        endelse  
        sm = signal_metadata
        
          H5D_CLOSE,signal_id
              
                  ;populate detector structs 
                  CASE dataset_id OF
                    'first_detector':   first_detector =  { waveform: waveform, dt: sm.dt, offset: sm.offset, signal_length: sm.signal_length, hardware_id: sm.hardware_id}
                    'second_detector':  second_detector = { waveform: waveform, dt: sm.dt, offset: sm.offset, signal_length: sm.signal_length, hardware_id: sm.hardware_id}
                    'third_detector':   third_detector =  { waveform: waveform, dt: sm.dt, offset: sm.offset, signal_length: sm.signal_length, hardware_id: sm.hardware_id}
                    'psu':              psu =             { waveform: waveform, dt: sm.dt, offset: sm.offset, signal_length: sm.signal_length, hardware_id: sm.hardware_id}
                    'lecroy_ch1':       lecroy_ch1 =      { waveform: waveform, dt: sm.dt, offset: sm.offset, signal_length: sm.signal_length, hardware_id: sm.hardware_id}
                    'lecroy_ch2':       lecroy_ch2 =      { waveform: waveform, dt: sm.dt, offset: sm.offset, signal_length: sm.signal_length, hardware_id: sm.hardware_id}
                    'lecroy_ch3':       lecroy_ch3 =      { waveform: waveform, dt: sm.dt, offset: sm.offset, signal_length: sm.signal_length, hardware_id: sm.hardware_id}
                    'lecroy_ch4':       lecroy_ch4 =      { waveform: waveform, dt: sm.dt, offset: sm.offset, signal_length: sm.signal_length, hardware_id: sm.hardware_id}
                  ENDCASE

        endfor
          
   H5G_CLOSE,shot_group_id 
   H5F_CLOSE,file_id ; End loop over datasets in the signal group
    
  
  signals=CREATE_STRUCT('first_detector',first_detector, $
                        'second_detector',second_detector, $
                        'third_detector',third_detector, $
                        'lecroy_ch1',lecroy_ch1, $ 
                        'lecroy_ch2',lecroy_ch2, $ 
                        'lecroy_ch3',lecroy_ch3, $ 
                        'lecroy_ch4',lecroy_ch4, $ 
                        'psu', psu, name=signals)
                        
  ;print,'Returning all signals...' ;sanity check
  return,signals

END