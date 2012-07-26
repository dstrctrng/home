set bell-style none
set +H

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

pushd ~ > /dev/null;
if [[ -f bin/_rvm ]];              then source  bin/_rvm; fi
if [[ -f .rbenv/bin/_profile ]];   then source .rbenv/bin/_profile; fi
if [[ -f .hubflow/bin/_profile ]]; then source .hubflow/bin/_profile; fi
if [[ -f .cue/bin/_profile ]];     then source .cue/bin/_profile; fi
if [[ -f .ubuntu/bin/_profile ]];  then source .ubuntu/bin/_profile; fi
popd > /dev/null;
