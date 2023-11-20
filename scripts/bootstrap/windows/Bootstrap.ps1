# jake pauls
# https://jakepauls.dev
# https://github.com/jake-pauls

# Bootstraps a Windows Installation

##########################
## Package Installation ##
##########################

# Install Chocolatey
iex ((New-Object System.Net.WebClient).DownloadString('https://chocolatey.org/install.ps1'))

# Install Packages in 'ChocoPackages.txt'
$packages = Get-Content ".\ChocoPackages.txt"
foreach($package in $packages) {
    Write-Host "[info] Installing Package: $package"
    choco install --yes $package
}

##############
## Symlinks ##
##############

# Config Directory
md -Force $HOME\.config

# Starship
ni $HOME\.dotfiles\config\starship\starship.toml -i SymbolicLink -ta "$HOME\.config\"

# Git Configuration
ni $HOME\.dotfiles\config\git\config -i SymbolicLink -ta "$HOME\.gitconfig"

# Default PowerShell Configuration
ni $HOME\.dotfiles\misc\windows\Microsoft.PowerShell_profile.ps1 -i SymbolicLink -ta "$HOME\Documents\WindowsPowerShell"
