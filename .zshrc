export BROWSER='open'
export EDITOR='vim'
export VISUAL='vim'
export PAGER='less'
export LESS='-F -g -i -M -R -S -w -X -z-4'

# unfortunately we have to do this because
# path_helper destroys the order of $PATH
source "$HOME/.zshenv"

source "$HOME/.zprezto/init.zsh"

unsetopt CORRECT
unsetopt AUTO_REMOVE_SLASH
unsetopt SHARE_HISTORY

source "$HOME/.zsh/aliases.zsh"
source "$HOME/.zsh/utils.zsh"
source "$HOME/.zsh/fzf.zsh"

if [[ -f "$HOME/.zsh/pep-utils.zsh" ]]; then
    source "$HOME/.zsh/pep-utils.zsh"
fi

export PURE_GIT_DIRTY=' %F{88}●'
export PURE_GIT_DOWN_ARROW='%F{220}⬋'
export PURE_GIT_UP_ARROW='%F{34}⬈'
export PURE_PROMPT_SYMBOL='🐙 ❯'
