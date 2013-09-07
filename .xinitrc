#!/bin/bash

xsetroot -solid '#000000'
xrdb -merge .Xresources
xmodmap .Xmodmap

xset b 0
xset r rate 250 60

xterm -ls +sb -fb fixed &
xterm -ls +sb -fb fixed &

exec ~/Library/Haskell/bin/xmonad
