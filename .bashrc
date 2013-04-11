#!/bin/bash

: ${DISPLAY:=}

source "$HOME/libexec/_jason"
set +efu

require 'whatever'

require 'pancake/macports_profile' $shome/local
if [[ ! -f /etc/profile.d/rvm.sh ]]; then
  require 'rvm' # 'rbenv'
fi
export GEM_HOME="$HOME/vendor/gems"
PATH="$GEM_HOME/bin:$PATH"
require 'puddle'

require 'paul'
require 'aaron'
require 'vim'
require 'git'
require 'perl'
require 'gandalf' "${GANDALF:-$shome}"

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
