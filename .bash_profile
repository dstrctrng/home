PATH='/usr/bin:/bin:/usr/sbin:/sbin:/usr/local/bin:/usr/local/git/bin'

shome="$HOME"
source "$shome/bin/_meat"

if [[ -f /opt/.profile ]]; then
  unset MACPORTS_ROOT
  source /opt/.profile
fi

require 'vim'
require 'hubflow'

require 'git'
require 'xmonad'

require 'cue'
source $HOME/.bashrc

require 'rvm'
rvm ree
require 'rbenv'
