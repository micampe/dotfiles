let g:fzf_layout= {
  \ 'window': { 
    \ 'width': 90,
    \ 'height': 20,
    \ }
  \ }

let g:fzf_preview_window = ['hidden,up,40%', 'ctrl-_']

let g:fzf_colors = {
      \ 'hl':      ['fg', 'Special'],
      \ 'hl+':     ['fg', 'Special'],
      \ 'header':  ['fg', 'PreProc'],
      \ 'info':    ['fg', 'Comment'],
      \ 'prompt':  ['fg', 'Special'],
      \ }

nnoremap <space>o :Files<cr>
nnoremap <space>O :GFiles<cr>
nnoremap <space>u :Buffers<cr>
nnoremap <space>i :History<cr>
