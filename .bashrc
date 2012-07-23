set bell-style none
set +H

function reload {
  pushd ~ > /dev/null
  unset __meat__
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

# let pancake initialize its components
if [[ -x ~/.getting-started/bin/pancake ]]; then
  eval "$(~/.getting-started/bin/pancake init)"
else
  pushd ~ > /dev/null;
  if [[ -f /opt/.profile ]];     then source /opt/.profile; fi;
  if [[ -d .rvm ]];              then source .rvm/scripts/rvm; rvm default; fi;
  if [[ -f .rbenv/.profile ]];   then source .rbenv/.profile; fi
  if [[ -f .hubflow/.profile ]]; then source .hubflow/.profile; fi;
  if [[ -f .cue/.profile ]];     then source .cue/.profile; fi
  if [[ -f .ubuntu/.profile ]];  then source .ubuntu/.profile; fi
  popd > /dev/null;
fi
