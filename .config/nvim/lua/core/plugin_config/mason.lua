local status, mason = pcall(require, "mason")
if not status then
	return
end

local status_lspconf, mason_lspconfig = pcall(require, "mason-lspconfig")
if not status_lspconf then
	return
end

local status_null_ls, mason_null_ls = pcall(require, "mason-null-ls")
if not status_null_ls then
	return
end

mason.setup()

-- after adding to the ensure_installed list
-- we must activate server through nvim-lspcong.lua file
mason_lspconfig.setup({
	ensure_installed = {
		"lua_ls",
		"rust_analyzer",
		"pyright",
		"tailwindcss",
		"stylelint_lsp",
		"eslint",
		"tsserver",
	},
})

-- after adding to the ensure_installed list
-- we must activate linter through null-ls.lua file
mason_null_ls.setup({
	ensure_installed = { "prettierd", "stylua" },
})
