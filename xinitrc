#!/bin/sh
#
# ~/.xinitrc
#
# Executed by startx (run your window manager from here)

XRESOURCES=$HOME/.Xresources
export LANG=en_US.utf8

[ -r $XRESOURCES ] && xrdb -merge $XRESOURCES -I.Xresources.d/

# quiet version of which
_which(){
    which >/dev/null 2>&1
}

# (run if exists)
# simplifies running which checks on startup commands
_rie(){
    _which $1 && $*
}

# Scripts and services to start just after X11
[ -r $XRESOURCES ] && xrdb -I.Xresources.d/ -merge $XRESOURCES
_rie nvidia-settings -a InitialPixmapPlacement=2
_which ssh-agent && _ssh-agent
[ -x $HOME/.dotfiles/scripts/xrandr.sh ] && $HOME/.dotfiles/scripts/xrandr.sh

if [ -d /etc/X11/xinit/xinitrc.d ]; then
  for f in /etc/X11/xinit/xinitrc.d/*; do
    [ -x "$f" ] && . "$f"
  done
  unset f
fi

if [ -n "$1" ]
then
  [ -n "$(which $1)" ] && exec {1:-i3}
else
  exec i3
fi

xset +fp /home/caleb/.fonts
xset fp rehash
