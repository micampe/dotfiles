if !has('gui_running')
  autocmd! ColorScheme * highlight Normal ctermbg=None
else
  " higher contrast backgrounds
  autocmd! ColorScheme sorbet highlight Normal guibg=#060811
  autocmd! ColorScheme xcodehc 
        \ if &background == 'dark' |
        \   highlight Normal guibg=#0f0f14 | 
        \ endif
endif

let g:xcodehc_dim_punctuation = 1
