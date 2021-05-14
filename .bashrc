# Jake Pauls
# https://jacobpauls.dev
# https://github.com/jacob-pauls

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

alias ls='ls --color=auto'

# Default Gentoo Prompt
#if [[ ${EUID} == 0 ]] ; then
#    PS1='\[\033[01;31m\]\h\[\033[01;34m\] \W \$\[\033[00m\] '
#else
#    PS1='\[\033[01;32m\]\u@\h\[\033[01;34m\] \w \$\[\033[00m\] '
#fi

# Uncomment to launch the starship prompt
eval "$(starship init bash)"
