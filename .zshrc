# initialize Prezto.
if [[ -s "${ZDOTDIR:-$HOME}/.zprezto/init.zsh" ]]; then
  source "${ZDOTDIR:-$HOME}/.zprezto/init.zsh"
fi

unsetopt CORRECT
unsetopt AUTO_REMOVE_SLASH

cdpath+=(. ~ ~/src)
path=(~/bin $path)

source ~/.zsh/aliases.zsh
source ~/.zsh/utils.zsh

if [[ -f ~/.zsh/pep-utils.zsh ]]; then
    source ~/.zsh/pep-utils.zsh
fi
