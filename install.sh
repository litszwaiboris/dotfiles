#!/bin/zsh

# Init
echo "Dotfiles Installer for litszwaiboris/dotfiles"

echo "Installing Prerequisites"
echo "Please enter your password to allow installation"
sudo -v

clear

# Homebrew Installation
echo "Installing Homebrew"
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
clear

echo "Homebrew Installation Completed"
sleep 0.5

echo "Setting up PATH variable for usage of homebrew"
echo 'PATH="/usr/local/bin:$PATH"' >> ~/.bash_profile
echo 'PATH="/usr/local/bin:$PATH"' >> ~/.zshrc
echo "Completed."
sleep 0.5
clear

# Installing SF-Symbols, Yabai, Skhd, Sketchybar
echo "Installing required packages"
brew install --cask nikitabobko/tap/aerospace
brew tap FelixKratz/formulae
brew install sketchybar skhd yabai
brew install --cask sf-symbols
echo "Completed."
sleep 0.5
clear

# Installing Font needed
echo "Installing MesloLGS Nerd Font"
brew tap homebrew/cask-fonts
brew install font-meslo-lg-nerd-font
echo "Completed."
echo "Prerequisites installed successfully"
# End Prerequisites

echo "Installing configurations"

# Accent Color (Dark Blue)
echo "Setting up macOS accent color"
defaults write -g NSColorSimulatedHardwareAccent -bool true
defaults write -g NSColorSimulatedHardwareEnclosureNumber -int 5

# Hidden desktop files
success=false
while [ $success = false ]; do
  clear 
  echo "Do you want to hide Desktop files? Please use yes/no to answer"
  read choice
  if [ $choice = "yes" ] || [ $choice = "y" ]; then
      echo ""
      echo "Disabling desktop files"
      defaults write com.apple.finder CreateDesktop -bool false
      success=true
  elif [ $choice = "no" ] || [ $choice = "n" ]; then
      echo ""
      echo "Enabling desktop files"
      defaults write com.apple.finder CreateDesktop -bool true
      success=true
  else 
      echo ""
      echo "Please answer in 'yes' or 'no'."
      sleep 1
  fi
done

# Configuration done
echo "Configuration done successfully"

# Copying config
echo "Copying config and settings"
cd "$(dirname "$0")"
dir=$(pwd)

cp -r $dir/* $HOME/

echo "Copy Completed"

echo "Installation Complete, you may find wallpapers online and apply it in your way."
echo "Happy ricing!"

exit 0
