" toggle background if the color scheme supports it
function! ToggleBackground() abort
  let oldcolors = exists("g:colors_name") ? g:colors_name : "default"
  if &background == 'light'
    set background=dark
  else
    set background=light
  endif
  if !exists("g:colors_name") || oldcolors != g:colors_name
    execute 'colorscheme ' . oldcolors
    redraw | echo oldcolors . ' does not support changing the background'
  endif
endfunction

command ToggleBackground call ToggleBackground()
nnoremap yob :call ToggleBackground()<cr>
