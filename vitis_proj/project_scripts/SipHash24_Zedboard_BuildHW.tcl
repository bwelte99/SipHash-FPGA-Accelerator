# Script to rebuild SipHash24_Zedboard in either HW or SW mode (default is HW)

puts "Setting comiler options ..."
app config -name SipHash24_Zedboard -set compiler-optimization {None (-O0)}
app config -name SipHash24_Zedboard -set compiler-misc {-DRUN_MODE=HW -c -fmessage-length=0 -MT"$@" -mcpu=cortex-a9 -mfpu=vfpv3 -mfloat-abi=hard}

# Rebuild app
puts "Rebuilding app ..."
app build -name SipHash24_Zedboard

puts "Finished building SipHash24_Zedboard for HW"
