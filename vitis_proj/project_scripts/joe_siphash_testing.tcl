platform create -name {SipHash24_wrapper} -hw {C:\Users\zambreno\Documents\MobaXterm\home\SipHash-FPGA-Accelerator\hardware_wrappers\Zedboard\SipHash24_wrapper.xsa} -arch {32-bit} -out {C:/Users/zambreno/workspace};platform write
domain create -name {domain_ps7_cortexa9_0} -display-name {domain_ps7_cortexa9_0} -os {standalone} -proc {ps7_cortexa9_0} -runtime {cpp} -arch {32-bit} -support-app {hello_world}
platform write
platform active {SipHash24_wrapper}
domain active {zynq_fsbl}
domain active {domain_ps7_cortexa9_0}
platform generate -quick


# JAZ: Have to add file delete commands here. CD, RM, CP, etc should all work
buildplatform.bat 49268 SipHash24_wrapper