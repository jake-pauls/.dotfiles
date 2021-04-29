#!/bin/bash
# Removes existing files in home directory and symlinks files from .dotfiles repo

# Variables
dotfiles_path=~/.dotfiles

# dotfiles to symlink
echo "Loading configured dotfiles..."
dotfiles=(
	".gitconfig"
	".bashrc"
	".vimrc"
    ".Xresources"
    ".config/nitrogen"
    ".config/awesome"
    ".config/alacritty"
    ".config/polybar"
    ".config/picom"
)

if [ ! -d "$HOME/.config" ]
then
	echo "Creating .config directory in $HOME"
	mkdir ~/.config
fi

# Remove dotfiles in home, symlink to .dotfiles repo
echo "Symlinking dotfiles to \$HOME"
for dotfile in "${dotfiles[@]}"; do
	rm -rf ~/$dotfile 
	ln -sf $dotfiles_path/$dotfile ~/$dotfile
done
