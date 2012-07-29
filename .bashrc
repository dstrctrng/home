shome="$HOME"
source "$shome/bin/_meat"
trap 'true' SIGINT

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

export MACPORTS_ROOT="$HOME/.macports"
require 'macports'
require 'rvm'
require 'hubflow'
require 'cue'
require 'ubuntu'

set bell-style none
set +H
