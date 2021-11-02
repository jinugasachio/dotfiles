# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

: "load powerlevel10k files" && {
  source $HOME/dotfiles/.zsh/p10k.zsh # To customize prompt, run `p10k configure` or edit p10k.zsh.
  source $HOME/powerlevel10k/powerlevel10k.zsh-theme # powerlevel10kのinstallがされていることが前提 https://github.com/romkatv/powerlevel10k#manual
}

: "load alias file" && {
  source $HOME/dotfiles/.zsh/alias.zsh
}

: "load peco file" && {
  source $HOME/dotfiles/.zsh/peco.zsh
}

# Ruby
[[ -d ~/.rbenv  ]] && export PATH=${HOME}/.rbenv/bin:${PATH} && eval "$(rbenv init -)"

# TODO: 下記をファイル分割して整理する
autoload -Uz compinit && compinit
autoload -U +X bashcompinit && bashcompinit
complete -C '/usr/local/bin/aws_completer' aws #awscliの補完
complete -o nospace -C /usr/local/bin/terraform terraform
fpath=(~/.zsh/completion $fpath)
source <(kubectl completion zsh)
[[ /usr/local/bin/kubectl ]] && source <(kubectl completion zsh)
