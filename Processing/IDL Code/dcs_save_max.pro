PRO dcs_save_max, dcs_maxes, x=x, y=y

fname = "Users\Clavius\Desktop\DCS_Data\dcs_max.csv"

;dcs_maxes = [1,2,3,4,5,6,7,8]

OPENU, lun, FILEPATH(fname, ROOT_DIR=["C:\"]), /GET_LUN, /APPEND

if keyword_set(x) then printf, lun, dcs_maxes(0), ",", dcs_maxes(1), ",", dcs_maxes(2), ",", dcs_maxes(3)


if keyword_set(y) then printf , lun, dcs_maxes(4), ",", dcs_maxes(5), ",", dcs_maxes(6), ",", dcs_maxes(7)
  
FREE_LUN, lun

END