#!/bin/bash

cd
source $HOME/.bash_profile

xsetroot -solid '#000000'
xrdb -merge .Xresources
xmodmap .Xmodmap

xset b 0
xset r rate 250 60

xv -root -quit -maxpect ~/Dropbox/images/Christina-Ricci-984.JPG

exec xmonad
