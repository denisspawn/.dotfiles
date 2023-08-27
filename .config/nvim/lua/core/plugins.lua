local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
	vim.fn.system({
		"git",
		"clone",
		"--filter=blob:none",
		"https://github.com/folke/lazy.nvim.git",
		"--branch=stable", -- latest stable release
		lazypath,
	})
end
vim.opt.rtp:prepend(lazypath)

local plugins = {
	"neovim/nvim-lspconfig", -- configuration LSP
	"ellisonleao/gruvbox.nvim", -- color themes
	"okuuva/auto-save.nvim", -- autosave
	"terrortylor/nvim-comment", -- comments
	"norcalli/nvim-colorizer.lua", -- highlite hex colors #ffffff
	"nvim-tree/nvim-tree.lua", -- file explorer
	"nvim-tree/nvim-web-devicons", -- icons
	--'nvim-lualine/lualine.nvim', -- info line
	"nvim-treesitter/nvim-treesitter", -- code highlighting
	"windwp/nvim-autopairs", -- plagin for autopairs
	"lewis6991/gitsigns.nvim", -- super fast git decorations implemented
	"dinhhuy258/git.nvim", -- simple clone of the plugin vim-fugitive which is written in Lua
	"easymotion/vim-easymotion", --fast navigate through the document
	"mattn/emmet-vim", --emmet for html, css and etc.
	"tpope/vim-surround", --plugin for automaticaly place quotes, brackets, parantheses and etc.
	"jeetsukumaran/vim-buffergator", --plugin for simple to list, select and switch between buffers.
	-- completion
	"hrsh7th/nvim-cmp", -- complition
	"hrsh7th/cmp-nvim-lsp", -- source for neovim's built-in LSP
	"hrsh7th/cmp-buffer", -- source for buffer words
	"hrsh7th/cmp-path", -- source for filesystem paths
	"hrsh7th/cmp-cmdline", -- source for vim's cmdline
	-- for vsnip users
	-- "hrsh7th/cmp-vsnip",
	-- "hrsh7th/vim-vsnip",
	-- for snippy users
	--"dcampos/nvim-snippy",
	--"dcampos/cmp-snippy",
	-- for luasnip users
	"saadparwaiz1/cmp_luasnip",
	{
		"L3MON4D3/LuaSnip",
		dependencies = { "rafamadriz/friendly-snippets" },
	},
	{
		"jose-elias-alvarez/null-ls.nvim", -- use Neovim as a language server to inject LSP diagnostics, code actions, and more via Lua
		dependencies = { "nvim-lua/plenary.nvim" },
	},
	-- awesome tabs
	{
		"akinsho/bufferline.nvim",
		version = "*",
		dependencies = "nvim-tree/nvim-web-devicons",
	},
	-- file search
	{
		"nvim-telescope/telescope.nvim",
		tag = "0.1.2",
		dependencies = { "nvim-lua/plenary.nvim" },
	},
	-- lsp plugins
	{
		"williamboman/mason.nvim", -- portable package manager
		dependencies = {
			"williamboman/mason-lspconfig.nvim", -- configuration for mason-LSP
			{
				"jay-babu/mason-null-ls.nvim", -- configuration for mason-null-ls
				event = { "BufReadPre", "BufNewFile" },
			},
		},
	},
}

local opts = {}

local status, lazy = pcall(require, "lazy")
if not status then
	print("Lazy is not installed")
	return
end

lazy.setup(plugins, opts)
