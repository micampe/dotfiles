path=(~/.gem/ruby/2.0.0/bin ~/bin $path)

# initialize Prezto.
if [[ -s "${ZDOTDIR:-$HOME}/.zprezto/init.zsh" ]]; then
  source "${ZDOTDIR:-$HOME}/.zprezto/init.zsh"
fi

unsetopt CORRECT
unsetopt AUTO_REMOVE_SLASH
unsetopt SHARE_HISTORY

cdpath+=(. ~ ~/src)

source ~/.zsh/aliases.zsh
source ~/.zsh/utils.zsh

if [[ -f ~/.zsh/pep-utils.zsh ]]; then
    source ~/.zsh/pep-utils.zsh
fi

export PURE_GIT_DIRTY=' %F{88}●'
export PURE_GIT_DOWN_ARROW='%F{220}⬋'
export PURE_GIT_UP_ARROW='%F{34}⬈'

if _has fzf; then
  source ~/opt/fzf/shell/completion.zsh
  source ~/opt/fzf/shell/key-bindings.zsh

  # restore the default ^T binding
  bindkey '^T' transpose-chars
  bindkey '^G' fzf-file-widget

  export FZF_DEFAULT_OPTS='--color fg:242'

  if _has ag ; then
    export FZF_DEFAULT_COMMAND='ag --hidden --ignore .git -g ""'
  elif _has ack ; then
    export FZF_DEFAULT_COMMAND='ack -f'
  fi

  if [[ -v $FZF_DEFAULT_COMMAND ]]; then
    export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"
    export FZF_ALT_C_COMMAND="$FZF_DEFAULT_COMMAND"
  fi
fi
