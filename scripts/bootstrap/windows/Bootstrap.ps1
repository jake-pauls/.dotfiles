# jake pauls
# https://jakepauls.dev
# https://github.com/jake-pauls

# Simple bootstrap for a Windows Installation

# Install Chocolatey
iex ((New-Object System.Net.WebClient).DownloadString('https://chocolatey.org/install.ps1'))

# Install Packages in 'ChocoPackages.txt'
$packages = Get-Content ".\ChocoPackages.txt"
foreach($package in $packages) {
    Write-Host "[info] Installing Package: $package"
    choco install --yes $package
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
