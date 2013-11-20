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

export VAGRANT_HOME="$shome/.vagrant"
export VBOX_USER_HOME="$shome/.vagrant"

ulimit -n 4000

PATH="$shome/bin:$shome/pkg/bin:$shome/pkg/sbin:$PATH"
if [[ -n "${PATH_OVERRIDE:-}" ]]; then
  PATH="$PATH_OVERRIDE:$PATH"
fi

if [[ -f ~/.siterc ]]; then
  source ~/.siterc
fi
