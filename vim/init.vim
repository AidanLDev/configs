" File should be located at C:/Users/<UserName>/AppData/Local/nvmim/init.vim

" Enable syntax highlighting
syntax enable

" Show line numbers
set number

" Show relative line numbers
set relativenumber

" Enable mouse support
set mouse=a

" Set tab width to 4 spaces
set tabstop=4
set shiftwidth=4
set expandtab

" Enable auto-indentation
set autoindent
set smartindent

" Highlight current line
set cursorline

" Enable incremental search
set incsearch

" Ignore case when searching
set ignorecase
set smartcase

" Enable system clipboard
set clipboard+=unnamedplus

" Show matching brackets
set showmatch

" Enable file type detection
filetype on
filetype plugin on
filetype indent on

" Set color scheme (you may need to install a color scheme first)
" colorscheme desert

" Map keys to switch between buffers
nnoremap <C-n> :bnext<CR>
nnoremap <C-p> :bprevious<CR>

" Enable persistent undo
set undofile
set undodir=$HOME/.config/nvim/undo