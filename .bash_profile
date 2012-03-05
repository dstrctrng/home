pushd ~ > /dev/null

source $HOME/.bashrc
source $HOME/.bash/bin/_cue
source $HOME/.bash/bin/_rvm
source $HOME/.bash/bin/_vim
source $HOME/.bash/bin/_macports
source $HOME/.bash/bin/_hubflow
source $HOME/.bash/bin/_git

if [[ $(uname -s) = "Darwin" ]]; then
  rvm system
else
  rvm ree
fi

popd > /dev/null
