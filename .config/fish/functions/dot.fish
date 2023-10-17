function dot --wraps=git --description 'dotfiles repository management'
    git --git-dir=$HOME/src/dotfiles.git --work-tree=$HOME $argv
end
