#!/bin/bash

echo "Installing configurations"

sudo -v

# SDDM
sudo cp -r ~/dotfiles/usr/* /usr/

# Config
cp -r ~/dotfiles/.config/ ~/.config/

# Background
sudo mkdir /usr/share/backgrounds/
sudo cp ~/dotfiles/catppuccin_triangle.png /usr/share/backgrounds/

# Cursor
mkdir ~/.local/share/icons/
cp -r ~/dotfiles/.local/share/icons/* ~/.local/share/icons/

echo "You may also install rEFInd as your boot manager and copy the configs for a more complete experience"
