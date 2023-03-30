# SipHash-FPGA-Accelerator
## Description
This repository contains an FPGA-based accelerator for SipHash, a pseudorandom keyed hash function, as well as hardware and software for a test bench that can profile the core's performance.  The core and its hardware test bench are implemented at the RTL level in VHDL, and the test bench software is written in C.

This README provides instructions for recreating the SipHash core and measuring its performance using v2020.1 of Vivado and Vitis, Xilinx's FPGA design tools.  Scripts written in Xilinx's tools control language (TCL) recreate the SipHash core along with its hardware test bench in Vivado, and similar scripts allow for exporting the hardware to Vitis, integrating it with a simple test application, and experimentally measuring the core's performance (i.e. reproducing results).  The repository also includes code and accompanying instructions to test SipHash's speed on a local workstation machine.

## Recreating the Hardware Design

These directions will walk you through recreating the hardware design for the SipHash core in addition to a test bench on either of the two supported Xilinx boards, the Zedboard and the ZCU-106.

Before starting, please ensure you have Xilinx Vivado 2020.1 (or a compatible version of Vivado) installed

**1)** Clone the GitHub repo (or access it via Dryad)

&emsp; `git clone https://github.com/bwelte99/SipHash-FPGA-Accelerator.git`

**2)** Open Vivado.  In the TCL console, navigate to the `/fpga_hw/proj/` directory

&emsp; `cd path/to/SipHash-FPGA-Accelerator/fpga_hw/proj/`

**3)** Source the script corresponding to the board you want to create a project for in the TCL console.  If targeting the Zedboard, run

&emsp; `source SipHashZedboard.tcl`

Otherwise, if you're targeting the ZCU-106, run

&emsp; `source SipHashZcu106.tcl`

**NOTE:** You must source these scripts in Vivado's TCL console; they will fail if run from a bash shell.

**4) (Optional)** You now have a project with a functioning replica of the SipHash core's test benches on one or both boards.  By default, the SipHash cores are configured to implement SipHash1-3.  You can either make edits as desired, or click 'Generate Bitstream' to create a bitfile which can directly program an FPGA or be exported to Vitis to create a software project.

If you want to edit the design, you can regenerate the bitstream after saving your changes and export the new configuration as a hardware wrapper (.xsa file) to create a platform for a software application in Vitis.  To save time and complexity, this repository contains ready-made .xsa files targeting the Zedboard and ZCU-106 that were generated using the provided Vivado projects for use in the next set of instructions.  

## Reproducing Results in Vitis
### Prerequisites
Please ensure you have installed the Xilinx Vitis IDE v2020.1 (or a compatible version) including functioning gcc and g++ toolchains.  You will also need serial communication software such as PuTTY, picocom, or an equivalent program.

### Project Setup
**1)** Clone the repo (if you haven't already)

&emsp; `git clone https://github.com/bwelte99/SipHash-FPGA-Accelerator.git`

**2)** Open Vitis, selecting `path/to/SipHash-FPGA-Accelerator/vitis_proj/vitis_workspace` as the workspace when prompted.

**3)** Open an XSCT console (Xilinx -> XSCT Console in the toolbar).  In it, navigate to the directory in the repository containing the project setup scripts.

&emsp; `cd path/to/SipHash-FPGA-Accelerator/vitis_proj/project_scripts`

**4)** You will notice there are three scripts for each possible board/algorithm combination (SipHash1-3 vs. SipHash2-4 and Zedboard vs. ZCU-106) for a total of 12 TCL scripts.  In the XSCT console, source the script ending in 'Create' for the board/algorithm combination you would like to recreate.  For example, if targeting SipHash2-4 on the Zedboard, run

&emsp; `source SipHash24_Zedboard_Create.tcl`

Note that this can potentially take some time (up to 15~20 minutes depending on which board you are targeting). Once the project has been successfully recreated, you should see an application project in the Vitis GUI with the following file structure:

{wrapper_name}\_wrapper/  
{application_name}\_system/  
|--{application_name}  
&emsp;    |--src/  
&emsp;&emsp;        |--siphash.c  
&emsp;&emsp;        |--siphash.h  
&emsp;&emsp;        |--vectors.h  
&emsp;&emsp;        |--{zedboard, zcu106}\_addresses.h  
&emsp;&emsp;        |--{zed, zcu}main.c  
        
There will be many other directories and files besides the ones pictured above, but these are the crucial ones to check for to ensure the script worked.

**5)** Having confirmed the preceding script successfully generated the project, let's turn our attention to the other two scripts relevant to your configuration.  The scripts ending in 'BuildHW' will configure the application to profile the performance of the SipHash hardware cores while the SW scripts will build a pure software application compiled with -O3 optimization to provide the best possible benchmark. Decide whether to time hardware or software hashing and then source the corresponding script.  For example, if timing Siphash2-4 hardware on the Zedboard, run

&emsp; `source SipHash24_Zedboard_BuildHW.tcl`

Once again, this can be a lengthy process (up to 10 minutes depending on the chosen board).

**NOTE:** At this point, it is common for Vitis to inexplicably forget which directory you specified as the workspace, resulting in an error.  Fortunately, this can be easily fixed by closing Vitis and reopening it, again selecting `path/to/SipHash-FPGA-Accelerator/vitis_proj/vitis_workspace/` as the workspace.

**6)** Finally, you now have a functioning executable (.elf file) which can be run as a bare metal application on your chosen board.  Ensure that the board is set up properly for JTAG programming, including serial connections for JTAG and UART communication.

Open an appropriate program for serial communication (e.g. PuTTY, picocom, minicom, etc).  Connect to the serial port on your workstation corresponding to the board you want to program using a baud rate of 115,200.   

**7)** Run the executable on the board (this should be as simple as pressing the play button in the Vitis IDE or launching and running it in debug mode).  The test application should send data for a variety of tests over the serial port including throughput in Gigabits per second and the PL clock cycles that elapsed during hashing.

**8) (Optional)** You can easily reconfigure the project from hardware to software timing or vice versa by sourcing the build script for the configuration you want to run in the XSCT console.  For example, if we want to switch from SipHash2-4 hardware to software on the Zedboard, run

&emsp; `source SipHash24_Zedboard_BuildSW.tcl`

You can also repeat steps 4-7 to reproduce results for other algorithm/board combinations you haven't run yet, although you will have to take care to ensure you're running the executable you want if multiple projects exist in your workspace.

The provided Vitis projects should be sufficient to reproduce the performance (i.e. throughput and speedup vs. software) reported in the conference paper.  To obtain speedup vs. software, simply divide the throughput for the hardware implementation of an algorithm, e.g. SipHash2-4 on the Zedboard, by the software throughput for that same board/algorithm combination.

# Testing Siphash on a Workstation Machine
To calculate the latency and throughput for SipHash2-4 on your local workstation, follow these steps on a Linux machine:

**1)** Clone the repo

&emsp; `git clone https://github.com/bwelte99/SipHash-FPGA-Accelerator.git`

**2)** Navigate to the /workstation/ directory


&emsp; `cd path/to/SipHash-FPGA-Accelerator/workstation`

**3)** Build the project

&emsp; `make`

**4)** Run the resulting executable

&emsp; `./workstation`

You should see output from a variety of tests indicating the latency and throughput of SipHash2-4 for different input sizes.

To see results for SipHash1-3 instead of SipHash2-4, clean the project and rebuild with the following commands:

&emsp; `make clean`

&emsp; `make CROUNDS=1 DROUNDS=3`


This will rebuild the `workstation` executable using SipHash1-3 instead of SipHash2-4.  Cleaning the project is necessary beforehand to ensure the build process recreates the object files using SipHash1-3.  Similarly, if you want to revert to SipHash2-4, you will need to clean the project and rebuild.  By default, `make` will build using SipHash2-4.


