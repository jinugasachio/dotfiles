#!/bin/zsh -e

: 'setup environment' && {
  export DOTPATH=$(pwd)
  mkdir ~/.zsh
}

: 'install powerlevel10k' && {
  git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ~/powerlevel10k
}

: 'install zsh-autosuggestions' && {
  git clone https://github.com/zsh-users/zsh-autosuggestions ~/.zsh/zsh-autosuggestions
}

: 'install zshrc' && {
  ln -s $DOTPATH/.zshrc ~/.zshrc
  for FILE in $(find $DOTPATH/.zsh/ -type f);
  do
    FILENAME=$(basename $FILE)
    ln -s $DOTPATH/.zsh/$FILENAME ~/.zsh/$FILENAME
  done
  echo installed successfully
}
