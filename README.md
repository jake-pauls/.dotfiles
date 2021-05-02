<h1 align="center">.dotfiles</h1>
<h4 align="center">aka: my life in archlinux</h4>

---

<p align="center">
    <img src="skynet.png" alt="Skynet" />
</p>

---

## Overview
- **OS** - [ArchLinux](https://archlinux.org/)
- **Window Manager** - [Awesome](https://awesomewm.org/)
- **Text Editor** - [Neovim](https://neovim.io/)
- **Terminal** - [Alacritty](https://github.com/alacritty/alacritty)
- **Shells**
  - [bash](https://www.gnu.org/software/bash/)
  - [fish](https://fishshell.com/) (main)
- **Shell Prompt** - [Starship](https://starship.rs/)
- **Package Managers**
  - [pacman](https://wiki.archlinux.org/title/pacman) (Arch Base Repositories)
  - [yay](https://github.com/Jguer/yay) (AUR)
- **File Managers**
  - [pcmanfm](https://wiki.archlinux.org/title/PCManFM) (GUI)
  - [ranger](https://github.com/ranger/ranger) (CLI)
- **CLI Tools (that are currently changing my life)**
  - [bat](https://github.com/sharkdp/bat)
  - [ripgrep](https://github.com/BurntSushi/ripgrep)
  - [fd](https://github.com/sharkdp/fd)

## Installation
Note: Ensure you grab the proper video drivers for your graphics card.
My configuration installis the `nvidia` proprietary drivers.

To grab my latest configuration, clone this repository in your root directory and run the following:
```
# ~/.dotfiles/.scripts/...
./connect-the-dots
```

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
