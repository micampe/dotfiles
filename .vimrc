syntax on
filetype plugin indent on

colorscheme jellybeans

source ~/.vim/packages.vim

" options ---

set encoding=utf-8
set scrolloff=3
set hidden
set nostartofline
set showcmd

" Indentation
set nowrap
set tabstop=8
set shiftwidth=4
set softtabstop=4
set shiftround
set expandtab

" Searching
set incsearch
set ignorecase
set smartcase
set infercase

" Status bar
set ruler
set laststatus=2
set wildmenu
set wildmode=longest:full,full

" allow backspacing over everything in insert mode
set backspace=indent,eol,start

" save backups, undo and swaps in the same dir
let backup_dir = '~/var/vim//'
if !filereadable(backup_dir)
    execute 'silent !mkdir -p ' . backup_dir . ' > /dev/null 2>&1'
endif
execute 'set backupdir=' . backup_dir
execute 'set directory=' . backup_dir
execute 'set undodir=' . backup_dir
set undofile

" mappings ---

nnoremap j gj
nnoremap k gk
nnoremap gj j
nnoremap gk k

cnoremap <expr> %% expand("%:p:h")."/"
nmap <leader>e :edit %%
nmap <leader>f :find %%

nmap <C-l> :set hls!<cr>

noremap <leader>b :ls<cr>:
noremap <silent> <leader>` :b#<cr>
noremap <silent> <leader>[ :bprev<cr>
noremap <silent> <leader>] :bnext<cr>

" jump to first non-whitespace on line, jump to begining of line if already at first non-whitespace
noremap <expr> <silent> 0 col('.') == match(getline('.'),'\S')+1 ? '0' : '^'

noremap <silent> [s :ScratchOpen<cr>
noremap <silent> ]s :ScratchClose<cr>

function! s:ShowHelp(tag) abort
  if winheight(0) * 2 < winwidth(0)
    execute 'vertical botright help '.a:tag
  else
    execute 'help '.a:tag
  endif
endfunction
command! -nargs=1 -complete=help Help call s:ShowHelp(<f-args>)

" typos
cnoremap <expr> X (getcmdtype() is# ':' && empty(getcmdline())) ? 'x' : 'X'
cnoremap <expr> Q (getcmdtype() is# ':' && empty(getcmdline())) ? 'q' : 'Q'

" fzf
nmap <leader>o :Files<cr>
nmap <leader>l :Buffers<cr>
nmap <leader>i :History<cr>

" plugins ---

" bufferline
let g:bufferline_echo = 1
let g:bufferline_show_bufnr = 0
let g:bufferline_modified = '*'
let g:bufferline_rotate = 0

if !g:bufferline_echo
    autocmd VimEnter *
        \ let &statusline='%{bufferline#refresh_status()}'
            \ .bufferline#get_status_string()
    let g:bufferline_active_buffer_left = ''
    let g:bufferline_active_buffer_right = ''
    let g:bufferline_inactive_highlight = 'StatusLine'
    let g:bufferline_active_highlight = 'Visual'
endif
