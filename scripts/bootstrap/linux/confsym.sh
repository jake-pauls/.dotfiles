#!/bin/bash

# Jake Pauls
# https://jakepauls.dev
# https://github.com/jake-pauls

# Configures sym links...
# Removes existing files in home directory and symlinks files from .dotfiles repo

# Variables
dpath=~/.dotfiles

# dotfiles to symlink
echo "[info] Loading configured dotfiles..."

# Add .config directory
cd ~ && mkdir .config

# Manually configured symlinks
rm ~/.bashrc
ln -sf $dpath/config/bash/.bashrc ~/.bashrc

rm ~/.zshrc
ln -sf $dpath/config/zsh/.zshrc ~/.zshrc

rm ~/.vimrc
ln -sf $dpath/config/vim/.vimrc ~/.vimrc

rm ~/.config/starship.toml
ln -sf $dpath/config/starship/starship.toml ~/.config/starship.toml

# Append some sane path defaults from this .dotfiles repo only
cat $dpath/misc/linux/.profile > ~/.profile
echo "[info] Appended \$PATH defaults to ~/.profile."

# .config symlinks
dotfiles=(
  "config/alacritty"
  "config/git"
  "config/nvim"
)

if [ ! -d "$HOME/.config" ]
then
  echo "[info] Creating .config directory in $HOME"
  mkdir ~/.config
fi

# Remove dotfiles in home, symlink to .dotfiles repo
echo "Symlinking dotfiles to \$HOME"
for dotfile in "${dotfiles[@]}"; do
  echo "[warn] Removing ~/.${dotfile}"
  rm -rf ~/.$dotfile
  echo "[info] Creating symlink for ~/.${dotfile}"
  ln -sf $dpath/$dotfile ~/.$dotfile
done

echo "[info] Successfully configured symlinks. Please validate ~/.profile before refreshing your shell."
