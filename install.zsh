#!/bin/zsh -e

: 'setup environment' && {
  export DOTPATH=$(pwd)
  mkdir ~/.zsh
}

: 'install zshrc' && {
  ln -s $DOTPATH/.zshrc ~/.zshrc
  for FILE in $(find $DOTPATH/.zsh/ -type f);
  do
    FILENAME=$(basename $FILE)
    echo load $FILENAME ...
    ln -s $DOTPATH/.zsh/$FILENAME ~/.zsh/$FILENAME
    echo installed $FILENAME
  done
}