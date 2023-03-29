# Script to rebuild SipHash24_ZCU106 in SW Mode
puts "Setting compiler options ..."
app config -name SipHash24_ZCU106 -set compiler-optimization {Optimize most (-O3)}
app config -name SipHash24_ZCU106 -set compiler-misc {-DMODE=SW -c -fmessage-length=0 -MT"$@"}

# Rebuild app
puts "Rebuilding app ..."
app build -name SipHash24_ZCU106

puts "Finished building SipHash24_ZCU106 for SW"

