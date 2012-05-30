PATH='/usr/bin:/bin:/usr/sbin:/sbin:/usr/local/bin:/usr/local/git/bin'

shome="$HOME"
source "$shome/bin/_meat"

if [[ -f /opt/.profile ]]; then
  source /opt/.profile
fi

require 'vim'
require 'hubflow'

require 'git'
require 'shocco'
require 'xmonad'

require 'cue'
source $HOME/.bashrc

require 'rvm'
rvm ree
require 'rbenv'
