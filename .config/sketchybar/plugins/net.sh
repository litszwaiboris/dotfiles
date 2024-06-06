LABEL=$(/System/Library/PrivateFrameworks/Apple80211.framework/Versions/Current/Resources/airport -I | awk 'NR==13 {$1 = ""; print}' | sed 's/^ //g')

get=$(networksetup -getairportpower en0 | awk '{print $4}')

connection=$(/System/Library/PrivateFrameworks/Apple80211.framework/Versions/Current/Resources/airport -I | awk 'NR==5 {print $2}')

ethernet=$(ifconfig | grep en8)

if [[ ! -z $ethernet ]]; then
  networksetup -setairportpower en0 off
fi

if [[ $get == "On" ]]; then
  if [[ $connection == "running" ]]; then
  	sketchybar -m --set $NAME icon="󰖩 " \
  	                          label.drawing=on
  elif [ $connection == "init" ] || [ $connection == "scanning" ]; then
      sketchybar -m --set $NAME icon="󱚵 " \
  	                          label.drawing=off
  fi
fi

if [[ $get == "Off" ]]; then
  if [[ -z $ethernet ]]; then
  	sketchybar -m --set $NAME icon="󰖪 " \
	                            label.drawing=off
  elif [[ ! -z $ethernet ]]; then
    sketchybar -m --set $NAME icon="􀩲 " \
                              label.drawing=on
  LABEL="Ethernet"
  fi
fi

sketchybar -m --set $NAME label="$LABEL"
