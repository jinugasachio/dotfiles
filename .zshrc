# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

: "load powerlevel10k files" && {
  source $HOME/dotfiles/.zsh/p10k.zsh # To customize prompt, run `p10k configure` or edit p10k.zsh.
  source $HOME/powerlevel10k/powerlevel10k.zsh-theme
}

: "load zsh-autosuggestions file" && {
  source ~/.zsh/zsh-autosuggestions/zsh-autosuggestions.zsh
}

: "load alias file" && {
  source $HOME/dotfiles/.zsh/alias.zsh
}

: "load function file" && {
  source $HOME/dotfiles/.zsh/function.zsh
}

: "load completion file" && {
  source $HOME/dotfiles/.zsh/completion.zsh
}

: "load peco file" && {
  source $HOME/dotfiles/.zsh/peco.zsh
}

# Ruby
[[ -d ~/.rbenv  ]] && export PATH=${HOME}/.rbenv/bin:${PATH} && eval "$(rbenv init -)"

# Python
export PYENV_ROOT="$HOME/.pyenv"
export PATH="$PYENV_ROOT/bin:$PATH"
eval "$(pyenv init --path)"
eval "$(pyenv init -)"

# Go
export GOENV_ROOT="$HOME/.goenv"
export PATH="$GOENV_ROOT/bin:$PATH"
eval "$(goenv init -)"
export PATH="$GOROOT/bin:$PATH"
export PATH="$PATH:$GOPATH/bin"
export GOPATH=$HOME/go
export PATH=$PATH:$GOPATH/bin

setopt no_beep # ビープ音を消す

bindkey -e

# direnvをzsh上で有効にする
eval "$(direnv hook zsh)"

# gh
eval "$(gh completion -s zsh)"

# saml2aws
eval "$(saml2aws --completion-script-zsh)"

# AQUA
export PATH="${AQUA_ROOT_DIR:-${XDG_DATA_HOME:-$HOME/.local/share}/aquaproj-aqua}/bin:$PATH"

