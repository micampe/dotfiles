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

  if [[ -v FZF_DEFAULT_COMMAND ]]; then
    export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"
  fi
fi
