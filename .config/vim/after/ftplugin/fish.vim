let s:save_cpo = &cpo
set cpo&vim

setlocal define=\\v^\\s*function>
setlocal include=\\v^\\s*\\.>
setlocal suffixesadd^=.fish

if executable('fish')
    setlocal omnifunc=fish#Complete
    setlocal formatprg=fish_indent
    let b:formatprg = [ 'fish_indent' ]
endif

let b:match_ignorecase = 0
let b:match_words = escape(
    \ '<%(begin|function|%(else\s\+)\@15<!if|switch|while|for)>'
    \   . ':<else\s\+if|case>:<else>:<end>',
    \ '<>%|)')
let b:match_skip = 's:comment\|string\|deref'

let &cpo = s:save_cpo
unlet s:save_cpo
