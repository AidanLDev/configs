" File should live in C:/Users/<UserName>/_vimrc/.vimrc
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

" Enable system clipboard (note the difference from Neovim)
set clipboard=unnamed

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
if has('persistent_undo')
    set undofile
    set undodir=$HOME/vimfiles/undo
endif

" Set the correct file encoding
set encoding=utf-8

" Disable creation of backup and swap files
set nobackup
set noswapfile

" Enable backspace in insert mode
set backspace=indent,eol,start

" Always show status line
set laststatus=2

" Enable command-line completion
set wildmenu

" Highlight search results
set hlsearch