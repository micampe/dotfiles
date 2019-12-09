if status --is-interactive
    set -x PATH ~/.local/bin $PATH
    set -x LESS "-F -g -i -M -R -S -w -X -z-4"
    set -x EDITOR vim
    set -x VISUAL vim
    set -x PAGER less

    # cd abbreviations
    abbr --add --global -- - 'cd -'

    # ls abbreviations
    abbr --add --global l 'ls'
    abbr --add --global l1 'ls -1'
end
