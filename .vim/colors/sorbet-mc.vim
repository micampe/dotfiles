runtime colors/sorbet.vim

let g:colors_name = 'sorbet-mc'

if &background ==# 'dark'
  hi Normal guifg=#dadada guibg=#060811
  hi Cursor guifg=#dadada guibg=#060811 gui=reverse cterm=reverse
endif
