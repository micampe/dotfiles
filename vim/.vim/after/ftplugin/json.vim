setlocal formatprg=jsonlint\ --sort\ preserve\ -f
setlocal equalprg=jsonlint\ --sort\ preserve\ -f
command! JsonMinimize :execute ":silent write !sh -c 'jsonlint --sort preserve -F | pbcopy'" | :redraw! | :execute "echo 'Minimized JSON copied to clipboard'"
