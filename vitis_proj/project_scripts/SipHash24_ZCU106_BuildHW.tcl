# Script to rebuild SipHash24_ZCU106 in HW mode

puts "Setting compiler options ..."
app config -name SipHash24_ZCU106 -set compiler-optimization {None (-O0)}
app config -name SipHash24_ZCU106 -set compiler-misc {-DRUN_MODE=HW -c -fmessage-length=0 -MT"$@"}

# Rebuild app
puts "Rebuilding app ..."
app build -name SipHash24_ZCU106

puts "Finished building SipHash24_ZCU106 for HW"
