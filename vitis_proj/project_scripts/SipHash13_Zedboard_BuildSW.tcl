# Script to rebuild SipHash13_Zedboard in SW Mode
puts "Setting compiler options ..."
app config -name SipHash13_Zedboard -set compiler-optimization {Optimize most (-O3)}
app config -name SipHash13_Zedboard -set compiler-misc {-DMODE=SW -DcROUNDS=1 -DdROUNDS=3 -c -fmessage-length=0 -MT"$@" -mcpu=cortex-a9 -mfpu=vfpv3 -mfloat-abi=hard}

# Rebuild app
puts "Rebuilding app ..."
app build -name SipHash13_Zedboard

puts "Finished building SipHash13_Zedboard for SW"

