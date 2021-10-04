#h5_save.py
#zach attack
#2-26-21

#opens a range of hdf5 files from the server, mounted to X:, and plots them.
#plots are saved to png format in the specified save folder.
#it is important not to change the 'r' in the file call, as anything else may
#allow you to accidentally alter the data on the server.

import numpy as np
import h5py 
import matplotlib.pyplot as plt

save_path = 'C:/Users/dusty/Desktop/hdf5 files/' #folder to save png files to
#path = "X:/5641/" #set to containing folder
waveforms_volume = 'X:/'

file_list = np.arange(5495450,5496449) #arange(x,n) will plot files x through n-1
first_shot = 0 #set to zero to save files as id_dust_event. set to file_list[0] to record shot number of set


for i in file_list:
    folder_name = str(int(str(i)[:4])) #gets leading digits of filename to get folder name
    path = waveforms_volume + folder_name + '/'
    filepath = path+str(i)+'.hdf5' #get full filepath
    shot_number = i-first_shot
    print(filepath)
    

    ##########################
    #### WARNING ######## WARNING ######## WARNING ######## WARNING ####
    # do not change the 'r' to anything else!
    f = h5py.File(filepath, 'r') #'r' is for read only. if you change 'r' to anything else,
                                 #zach reserves the right to assassinate you.
    #### WARNING ######## WARNING ######## WARNING ######## WARNING ####


    hdf_contents=list(f.keys())
    print(hdf_contents) #list contents
    

    first_det = f[u'first_detector'] #read contents to variables
    second_det = f[u'second_detector']
    third_det = f[u'third_detector']
    psu = f[u'psu']

    
        
    d1=first_det[0:] #dunno why, but a necessary step to avoid cryptic errors.
    d2=second_det[0:]
    d3=third_det[0:]
    psu=psu[0:]

    dt = first_det.attrs['dt'] #read hdf5 metadata for time axis
    x = dt*np.arange(len(d1))

    plt.figure(figsize=(18,10)) #set plot size to make easier to read
    

    plt.subplot(4,1,1)#4 panel plot, 1st column, row 1
    plt.title('file '+str(i)+', shot #'+str(i-file_list[0]))
    plt.plot(x,d1,color='lightsteelblue')
    
    plt.subplot(4,1,2)#4 panel plot, 1st column, row 2
    plt.plot(x,d2,color='b')

    plt.subplot(4,1,3)#4 panel plot, 1st column, row 3
    plt.plot(x,psu,color='r')

    plt.subplot(4,1,4)#4 panel plot, 1st column, row 4
    plt.plot(x,d3,color='y')

    #plt.show()


    plt.savefig(save_path+str(shot_number)+'.png')
    plt.clf()