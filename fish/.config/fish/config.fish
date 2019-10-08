if status --is-interactive
    set -x PATH ~/bin $PATH
    abbr --add --global l 'ls -F'
    abbr --add --global -- - 'cd -'
    # list only hidden files
    abbr --add --global lh 'ls -d1 -l .*'
end
