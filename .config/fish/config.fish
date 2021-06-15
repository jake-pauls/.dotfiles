# Jake Pauls
# https://jacobpauls.dev
# https://github.com/jacob-pauls

##
## General
##

# Remove fish greeting
set fish_greeting

# Use bat for reading manpages
set -x MANPAGER "sh -c 'col -bx | bat -l man -p'"

# Set autocomplete colors
set fish_color_normal brwhite
set fish_color_autosuggestion brgreen
set fish_color_command brwhite
set fish_color_error red
set fish_color_param brwhite

##
## Functions
## Bear with me! Still learning what's capable here...
##

# Creating backup files
# ex: backup code.js => code.js.temp
function backup --argument filename
    cp $filename $filename.temp
end

##
## Aliases
##

# File Confirmation
alias cp="cp -i"
alias mv="mv -i"
alias rm="rm -i"

# Arch
alias pacman="sudo pacman"
alias pacgod='yay -Syu'         # Update Standard and AUR Packages
alias pacup='sudo pacman -Syyu' # Standard Package Update
alias yayup='yay -Sua'          # Update AUR

# Utils
alias cat="bat"

# Navigation
alias drive="cd / && cd /media/Storage/FileStorage"
alias projects="cd / && cd /media/Storage/FileStorage/Projects"

alias wsl-drive="cd / && cd /mnt/e/FileStorage"
alias wsl-projects="cd / && cd /mnt/e/FileStorage/Projects"

##
## Starship
##
starship init fish | source
