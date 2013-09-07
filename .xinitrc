#!/bin/bash

cd

if [[ x"$BASH" != x"/bin/bash" ]]; then
  exec /bin/bash "$HOME/.xinitrc"
fi

source ~/.bash_profile

xsetroot -solid '#000000'
xrdb -merge .Xresources
xmodmap .Xmodmap

xset b 0
xset r rate 250 60

xterm -ls +sb -fb fixed &
xterm -ls +sb -fb fixed &*

exec ~/Library/Haskell/bin/xmonad
