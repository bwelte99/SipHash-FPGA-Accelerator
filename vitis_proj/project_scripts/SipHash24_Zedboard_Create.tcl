# set paths for the directory the script runs from and the vitis workspace directory 
set origin_dir [ file dirname [ file normalize [ info script ] ] ]
set ws $origin_dir/../vitis_workspace

# create hardware platform in the vitis workspace
platform create -name {SipHash24_wrapper} -hw $origin_dir/../hardware_wrappers/Zedboard/SipHash24_wrapper.xsa -arch {32-bit};platform write

# create domain for the processor we're trying to program (core 0 in the ARM A9)
domain create -name {domain_ps7_cortexa9_0} -display-name {domain_ps7_cortexa9_0} -os {standalone} -proc {ps7_cortexa9_0} -runtime {cpp} -arch {32-bit} -support-app {hello_world}

# Write the platform and activate it along with the domain
platform write
platform active {SipHash24_wrapper}
domain active {zynq_fsbl}
domain active {domain_ps7_cortexa9_0}

# Generate platform
platform generate

# Create the sw application, copying in relevant source files
app create -name "SipHash24_Zedboard" -platform $ws/SipHash24_wrapper/export/SipHash24_wrapper/SipHash24_wrapper.xpfm -domain "domain_ps7_cortexa9_0" -template "Hello World"

exec rm $ws/SipHash24_Zedboard/src/helloworld.c
exec cp $origin_dir/../sw/zedmain.c $ws/SipHash24_Zedboard/src/zedmain.c
exec cp $origin_dir/../sw/siphash.c $ws/SipHash24_Zedboard/src/siphash.c
exec cp $origin_dir/../sw/siphash.h $ws/SipHash24_Zedboard/src/siphash.h
exec cp $origin_dir/../sw/vectors.h $ws/SipHash24_Zedboard/src/vectors.h
exec cp $origin_dir/../sw/zedboard_addresses.h $ws/SipHash24_Zedboard/src/zedboard_addresses.h

exit
