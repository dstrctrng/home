shome="$HOME"
source "$shome/bin/_meat"

: ${MACPORTS:="$shome/local"}
: ${VAGRANT:="$shome/vm"}
: ${CUE:="$shome/.cue"}
: ${PS1_LEFT:='${prn_git}${prn_pwd}'}
: ${PS1_RIGHT:='${prn_ssh}'}

require 'macports'
require 'rvm'
require 'hubflow'
require 'ubuntu'

require 'aliases'
require 'terminal'
require 'osx'
require 'cue'

require 'vim'
require 'git'
require 'xmonad'
