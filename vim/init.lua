local vim = vim
local Plug = vim.fn['plug#']

-- Plug set-up

vim.call('plug#begin')
Plug('~/.local/share/nvim/plugged')

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

-- Set color scheme (you may need to install a color scheme first)
-- vim.cmd('colorscheme desert')

-- Map keys to switch between buffers
vim.api.nvim_set_keymap('n', '<C-n>', ':bnext<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<C-p>', ':bprevious<CR>', { noremap = true, silent = true })

-- Enable persistent undo
vim.opt.undofile = true
vim.opt.undodir = vim.fn.expand('$HOME/.config/nvim/undo')
