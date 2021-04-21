#!/bin/bash
# Jake Pauls
# https://jacobpauls.dev
# https://github.com/jacob-pauls

# Connects the dots...

###############
## Variables ##
###############
dotfiles_path=~/.dotfiles

cd ~ && echo "This install script assumes git is installed within a basic arch installation\n"

#########
## SSH ##
#########
sudo pacman -S openssh git

echo "Please enter your GitHub email address: "
read gh_email && echo "\n"

ssh-keygen -t ed25519 -C $gh_email 
eval "$(ssh-agent -s)"
ssh-add ~/.ssh/id_ed25519

echo "\n SSH key generated for this machine, in association with $gh_email"
echo "\nAdd this public key to your GitHub account before continuing to configure SSH on this machine\n"
echo "Press [ENTER] to continue..."
read enter 

###############
## .dotfiles ##
###############

# Symlinks 
echo "Loading configured dotfiles..."
dotfiles=(
	".gitconfig"
	".bashrc"
	".vimrc"
    ".config/nitrogen"
    ".config/awesome"
    ".config/polybar"
)

# Remove conflicting dotfiles in home, symlink to .dotfiles repo
echo "Symlinking dotfiles to \$HOME..."
for dotfile in "${dotfiles[@]}"; do
	rm -rf ~/$dotfile
	ln -sf $dotfiles_path/$dotfile ~/$dotfile
done

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

pacman  = (
    "xorg"
    "lightdm"
    "lightdm-webkit2-greeter"
    "lightdm-webkit-theme-litarvan"
    "picom"
    "nitrogen"
    "awesome"
    "alacritty"
    "xterm"
    "vim"
    "neovim"
    "NetworkManager"
    "dhcpcd"
    "network-manager-applet"
    "volumeicon"
)

yay = (
    "google-chrome"
)


# Installation
sudo pacman -S ${pacman[@]}
yay -S ${yay[@]}

# Networking
systemctl enable NetworkManager
systemctl enable dhcpcd

echo "Successfully connected the dots."
echo "Before beginning, please complete the lightdm config:"
echo "\t1. cd '/etc/lightdm/lightdm.conf' and set 'greeter-session=lightdm-webkit2-greeter'"
echo "\t2. cd '/etc/lightdm/lightdm-webkit2-greeter.conf and set 'webkit-theme = litarvan''"
echo "Happy hacking!"
