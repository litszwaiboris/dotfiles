kitty -e sudo pacman -Syyu --noconfirm

if [ $? -ge 0 ]; then
  notify-send "Le système d'exploitation est mise a jour"
else
  notify-send "Les commandes ont abouti à des erreurs"
fi
