function ql {
    qlmanage -p "$@" >& /dev/null
}

function git-edit-conflicts {
    git st | grep '^UU' | awk '{ print $2 }' | xargs subl
}

function kill-launch-services {
    /System/Library/Frameworks/CoreServices.framework/Versions/A/Frameworks/LaunchServices.framework/Versions/A/Support/lsregister -kill -seed -r -v
}

function unlock-keychain {
    security unlock-keychain ~/Library/Keychains/login.keychain
}
