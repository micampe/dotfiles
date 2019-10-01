function! s:RegisterPackages() abort
  packadd minpac
  call minpac#init()

  " minpac
  call minpac#add('https://github.com/k-takata/minpac.git', {'type': 'opt'})

  " color schemes
  call minpac#add('https://github.com/GGalizzi/cake-vim.git', {'type': 'opt'})
  call minpac#add('https://github.com/cocopon/iceberg.vim', {'type': 'opt'})
  call minpac#add('https://github.com/fxn/vim-monochrome.git', {'type': 'opt'})
  call minpac#add('https://github.com/nanotech/jellybeans.vim.git', {'type': 'opt'})

  " plugins
  call minpac#add('https://github.com/junegunn/fzf.vim.git')
  call minpac#add('https://github.com/ludovicchabant/vim-gutentags.git')
  call minpac#add('https://github.com/tpope/vim-commentary.git')
  call minpac#add('https://github.com/tpope/vim-repeat.git')
  call minpac#add('https://github.com/tpope/vim-rsi.git')
  call minpac#add('https://github.com/tpope/vim-sensible.git')
  call minpac#add('https://github.com/tpope/vim-sleuth.git')
  call minpac#add('https://github.com/tpope/vim-surround.git')
  call minpac#add('https://github.com/tpope/vim-unimpaired.git')
  call minpac#add('https://github.com/tpope/vim-vinegar.git')
  call minpac#add('https://github.com/Stautob/vim-fish')
  call minpac#add('https://github.com/keith/swift.vim.git')
endfunction

command! PackUpdate call s:RegisterPackages() | redraw | call minpac#update()
command! PackClean  call s:RegisterPackages() | call minpac#clean()

