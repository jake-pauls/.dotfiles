# Jake Pauls
# https://jacobpauls.dev
# https://github.com/jacob-pauls

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

alias ls='ls --color=auto'
PS1='[\u@\h \W]$ '

# Launch fish on startup if there isn't a parent process
if [[ $(ps --no-header --pid=$PPID --format=cmd) != "fish" ]]
then
    exec fish
fi

# Uncomment to launch the starship prompt
# eval "$(starship init bash)"
