local vim = vim
local Plug = vim.fn['plug#']

-- Plug set-up

vim.call('plug#begin')
Plug('terryma/vim-multiple-cursors')

-- Plugins for neo-tree https://github.com/nvim-neo-tree/neo-tree.nvim?tab=readme-ov-file
Plug('nvim-lua/plenary.nvim')
Plug('nvim-tree/nvim-web-devicons')
Plug('MunifTanjim/nui.nvim')
Plug('nvim-neo-tree/neo-tree.nvim')

-- Plugins for telescope.nvim (The fuzzy finder)
Plug ('nvim-lua/plenary.nvim')
Plug("nvim-telescope/telescope.nvim")
Plug('BurntSushi/ripgrep')

-- Vim Be Good, for practising vim stuff
Plug ('ThePrimeagen/vim-be-good')

-- Catppucin - a nice colour scheme
Plug ('catppuccin/nvim')

-- TODO: Go through this video and set-up the TS LSP https://www.youtube.com/watch?v=E5vzKgqQ8u0

vim.call('plug#end')

-- Enable syntax highlighting
vim.cmd('syntax enable')

-- Show line numbers
vim.opt.number = true

-- Show relative line numbers
vim.opt.relativenumber = true

-- Enable mouse support
vim.opt.mouse = 'a'

-- Set tab width to 4 spaces
vim.opt.tabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true

-- Enable auto-indentation
vim.opt.autoindent = true
vim.opt.smartindent = true

-- Highlight current line
vim.opt.cursorline = true

-- Enable incremental search
vim.opt.incsearch = true

-- Ignore case when searching
vim.opt.ignorecase = true
vim.opt.smartcase = true

-- Enable system clipboard
vim.opt.clipboard:append('unnamedplus')

-- Show matching brackets
vim.opt.showmatch = true

-- Enable file type detection
vim.cmd('filetype on')
vim.cmd('filetype plugin on')
vim.cmd('filetype indent on')

-- Set color scheme 
vim.cmd('colorscheme catppuccin')

-- Map keys to switch between buffers
vim.api.nvim_set_keymap('n', '<C-n>', ':bnext<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<C-p>', ':bprevious<CR>', { noremap = true, silent = true })

-- Enable persistent undo
vim.opt.undofile = true
vim.opt.undodir = vim.fn.expand('$HOME/.config/nvim/undo')

-- Set tabs as spaces AND set tab width to 2
vim.cmd("set expandtab")
vim.cmd("set tabstop=2")
vim.cmd("set softtabstop=2")
vim.cmd("set shiftwidth=2")

-- Telescope Config
local builtin = require('telescope.builtin')
vim.keymap.set('n', '<C-p>', builtin.find_files, { desc = 'Telescope find files' })

