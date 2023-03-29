# Script to rebuild SipHash13_ZCU106 in SW Mode
puts "Setting compiler options ..."
app config -name SipHash13_ZCU106 -set compiler-optimization {Optimize most (-O3)}
app config -name SipHash13_ZCU106 -set compiler-misc {-DMODE=SW -c -fmessage-length=0 -MT"$@"}

# Rebuild app
puts "Rebuilding app ..."
app build -name SipHash13_ZCU106

puts "Finished building SipHash13_ZCU106 for SW"

