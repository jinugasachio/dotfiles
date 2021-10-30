# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

[[ -d ~/.rbenv  ]] && \
  export PATH=${HOME}/.rbenv/bin:${PATH} && \
  eval "$(rbenv init -)"

# alias
alias a='aws'
alias acl='aws configure list'
alias d='docker'
alias dc='docker compose'
alias edit='vim ~/dotfiles/.zshrc'
alias k='kubectl'
alias kbn='kubens'
alias kcx='kubectx'
alias g='git'
alias ga='git add'
alias gc='git commit'
alias gpoh='git push origin head'
alias t='terraform'
alias ls='ls -G'
alias reload='source ~/dotfiles/.zshrc'



autoload -Uz compinit
compinit


autoload -U +X bashcompinit && bashcompinit
complete -o nospace -C /usr/local/bin/terraform terraform

fpath=(~/.zsh/completion $fpath)
source /usr/local/opt/powerlevel10k/powerlevel10k.zsh-theme

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

source <(kubectl completion zsh)
[[ /usr/local/bin/kubectl ]] && source <(kubectl completion zsh)
