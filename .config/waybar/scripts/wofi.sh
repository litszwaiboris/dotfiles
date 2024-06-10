opened=$(pgrep wofi)

if [[ ! -z $opened ]]; then
    killall wofi
else
    wofi --show drun
fi
