runtime bundle/vim-pathogen/autoload/pathogen.vim
execute pathogen#infect()

syntax on
filetype plugin indent on

colorscheme jellybeans

set encoding=utf-8
set modelines=3
set scrolloff=3
set hidden
set nostartofline

set nopaste
set pastetoggle=<F10>

set nowrap
set tabstop=8
set shiftwidth=4
set softtabstop=4
set shiftround
set expandtab

" Searching
set hlsearch
set incsearch
set ignorecase
set smartcase
set gdefault

" Status bar
set ruler
set laststatus=2
set wildmenu

" make uses real tabs
au FileType make set noexpandtab

" wrap git commit messages
au FileType gitcommit set textwidth=79

" allow backspacing over everything in insert mode
set backspace=indent,eol,start

" save backups, undo and swaps in the same dir
silent !mkdir ~/.vim/backup > /dev/null 2>&1
set backupdir=~/.vim/backup
set directory=~/.vim/backup
set undodir=~/.vim/backup
set undofile


" --- mappings

" Opens an edit command with the path of the currently edited file filled in
map <leader>e :e <C-r>=expand("%:p:h") . "/" <cr>

nnoremap <space> <C-d>

" buffers
noremap <leader>b :ls<cr>:buffer 
noremap <C-a> :b#<cr>
noremap <C-h> :bprev<cr>
noremap <C-l> :bnext<cr>
noremap <C-k> :bprev<cr>
noremap <C-j> :bnext<cr>


" --- plugins settings

" jellybeans
let g:jellybeans_overrides = {
\    'background': { 'ctermbg': 'none', '256ctermbg': 'none' },
\}

" bufferline
let g:bufferline_echo = 0
autocmd VimEnter *
  \ let &statusline='%{bufferline#refresh_status()}'
    \ .bufferline#get_status_string()

let g:bufferline_show_bufnr = 0
let g:bufferline_active_buffer_left = ''
let g:bufferline_active_buffer_right = ''
let g:bufferline_modified = '*'
let g:bufferline_inactive_highlight = 'StatusLine'
let g:bufferline_active_highlight = 'Visual'
