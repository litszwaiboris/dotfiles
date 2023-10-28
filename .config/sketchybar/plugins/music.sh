source ${HOME}/.config/sketchybar/plugins/music_check.sh

if [ $CHECK == "a" ]; then
    ICON="󰝚"
    sketchybar -m --set media icon="$ICON" \
                  --set media label.drawing=on \
                  --set media label="$LABEL"
else
    ICON="󰝛"
    sketchybar -m --set media icon="$ICON" \
                  --set media label.drawing=off
fi

