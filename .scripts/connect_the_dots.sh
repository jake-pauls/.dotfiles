#!/bin/bash
# Jake Pauls
# https://jacobpauls.dev
# https://github.com/jacob-pauls

# Connects the dots...
# Assumptions: Clean Arch install with git and networking configured
# Feel free to pull this repo using https, ssh configuration is one of the core install steps

###############
## Variables ##
###############
dotfiles_path=~/.dotfiles

cd ~ && echo "This install script assumes git is installed within a basic arch installation\n"

echo "Checking for system updates..."
sudo pacman -Syu

#########
## SSH ##
#########
echo "Installing openssh..."
sudo pacman -S openssh

echo "Please enter your GitHub email address: "
read gh_email

ssh-keygen -t ed25519 -C $gh_email 
eval "$(ssh-agent -s)"
ssh-add ~/.ssh/id_ed25519

echo "SSH key generated for this machine, in association with $gh_email"
echo "Add this public key to your GitHub account before continuing to configure SSH on this machine"

cat ~/.ssh/id_ed25519.pub

echo "Press [ENTER] to continue..."
read enter 

# Update origin after SSH configuration
cd ~/.dotfiles 
git remote set-url origin git@github.com:jacob-pauls/.dotfiles.git

###############
## .dotfiles ##
###############

# Symlink dotfiles
cd ~/.dotfiles/.scripts
. "./conf_symlinks.sh"

###############
## yay (AUR) ##
###############
echo "Installing the base-devel packages..."
sudo pacman -S base-devel
cd ~/.config

echo "Cloning yay from the AUR..."
git clone https://aur.archlinux.org/yay.git
cd yay && makepkg -si
cd ~

##############
## Packages ##
##############

# Replace "nvidia" with required graphics driver
pacman=(
    "nvidia" 
    "xorg"
    "xorg-xinit"
    "firefox"
    "picom"
    "nitrogen"
    "awesome"
    "dmenu"
    "alacritty"
    "xterm"
    "vim"
    "neovim"
    "ranger"
    "pcmanfm"
    "discord"
    "networkmanager"
    "alsa-utils"
    "unzip"
    "lxappearance"
)

yay=(
    "qogir-gtk-theme"
    "qogir-icon-theme"
    "spotify"
)


# Installation
sudo pacman -S ${pacman[@]}
yay -S ${yay[@]}

echo "Successfully connected the dots."
echo "Please reboot! Otherwise, happy hacking!"
