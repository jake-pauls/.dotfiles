# jake pauls
# https://jakepauls.dev
# https://github.com/jake-pauls

# Start starship
Invoke-Expression (&starship init powershell)

# Alias for a '#nocheckin' for the current p4 user on the default CL
# todo: verify that the P4USER auto-fills
function defaultNocheckin {
	python $HOME\.dotfiles\scripts\nocheckin.py $P4USER
}
New-Alias nocheckin defaultNocheckin

# Alias to run a diff on p4 using the p4diff.py script
# Also pipes the data into less so that it's scrollable
function p4DiffWithLess {
	p4 diff | python $HOME\.dotfiles\scripts\p4diff.py | less -r
}
New-Alias p4diff p4DiffWithLess

# Alias to start Git Bash interactively in the terminal
function startGitBash {
	& 'C:\Program Files\Git\bin\sh.exe' --login
}
New-Alias Bash startGitBash
