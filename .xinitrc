#!/bin/bash

if [[ x"$BASH" != x"/bin/bash" ]]; then
  exec /bin/bash "$HOME/.xinitrc"
fi

cd

xsetroot -solid '#000000'
xrdb -merge .Xresources
xmodmap .Xmodmap

xset b 0
xset r rate 250 60

xterm -ls +sb -fb fixed &
exec xterm -ls +sb -fb fixed
