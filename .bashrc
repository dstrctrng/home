: ${DISPLAY:=}

source "$HOME/bin/_jason"
set -u

require 'macports' $shome/local
require 'rvm'

require 'hubflow'
require 'ubuntu'
require 'vim'
require 'git'

: ${PS1_LEFT:='${prn_git}${prn_pwd}'}
: ${PS1_RIGHT:='${prn_ssh}'}
require 'cue/pwd'
require 'cue/ssh'
require 'cue/git'
require 'cue'

require 'aliases'
require 'terminal'
require 'xmonad'

require 'osx'
require 'vagrant'
