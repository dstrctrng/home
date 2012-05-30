PATH='/usr/bin:/bin:/usr/sbin:/sbin:/usr/local/bin:/usr/local/git/bin'

shome="$HOME"
source "$shome/bin/_meat"

export MACPORTS_ROOT="$HOME/.macports"
require 'macports'
require 'ubuntu'

require 'vim'
require 'hubflow'

require 'git'
require 'shocco'
require 'xmonad'

require 'cue'
source $HOME/.bashrc

require 'rvm'
rvm ree
