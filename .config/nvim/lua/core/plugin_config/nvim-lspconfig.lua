local status, lspconfig = pcall(require, "lspconfig")
if not status then
	return
end

-- https://github.com/eslint/eslint
-- npm init @eslint/config
lspconfig.eslint.setup({})
lspconfig.tsserver.setup({
	init_options = {
		preferences = {
			-- https://github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md#tsserver
			-- https://github.com/typescript-language-server/typescript-language-server#workspacedidchangeconfiguration
			-- Preferred style for JSX attribute completions:
			-- `"auto"` - Insert `={}` or `=\"\"` after attribute names based on the prop type.
			-- `"braces"` - Insert `={}` after attribute names.
			-- `"none"` - Only insert attribute names.
			jsxAttributeCompletionStyle = "none",
		},
	},
})
-- emmet doesn't have his own name in Mason
-- it must be installed manually :MasonInstall emmet-language-server
lspconfig.emmet_language_server.setup({})
lspconfig.pyright.setup({})
lspconfig.tailwindcss.setup({})
-- https://github.com/stylelint/stylelint/blob/main/docs/user-guide/get-started.md
-- npm init stylelint
lspconfig.stylelint_lsp.setup({
	filetypes = { "css", "scss", "less" },
	settings = {
		stylelintplus = {
			autoFixOnSave = true,
			autoFixOnFormat = true,
			-- other settings...
		},
	},
})
lspconfig.rust_analyzer.setup({
	-- Server-specific settings. See `:help lspconfig-setup`
	settings = {
		["rust-analyzer"] = {},
	},
})

lspconfig.lua_ls.setup({
	settings = {
		Lua = {
			diagnostics = {
				-- Get the language server to recognize the `vim` global
				globals = { "vim" },
			},
			workspace = {
				-- Make the server aware of Neovim runtime files
				library = vim.api.nvim_get_runtime_file("", true),
				checkThirdParty = false,
			},
		},
	},
})

lspconfig.astro.setup({})
-- lspconfig.astro.setup({
-- 	filetypes = { "astro" },
-- 	init_options = {
-- 		javascript = {},
-- 	},
-- })

-- Global mappings.
-- See `:help vim.diagnostic.*` for documentation on any of the below functions
vim.keymap.set("n", "<space>e", vim.diagnostic.open_float)
vim.keymap.set("n", "[d", vim.diagnostic.goto_prev)
vim.keymap.set("n", "]d", vim.diagnostic.goto_next)
vim.keymap.set("n", "<space>q", vim.diagnostic.setloclist)

-- Use LspAttach autocommand to only map the following keys
-- after the language server attaches to the current buffer
vim.api.nvim_create_autocmd("LspAttach", {
	group = vim.api.nvim_create_augroup("UserLspConfig", {}),
	callback = function(ev)
		-- Enable completion triggered by <c-x><c-o>
		vim.bo[ev.buf].omnifunc = "v:lua.vim.lsp.omnifunc"

		-- Buffer local mappings.
		-- See `:help vim.lsp.*` for documentation on any of the below functions
		local opts = { buffer = ev.buf }
		vim.keymap.set("n", "gD", vim.lsp.buf.declaration, opts)
		vim.keymap.set("n", "gd", vim.lsp.buf.definition, opts)
		vim.keymap.set("n", "K", vim.lsp.buf.hover, opts)
		vim.keymap.set("n", "gi", vim.lsp.buf.implementation, opts)
		vim.keymap.set("n", "<C-i>", vim.lsp.buf.signature_help, opts)
		vim.keymap.set("n", "<space>wa", vim.lsp.buf.add_workspace_folder, opts)
		vim.keymap.set("n", "<space>wr", vim.lsp.buf.remove_workspace_folder, opts)
		vim.keymap.set("n", "<space>wl", function()
			print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
		end, opts)
		vim.keymap.set("n", "<space>D", vim.lsp.buf.type_definition, opts)
		vim.keymap.set("n", "<space>rn", vim.lsp.buf.rename, opts)
		vim.keymap.set({ "n", "v" }, "<space>ca", vim.lsp.buf.code_action, opts)
		vim.keymap.set("n", "gr", vim.lsp.buf.references, opts)
		vim.keymap.set("n", "<space>f", function()
			vim.lsp.buf.format({ async = true })
		end, opts)
	end,
})
