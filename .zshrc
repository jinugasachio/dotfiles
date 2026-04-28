typeset -U path PATH
path=(/opt/homebrew/bin /opt/homebrew/sbin /usr/local/bin /usr/local/sbin $path)

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

if command -v starship >/dev/null 2>&1; then
  eval "$(starship init zsh)"
fi
