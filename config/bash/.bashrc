# jake pauls
# https://jakepauls.dev
# https://github.com/jake-pauls

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

# Disable ls highlighting, use automatic colors otherwise
LS_COLORS=$LS_COLORS:'ow=1;34:' ; export LS_COLORS

alias ls='ls --color=auto'

# Uncomment to launch the starship prompt
eval "$(starship init bash)"
