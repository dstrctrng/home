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

# let pancake initialize its components
if [[ -x ~/.getting-started/bin/pancake ]]; then
  eval "$(~/.getting-started/bin/pancake init)"
fi
