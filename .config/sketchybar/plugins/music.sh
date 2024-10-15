source ${HOME}/.config/sketchybar/plugins/music_check.sh

if [ $CHECK == "a" ]; then
    ICON="󰝚"
    sketchybar -m --set media icon="$ICON" \
                  --set media label.drawing=on 

    if [ ${#LABEL} -gt 20 ]; then
      sketchybar -m --set media label="$ARTIST"
    else
    sketchybar -m --set media label="$LABEL"
    fi
else
    ICON="󰝛"
    sketchybar -m --set media icon="$ICON" \
                  --set media label.drawing=off
fi

