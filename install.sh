#!/bin/bash

echo "Dotfiles Installer for litszwaiboris/dotfiles"

echo "Installing Prerequisites"
echo "Please enter your password to allow installation"
sudo -v

clear

echo "Installing Window Manager"
sudo dnf install waybar hyprland fuzzel light pipewire-utils grim kitty thunar firefox hyprlock hyprpaper -y 

echo "Completed"
sleep 0.5
clear
sudo dnf copr enable che/nerd-fonts -y
sudo dnf install nerd-fonts -y
echo "Completed."
sleep 0.5
clear

echo "Installing configurations"

echo "Copy configuration files from .config inside the repo to <your user folder>/.config"
echo "Copy files in /usr/share to /usr/share in your machine"
