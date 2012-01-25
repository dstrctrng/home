for a in $(set | grep ^rvm_ | grep = | cut -d= -f1); do
  unset $a
done

if [[ -f /usr/local/rvm/scripts/rvm ]]; then
  export rvm_prefix="/usr/local"
  export rvm_path="${rvm_prefix}/rvm"
  source ${rvm_path}/scripts/rvm
elif [[ -f /etc/profile.d/rvm.sh ]]; then
  source /etc/profile.d/rvm.sh
else
  source $HOME/.rvm/scripts/rvm
fi
