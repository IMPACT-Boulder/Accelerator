import pickle
import mysql
import mysql.connector
import numpy as np
from datetime import datetime
import copy

class Session:
    def __init__(self, start, end,minV,maxV):
        
        self.start = start
        self.end = end
        self.duration = end-start   
        self.material = None
        self.dustID = None
        self.experimentID = None
        self.min_V = minV
        self.max_V = maxV
        self.min_mass = -1
        self.max_mass = -1
        self.particle_list = []
        self.quality = 5
        self.performance_factor = 0

"""ADJUST THESE TO THE CORRECT VALUES WHEN RUNNING"""
hostname = "192.168.1.102"
usr = "root"
password = "dust"
db = "ccldas_production"

#Retrieve data from sql server
mydb = mysql.connector.connect(host=hostname, user=usr,\
    passwd=password,database=db,auth_plugin='mysql_native_password')
cursor = mydb.cursor()
cursor.execute("select * from ccldas_production.run_times")
runtimes = cursor.fetchall()
def timeshow(timelist):
    for timestamp in timelist:
        print("%s, %s"%(datetime.fromtimestamp(timestamp[0]/1000).strftime("%X|%m/%d"),datetime.fromtimestamp(timestamp[1]/1000).strftime("%X|%m/%d")),end = "   ")
    print()
#Fetch all the velocity parameter changes, with the timestamp, min, and max
total=0
try:
    with open("temp_data.pkl","rb") as pickle_file:
        #Loaded from the object file temp_data.pkl
        session_list = pickle.load(pickle_file)

        #Establish maps for each experiment mapping to all start and stop times
        exp_to_db = {}
        exp_to_pkl = {}

        #Populating the maps, each with experimentID key to a list of touples, (start, stop) in ms time       
        for run in runtimes:
            if run[2] not in exp_to_db:
                exp_to_db[run[2]] = []
            exp_to_db[run[2]].append((run[0],run[1]))
        for session in session_list:
            if session.experimentID not in exp_to_pkl:
                exp_to_pkl[session.experimentID] = []
            exp_to_pkl[session.experimentID].append((session.start,session.end))


        #A deep copy for the operation
        db_copy = copy.deepcopy(exp_to_db)
        #The span of the runtimes that need to be corrected here
        runtimes_start, runtimes_stop = 1208,2614
        for i in range(runtimes_start,runtimes_stop+1):

            #Manage the key errors
            if i in exp_to_db and i in exp_to_pkl:

                #Setup indices and lists
                db_index = 0 
                pkl_index = 0
                db = exp_to_db[i]
                pkl = exp_to_pkl[i]

                #Sets stop times for each start times, relying on the database values
                for j in range(len(db)-1):
                    #Check if the gap goes over day lines
                    db[j] = (db[j][0],db[j+1][0]-1)

                #Assigns stops from the pkl if they go chronologically
                while db_index < len(db):
                    val = db[db_index]
                    while pkl_index < len(pkl) and pkl[pkl_index][1] < db[db_index][1] and pkl[pkl_index][1] > db[db_index][0]:
                        val = (db[db_index][0],pkl[pkl_index][1])
                        pkl_index += 1

                    db[db_index] = val
                    db_index += 1

                #Prevent for the crossing of dates from start to stop
                for j in range(len(db)):
                    val = db[j]
                    if datetime.fromtimestamp(val[0]/1000).strftime("%d")!=datetime.fromtimestamp(val[1]/1000).strftime("%d"):
                        db[j] = db_copy[i][j]

                #Slap the last pkl onto the db if it makes sense(ish)
                if pkl[-1][1] > db[-1][0] and pkl[-1][1] - db[-1][0] < 8*60*60*1000: db[-1] = (db[-1][0],pkl[-1][1])

                #Update the database, I assume no duplicate start values
                for val in exp_to_db[i]:
                    cursor.execute("update ccldas_production.run_times set stop_timestamp = %d where start_timestamp = %d" %(val[1],val[0]))


except FileNotFoundError:
    print('temp_data.pkl not found')