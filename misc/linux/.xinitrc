#!/bin/sh

## jake pauls
## https://jakepauls.dev
## https://github.com/jake-pauls

userresources=$HOME/.Xresources
sysresources=/etc/X11/xinit/.Xresources

source ~/.profile

if [ -f $sysresources ]; then
    xrdb -merge $sysresources
fi

if [ -f "$userresources" ]; then
    xrdb -merge "$userresources"
fi

if [ -d /etc/X11/xinit/xinitrc.d ] ; then
 for f in /etc/X11/xinit/xinitrc.d/?*.sh ; do
  [ -x "$f" ] && . "$f"
 done
 unset f
fi

nitrogen --restore &
picom &
volumeicon &
exec awesome
