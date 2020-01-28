last updated (1/28/2020)

FPGA:
-contains fpga project for the old fpga
  -controller versions v3,v4,v4.1,v4.2
  - testing functionality
  - most up to date version for old FPGA is **v4.2** 

FPGA2:
-contains outdated code updates for new FPGA
  - updates are for adapter module (NI 5782) (new module is NI 5734)
  - contains an in progress controller v5 that Forest was working on
  - testing functionality
  - also contains FPGAcode2.vi
    - this is the an update to the algorithm that runs on the FPGA itself
    - also for old hardware
    - it seems to match old algorithm but is refactored to be more organized
    - not sure if it works

FPGA3:
-contains outdated, incomplete major update to new FPGA algorithm (also Forest)
  - controller v6