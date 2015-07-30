# initialize Prezto.
if [[ -s "${ZDOTDIR:-$HOME}/.zprezto/init.zsh" ]]; then
  source "${ZDOTDIR:-$HOME}/.zprezto/init.zsh"
fi

unsetopt CORRECT
unsetopt AUTO_REMOVE_SLASH
unsetopt SHARE_HISTORY

cdpath+=(. ~ ~/src)
path=(~/bin $path)

source ~/.zsh/aliases.zsh
source ~/.zsh/utils.zsh

if [[ -f ~/.zsh/pep-utils.zsh ]]; then
    source ~/.zsh/pep-utils.zsh
fi

# I don't know why but git can't authenticate in the bg in a ssh session
if [[ -n "$SSH_TTY" ]]; then
   export PURE_GIT_PULL=0
fi 

export PURE_GIT_DIRTY=' %F{88}●'
export PURE_GIT_DOWN_ARROW='%F{220}⬋'
export PURE_GIT_UP_ARROW='%F{34}⬈'
