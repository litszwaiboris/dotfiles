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

echo "Copying config and settings"
cd "$(dirname "$0")"
dir=$(pwd)

printf "Is this the correct dotfiles repository directory? %s n/y " $dir

read confirmed

if [ ! "$confirmed" = "y" ]; then
	echo "Please make sure that you navigated to the right path for the repository"
	exit 0
else
	cp --parents $dir/.config/* $HOME/.config/
	sudo cp ./usr/share/backgrounds/catppuccin_triangle.png /usr/share/backgrounds/
	echo "Installation Completed"
	echo "Happy ricing!"
	exit 0
fi
