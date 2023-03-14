# SipHash-FPGA-Accelerator
## Description
This repository contains the source code for an FPGA-based SipHash accelerator and an accompanying test bench implemented in VHDL.

The .xsa files under \wrappers\ can be used in Vitis to instantiate a test bench for the core on two Xilinx boards: the Zedboard or the ZCU-106. The \sw\ directory contains the source code written to run the tests, and the test vectors are contained in header files under \vectors\.  The source code that can instantiate the core on any platform is located under \vhdl\

## Testing Siphash on a Workstation Machine
To calculate the latency and throughput for SipHash2-4 on your local workstation, follow these steps on a Linux machine:

1) Clone the repo 
`git clone https://github.com/bwelte99/SipHash-FPGA-Accelerator.git`

2) Navigate to the /sw/ directory
`cd path/to/SipHash-FPGA-Accelerator/sw`

3) Run 
`make`

4) Execute the resulting 'servertest' executable
`./servertest`

You should see output from a variety of tests indicating the latency and throughput of SipHash2-4 for different input sizes.

To see results for SipHash1-3 instead of SipHash2-4, you will need to edit siphash.c.  Change cRounds to 1 and dRounds to 3, i.e. `#define cRounds 1` and `#define dRounds 3`.  You should also comment out the array of hashes for SipHash2-4 in vectors_full.h and uncomment the hash array for SipHash1-3 to verify the results are correct.

## Reproducing Results
### Prerequisites
Please ensure you have installed the Xilinx Vitis IDE v2020.1 (or a compatible version)

### Project Setup
**1)** Clone the repo (if you haven't already)
`git clone https://github.com/bwelte99/SipHash-FPGA-Accelerator.git`

**2)** Open Vitis

**3)** Create a new project (File -> New -> Application Project)

**4)** Select "Create a new platform from hardware (XSA)".  Select the xsa for the board (Zedboard/ZCU-106) and algorithm (SipHash2-4/SipHash1-3) you want to test.  The wrappers can be found at <path_to>/SipHash-FPGA-Accelerator/hardware_wrappers/

**5)** Name the application and create it using the "Hello World" template.

**6)** Delete helloworld.c from the project's source code files and copy the following files from <path>/SipHash-FPGA-Accelerator/sw/ to the Vitis project's /src/ directory:
- main.c
- siphash.c
- siphash.h
- vectors_full.h
- zcu106_addresses.h (if using the zcu106)
- zedboard_addresses.h (if using the zedboard)

**7)** Configure the project settings to test SipHash2-4 or SipHash1-3 in hardware or software, as desired.  
#### Hardware vs. Software mode
To change whether a hardware or software implementation of SipHash is being timed, change the macro definition of TIMING_MODE in main.c appropriately.  For example, `#define TIMING_MODE HARDWARE` will select hardware mode, and `#define TIMING_MODE SOFTWARE` will select software.

#### Number of Test Cores
To vary the number of iterations of SipHash used in the test, change the macro definition of NUM_TEST_CORES in main.c.  If the selected timing mode is hardware, this macro will control the number of parallel cores on the FPGA that are utilized. If the selected timing mode is software, the `siphash()` function will be sequentially invoked once for each core. Valid values of NUM_TEST_CORES range from 1 to 16, inclusive.

#### SipHash2-4 vs. SipHash1-3
Note that the version of SipHash the FPGA will execute is determined by the .xsa file you chose at the beginning of project creation!
  
To switch the software implementation from SipHash2-4 to SipHash1-3, change the definitions of cRounds and dRounds in siphash.c from 2 and 4 respectively to 1 and 3.  Conversely, to switch back to SipHash2-4, revert cRounds and dRounds to 2 and 4.  

To verify the results' correctness, ensure that the proper array of hashes is not commented out in vectors_full.h.  If you scroll to the bottom of vectors_full.h, you will notice there are two declarationsof `hashes[]`, one for SipHash2-4 and another for SipHash1-3.  Ensure that the array declaration for the algorithm you are using is uncommented and comment out the array declaration for the one that's not in use.
  
**8)** Finally, build the project in the Vitis IDE.  Note that if you are timing the SipHash software, you will see the best results by compiling with -O3 optimization, but if you are timing the hardware, the application will only function correctly if compiled with -O0.  To change optimization settings, right click the application in the project explorer and go to "C/C++ Build Settings" -> "C/C++ Build" -> "Settings" -> "ARM v8 gcc compiler" -> "Optimization" and select the desired optimization level from the drop-down menu.
  
  ![image](https://user-images.githubusercontent.com/71848340/225121872-7e8fdcab-f039-4bfe-ae07-65311f8d52c7.png)


**9)** Assuming the build succeeds, you should now have a functioning baremetal executable for your chosen FPGA.  The application will print the results of a given experiment via UART (baud rate = 115,200) which you can observe with an appropriate program (PuTTY, picocom, etc).




