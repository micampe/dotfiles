runtime colors/quiet.vim

let g:colors_name = 'quiet-mc'

if &background ==# 'dark'
  hi Constant guifg=#fafafa
  hi Special guifg=#fafafa
  hi Statement guifg=#fafafa
  hi Cursor guifg=#dadada guibg=#000000 gui=reverse cterm=reverse
else
  hi Constant guifg=#404040
  hi Special guifg=#404040
  hi Statement guifg=#404040
endif
