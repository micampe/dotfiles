runtime colors/lunaperche.vim

let g:colors_name = 'lunaperche-mc'

if &background ==# 'light'
  hi Normal guibg=#efefef
  hi StatusLine guifg=#ffffff guibg=#767676
  hi StatusLineNC guifg=#767676 guibg=#c7c7c7
  hi VertSplit guifg=#c7c7c7 guibg=#c7c7c7
else
  hi MatchParen guifg=NONE guibg=#005f87 gui=NONE cterm=NONE
endif
