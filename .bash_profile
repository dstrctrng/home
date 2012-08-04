# initialize PATH to something sane
PATH='/usr/bin:/bin:/usr/sbin:/sbin:/usr/local/bin'

export MACPORTS="$HOME/local"
export VAGRANT="$HOME/vm"
export CUE="$HOME/.cue"
export PS1_LEFT='${prn_git}${prn_pwd}'
export PS1_RIGHT='${prn_ssh}${prn_hello}'

source $HOME/.bashrc

# personal libraries
require 'vim'
require 'git'
require 'xmonad'
