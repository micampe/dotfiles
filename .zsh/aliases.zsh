alias ll='ls -lhF'
alias lla='ls -lhAF'
alias la='ls -AF'
alias l='ls -F'
 
alias -- -='cd -'

function mcd { mkdir -p $1 && cd $1 }
function cdp { cd $(ls ~/src/ | fzf --select-1 --query=$1) }
