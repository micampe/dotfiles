if status --is-interactive
    set -x PATH ~/bin $PATH

    # cd abbreviations
    abbr --add --global -- - 'cd -'

    # ls abbreviations
    abbr --add --global l 'ls -F'
    abbr --add --global l1 'ls -F1'
    abbr --add --global lh 'ls -d1 -l .*'
end
