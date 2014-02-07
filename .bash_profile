# initialize PATH to something sane
PATH="$HOME/helpers:/usr/bin:/bin:/usr/sbin:/sbin:/usr/local/bin"

export SHLVL_INITIAL="$SHLVL"
source $HOME/.bashrc
if [[ -r /opt/golden-path ]]; then
  source /opt/golden-path/exec/_golden-path
elif [[ -r /opt/gooose ]]; then
  source /opt/goose/exec/_goose
fi
sdark
