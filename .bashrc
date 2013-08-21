#!/bin/bash

: ${DISPLAY:=}

: ${GANDALF:=$shome}
export GANDALF

source "$HOME/libexec/_jason"
set +efu

require 'whatever'

if [[ -d "$shome/local" ]]; then
  require 'pancake/macports_profile' $shome/local
fi

if [[ ! -f /etc/profile.d/rvm.sh ]]; then
  require 'rvm' default # 'rbenv'
fi

require 'puddle'

require 'paul'
require 'git'

require 'cue'
require 'junas'

require 'aliases'
require 'terminal'
require 'xmonad'

require 'osx'
require 'vagrant'
require 'ssh'

if [[ -n "${PATH_OVERRIDE:-}" ]]; then
  PATH="$PATH_OVERRIDE:$PATH"
fi

if [[ -f ~/.siterc ]]; then
  source ~/.siterc
fi
