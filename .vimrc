runtime bundle/vim-pathogen/autoload/pathogen.vim
execute pathogen#infect()

syntax on
filetype plugin indent on

colorscheme jellybeans

set encoding=utf-8
set scrolloff=3
set hidden
set nostartofline
set path+=**

set nopaste
set pastetoggle=<F10>

" Indentation
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

nmap <leader>e :edit <C-r>=expand("%:p:h")."/" <cr>
nmap <leader>f :find <C-r>=expand("%:p:h")."/" <cr>
nmap <leader>u :nohlsearch<cr>

" buffers
noremap <leader>b :ls<cr>:b 
noremap <leader>` :b#<cr>
noremap <C-p> :bprev<cr>
noremap <C-n> :bnext<cr>


" --- plugins settings

" fzf.vim
nmap <leader>o :Files<cr>
nmap <leader>l :Buffers<cr>
nmap <leader>i :History<cr>

" jellybeans
let g:jellybeans_overrides = { 'background': { 'ctermbg': 'none', '256ctermbg': 'none' } }

" bufferline
let g:bufferline_echo = 1
let g:bufferline_show_bufnr = 0
let g:bufferline_modified = '*'

if !g:bufferline_echo
    autocmd VimEnter *
        \ let &statusline='%{bufferline#refresh_status()}'
            \ .bufferline#get_status_string()
    let g:bufferline_active_buffer_left = ''
    let g:bufferline_active_buffer_right = ''
    let g:bufferline_inactive_highlight = 'StatusLine'
    let g:bufferline_active_highlight = 'Visual'
endif
