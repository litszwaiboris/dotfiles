opened=$(pgrep fuzzel)

configdir=$HOME/.config

if [[ ! -z $opened ]]; then
    killall fuzzel
else
    fuzzel --icon-theme Papirus-Dark --font="MesloLGS Nerd Font:size=15" -D no -w 50 -l 15 -y 20 --line-height=25
fi
