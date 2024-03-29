<h1 align="center">.dotfiles</h1>

<p align="center">
    <!-- <img src="skynet.png" alt="Skynet" /> -->
    <img src="ultron.png" alt="Ultron" />
</p>

## Overview (✨ what I'm currently having fun with ✨)
- **OS** - [ArcoLinux](https://arcolinux.com/)
- **Window Manager** - [Awesome](https://awesomewm.org/)
- **Text Editor** - [Neovim](https://neovim.io/)
- **Terminal** - [Alacritty](https://github.com/alacritty/alacritty)
- **Shells**
  - [zsh](https://www.zsh.org/)
- **Shell Prompt** - [Starship](https://starship.rs/)
- **Package Managers**
  - [pacman](https://wiki.archlinux.org/title/pacman) (Arch Base Repositories)
  - [yay](https://github.com/Jguer/yay) (AUR)
- **File Managers**
  - [pcmanfm](https://wiki.archlinux.org/title/PCManFM) (GUI)
- **Document Reader** - [zathura](https://pwmt.org/projects/zathura/)
- **CLI Tools**
  - [bat](https://github.com/sharkdp/bat)
  - [ripgrep](https://github.com/BurntSushi/ripgrep)
  - [fd](https://github.com/sharkdp/fd)

## Personal Note: Dual Booting Arch/Windows (Legacy/BIOS)
Couldn't find as many straight forward resources regarding legacy dual booting for Arch/Windows clients.
The Arch wiki provids some insight, but if your partitioning on both machines was performed correctly - this should work perfectly fine.

0. For dual booting Arch, follow the main installation guide until installing a boot loader.
1. Install the following packages:

```
pacman -S grub os-prober ntfs-3g
```
2. Run the grub installer (specify EFI target if using a UEFI installation)
**Note: `/dev/sdX` refers to the disk containing both OSes.**
```
grub-install --target=i386-pc /dev/sdX
```
3. Run os-prober to search for additional boot loaders
```
os-prober
```
**Note: A log should appear signifying a recognized windows installation, for me - it recognized the __system reserved__ partition in particular.**

4. Create the grub configuration file
```
grub-mkconfig -o /boot/grub/grub.cfg
```
Grub should identify the windows boot loader partition when generating the config.
