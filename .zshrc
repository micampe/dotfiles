export BROWSER='open'
export EDITOR='vim'
export VISUAL='vim'
export PAGER='less'
export LESS='-F -g -i -M -R -S -w -X -z-4'

# unfortunately we have to do this because
# path_helper destroys the order of $PATH
source "$HOME/.zshenv"


# initialize Prezto.
if [[ -s "${ZDOTDIR:-$HOME}/.zprezto/init.zsh" ]]; then
  source "${ZDOTDIR:-$HOME}/.zprezto/init.zsh"
fi

unsetopt CORRECT
unsetopt AUTO_REMOVE_SLASH
unsetopt SHARE_HISTORY

source ~/.zsh/aliases.zsh
source ~/.zsh/utils.zsh
source ~/.zsh/fzf.zsh

if [[ -f ~/.zsh/pep-utils.zsh ]]; then
    source ~/.zsh/pep-utils.zsh
fi

export PURE_GIT_DIRTY=' %F{88}●'
export PURE_GIT_DOWN_ARROW='%F{220}⬋'
export PURE_GIT_UP_ARROW='%F{34}⬈'
