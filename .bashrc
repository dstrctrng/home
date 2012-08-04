shome="$HOME"
source "$shome/bin/_meat"

function reload {
  pushd ~ > /dev/null
  source "$HOME/.bash_profile"
  popd > /dev/null
}

function update {
  pushd ~ > /dev/null
  git update origin master
  bundle --local
  git push -u origin HEAD:master
  reload
  reload
  popd ~ > /dev/null
}

function prompt-hello {
  echo ""
}

require 'macports'
require 'rvm'
require 'hubflow'
require 'cue'
require 'ubuntu'

require 'aliases'
require 'terminal'
require 'osx'
