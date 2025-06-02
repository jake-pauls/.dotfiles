#!/bin/bash

# Jake Pauls
# https://jakepauls.dev
# https://github.com/jake-pauls

dpath=~/.dotfiles

cd ~ && echo "[warn] This install script assumes git is installed within a basic arch installation\n"

echo "[pacman] Checking for system updates..."
sudo pacman -Syu

# SSH
echo "[pacman] Installing openssh..."
sudo pacman -S openssh

echo "Please enter your GitHub email address: "
read gh_email

ssh-keygen -t ed25519 -C $gh_email
eval "$(ssh-agent -s)"
ssh-add ~/.ssh/id_ed25519

echo "[warn] SSH key generated for this machine, in association with $gh_email."
echo "[warn] Add this public key to your GitHub account before continuing to configure SSH on this machine."

cat ~/.ssh/id_ed25519.pub

echo "Press [ENTER] to continue..."
read enter

# Update origin after SSH configuration
cd $dpath
git remote set-url origin git@github.com:jake-pauls/.dotfiles.git

# Symlink dotfiles
cd $dpath/scripts
bash confsym.sh

# Packages
lib=(
  "clang"
)

file=(
  "zathura"
  "zathura-pdf-poppler"
)

terminal=(
  "alacritty"
  "zsh"
  "starship"
  "ttf-jetbrains-mono-nerd"
)

cli=(
  "vim"
  "neovim"
  "ripgrep"
  "bat"
  "fd"
  "unzip"
)

misc=(
  "firefox"
  "discord"
)

# Installation
sudo pacman -S ${lib[@]} ${file[@]} ${terminal[@]} ${cli[@]} ${misc[@]}

# Use dash as the default shell
echo "[info] Changing default shell to zsh"
sudo chsh -s /usr/bin/zsh
