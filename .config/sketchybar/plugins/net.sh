LABEL=$(/System/Library/PrivateFrameworks/Apple80211.framework/Versions/Current/Resources/airport -I | awk 'NR==13 {$1 = ""; print}' | sed 's/^ //g')

get=$(/System/Library/PrivateFrameworks/Apple80211.framework/Versions/Current/Resources/airport -I | awk '{print $2}')

connection=$(/System/Library/PrivateFrameworks/Apple80211.framework/Versions/Current/Resources/airport -I | awk 'NR==5 {print $2}')

if [[ $connection == "running" ]]; then
	sketchybar -m --set $NAME icon="󰖩 " \
	                          label.drawing=on
elif [ $connection == "init" ] || [ $connection == "scanning" ]; then
    sketchybar -m --set $NAME icon="󱚵 " \
	                          label.drawing=off
fi

if [[ $get == *"Off"* ]]; then
	sketchybar -m --set $NAME icon="󰖪 " \
	                          label.drawing=off
fi

sketchybar -m --set $NAME label="$LABEL"
