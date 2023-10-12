let g:gutentags_ctags_executable = exepath('ctags')
let g:gutentags_cache_dir = s:vim_data_dir . "tags"
if !executable(g:gutentags_ctags_executable)
  let g:gutentags_enabled = 0
endif
