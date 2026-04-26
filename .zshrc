# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

typeset -U path PATH
path=(/opt/homebrew/bin /opt/homebrew/sbin /usr/local/bin /usr/local/sbin $path)

: "load powerlevel10k files" && {
  source "$HOME/powerlevel10k/powerlevel10k.zsh-theme"
  source "$HOME/dotfiles/.zsh/p10k.zsh" # To customize prompt, run `p10k configure` or edit p10k.zsh.
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
[[ -d ~/.rbenv ]] && path=("$HOME/.rbenv/bin" $path)
if command -v rbenv >/dev/null 2>&1; then
  eval "$(rbenv init -)"
fi

# Python
export PYENV_ROOT="$HOME/.pyenv"
[[ -d "$PYENV_ROOT/bin" ]] && path=("$PYENV_ROOT/bin" $path)
if command -v pyenv >/dev/null 2>&1; then
  eval "$(pyenv init --path)"
  eval "$(pyenv init -)"
fi

# Go
export GOENV_ROOT="$HOME/.goenv"
export GOPATH=$HOME/go
[[ -d "$GOENV_ROOT/bin" ]] && path=("$GOENV_ROOT/bin" $path)
if command -v goenv >/dev/null 2>&1; then
  eval "$(goenv init -)"
fi
[[ -n "${GOROOT:-}" ]] && path=("$GOROOT/bin" $path)
path=($path "$GOPATH/bin")

setopt no_beep # ビープ音を消す

bindkey -e

# direnvをzsh上で有効にする
if command -v direnv >/dev/null 2>&1; then
  eval "$(direnv hook zsh)"
fi

# gh
if command -v gh >/dev/null 2>&1; then
  eval "$(gh completion -s zsh)"
fi

# saml2aws
if command -v saml2aws >/dev/null 2>&1; then
  eval "$(saml2aws --completion-script-zsh)"
fi

# AQUA
export PATH="${AQUA_ROOT_DIR:-${XDG_DATA_HOME:-$HOME/.local/share}/aquaproj-aqua}/bin:$PATH"
