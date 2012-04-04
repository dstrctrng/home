pushd ~ > /dev/null

source $HOME/.bashrc
source $HOME/.cue/.profile
source $HOME/.macports/.profile
source $HOME/.virtualbox/.profile
source $HOME/.vim/.profile
source $HOME/.hubflow/.profile
source $HOME/.bash/bin/_git
source $HOME/.rvm/.profile
#source $HOME/.rbenv/.profile
source $HOME/.bash/bin/_x11
[[ -r $(which virtualenvwrapper.sh 2>&-) ]] && source virtualenvwrapper.sh
[[ -d $HOME/.virtualenvs/shocco ]] && source $HOME/.virtualenvs/shocco/bin/activate

rvm ree

popd > /dev/null

