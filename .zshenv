typeset -gU cdpath fpath path

cdpath=(. ~ ~/src)

if [[ -d ~/.gem ]]; then
    path=(~/.gem/ruby/*/bin $path)
fi

path=(~/bin $path)
