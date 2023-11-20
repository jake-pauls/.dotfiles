# jake pauls
# https://jakepauls.dev
# https://github.com/jake-pauls

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

# Disable ls highlighting, use automatic colors otherwise
LS_COLORS=$LS_COLORS:'ow=1;34:' ; export LS_COLORS

##
## Aliases
##

# File Confirmation
alias cp="cp -i"
alias mv="mv -i"
alias rm="rm -i"

# Colorize ls output
alias ls='ls --color=auto'

# Colorize grep output (similar to rg)
alias grep='grep --color=auto'
alias egrep='egrep --color=auto'
alias fgrep='fgrep --color=auto'

# Starship Prompt
eval "$(starship init bash)"
