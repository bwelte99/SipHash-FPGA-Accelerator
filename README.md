# SipHash-FPGA-Accelerator
This repository contains the source code for an FPGA-based SipHash accelerator implemented in VHDL and an accompanying test bench (hardware and software).

The .xsa files under \wrappers\ can be used in Vitis to instantiate a test bench for the core on two Xilinx boards: the Zedboard or the ZCU-106. The \sw\ directory contains the source code written to run the tests, and the test vectors are contained in header files under \vectors\.  The source code that can instantiate the core on any platform is located under \vhdl\




