opened=$(pgrep wofi)

configdir=$HOME/.config

if [[ ! -z $opened ]]; then
    killall wofi
else
    wofi --show drun --conf $configdir/wofi/config --style $configdir/wofi/style.css -I
fi
