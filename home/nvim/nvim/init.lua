-- disable netrw at the very start of your init.lua
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

vim.cmd([[
	let data_dir = has('nvim') ? stdpath('data') . '/site' : '~/.vim'
	if empty(glob(data_dir . '/autoload/plug.vim'))
	  silent execute '!curl -fLo '.data_dir.'/autoload/plug.vim --create-dirs  https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
	  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
	endif
	set runtimepath^=~/.vim runtimepath+=~/.vim/after
	let &packpath = &runtimepath
	source ~/.vimrc

	"plugins
	call plug#begin()
	" Plug 'scrooloose/nerdtree'
	" Plug 'wlangstroth/vim-racket'
	Plug 'tpope/vim-sensible'
	Plug 'nvim-tree/nvim-web-devicons' " optional
	Plug 'nvim-tree/nvim-tree.lua'

	Plug 'dracula/vim', {'as': 'dracula'}
	Plug 'nordtheme/vim'
	Plug 'catppuccin/nvim', { 'as': 'catppuccin' }

	Plug 'neovim/nvim-lspconfig'
	Plug 'numToStr/Comment.nvim'
	Plug 'ellisonleao/glow.nvim'
	Plug 'preservim/vimux'

	Plug 'mfussenegger/nvim-jdtls'

	Plug 'williamboman/mason.nvim'
	Plug 'williamboman/mason-lspconfig.nvim'

	Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
	Plug 'windwp/nvim-ts-autotag'

	Plug 'stevearc/conform.nvim'
	Plug 'hrsh7th/cmp-nvim-lsp'
	Plug 'hrsh7th/cmp-buffer'
	Plug 'hrsh7th/cmp-path'
	Plug 'hrsh7th/cmp-cmdline'
	Plug 'hrsh7th/nvim-cmp'

	Plug 'wakatime/vim-wakatime'

	Plug 'christoomey/vim-tmux-navigator'

	Plug 'L3MON4D3/LuaSnip', {'tag': 'v2.*', 'do': 'make install_jsregexp'} " Replace <CurrentMajor> by the latest released major (first number of latest release)
	Plug 'rafamadriz/friendly-snippets'

	Plug 'simrat39/rust-tools.nvim'

	Plug 'nvim-lua/plenary.nvim'
	Plug 'nvim-telescope/telescope.nvim', { 'tag': '0.1.8' }

	Plug 'olimorris/codecompanion.nvim'

	Plug 'echasnovski/mini.nvim'
	Plug 'MeanderingProgrammer/render-markdown.nvim'

	call plug#end()

	let mapleader = ","
	map <Leader>t :NvimTreeToggle<Enter>
	map <Leader>ff :Telescope find_files<Enter>
	map <Leader>fd :Telescope lsp_workspace_symbols<Enter>
	map <Leader>fs :Telescope lsp_document_symbols<Enter>
	map <Leader>g :Glow<Enter>
	map <Leader>G :Glow!<Enter>

	map <Leader>vc :VimuxPromptCommand<Enter>
	map <Leader>vr :VimuxRunLastCommand<Enter>
	map <Leader>vo :VimuxOpenRunner<Enter>
	map <Leader>vx :VimuxCloseRunner<Enter>

	map <Leader>cc :CodeCompanionChat Toggle<Enter>
	map <Leader>cn :CodeCompanionChat <Enter>
	map <Leader>ca :CodeCompanionActions <Enter>

	set termguicolors
	colorscheme catppuccin-frappe

]])

require('render-markdown').setup({
	file_types = {"markdown", "codecompanion" },
})

require('nvim-tree').setup({view = {relativenumber = true}})
require('glow').setup()
require('mason').setup()
require('Comment').setup()
require('nvim-ts-autotag').setup()

require("conform").setup({
  formatters_by_ft = {
    -- Conform will run the first available formatter
    javascript = { "prettierd", "prettier", stop_after_first = true },
    html = { "prettierd", "prettier", stop_after_first = true },
  },
  format_on_save = {
    -- These options will be passed to conform.format()
    timeout_ms = 500,
    lsp_format = "fallback",
  },
})
--[[
require("codecompanion").setup({
  display = {
	  chat = {
			window = {
				position = "right",
			},
		},
	},
  strategies = {
    chat = {
      adapter = "gemini",
    },
    inline = {
      adapter = "gemini",
    },
  },
})
]]

-- Global mappings.
-- See `:help vim.diagnostic.*` for documentation on any of the below functions
vim.keymap.set('n', '<space>e', vim.diagnostic.open_float)
vim.keymap.set('n', '[d', vim.diagnostic.goto_prev)
vim.keymap.set('n', ']d', vim.diagnostic.goto_next)
vim.keymap.set('n', '<space>q', vim.diagnostic.setloclist)

require'nvim-treesitter.configs'.setup {
  ensure_installed = { "lua", "rust", "toml" },
  highlight = {
    enable = true,
    additional_vim_regex_highlighting = false,
  },
  indent = {
	  enable = true,
  }
}

vim.opt.foldmethod = "expr"
vim.opt.foldexpr = "nvim_treesitter#foldexpr()"
vim.opt.foldenable = false

-- Use LspAttach autocommand to only map the following keys
-- after the language server attaches to the current buffer
vim.api.nvim_create_autocmd('LspAttach', {
  group = vim.api.nvim_create_augroup('UserLspConfig', {}),
  callback = function(ev)
    -- Enable completion triggered by <c-x><c-o>
    -- vim.bo[ev.buf].omnifunc = 'v:lua.vim.lsp.omnifunc'
	vim.api.nvim_buf_set_option(ev.buf, 'omnifunc', 'v:lua.vim.lsp.omnifunc')

    -- Buffer local mappings.
    -- See `:help vim.lsp.*` for documentation on any of the below functions
    local opts = { buffer = ev.buf }
    vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, opts)
    vim.keymap.set('n', 'gd', vim.lsp.buf.definition, opts)
    vim.keymap.set('n', 'K', vim.lsp.buf.hover, opts)
    vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, opts)
    -- vim.keymap.set('n', '<C-k>', vim.lsp.buf.signature_help, opts)
    vim.keymap.set('n', '<space>wa', vim.lsp.buf.add_workspace_folder, opts)
    vim.keymap.set('n', '<space>wr', vim.lsp.buf.remove_workspace_folder, opts)
    vim.keymap.set('n', '<space>wl', function()
      print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
    end, opts)
    vim.keymap.set('n', '<space>D', vim.lsp.buf.type_definition, opts)
    vim.keymap.set('n', '<space>rn', vim.lsp.buf.rename, opts)
    vim.keymap.set({ 'n', 'v' }, '<space>ca', vim.lsp.buf.code_action, opts)
    vim.keymap.set('n', 'gr', vim.lsp.buf.references, opts)
    vim.keymap.set('n', '<space>f', function()
      vim.lsp.buf.format { async = true }
    end, opts)
  end,
})

local capabilities = require('cmp_nvim_lsp').default_capabilities()

-- https://nathan-long.com/blog/modern-javascript-tooling-in-neovim

-- Setup language servers.
local lspconfig = require('lspconfig')
lspconfig.cssls.setup {}
-- C/C++/Objective C
lspconfig.ccls.setup {
	capabilities = capabilities
}
lspconfig.gdscript.setup {}
lspconfig.pyright.setup {}
lspconfig.ts_ls.setup {}
lspconfig.html.setup {
	capabilities = capabilities
}

lspconfig.emmet_ls.setup {
	capabilities = capabilities
}

lspconfig.rust_analyzer.setup({
	settings = {
		capabilities = capabilities
	}
})

lspconfig.asm_lsp.setup{}


-- Luasnip ---------------------------------------------------------------------
-- Load as needed by filetype by the luasnippets folder in the config dir
local luasnip = require("luasnip")
require("luasnip.loaders.from_lua").lazy_load()
require("luasnip.loaders.from_vscode").lazy_load()

-- set keybinds for both INSERT and VISUAL.
vim.api.nvim_set_keymap("i", "<C-n>", "<Plug>luasnip-next-choice", {})
vim.api.nvim_set_keymap("s", "<C-n>", "<Plug>luasnip-next-choice", {})
vim.api.nvim_set_keymap("i", "<C-p>", "<Plug>luasnip-prev-choice", {})
vim.api.nvim_set_keymap("s", "<C-p>", "<Plug>luasnip-prev-choice", {})
-- Set this check up for nvim-cmp tab mapping
local has_words_before = function()
  local line, col = unpack(vim.api.nvim_win_get_cursor(0))
  return col ~= 0 and vim.api.nvim_buf_get_lines(0, line - 1, line, true)[1]:sub(col, col):match("%s") == nil
end

-- CMP - Autocompletion --------------------------------------------------------
local cmp = require 'cmp'
cmp.setup {
  snippet = {
    expand = function(args)
       require('luasnip').lsp_expand(args.body) -- For `luasnip` users.
    end,
  },
  mapping = {
    ['<C-p>'] = cmp.mapping.select_prev_item(),
    ['<C-n>'] = cmp.mapping.select_next_item(),
    ['<C-d>'] = cmp.mapping.scroll_docs(-4),
    ['<C-f>'] = cmp.mapping.scroll_docs(4),
    ['<C-Space>'] = cmp.mapping.complete(),
    ['<C-e>'] = cmp.mapping.close(),
    ['<CR>'] = cmp.mapping.confirm {
      behavior = cmp.ConfirmBehavior.Replace,
      select = true,
    },
    ["<Tab>"] = cmp.mapping(function(fallback)
      if cmp.visible() then
        cmp.select_next_item()
      elseif luasnip.expand_or_jumpable() then
        luasnip.expand_or_jump()
      elseif has_words_before() then
        cmp.complete()
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
  },
  sources = {
    { name = 'nvim_lsp' },
    { name = 'nvim_lsp_signature_help' },
    { name = 'luasnip' , option = { show_autosnippets = true } },
    { name = 'buffer' },
    { name = 'path' }
  },
}


vim.api.nvim_create_autocmd("FileType", {
  pattern = "html,css,javascript",
  callback = function()
    vim.opt_local.shiftwidth = 2
  end
})


vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")

