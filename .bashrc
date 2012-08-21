#!/bin/bash

: ${DISPLAY:=}

source "$HOME/bin/_jason"
set -u

require 'macports' $shome/local
require 'rvm'

require 'paul'
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
require 'ssh'

if [[ -n "${PATH_OVERRIDE:-}" ]]; then
  PATH="$PATH_OVERRIDE:$PATH"
fi
