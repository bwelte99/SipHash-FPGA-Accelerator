# Script to rebuild SipHash13_Zedboard in either HW or SW mode (default is HW)

puts "Setting comiler options ..."
app config -name SipHash13_Zedboard -set compiler-optimization {None (-O0)}
app config -name SipHash13_Zedboard -set compiler-misc {-DRUN_MODE=HW -DcROUNDS=1 -DdROUNDS=3 -c -fmessage-length=0 -MT"$@" -mcpu=cortex-a9 -mfpu=vfpv3 -mfloat-abi=hard}

# Rebuild app
puts "Rebuilding app ..."
app build -name SipHash13_Zedboard

puts "Finished building SipHash13_Zedboard for HW"
