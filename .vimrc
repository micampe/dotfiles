syntax on
filetype plugin indent on

let g:jellybeans_overrides = {
\    'background': { 'ctermbg': 'none', '256ctermbg': 'none' },
\    'MatchParen': { 'guifg': 'ffffff', 'guibg': '556779' },
\}
colorscheme jellybeans

source ~/.vim/packages.vim

" options ---

set encoding=utf-8
set scrolloff=3
set hidden
set nostartofline
set showcmd
set autoread

" Indentation
set nowrap
set tabstop=8
set shiftwidth=4
set softtabstop=4
set shiftround
set expandtab
set breakindent
set showbreak=\\\\\ \ 

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
let s:vim_data_dir = $HOME . '/var/vim//'
let s:vim_undo_dir = s:vim_data_dir . 'undo//'

if !isdirectory(s:vim_undo_dir)
  call mkdir(s:vim_undo_dir, 'p')
endif

let &backupdir=s:vim_data_dir
let &directory=s:vim_data_dir
let &undodir=s:vim_undo_dir
set undofile

" make vim recognize arcanist diffs as git commits
augroup vimrc_arcanist
  autocmd!
  autocmd BufRead new-commit setlocal filetype=gitcommit
  autocmd BufRead differential-update-comments setlocal filetype=gitcommit
augroup END

" mappings ---

nnoremap j gj
nnoremap k gk
nnoremap gj j
nnoremap gk k

cnoremap <expr> %% fnameescape(expand("%:p:h")."/")
nmap <leader>e :edit %%
nmap <leader>f :find %%

nnoremap <C-l> :set hls!<cr>

noremap <silent> <leader>- :b#<cr>
noremap <silent> <leader>[ :bprev<cr>
noremap <silent> <leader>] :bnext<cr>
noremap <silent> <leader>bd :b#<cr>:bdelete #<cr>

" change word under cursor
nnoremap c* *Ncgn
nnoremap c# #NcgN

" nicer command line history navigation
cnoremap <C-p> <up>
cnoremap <C-n> <down>

" jump to first non-whitespace on line, jump to begining of line if already at first non-whitespace
nnoremap <expr> <silent> 0 col('.') == match(getline('.'),'\S')+1 ? '0' : '^'

" split help vertically if there’s room
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

" plugins ---

" vim-easyclip shadows m for :mark
nnoremap gm m

" fzf
nnoremap <leader>o :Files<cr>
nnoremap <leader>l :Buffers<cr>
nnoremap <leader>i :History<cr>

" gutentags
let g:gutentags_cache_dir = s:vim_data_dir . "tags"
