#!/bin/bash

# Install meta packages required for making yay
echo "Installing base-devel packages"
sudo pacman -S base-devel

# Install yay to access AUR packages
echo "Cloning yay repository from https://aur.arhlinux.org into the home directory"
cd ~ && git clone https://aur.archlinux.org/yay-git.git

cd yay-git/ && makepkg -si
echo "Finished installing yay" 
