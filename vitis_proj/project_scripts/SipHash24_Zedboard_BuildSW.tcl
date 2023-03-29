# Script to rebuild SipHash24_Zedboard in SW Mode
puts "Setting compiler options ..."
app config -name SipHash24_Zedboard -set compiler-optimization {Optimize most (-O3)}
app config -name SipHash24_Zedboard -set compiler-misc {-DMODE=SW -c -fmessage-length=0 -MT"$@" -mcpu=cortex-a9 -mfpu=vfpv3 -mfloat-abi=hard}

# Rebuild app
puts "Rebuilding app ..."
app build -name SipHash24_Zedboard

puts "Finished building SipHash24_Zedboard for SW"

