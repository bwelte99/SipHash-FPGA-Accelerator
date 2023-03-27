set origin_dir [ file dirname [ file normalize [ info script ] ] ]
#puts "DEBUG: origin_dir is $origin_dir"

set ws $origin_dir/../vitis_workspace
#puts "DEBUG: setting workspace to $ws"
setws $ws

set plat_name "SipHash24_wrapper"
set cpu_arch "32-bit"
set domain_name "domain_ps7_cortexa9_0"
set fsbl_name "zynq_fsbl"
set os "standalone"
set proc "ps7_cortexa9_0"
set app_name "ZedboardSipHash24"

platform create -name {SipHash24_wrapper} -hw $origin_dir/../hardware_wrappers/Zedboard/SipHash24_wrapper.xsa -arch {32-bit};platform write

domain create -name {domain_ps7_cortexa9_0} -display-name {domain_ps7_cortexa9_0} -os {standalone} -proc {ps7_cortexa9_0} -runtime {cpp} -arch {32-bit} -support-app {hello_world}

platform write
platform active {SipHash24_wrapper}

domain active {zynq_fsbl}
domain active {domain_ps7_cortexa9_0}

platform generate #-quick

app create -name "SipHash24_Zedboard" -platform $ws/SipHash24_wrapper/export/SipHash24_wrapper/SipHash24_wrapper.xpfm -domain "domain_ps7_cortexa9_0" -template "Hello World"

exec rm $ws/SipHash24_Zedboard/src/helloworld.c
exec cp $origin_dir/../sw/zedmain.c $ws/SipHash24_Zedboard/src/zedmain.c
exec cp $origin_dir/../sw/siphash.c $ws/SipHash24_Zedboard/src/siphash.c
exec cp $origin_dir/../sw/siphash.h $ws/SipHash24_Zedboard/src/siphash.h
exec cp $origin_dir/../sw/vectors.h $ws/SipHash24_Zedboard/src/vectors.h
exec cp $origin_dir/../sw/zedboard_addresses.h $ws/SipHash24_Zedboard/src/zedboard_addresses.h

#TODO: copy makefile?

app build -name "SipHash24_Zedboard"

# JAZ: Have to add file delete commands here. CD, RM, CP, etc should all work
#buildplatform.bat 49268 SipHash24_wrapper

exit

puts "Setup script complete"
