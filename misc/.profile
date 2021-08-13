#!/bin/sh

# ENV
export LANG="en_US.UTF-8"
export TERM="xterm-256color"
export EDITOR="nvim"
export TERMINAL="alacritty"
export CC="clang"
export CCX="clang++"
export DOTFILES="$HOME/.dotfiles"
export GOPATH="$HOME/.local/go"
export GOBIN="$HOME/.local/go/bin"
export CARGO="$HOME/.cargo/env"
export RANGER_LOAD_DEFAULT_RC=FALSE

# PATH
export PATH="$HOME/.dotfiles/scripts:$PATH"
export PATH="$HOME/.local/go/bin:$PATH"

