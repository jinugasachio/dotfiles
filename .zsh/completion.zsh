autoload -Uz compinit && compinit                                # compsysで用意されている全ての補完機能を有効にする  
autoload -U +X bashcompinit && bashcompinit
complete -C '/usr/local/bin/aws_completer' aws                   # awscliの補完
complete -o nospace -C /usr/local/bin/terraform terraform
fpath=(~/.zsh/completion $fpath)
source <(kubectl completion zsh)
[[ /usr/local/bin/kubectl ]] && source <(kubectl completion zsh) 

# *********************************
#
# 補完スタイルの設定
#
# *********************************
zstyle ':completion:*' group-name ''              # 補完候補をタグ毎にグループ分けする
zstyle ':completion:*' format '%BCompleting %d%b' # グループの説明を候補一覧の上に出力する
zstyle ':completion:*' menu true select           # メニュー補完を有効にし候補一覧をカーソルで選択できるようにする