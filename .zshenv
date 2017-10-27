export BROWSER='open'
export EDITOR='vim'
export VISUAL='vim'
export PAGER='less'
export LESS='-F -g -i -M -R -S -w -X -z-4'

typeset -gU cdpath fpath mailpath path

cdpath+=(. ~ ~/src)

path=(
  ~/bin
  ~/.gem/ruby/2.0.0/bin
  /usr/local/{bin,sbin}
  $path
)
