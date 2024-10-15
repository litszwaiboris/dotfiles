LABEL=$(ipconfig getsummary en0 | awk -F ' SSID : '  '/ SSID : / {print $2}')

get=$(networksetup -getairportpower en0 | awk 'NR==1 {print $4}')

if [[ $get == "On" ]]; then
  if [ -z $LABEL ]; then
    LABEL="Disconnected"
  else
    sketchybar -m --set $NAME icon="󰖩 " \
  	                          label.drawing=on
  fi
fi

if [[ $get == "Off" ]]; then
  sketchybar -m --set $NAME icon="󰖪 " \
	                          label.drawing=off
fi

sketchybar -m --set $NAME label="$LABEL"
