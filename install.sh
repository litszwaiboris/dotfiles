#!/bin/bash

# Init
echo "Dotfiles Installer for litszwaiboris/dotfiles"

echo "Installing Prerequisites"
echo "Please enter your password to allow installation"
sudo -v

clear

echo "Installing Window Manager"
sudo dnf install waybar hyprland wofi light pipewire-utils grim kitty thunar firefox hyprlock hyprpaper 

echo "Completed"
sleep 0.5

# Installing Nerd Fonts
clear
sudo dnf copr enable che/nerd-fonts
sudo dnf install nerd-fonts
echo "Completed."
sleep 0.5
clear

echo "Installing configurations"

echo "Copying config and settings"
cd "$(dirname "$0")"
dir=$(pwd)

mkdir -p $dir/.config/* && cp $dir/.config/* $HOME/.config/

echo "Installation Completed"

echo "Happy ricing!"

exit 0
