LABEL=$(/System/Library/PrivateFrameworks/Apple80211.framework/Versions/Current/Resources/airport -I | awk 'NR==13 {print $2}')

get=$(networksetup -getairportpower en0)

if [[ $get == *"On"* ]]; then
	sketchybar -m --set $NAME icon="󰖩 "
fi

if [[ $get == *"Off"* ]]; then
	sketchybar -m --set $NAME icon="󰖪 "
fi

sketchybar -m --set $NAME label=$LABEL
