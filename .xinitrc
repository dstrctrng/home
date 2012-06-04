#!/bin/bash

cd
source $HOME/.bash_profile

xsetroot -solid '#000000'
xrdb -merge .Xresources
xmodmap .Xmodmap

xset b 0
xset r rate 250 60

#xv -root -quit -maxpect ~/Dropbox/images/repetition_by_ryohei_hase-d4s74gg.jpg

echo $DISPLAY > ~/.display
terminal &
terminal &
exec xmonad
