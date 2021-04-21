#!/bin/bash

##########################
## Package Installation ##
##########################

# OS
pacman -S xorg awesome lightdm

# UI
pacman -S picom nitrogen

# Terminal
pacman -S xterm alacritty

# yay
yay -S google-chrome polybar

# polybar ext
pacman -S network-manager-applet volumeicon 
