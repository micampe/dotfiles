setlocal formatprg=jsonlint\ --sort\ preserve\ -f
setlocal equalprg=jsonlint\ --sort\ preserve\ -f
command! JsonMinimize :w !sh -c 'jsonlint --sort preserve -F | pbcopy'
