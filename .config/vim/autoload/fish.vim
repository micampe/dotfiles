" vim now supports fish syntax, but not completion
" taken from https://github.com/khaveesh/vim-fish-syntax

function! fish#Complete(findstart, base) abort
  if a:findstart
    return getline('.') =~# '\v^\s*$' ? -1 : 0
  else
    if empty(a:base)
      return []
    endif
    let l:results = []
    let l:base = substitute(a:base, '"', "'", "")
    let l:completions =
          \ system('fish -c "complete -C'.shellescape(l:base).'"')
    let l:sufpos = match(a:base, '\v\S+$')
    if l:sufpos >= 0
      let l:cmd = a:base[:l:sufpos-1]
      let l:arg = a:base[l:sufpos:]
    else
      let l:cmd = a:base
      let l:arg = ''
    endif
    for l:line in filter(split(l:completions, '\n'), '!empty(v:val)')
      let l:tokens = split(l:line, '\t')
      let l:term = l:tokens[0]
      if l:term =~? '^\V'.l:arg
        call add(l:results, {
              \    'word': l:cmd.l:term,
              \    'abbr': l:term,
              \    'menu': get(l:tokens, 1, ''),
              \    'dup': 1
              \  })
      endif
    endfor
    return l:results
  endif
endfunction
