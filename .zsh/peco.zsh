function peco-change-derectory() {
  cd "$(find . -type d | peco)"  
}
zle -N peco-change-derectory
bindkey '^z' peco-change-derectory

function peco-select-history() {
  BUFFER=$(\history -n -r 1 | peco --query "$LBUFFER")
  CURSOR=$#BUFFER
  zle clear-screen
}
zle -N peco-select-history
bindkey '^r' peco-select-history
