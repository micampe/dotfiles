if status --is-interactive
    set -x PATH ~/bin $PATH
    abbr --add --global l 'ls -F'
    abbr --add --global -- - 'cd -'
end
