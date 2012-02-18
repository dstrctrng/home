source $HOME/.bash/profile
for a in $(find $HOME/.bash/profile.d ! -type d | sort); do
  source $a
done
