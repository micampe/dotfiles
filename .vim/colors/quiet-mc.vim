runtime colors/quiet.vim

let g:colors_name = 'quiet-mc'

if &background ==# 'dark'
" #000000 #d7005f #00af5f #d78700 #0087d7 #d787d7 #00afaf #dadada 
" #707070 #ff005f #00d75f #ffaf00 #5fafff #ff87ff #00d7d7 #ffffff
  hi Comment guifg=#707070 ctermfg=8 gui=none cterm=none
  hi Constant guifg=#fafafa ctermfg=15
  hi Cursor guifg=#dadada guibg=#000000 gui=reverse cterm=reverse
  hi PreProc guifg=#5fafff ctermfg=12
  hi Special guifg=#00d7d7 ctermfg=14
  hi Statement guifg=#fafafa ctermfg=15 gui=bold cterm=bold
  hi String guifg=#ffaf00 ctermfg=11 gui=none cterm=none

  hi DiffAdd gui=none cterm=none
  hi DiffChange gui=none cterm=none
  hi DiffDelete gui=none cterm=none
  hi DiffText gui=none cterm=none
else
" #000000 #af0000 #005f00 #af5f00 #005faf #870087 #008787 #d7d7d7 
" #626262 #d70000 #008700 #d78700 #0087d7 #af00af #00afaf #ffffff
  hi Comment guifg=#626262 ctermfg=8 gui=none cterm=none
  hi Constant guifg=#000000 ctermfg=0
  hi Cursor guifg=#000000 guibg=#d7d7d7 gui=reverse cterm=reverse
  hi Normal guifg=#303030
  hi PreProc guifg=#005faf ctermfg=4
  hi Special guifg=#008787 ctermfg=6
  hi Statement guifg=#000000 ctermfg=0 gui=bold cterm=bold
  hi String guifg=#af5f00 ctermfg=3 gui=none cterm=none
endif

hi helpHyperTextJump gui=underline cterm=underline

hi! link cStorageClass cType
hi! link cType Statement
hi! link cppType cType
hi! link fishInnerVariable PreProc
hi! link pythonDecoratorName pythonDecorator
hi! link vimOper Normal
hi! link vimParenSep Normal
hi! link yamlKeyValueDelimiter Normal
