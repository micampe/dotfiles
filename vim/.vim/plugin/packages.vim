function! PackInit() abort
  packadd minpac
  call minpac#init({'status_open': 'horizontal'})

  " minpac
  call minpac#add('https://github.com/k-takata/minpac.git', {'type': 'opt'})

  " color schemes
  call minpac#add('https://github.com/micampe/vim-colors-xcode.git')

  " syntax
  call minpac#add('https://github.com/georgewitteman/vim-fish')
  call minpac#add('https://github.com/keith/swift.vim.git')
  call minpac#add('https://github.com/rust-lang/rust.vim.git')

  " completion
  call minpac#add('https://github.com/lifepillar/vim-mucomplete.git')

  " plugins
  call minpac#add('https://github.com/junegunn/fzf.git', {'do': { -> fzf#install() }})
  call minpac#add('https://github.com/junegunn/fzf.vim.git')
  call minpac#add('https://github.com/michaeljsmith/vim-indent-object.git')
  call minpac#add('https://github.com/romainl/vim-cool.git')
  call minpac#add('https://github.com/tpope/vim-commentary.git')
  call minpac#add('https://github.com/tpope/vim-repeat.git')
  call minpac#add('https://github.com/tpope/vim-rsi.git')
  call minpac#add('https://github.com/tpope/vim-sensible.git')
  call minpac#add('https://github.com/tpope/vim-sleuth.git')
  call minpac#add('https://github.com/tpope/vim-surround.git')
  call minpac#add('https://github.com/tpope/vim-unimpaired.git')
  call minpac#add('https://github.com/tpope/vim-vinegar.git')
endfunction

command! PackUpdate call PackInit() | redraw | call minpac#update()
command! PackClean  call PackInit() | call minpac#clean()
