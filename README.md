<h1 align="center">.dotfiles (aka: my life in archlinux)</h1>

## Overview
There's nothing here yet.

## Installation
Note: Ensure you grab the proper video drivers for your graphics card.
My configuration installis the `nvidia` proprietary drivers.

To grab my latest configuration, clone this repository and run the following:
```
bash .dotfiles/.scripts/connect_the_dots.sh
```

## Dual Booting Arch/Windows (Legacy/BIOS)
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
