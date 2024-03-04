runtime colors/quiet.vim

let g:colors_name = 'quiet-mc'

if &background ==# 'dark'
  hi Comment guifg=#707070 ctermfg=8 gui=none cterm=none
  hi Constant guifg=#fafafa ctermfg=15
  hi Cursor guifg=#dadada guibg=#000000 gui=reverse cterm=reverse
  hi PreProc guifg=#5fafff ctermfg=4
  hi Special guifg=#00afaf ctermfg=6
  hi Statement guifg=#fafafa ctermfg=15 gui=bold cterm=bold
  hi String guifg=#ffaf00 ctermfg=3 gui=none cterm=none
else
  hi Comment guifg=#626262 ctermfg=8 gui=none cterm=none
  hi Constant guifg=#000000 ctermfg=0
  hi Normal guifg=#303030
  hi PreProc guifg=#0087d7 ctermfg=4
  hi Special guifg=#008787 ctermfg=6
  hi Statement guifg=#000000 ctermfg=0 gui=bold cterm=bold
  hi String guifg=#d78700 ctermfg=3 gui=none cterm=none
endif

hi helpHyperTextJump gui=underline cterm=underline

hi! link cType Statement
hi! link cppType cType
hi! link vimParenSep Normal
hi! link yamlKeyValueDelimiter Normal
