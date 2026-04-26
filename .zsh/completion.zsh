autoload -Uz compinit && compinit                           # compsysで用意されている全ての補完機能を有効にする
autoload -U +X bashcompinit && bashcompinit
fpath=(~/.zsh/completion $fpath)

if command -v aws_completer >/dev/null 2>&1; then
  complete -C "$(command -v aws_completer)" aws              # awscliの補完
fi

if command -v terraform >/dev/null 2>&1; then
  complete -o nospace -C "$(command -v terraform)" terraform
fi

if command -v kubectl >/dev/null 2>&1; then
  source <(kubectl completion zsh)
fi

# helm 補完
if command -v helm >/dev/null 2>&1; then
  source <(helm completion zsh)
fi

# az 補完
if command -v brew >/dev/null 2>&1 && command -v az >/dev/null 2>&1; then
  az_completion="$(brew --prefix)/etc/bash_completion.d/az"
  [[ -r "$az_completion" ]] && source "$az_completion"
  unset az_completion
fi

# gcloud 補完
for gcloud_sdk_dir in \
  '/opt/homebrew/Caskroom/google-cloud-sdk/latest/google-cloud-sdk' \
  '/opt/homebrew/Caskroom/google-cloud-sdk'
do
  if [[ -r "$gcloud_sdk_dir/path.zsh.inc" ]]; then
    source "$gcloud_sdk_dir/path.zsh.inc"
  fi

  if [[ -r "$gcloud_sdk_dir/completion.zsh.inc" ]]; then
    source "$gcloud_sdk_dir/completion.zsh.inc"
  fi
done
unset gcloud_sdk_dir

# *********************************
#
# 補完スタイルの設定
#
# *********************************
zstyle ':completion:*' group-name ''              # 補完候補をタグ毎にグループ分けする
zstyle ':completion:*' format '%BCompleting %d%b' # グループの説明を候補一覧の上に出力する
zstyle ':completion:*' menu true select           # メニュー補完を有効にし候補一覧をカーソルで選択できるようにする
