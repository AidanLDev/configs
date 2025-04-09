local vim = vim
local Plug = vim.fn["plug#"]

-- Plug set-up

vim.call("plug#begin")
Plug("terryma/vim-multiple-cursors")

-- Plugins for neo-tree https://github.com/nvim-neo-tree/neo-tree.nvim?tab=readme-ov-file
Plug("nvim-lua/plenary.nvim")
Plug("nvim-tree/nvim-web-devicons")
Plug("MunifTanjim/nui.nvim")
Plug("nvim-neo-tree/neo-tree.nvim")

-- Plugins for telescope.nvim (The fuzzy finder)
Plug("nvim-lua/plenary.nvim")
Plug("nvim-telescope/telescope.nvim")
Plug("BurntSushi/ripgrep")
Plug("nvim-telescope/telescope-ui-select.nvim")

-- Vim Be Good, for practising vim stuff
Plug("ThePrimeagen/vim-be-good")

-- Catppucin - a nice colour scheme
Plug("catppuccin/nvim")

-- Tree sitter
Plug("nvim-treesitter/nvim-treesitter", { ["do"] = ":TSUpdate" })

-- NVIM-Lualine a nice nvim status bar
Plug("nvim-lualine/lualine.nvim")

-- LSP Package
Plug("williamboman/mason.nvim")
Plug("williamboman/mason-lspconfig.nvim")
Plug("neovim/nvim-lspconfig")

-- Formatting packages
Plug("nvimtools/none-ls.nvim")

-- Autocomplete and Snippet packages
Plug("hrsh7th/nvim-cmp")
Plug("hrsh7th/cmp-nvim-lsp")
Plug("L3MON4D3/LuaSnip")
Plug("saadparwaiz1/cmp_luasnip")
Plug("rafamadriz/friendly-snippets")

-- Highlight colours
Plug("rrethy/vim-hexokinase", { ["do"] = ":make hexokinase" })

-- Github copilot
Plug("github/copilot.vim")

-- Augment code (AI agent thing)
Plug("augmentcode/augment.vim")

vim.call("plug#end")

-- Enable syntax highlighting
vim.cmd("syntax enable")

-- Show line numbers
vim.opt.number = true

-- Show relative line numbers
vim.opt.relativenumber = true

-- Enable mouse support
vim.opt.mouse = "a"

-- Set tab width to 4 spaces
vim.opt.tabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true

-- Set <leader> key binding to space (by default it's a backslash '\')
vim.g.mapleader = " "

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
vim.opt.clipboard:append("unnamedplus")

-- Show matching brackets
vim.opt.showmatch = true

-- Enable file type detection
vim.cmd("filetype on")
vim.cmd("filetype plugin on")
vim.cmd("filetype indent on")

-- Set color scheme
vim.cmd("colorscheme catppuccin")

-- Map keys to switch between buffers
vim.api.nvim_set_keymap("n", "<C-n>", ":bnext<CR>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "<C-p>", ":bprevious<CR>", { noremap = true, silent = true })

-- Enable persistent undo
vim.opt.undofile = true
vim.opt.undodir = vim.fn.expand("$HOME/.config/nvim/undo")

-- Set tabs as spaces AND set tab width to 2
vim.cmd("set expandtab")
vim.cmd("set tabstop=2")
vim.cmd("set softtabstop=2")
vim.cmd("set shiftwidth=2")

-- Telescope Config
local builtin = require("telescope.builtin")
vim.keymap.set("n", "<C-p>", builtin.find_files, { desc = "Telescope find files" })
require("telescope").setup({
  defaults = {
    file_ignore_patterns = {
      "node_modules",
      "dist",
      "build",
      ".next",
    },
    hidden = true,
  },
  extentions = {
    ["ui-select"] = {
      require("telescope.themes").get_dropdown({}),
    },
  },
})

require("telescope").load_extension("ui-select")

-- Treesitter Config
local config = require("nvim-treesitter.configs")
config.setup({
  auto_install = true,
  highlight = { enabled = true },
  indent = { enabled = true },
})

-- Neo-tree config
vim.keymap.set("n", "<C-b>", ":Neotree filesystem reveal right<CR>")
require("neo-tree").setup({
  filesystem = {
    filtered_items = {
      visible = true,
      hide_dotfiles = false,
    }
  }
})

-- Lualine config
require("lualine").setup({
  options = {
    theme = "dracula",
  },
})

-- LSP Config
require("mason").setup()
require("mason-lspconfig").setup({
  ensure_installed = {
    "lua_ls",
    "rust_analyzer",
    "tailwindcss",
    "eslint",
  },
})


local capabilities = require('cmp_nvim_lsp').default_capabilities()

local lspconfig = require("lspconfig")

-- Configure Lua Language Server
lspconfig.lua_ls.setup({})

-- Configure TypeScript Language Server
lspconfig.ts_ls.setup({})

-- Configure Rust Analyzer
lspconfig.rust_analyzer.setup({
  capabilities = capabilities,
  settings = {
    ['rust-analyzer'] = {
      checkOnSave = {
        command = "clippy"
      },
      completion = {
        postfix = {
          enable = true,
        },
      },
    }
  }
})

-- Configure Tailwind CSS
lspconfig.tailwindcss.setup({
  capabilities = capabilities
})

-- Configure eslint
lspconfig.eslint.setup({
  capabilities = capabilities
})

-- Configure diagnostic display
vim.diagnostic.config({
  float = {
    border = "rounded",
    source = "always",
    header = "",
    prefix = "",
    width = 50,     -- Adjust this value to your preference
    max_width = 60, -- Maximum width of floating window
  },
})

-- Keybind to show diagnostics in a floating window
vim.keymap.set('n', '<leader>e', function()
  vim.diagnostic.open_float({ scope = "line" })
end)

vim.keymap.set("n", "K", vim.lsp.buf.hover, {})
vim.keymap.set("n", "gd", vim.lsp.buf.definition, {})
vim.keymap.set({ "n", "v" }, "<leader><CR>", vim.lsp.buf.code_action, {})

-- Keymap to format code using the lsp
vim.keymap.set("n", "<leader>f", vim.lsp.buf.format)
vim.cmd([[autocmd BufWritePre *.ts,*.tsx,*.js,*.jsx lua vim.lsp.buf.format()]])

-- None ls set-up
local null_ls = require("null-ls")
null_ls.setup({
  sources = {
    null_ls.builtins.formatting.stylua,
    null_ls.builtins.formatting.prettier,
    null_ls.builtins.formatting.rustfmt,
  },
})

vim.keymap.set("n", "<leader>pi", ":PlugInstall <CR>")


-- CMP set-up
local cmp = require("cmp")
local luasnip = require("luasnip")
require("luasnip.loaders.from_vscode").lazy_load()

cmp.setup({
  snippet = {
    expand = function(args)
      luasnip.lsp_expand(args.body)
    end,
  },
  window = {
    completion = cmp.config.window.bordered(),
    documentation = cmp.config.window.bordered(),
  },
  mapping = cmp.mapping.preset.insert({
    ["<C-b>"] = cmp.mapping.scroll_docs(-4),
    ["<C-f>"] = cmp.mapping.scroll_docs(4),
    ["<C-Space>"] = cmp.mapping.complete(),
    ["<C-e>"] = cmp.mapping.abort(),
    ["<CR>"] = cmp.mapping.confirm({ select = true }),
    ["<Tab>"] = cmp.mapping(function(fallback)
      if cmp.visible() then
        cmp.select_next_item()
      elseif luasnip.expand_or_locally_jumpable() then
        luasnip.expand_or_jump()
      else
        fallback()
      end
    end, { "i", "s" }),
    ["<S-Tab>"] = cmp.mapping(function(fallback)
      if cmp.visible() then
        cmp.select_prev_item()
      elseif luasnip.jumpable(-1) then
        luasnip.jump(-1)
      else
        fallback()
      end
    end, { "i", "s" }),
  }),
  sources = cmp.config.sources({
    { name = "nvim_lsp" },
    { name = "luasnip" },
  }, {
    { name = "buffer" },
  }),
})

-- Enable Hexokinase (the colour highlighter)
vim.g.Hexokinase_highlighters = { 'backgroundfull' }

-- Copilot set-up
vim.g.copilot_no_tab_map = true
vim.api.nvim_set_keymap("i", "<C-a>", 'copilot#Accept("<CR>")', { expr = true, silent = true, noremap = true })
