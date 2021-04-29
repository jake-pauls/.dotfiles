#!/bin/sh

# ENV
export EDITOR="nvim"
export DOTFILES="$HOME/.dotfiles"
export TERMINAL="alacritty"
export CC="gcc"
export GOPATH="$HOME/.local/go"
export GOBIN="$HOME/.local/go/bin"

# PATH
export PATH="$HOME/.dotfiles/.scripts:$PATH"
export PATH="$HOME/.local/go/bin:$PATH"
