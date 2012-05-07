source $HOME/.bashrc
source $HOME/.macports/.profile
source $HOME/.virtualbox/.profile
source $HOME/.vim/.profile
source $HOME/.hubflow/.profile
source $HOME/.bash/bin/_git
source $HOME/.rvm/.profile
source $HOME/.bash/bin/_x11

source $HOME/.bash/bin/_shocco
source $HOME/.cue/.profile

if ! rbenv local 2>&- > /dev/null; then
  ree_ruby="$(rvm list strings | grep ^ree | sort | head -1)"
  if [[ -n "$ree_ruby" ]]; then
    rbenv local $ree_ruby
  fi
fi
