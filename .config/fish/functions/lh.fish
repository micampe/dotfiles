function lh --wraps=ls --description 'List hidden files only'
    if count $argv > /dev/null
        if test -d $argv[1]
            pushd $argv[1]
        else
            echo "ls: $argv[1]: directory not found"
            return 1
        end
    else
        pushd .
    end
    if count .* > /dev/null
        ls -odhtr .*
    end
    popd
end
