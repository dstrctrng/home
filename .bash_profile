# initialize PATH to something sane
PATH='/usr/bin:/bin:/usr/sbin:/sbin:/usr/local/bin'

# load shell meat
shome="$HOME"
source "$shome/bin/_meat"

# let pancake initialize its components
eval "$(~/.getting-started/bin/pancake init)"

# personal libraries
require 'vim'
require 'git'
require 'xmonad'

# TODO HACK 
require 'cue'

# sub-shell initialization
source $HOME/.bashrc
