# initialize PATH to something sane
PATH='/usr/bin:/bin:/usr/sbin:/sbin:/usr/local/bin'

# load shell meat
shome="$HOME"
source "$shome/bin/_meat"

# sub-shell init with pancake
source $HOME/.bashrc

# personal libraries
require 'vim'
require 'git'
require 'xmonad'
