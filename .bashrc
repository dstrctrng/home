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

function req {
  local library="$1";
  shift;
  if [[ -r "$HOME/bin/_$library" ]]; then
    source "$HOME/bin/_$library";
  else
    if [[ -r "$HOME/.$library/bin/_profile" ]]; then
      source "$HOME/.$library/bin/_profile";
    else
      if [[ -r "$HOME/.$library/.profile" ]]; then
        source "$HOME/.$library/.profile";
      fi;
    fi;
  fi
}

req 'rvm'
req 'macports'
req 'hubflow'
req 'cue'
req 'ubuntu'
