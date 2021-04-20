#!/bin/bash

# Variables
dotfiles_path=~/.dotfiles

# dotfiles to symlink
echo "Loading configured dotfiles..."
dotfiles=(
	".gitconfig"
	".bashrc"
	".vimrc"
)

# Remove dotfiles in home, symlink to .dotfiles repo
echo "Symlinking dotfiles to \$HOME"
for dotfile in "${dotfiles[@]}"; do
	rm -rf ~/$dotfile
	ln -sf $dotfiles_path/$dotfile ~/$dotfile
done
