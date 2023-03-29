# set paths for the directory the script runs from and the vitis workspace directory 
set origin_dir [ file dirname [ file normalize [ info script ] ] ]
set ws $origin_dir/../vitis_workspace

# create hardware platform in the vitis workspace
platform create -name {Zcu106_SipHash24_wrapper} -hw $origin_dir/../hardware_wrappers/ZCU-106/zcu106_siphash_x16.xsa -arch {64-bit};platform write

# create domain for the processor we're trying to program (core 0 in the ARM A53)
domain create -name {domain_psu_cortexa53_0} -display-name {domain_psu_cortexa53_0} -os {standalone} -proc {psu_cortexa53_0} -runtime {cpp} -arch {64-bit} -support-app {hello_world}

# Write the platform and activate it along with the domain
platform write
platform active {Zcu106_SipHash24_wrapper}
domain active {domain_psu_cortexa53_0}

# Generate platform
platform generate

# Create the sw application, copying in relevant source files
app create -name "SipHash24_ZCU106" -platform $ws/Zcu106_SipHash24_wrapper/export/Zcu106_SipHash24_wrapper/Zcu106_SipHash24_wrapper.xpfm -domain "domain_psu_cortexa53_0" -template "Hello World"

exec rm $ws/SipHash24_ZCU106/src/helloworld.c
exec cp $origin_dir/../sw/zcumain.c $ws/SipHash24_ZCU106/src/zcumain.c
exec cp $origin_dir/../sw/siphash.c $ws/SipHash24_ZCU106/src/siphash.c
exec cp $origin_dir/../sw/siphash.h $ws/SipHash24_ZCU106/src/siphash.h
exec cp $origin_dir/../sw/vectors.h $ws/SipHash24_ZCU106/src/vectors.h
exec cp $origin_dir/../sw/ZCU106_addresses.h $ws/SipHash24_ZCU106/src/ZCU106_addresses.h

exit
