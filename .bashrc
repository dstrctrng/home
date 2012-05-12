set bell-style none
set +H

function reload {
  pushd ~ > /dev/null
  source "$HOME/.bash_profile"
  popd > /dev/null
}

function update {
  pushd ~ > /dev/null
  git pull origin master
  git submodule update --init --recursive
  bundle --local
  git push -u origin HEAD:master
  reload
  reload
  popd ~ > /dev/null
}
