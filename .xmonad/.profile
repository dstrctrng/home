PATH=$HOME/.cabal/bin:$HOME/Library/Haskell/bin:$PATH
if [[ ${DISPLAY%%/*}x = "x" ]]; then
  unset DISPLAY
fi
