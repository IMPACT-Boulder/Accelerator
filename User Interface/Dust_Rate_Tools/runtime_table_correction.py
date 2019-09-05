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
    def __str__(self):
        return "Session from %s to %s \nDuration: %.1f min material: %s, %.1f-%.1fkm/s %d %d\nDustID: %s \
ExperimentID: %s particles: %d Quality: %d\n------------------------------------------\
" %(datetime.fromtimestamp(self.start/1000).strftime("%c"),\
            datetime.fromtimestamp(self.end/1000).strftime("%c"),\
            self.duration/1000/60,self.material,self.min_V,self.max_V,self.start,self.end,\
            self.dustID,self.experimentID,len(self.particle_list),self.quality)
def timeshow(timelist):
    for timestamp in timelist:
        print("%s, %s"%(datetime.fromtimestamp(timestamp[0]/1000).strftime("%X|%m/%d"),datetime.fromtimestamp(timestamp[1]/1000).strftime("%X|%m/%d")),end = "   ")

    print()

hostname = "localhost"
usr = "root"
password = "dust"
db = "ccldas_production"
mydb = mysql.connector.connect(host=hostname, user=usr,\
    passwd=password,database=db,auth_plugin='mysql_native_password')
cursor = mydb.cursor()
cursor.execute("select * from ccldas_production.run_times")
runtimes = cursor.fetchall()
cursor.execute("")

#Fetch all the velocity parameter changes, with the timestamp, min, and max
total=0
try:
    with open("temp_data.pkl","rb") as pickle_file:
        session_list = pickle.load(pickle_file)

        exp_to_db = {}
        exp_to_pkl = {}
        pkldiff = []
        dbdiff = []
        for run in runtimes:
            if run[2] not in exp_to_db:
                exp_to_db[run[2]] = []
               
            exp_to_db[run[2]].append((run[0],run[1]))
        for session in session_list:
            if session.experimentID not in exp_to_pkl:
                exp_to_pkl[session.experimentID] = []
            exp_to_pkl[session.experimentID].append((session.start,session.end))

        for key in exp_to_db:
            if key in exp_to_pkl:
                pkldiff.append(len(exp_to_pkl[key]))
                dbdiff.append(len(exp_to_db[key]))

        prev_time = 0
        new_time =0
        prob =0 
        bad_time = 0
        db_copy = copy.deepcopy(exp_to_db)
        for i in range(320,1208):
            
            if i in exp_to_db and i in exp_to_pkl:
                db_index = 0 
                pkl_index = 0
                db = exp_to_db[i]
                pkl = exp_to_pkl[i]
                for val in db:
                    prev_time += val[1]-val[0]

                #Cascades the stop times
                for j in range(len(db)-1):
                    if datetime.fromtimestamp(db[j+1][0]/1000).strftime("%d")==datetime.fromtimestamp(db[j][1]/1000).strftime("%d"):
                        db[j] = (db[j][0],db[j+1][0]-1)
                    else:
                        prob -=1
                        timeshow(exp_to_db[i])
                if db[-1][0] > pkl[-1][1]:
                    prob -=1
                #Assigns stops from the pkl if they go chronologically
                while db_index < len(db):
                    val = db[db_index]
                    while pkl_index < len(pkl) and pkl[pkl_index][1] < db[db_index][1] and pkl[pkl_index][1] > db[db_index][0]:
                        val = (db[db_index][0],pkl[pkl_index][1])

                        pkl_index += 1


    
                    db[db_index] = val
                    new_time += val[1]-val[0]
                    db_index += 1

                #Slap the last pkl onto the db if it makes sense(ish)
                if pkl[-1][1] > db[-1][0] and pkl[-1][1] - db[-1][0] < 8*60*60*1000: db[-1] = (db[-1][0],pkl[-1][1])

        
                # if abs( sum(val[1]-val[0] for val in exp_to_db[i]) - sum(val[1]-val[0] for val in db_copy[i])) >= 15*60*1000:
                for val in exp_to_db[i]:
                    if val[0]==val[1]:

                # if  sum(abs(exp_to_db[i][j][1] - db_copy[i][j][1]) + abs(exp_to_db[i][j][0] - db_copy[i][j][0]) for j in range(len(exp_to_db[i])))/1000/60 > 120:
                        prob +=1
                        print(i)
                        print(sum(abs(exp_to_db[i][j][1] - db_copy[i][j][1]) + abs(exp_to_db[i][j][0] - db_copy[i][j][0]) for j in range(len(exp_to_db[i])))/1000/60)

                        timeshow(db_copy[i])
                        timeshow(exp_to_pkl[i])
                        timeshow(exp_to_db[i])
                        print("\n")
                for val in exp_to_db[i]:
                    cursor.execute("update ccldas_production.runtimes set stop_timestamp = %d where start_timestamp = %d" %(val[1],val[0]))


        print(prob)
        print(prev_time/1000/60/60, new_time/1000/60/60)
        print(bad_time/1000/60/60)
        new_runtimes = []
        for i in exp_to_db:
            for val in exp_to_db[i]:
                # print("%d,%d,%d" %(val[0],val[1],i))
                # new_runtimes.append("%d,%d,%d" %(val[0],val[1],i))
                new_runtimes.append( (val[0],val[1],i))
        print(len(runtimes),len(new_runtimes))

        # for i in range(len(runtimes)):
        #     # print(runtimes[i],new_runtimes[i])
        #     print("%10f" %((new_runtimes[i][1]-runtimes[i][1])/1000/60/60))

except FileNotFoundError:
    print('reeee')