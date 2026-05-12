#!/bin/zsh -e

: 'setup environment' && {
  export DOTPATH=$(pwd)
  mkdir -p ~/.zsh ~/.config/ghostty ~/.config/yazi/plugins
}

: 'install zsh-autosuggestions' && {
  git clone https://github.com/zsh-users/zsh-autosuggestions ~/.zsh/zsh-autosuggestions
}

: 'install zshrc' && {
  ln -s $DOTPATH/.zshrc ~/.zshrc
  ln -s $DOTPATH/.zshenv ~/.zshenv
  for FILE in $(find $DOTPATH/.zsh/ -type f);
  do
    FILENAME=$(basename $FILE)
    ln -s $DOTPATH/.zsh/$FILENAME ~/.zsh/$FILENAME
  done
  ln -s $DOTPATH/.config/ghostty/config ~/.config/ghostty/config
  ln -s $DOTPATH/.config/starship.toml ~/.config/starship.toml
  ln -s $DOTPATH/.config/yazi/yazi.toml ~/.config/yazi/yazi.toml
  ln -s $DOTPATH/.config/yazi/keymap.toml ~/.config/yazi/keymap.toml
  ln -s $DOTPATH/.config/yazi/plugins/resize-pane.yazi ~/.config/yazi/plugins/resize-pane.yazi
  echo installed successfully
}
