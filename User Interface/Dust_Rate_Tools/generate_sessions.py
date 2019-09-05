"""
generate_sessions.py      Nathan Schneider     July 18 2019
The purpose of this program is to facilitate the calculation of dust detection rates
for various parameters by generating a list of active sessions from the data. This
allows for the calculation of tagged runtime, which is currently not supported by the
database. This program pulls the necessary data from the mySQL production server,
segments it into sessions, and classifies each session with the following characteristics:
Start and stop times, in milliseconds as a unix timestamp, duration, the name of the dust
material being shot, the dust type ID, the experiment ID, the range of selected velocities, 
and a session quality.
SESSION QUALITIES:
1: Maintenance session
2: Low number of particle detections <10
3: Low runtime < 20 min
4: Standard sessions
5: High dust event count (productive session)
IMPORTANT: This code requires python 3.X, the appopriate version of the mySQL Python Connector for Python 3.X,
along with the matplotlib python package. These both have windows installers or can be installed on linux through pip.
See README.md for more information
"""

import mysql
import mysql.connector
from datetime import datetime
import tkinter
import matplotlib.pyplot as plt
import pickle
import time
import sys


#The gap size referes to the segmentation of the dust event timeline into groups where the spacing between two events
# is >= to the gap size. 
gap_size = 5*60*1000

#Useful data starts after 2013, or 1380573080182 in ms time.
data_start = 1380573080182


#The experiment ID and quality for the maintenance sessions
maintenance_quality =1
maintenance_id = 9

#Low count quality and limit
low_count_quality = 2
low_count_quality_count = 10

#Low runtime sessions with this quality, and a 20 min limit in ms
low_time_quality = 3
low_time_quality_time = 20*60*1000

#Quality and counts for high quality
default_quality = 4
high_count_quality = 5
high_count_quality_count = 300


#The session class, used as useful storage class for session related data
#A list of these will be saved and loaded for use in the rate analysis
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
        self.performance_factor = 1

    #Debugging to_string method
    def __str__(self):
        return "Session from %s to %s \nDuration: %.1f min material: %s, %.1f-%.1fkm/s %d %d\nDustID: %s \
ExperimentID: %s particles: %d Quality: %d\n------------------------------------------\
" %(datetime.fromtimestamp(self.start/1000).strftime("%c"),\
            datetime.fromtimestamp(self.end/1000).strftime("%c"),\
            self.duration/1000/60,self.material,self.min_V,self.max_V,self.start,self.end,\
            self.dustID,self.experimentID,len(self.particle_list),self.quality)


#Takes the list of materials and batches, and prints the delimited structure to stdout for the VI to use
def print_dust_types(dust_list):
    dust_map = {}
    for dust in dust_list:
        if dust[1] not in dust_map:
            dust_map[dust[1]] = [(-1,"All")]
        dust_map[dust[1]].append((dust[0],dust[2].strip().replace("\n","")))
    
    for dust in dust_map:
        print(dust,end="{")
        for batch in dust_map[dust]:
            print(" %s|%s"%(batch[0],batch[1]),end="`",flush=True)
        print("}",end = "")   

#Takes the list of groups and experiments, and prints the delimited structure to stdout for the VI to use
def print_experiment_comments(experiment_list,group_list):
    group_map = {}
    for group in group_list:
        group_map[group[0]] = group[1]
    group_to_experiment_list = {}
    for experiment in experiment_list:
        if experiment[1] not in group_to_experiment_list:
            group_to_experiment_list[experiment[1]] = []
        group_to_experiment_list[experiment[1]].append("%d|%d|%s"\
             %(experiment[0],experiment[2],str(experiment[3]).replace("\n","")))
    for group in group_to_experiment_list:
        print(group_map[group],end = "{")
        for experiment in group_to_experiment_list[group]:
            print(experiment,end = "`")
        print("}",end = "")    


#Rate analyzer class is the basis of this program, and it utilizes the data availability of object oriented programming
# to pass multiple lists to multiple methods. It takes the mySQL database login info to run
class Rate_analyzer:
    def __init__(self,hostname, user, password, database,error_code):
        start_time = time.time()

        #Pulls the data from local files and the SQL server
        self.pull_data(hostname,user, password, database,error_code)

        #Groups the particles by splitting them in groups where there are gaps
        self.group_particles()
        
        #Split these sessions by gaps where the pelletron is not firing
        self.frequency_segment()
        #Split the sessions along the experiment ID changes, also give each session the epxeriment ID 
        # at the time
        self.experiment_tag_segment()

    
        #Split the sessions along the velocity range changes, also give each session the velocity paramters
        # at the time
        self.velocity_tag_segment()

        #Use the data stored in each dust event to tag the session with the dustID and material
        self.particle_tag()

        #Write the data to a local file, allowing the rate_results.py to calculate only the results, not pull
        # and calculate all the data as in this program. 
        self.write_data()
        for s in self.session_list:
            if s.experimentID > 1145 and s.experimentID < 1155:
                print(s,file = sys.stderr)

        #A few debugging statements
        print("Total runtime: %2f hours" %(sum(s.duration for s in self.session_list)/1000/60/60),file = sys.stderr)
        print("Total sessions: ",len(self.session_list),file = sys.stderr)
        print("Valid: %d Empty: %d" %(len(self.valid_sessions),len(self.empty_sessions)),file = sys.stderr)
        print("Valid time: %.2f Empty time: %.2f" %(sum(s.duration for s in self.valid_sessions)/1000/60/60,\
            sum(s.duration for s in self.empty_sessions)/1000/60/60),file = sys.stderr)
        print("Total Particles: %d" %(sum(len(s.particle_list) for s in self.valid_sessions)),file = sys.stderr)
        print("Time to calculate: %.2fs" %(time.time()-start_time),file = sys.stderr)


        exps = [s.experimentID for s in self.session_list if s.experimentID >= 320 and s.experimentID <=1208]
        print(len(list(set(exps))), file = sys.stderr)
        print(sum(s.duration for s in self.session_list if s.experimentID < 1200)/1000/60/60,file = sys.stderr)
    # pull_data takes the login credentials for the database and populates the important input fields of 
    # the rate analyzer class.
    # The data is retrieved as a list of tuples, such as (integer, float, float, integer) in the case of one
    # particle
    def pull_data(self,hostname, usr, password, db,error_code):

        #Debugging timer
        start_time = time.time()

        #Server connection
        mydb = mysql.connector.connect(host=hostname, user=usr,\
            passwd=password,database=db,auth_plugin='mysql_native_password')
        cursor = mydb.cursor()
        if error_code!= 25: exit(25)
        #Fetch all the velocity parameter changes, with the timestamp, min, and max
        cursor.execute("select integer_timestamp, velocity_max, \
        velocity_min,mass_max, mass_min from psu order by integer_timestamp ASC")
        self.velocities = cursor.fetchall()

        #Fetch a table of the source setting frequencies, along with the current and next timestamp
        # This allows us to consider the time between a frequency = 0 and the next timestamp dead time
        cursor.execute("SELECT integer_timestamp,LEAD(integer_timestamp) over \
            (order by integer_timestamp) as next,frequency FROM ccldas_production.source_settings\
                  order by integer_timestamp asc")
        frequencies = cursor.fetchall()
        #frequency_gaps stores the multiple gaps in the active timeline
        self.frequency_gaps = []
        for i in range(len(frequencies)-1):
            f = frequencies[i]
            if f[2]==0: 
                self.frequency_gaps.append(f)
                #self.frequency_gaps.append(frequencies[i+1])


        #Fetch all the experiment changes with their timestamps
        cursor.execute("SELECT integer_timestamp,id_experiment_settings,id_groups\
        FROM ccldas_production.experiment_settings")
        self.experiments = cursor.fetchall()

        #The dust event captures an id_dust_info, which references a dust type, which references a dust materials
        #two maps/dictionaries were used to keep this mapping
        cursor.execute("SELECT id_dust_info,dust_type \
        FROM ccldas_production.dust_info")
        dust_info = cursor.fetchall()

        #These maps map a dust ID to a dust type, and a dust type to a dust name
        cursor.execute("SELECT id_dust_type,dust_name \
        FROM ccldas_production.dust_type")
        dust_type = cursor.fetchall()

        self.info_to_type = {}
        for d in dust_info:
            self.info_to_type[d[0]] = d[1]
        self.type_to_name = {}
        for d in dust_type:
            self.type_to_name[d[0]] = d[1]   

        #The dust comments retreive the comments for a given dust ID
        cursor.execute("SELECT id_dust_type,dust_name,comments \
        FROM ccldas_production.dust_type")
        dust_type_comments = cursor.fetchall()
        print_dust_types(dust_type_comments)
        #Delimiter between materials and experiements
        print("@",end = "")
        #Pull the experiment data for the VI dropdown menus
        cursor.execute("SELECT id_experiment_settings,id_groups,\
            integer_timestamp,tag FROM ccldas_production.experiment_settings;")
        experiment_comments = cursor.fetchall()
        cursor.execute("SELECT id_groups,group_names FROM ccldas_production.groups;")
        group_list = cursor.fetchall()
        print_experiment_comments(experiment_comments,group_list)

        #Retrieving all the dust events is rather time-consuming, so a local csv is stored and updated
        # each time this program is run. 
        self.particles = []
        try:
            #If the the file exists
            with open('particles.csv', 'r') as particle_file:
                print("Fetching particles locally",flush= True,file = sys.stderr)
                #read it into memory
                for line in particle_file:
                    vals = line.split(",")
                    part = (int(vals[0]),int(vals[1]),float(vals[2]),int(vals[3]),float(vals[4]))
                    self.particles.append(part)
                # retrive any new particles from the database afte the last known timestamp
                query = "SELECT integer_timestamp, id_dust_info,velocity,estimate_quality,mass\
                FROM ccldas_production.dust_event WHERE (integer_timestamp >%d and velocity <= 100000 \
                AND velocity >= 0) ORDER BY integer_timestamp ASC" % (self.particles[-1][0])
                cursor.execute(query)
                for particle in cursor.fetchall():
                    self.particles.append(particle)

        #If the file does not exist
        except FileNotFoundError:
            print("Fetching particles by web",flush= True,file = sys.stderr)
            #pull all the data from the database
            query = "SELECT integer_timestamp, id_dust_info,velocity,estimate_quality,mass\
            FROM ccldas_production.dust_event WHERE ( velocity <= 100000 \
            AND velocity >= 0) ORDER BY integer_timestamp ASC"
            cursor.execute(query)
            self.particles = cursor.fetchall()
        
        #Write the data to the file in csv format
        particle_file = open("particles.csv","w")
        for particle in self.particles:
            particle_file.write("%d,%d,%f,%d,%E\n" %(particle[0],particle[1],particle[2],particle[3],particle[4]))
        particle_file.close()
        print("All data fetched. Time: %.2f seconds" %(time.time()-start_time),file = sys.stderr)

    #The timeline of dust events is split into groups based on a given gap size
    # The object fields used are particles[], velocities[] and this method creates and
    # uses session_list[]
    def group_particles(self):
        self.session_list = []

        particle_index = 1
        current_timestamp = self.velocities[0][0]

        #No sessions before the first recorded velocity parameters
        while self.particles[particle_index][0] < current_timestamp: particle_index+=1

        #Defining a session start
        session_start = self.particles[particle_index][0]
        particle_index +=1

        
        while particle_index < len(self.particles):

            prev_timestamp = self.particles[particle_index-1][0]
            current_timestamp = self.particles[particle_index][0]
            #If the gap is larger than the constant gap size
            if (current_timestamp-prev_timestamp > gap_size):
                #make a new session
                session_end = prev_timestamp
                self.session_list.append(Session(session_start-1,session_end+1,-1,-1))
                session_start = current_timestamp

            particle_index+=1


    # frequency_segment makes use of the frequency gaps list pulled from the database. It uses two parallelly incrementing
    # indices to step through both the session list and the frequency gaps list in linear time. 
    # a frequency gap is where there is a period of time where the pelletron frequency is 0
    # When there is a frequency gap that appears in the session, the session is split around that gap. 
    def frequency_segment(self):
        frequency_index =0
        sesssion_index =0

        #For each session
        while sesssion_index < len(self.session_list):
            session = self.session_list[sesssion_index]

            #Check the first frequency gap after the start of the session (it will likely be after the end of 
            # the session)
            while frequency_index< len(self.frequency_gaps)-2 and\
                 self.frequency_gaps[frequency_index][0] < session.start:
                frequency_index+=1

            # if the gap is contained within the session,
            if frequency_index< len(self.frequency_gaps)-2 and self.frequency_gaps[frequency_index][1] <= session.end :
                #delete the session and replace it with two others, split around the gap
                del self.session_list[sesssion_index]
                self.session_list.insert(sesssion_index, Session(self.frequency_gaps[frequency_index][1]+1,\
                                    session.end,session.min_V,session.max_V))
                self.session_list.insert(sesssion_index, Session(session.start,\
                                    self.frequency_gaps[frequency_index][0]-1,session.min_V,session.max_V))
                #back up to clean up
                frequency_index -=1
                sesssion_index -=1

            sesssion_index+=1

    
    # velocity_tag_segment and experiment_tag_segment work in nearly identical ways as frequency segment
    # and exactly the same way as each. I elected to keep them as separate methods as they differ slightly
    # and the consolidation of these methods would make it harder to read

    # velocity_tag_segment splits the sessions into two if a velocity parameter change occurs in the middle of a 
    # session, and tags the sessions with the appropriate velocity. 
    def velocity_tag_segment(self):
        session_index = 0
        velocity_index = 0
        #for all in the list bounds
        while session_index < len(self.session_list) and velocity_index < len(self.velocities):
            session = self.session_list[session_index]

            #take the first velocity change after the start of the session
            while velocity_index < len(self.velocities)-1 and \
                  self.velocities[velocity_index][0] < session.start:
                velocity_index += 1
            
            #The correct velocity parameters are the ones set prior to the first velocity change
            # after session start, so velocity_index-1
            session.min_V = self.velocities[velocity_index-1][2]
            session.max_V = self.velocities[velocity_index-1][1]
            session.min_mass = self.velocities[velocity_index-1][4]
            session.max_mass = self.velocities[velocity_index-1][3]

            #If the velocity change happens during the session
            if self.velocities[velocity_index][0] < session.end:
                #replace the session with two split around it
                del self.session_list[session_index]
                self.session_list.insert(session_index, Session(self.velocities[velocity_index][0]+1,\
                                    session.end,session.min_V,session.max_V))
                self.session_list[session_index].experimentID = session.experimentID
                self.session_list.insert(session_index, Session(session.start,\
                                    self.velocities[velocity_index][0]-1,session.min_V,session.max_V))
                self.session_list[session_index].experimentID = session.experimentID

                session_index -=1
                velocity_index -=1

            session_index+=1
  
    # experiment_tag_segment splits the sessions into two if an experiment change occurs in the middle of a 
    # session, and tags the sessions with the appropriate experiment ID. 
    def experiment_tag_segment(self):
        session_index = 0
        exp_id_index = 0

        #See above methods for identical program structure and flow
        while session_index < len(self.session_list) and exp_id_index < len(self.experiments):
            session = self.session_list[session_index]
            while exp_id_index < len(self.experiments)-1 and \
                self.experiments[exp_id_index][0] < session.start:
                exp_id_index += 1

            session.experimentID = self.experiments[exp_id_index-1][1]
            #Split and replace
            if self.experiments[exp_id_index][0] < session.end:
                del self.session_list[session_index]
                self.session_list.insert(session_index, Session(self.experiments[exp_id_index][0]+1,\
                                    session.end,session.min_V,session.max_V))
                self.session_list[session_index].experimentID = session.experimentID

                self.session_list.insert(session_index, Session(session.start,\
                                    self.experiments[exp_id_index][0]-1,session.min_V,session.max_V))
                self.session_list[session_index].experimentID = session.experimentID

                exp_id_index-=1
                session_index -=1
                
            session_index+=1
        

    #Particle_tag takes the current sessions, and places the dust events in the sessions they should be in
    # It again uses the parallel indices strategy
    def particle_tag(self):

        self.empty_sessions = []
        self.valid_sessions = []
        particle_index =0


        for session in self.session_list:
            while self.particles[particle_index][0] < session.start:
                particle_index+=1
            #If the first particle after the start of the session is before the end (aka in the session)
            if self.particles[particle_index][0] <= session.end:
                #Give it a dust ID from dust type
                session.dustID = self.info_to_type[self.particles[particle_index][1]]
                session.material = self.type_to_name[session.dustID]
                self.valid_sessions.append(session)
            
            #Cases of empty sessions
            else: self.empty_sessions.append(session)
            
            #Add all the particles within the session to the session's particle list
            while self.particles[particle_index][0] <= session.end:
                session.particle_list.append(self.particles[particle_index])
                particle_index+=1

            #Assign qualities to the sessions 
            if session.experimentID == maintenance_id: session.quality = maintenance_quality

            if session.quality>low_count_quality and len(session.particle_list) < low_count_quality_count :
                session.quality = low_count_quality

            if session.quality > low_time_quality and session.duration < low_time_quality_time:
                session.quality = low_time_quality

            if session.quality >= default_quality and len(session.particle_list) < high_count_quality_count:
                session.quality = default_quality

    #Use the pickle library to write the finalized list of sessions to temp_data.pkl
    def write_data(self):
        with open("temp_data.pkl","wb") as save_file:
            pickle.dump(self.valid_sessions,save_file)
        

#Call the rate analyzer with the given login credentials

command_line_args= sys.stdin.read().strip()

if command_line_args=="":

    a = Rate_analyzer("localhost","root","dust","ccldas_production",25)
else:
    argv = command_line_args.split("|")
    a = Rate_analyzer(argv[0],argv[1],argv[2],"ccldas_production",int(argv[3]))


