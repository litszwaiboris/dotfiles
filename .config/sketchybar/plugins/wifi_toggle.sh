get=$(networksetup -getairportpower en0 | awk 'NR==1 {print $4}')

if [[ $get == "On" ]]; then
  networksetup -setairportpower en0 off
elif [[ $get == "Off" ]]; then
  networksetup -setairportpower en0 on
fi
