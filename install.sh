#!/bin/bash

echo "Installing configurations"

sudo -v

# SDDM
sudo cp -r ~/dotfiles/usr/* /usr/
sudo mkdir /etc/sddm.conf.d
sudo cp -r ~/dotfiles/etc/sddm.conf.d/* /etc/sddm.conf.d/

# Config
cp -r ~/dotfiles/.config/ ~/.config/

# Background
sudo mkdir /usr/share/backgrounds/
sudo cp ~/dotfiles/catppuccin_triangle.png /usr/share/backgrounds/

# Cursor
mkdir ~/.local/share/icons/
cp -r ~/dotfiles/.local/share/icons/* ~/.local/share/icons/

# Theme
mkdir /usr/share/themes
sudo cp -r ~/dotfiles/usr/share/themes/* /usr/share/themes/
gsettings set org.gnome.desktop.interface gtk-theme "catppuccin"

# Icons
gsettings set org.gnome.desktop.interface icon-theme "Papirus"

echo "You may also install rEFInd as your boot manager and copy the configs for a more complete experience"
