# Dust Accelerator Database Analysis
Nathan Schneider schnei.nathan@gmail.com
## Project
This tool is designed to give insight on historical data of the dust accelerator, mainly the rate at which it can produce dust given certain parameters. This labVIEW vi with associated python scripts support the collection, processing, and display of accelerator dust event rate data. 

Along with the rate tools there is a fix for a database error that can be retroactively corrected. Both these tools require the mySQL database to be updated to a newer version in order to function. 

## Windows Setup
1. Install python 3, this was designed on python 3.6 but later versions will likely work. If you don't have Python installed install it from the installer provided in the repository
2. Run the setup utility to install the mySQL Python Connector and matplotlib library. This will also install python package utility pip.
3. If this doesn't work as intended, download pip and install the packages manaually
   - Download pip from the first link, and use the second to install `matplotlib` and `mysql-connector-python` for ONLY the current user, with the --user tag
   - https://pip.pypa.io/en/stable/installing/
   - https://docs.python.org/3/installing/index.html

# Usage
To run the rate tool launch the results_interface.vi application

To fix the runtime table, change the code variables for mySQL server access, then run it. NOTE: this will only work when the mySQL server is updated

## mySQL server update
The mySQL server for the database is currently running on the 2008 version, older than the python tools I am using to analyze the data. It must be updated before the tools can work on new data. The rate interface currently draws from the saved data in the temp_data.pkl file, which persists between runs. Once the server is updated, and only then, can you edit the labVIEW back panel for the rate_interface (follow comments) to shift into standard operation. That will allow temp_data.pkl to be deleted and re-created from the live database. BE CAREFUL NOT TO DELETE temp_data.pkl before the live database is updated. 

## Troubleshooting
If the program seems caught in a loop with Authentication failure, stop the program and check the debugging tab
Here are some of the more common errors:
 - Error: ModuleNotFoundError: No module named 'mysql'
    - Failed to install the mySQL python connector, see setup first
    - If that fails, download from https://dev.mysql.com/downloads/connector/python/
 - Error; ModuleNotFoundError: No module named 'matplotlib'
    - Failed to install the matplotlib Python package, see setup first
    - Install through pip with `pip install matplotlib`
    - Or download from https://matplotlib.org/downloads.html
 - _mysql_connector.MySQLInterfaceError: Can't connect to MySQL server 
    - This is a failure to connect with the mySQL server. This is either due to a credential authentication failure with the mySQL server, OR if the database has not been updated, the program cannot find temp_data.pkl
 - Setup error: 'pip' is not recognized as an internal or external command
    - Failed to install pip, run setup.bat again, or install from https://pip.pypa.io/en/stable/installing/
    
# Implementation
 - When launched from the results_interface the program follows 2 steps:
    - The VI calls the generate_sessions.py program to create the session objects for rate analysis, storing it in temp_data.pkl
      - generate_sessions.py draws from the mySQL database to create a timeline of accelerator activity. 
       - The timeline is then split into sessions of active runtime with unique velocity parameters, experiment ID and dust ID.
       - This data is saved in python object file temp_data.pkl with the pickle library 
    - The VI will repeatedly call rate_results.py and pass it the parameters from the front end. rate_results.py draws from temp_data.pkl to calculate the correct rates for the given parameters
      - rate_results.py reads the session info each time from temp_data.pkl and takes the query parameters from stdin
      - The program downselects sessions and particles to match the given parameters, then displays the rate in stdout
      - Several .png graphs are made, and are loaded independently by the VI
 - See Dust_Data_Project.pptx for more details
