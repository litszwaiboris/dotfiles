LABEL=$(networksetup -getairportnetwork en0 | awk '{$1 = ""; $2 = ""; $3 = ""; print}' | sed 's/ //g')

get=$(networksetup -getairportpower en0 | awk '{print $4}')

ethernet=$(ifconfig | grep en8)

if [[ ! -z $ethernet ]]; then
  networksetup -setairportpower en0 off
fi

if [[ $get == "On" ]]; then
  sketchybar -m --set $NAME icon="󰖩 " \
  	                        label.drawing=on
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
