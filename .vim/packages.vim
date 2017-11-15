command! PackUpdate packadd minpac | source $MYVIMRC | redraw | call minpac#update()
command! PackClean  packadd minpac | source $MYVIMRC | call minpac#clean()

if !exists('*minpac#init')
  finish
endif

call minpac#init()

call minpac#add('https://github.com/k-takata/minpac.git', {'type': 'opt'})

call minpac#add('https://github.com/GGalizzi/cake-vim.git', {'type': 'opt'})
call minpac#add('https://github.com/cocopon/iceberg.vim', {'type': 'opt'})
call minpac#add('https://github.com/fxn/vim-monochrome.git', {'type': 'opt'})
call minpac#add('https://github.com/nanotech/jellybeans.vim.git', {'type': 'opt'})

call minpac#add('https://github.com/junegunn/fzf.vim.git')
call minpac#add('https://github.com/ludovicchabant/vim-gutentags.git')
call minpac#add('https://github.com/svermeulen/vim-easyclip.git')
call minpac#add('https://github.com/tpope/vim-commentary.git')
call minpac#add('https://github.com/tpope/vim-repeat.git')
call minpac#add('https://github.com/tpope/vim-rsi.git')
call minpac#add('https://github.com/tpope/vim-sensible.git')
call minpac#add('https://github.com/tpope/vim-sleuth.git')
call minpac#add('https://github.com/tpope/vim-surround.git')
call minpac#add('https://github.com/tpope/vim-unimpaired.git')
call minpac#add('https://github.com/tpope/vim-vinegar.git')
call minpac#add('https://github.com/vim-scripts/ZoomWin.git')
