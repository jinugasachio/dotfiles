bindkey '^b' peco-switch-branch
bindkey '^r' peco-select-history
bindkey '^z' peco-change-derectory

function peco-switch-branch() {
    local selected_line="$(git for-each-ref --format='%(refname:short) | %(committerdate:relative) | %(committername) | %(subject)' --sort=-committerdate refs/heads refs/remotes \
        | column -t -s '|' \
        | grep -v 'origin' \
        | peco \
        | head -n 1 \
        | awk '{print $1}')"
    if [ -n "$selected_line" ]; then
        BUFFER="git switch ${selected_line}"
        CURSOR=$#BUFFER
        zle accept-line
    fi
    zle clear-screen
}
zle -N peco-switch-branch

function peco-select-history() {
    BUFFER=$(history 1 | sort -k1,1nr | perl -ne 'BEGIN { my @lines = (); } s/^\s*\d+\*?\s*//; $in=$_; if (!(grep {$in eq $_} @lines)) { push(@lines, $in); print $in; }' | peco --query "$LBUFFER")
    CURSOR=${#BUFFER}
    zle reset-prompt
}
zle -N peco-select-history

function peco-change-derectory() {
  cd "$(find . -type d | peco)"  
}
zle -N peco-change-derectory

# gcloud でプロジェクトの切り替えを楽にする
# https://blog.engineer.adways.net/entry/2018/06/08/150000
function gx() {
  projData=$(gcloud config configurations list | peco --query "$LBUFFER")
  if echo "${projData}" | grep -E "^[a-zA-Z].*" > /dev/null ; then
    config=$(echo ${projData} | awk '{print $1}')
    gcloud config configurations activate ${config}

    echo "=== The current account is as follows ==="
    gcloud config configurations list | grep "${config}"
  fi
}
