function! PackInit() abort
  packadd minpac
  call minpac#init()

  " color schemes
  call minpac#add('lifepillar/vim-colortemplate')

  " syntax
  call minpac#add('khaveesh/vim-fish-syntax')
  call minpac#add('keith/swift.vim')
  call minpac#add('rust-lang/rust.vim')

  " completion
  call minpac#add('lifepillar/vim-mucomplete')

  " plugins
  call minpac#add('junegunn/fzf', {'do': { -> fzf#install() }})
  call minpac#add('junegunn/fzf.vim')
  call minpac#add('machakann/vim-highlightedyank')
  call minpac#add('michaeljsmith/vim-indent-object')
  call minpac#add('romainl/vim-cool')
  call minpac#add('tpope/vim-commentary')
  call minpac#add('tpope/vim-repeat')
  call minpac#add('tpope/vim-rsi')
  call minpac#add('tpope/vim-sensible')
  call minpac#add('tpope/vim-sleuth')
  call minpac#add('tpope/vim-surround')
  call minpac#add('tpope/vim-unimpaired')
  call minpac#add('tpope/vim-vinegar')
endfunction

command! PackUpdate call PackInit() | redraw | call minpac#update()
command! PackClean  call PackInit() | call minpac#clean()
command! PackStatus call PackInit() | call minpac#status()
