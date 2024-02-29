runtime colors/quiet.vim

let g:colors_name = 'quiet-mc'

if &background ==# 'dark'
  hi Comment guifg=#707070 gui=none
  hi Constant guifg=#fafafa
  hi Special guifg=#fafafa
  hi PreProc guifg=#5fafff
  hi String guifg=#ffaf00 gui=none
  hi Statement guifg=#fafafa gui=bold
  hi Cursor guifg=#dadada guibg=#000000 gui=reverse cterm=reverse
  hi link shQuote String
else
  hi Comment guifg=#626262 gui=none
  hi Constant guifg=#404040
  hi PreProc guifg=#00afaf
  hi String guifg=#d78700 gui=none
  hi Special guifg=#404040
  hi Statement guifg=#404040 gui=bold
  hi link shQuote String
endif
