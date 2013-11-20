#!/bin/bash

: ${DISPLAY:=}

: ${GANDALF:=$shome}
export GANDALF

source "$HOME/libexec/_jason"
set +efu

require 'whatever'

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

ulimit -n 4000
PATH="$HOME/pkg/bin:$HOME/pkg/sbin:$PATH"

if [[ -f ~/.siterc ]]; then
  source ~/.siterc
fi
