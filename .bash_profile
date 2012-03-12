pushd ~ > /dev/null

source $HOME/.bashrc
source $HOME/.cue/.profile
source $HOME/.macports/.profile
source $HOME/.vim/.profile
source $HOME/.bash/bin/_git
source $HOME/.hubflow/.profile
source $HOME/.rvm/.profile
#source $HOME/.rbenv/.profile
source $HOME/.bash/bin/_x11

if [[ $(uname -s) = "Darwin" ]]; then
  rvm system
else
  rvm ree
fi

popd > /dev/null
