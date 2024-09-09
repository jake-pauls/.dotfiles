# jake pauls
# https://jakepauls.dev
# https://github.com/jake-pauls

# Simple bootstrap for a Windows Installation

# Install Packages in 'WingetPackages.txt'
$packages = Get-Content ".\WingetPackages.txt"
foreach($package in $packages) {
    Write-Host "[info] Installing Package: $package"
    winget install -e --id $package
}

# Config Directory
md -Force $HOME\.config

# Starship
cp $HOME\.dotfiles\config\starship\starship.toml $HOME\.config\

# Git Configuration
md -Force $HOME\.config\git
cp $HOME\.dotfiles\config\git\config $HOME\.config\git\

# Default PowerShell Configuration
cp $HOME\.dotfiles\misc\windows\Microsoft.PowerShell_profile.ps1 $HOME\Documents\WindowsPowerShell
