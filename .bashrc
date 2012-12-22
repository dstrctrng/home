#!/bin/bash

: ${DISPLAY:=}

source "$HOME/libexec/_jason"
set +efu

require 'pancake/macports_profile' $shome/local
require 'rvm'
#require 'rbenv'

require 'paul'
require 'aaron'
require 'vim'
require 'git'
require 'perl'

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
require 'ssh'

if [[ -n "${PATH_OVERRIDE:-}" ]]; then
  PATH="$PATH_OVERRIDE:$PATH"
fi

set +u
