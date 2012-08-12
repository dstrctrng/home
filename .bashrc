shome="$HOME"
source "$shome/bin/_meat"

: ${MACPORTS:="$shome/local"}
: ${PS1_LEFT:='${prn_git}${prn_pwd}'}
: ${PS1_RIGHT:='${prn_ssh}'}

require 'macports'
require 'rvm'

require 'hubflow'
require 'ubuntu'
require 'vim'
require 'git'

require 'cue/pwd'
require 'cue/ssh'
require 'cue/git'
require 'cue'

require 'aliases'
require 'terminal'
require 'xmonad'

require 'osx'
require 'vagrant'
