#!/bin/bash

: ${DISPLAY:=}

source "$HOME/libexec/_jason"
set +efu

require 'whatever'

require 'pancake/macports_profile' $shome/local
require 'rbenv' # 'rvm'
require 'puddle'

require 'paul'
require 'aaron'
require 'vim'
require 'git'
require 'perl'

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
