function! PackInit() abort
  packadd minpac
  call minpac#init({'status_open': 'horizontal'})

  " minpac
  call minpac#add('https://github.com/k-takata/minpac.git', {'type': 'opt'})

  " color schemes
  call minpac#add('https://github.com/cocopon/iceberg.vim', {'type': 'opt'})
  call minpac#add('https://github.com/fxn/vim-monochrome.git', {'type': 'opt'})
  call minpac#add('https://github.com/nanotech/jellybeans.vim.git', {'type': 'opt'})

  " plugins
  call minpac#add('https://github.com/junegunn/fzf.vim.git')
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
  call minpac#add('https://github.com/rust-lang/rust.vim.git')
endfunction

command! PackUpdate call PackInit() | redraw | call minpac#update()
command! PackClean  call PackInit() | call minpac#clean()
command! PackStatus call PackInit() | call minpac#status()
