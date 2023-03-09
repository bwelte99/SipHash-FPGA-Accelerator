# SipHash-FPGA-Accelerator
## Description
This repository contains the source code for an FPGA-based SipHash accelerator implemented in VHDL and an accompanying test bench (hardware and software).

The .xsa files under \wrappers\ can be used in Vitis to instantiate a test bench for the core on two Xilinx boards: the Zedboard or the ZCU-106. The \sw\ directory contains the source code written to run the tests, and the test vectors are contained in header files under \vectors\.  The source code that can instantiate the core on any platform is located under \vhdl\

## Testing Siphash on a Workstation Machine
To calculate the latency and throughput for SipHash2-4 on your local workstation, follow these steps on a Linux machine:

1) Clone the repo 
`git clone https://github.com/bwelte99/SipHash-FPGA-Accelerator.git`

2) Navigate to the /sw/ directory
`cd path/to/SipHash-FPGA-Accelerator/sw`

3) Run make
`make`

4) Execute the resulting executable, 'servertest'
`./servertest`

You should see output from a variety of tests indicating the latency and throughput for SipHash2-4 using a variety of input sizes (these performance measurements were obtained using gettimeofday())









