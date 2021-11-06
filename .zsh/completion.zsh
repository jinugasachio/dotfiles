autoload -Uz compinit && compinit
autoload -U +X bashcompinit && bashcompinit
complete -C '/usr/local/bin/aws_completer' aws #awscliの補完
complete -o nospace -C /usr/local/bin/terraform terraform
fpath=(~/.zsh/completion $fpath)
source <(kubectl completion zsh)
[[ /usr/local/bin/kubectl ]] && source <(kubectl completion zsh)