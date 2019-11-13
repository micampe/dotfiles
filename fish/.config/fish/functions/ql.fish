function ql --description 'Invoke QuickLook'
    qlmanage -p $argv > /dev/null 2>&1
end
