PATH='/usr/bin:/bin:/usr/sbin:/sbin:/usr/local/bin:/usr/local/git/bin'

shome="$HOME"
source "$shome/bin/_meat"

require 'macports'
require 'virtualbox'

require 'vim'
require 'hubflow'

require 'git'
require 'shocco'
require 'xmonad'

require 'cue'
source $HOME/.bashrc

require 'rvm'
rvm ree
