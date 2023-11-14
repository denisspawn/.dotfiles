local status, mason = pcall(require, "mason")
if not status then
	return
end

local status_mason_tool_installer, mason_tool_installer = pcall(require, "mason-tool-installer")
if not status_mason_tool_installer then
	return
end

mason.setup({
	ui = {
		icons = {
			package_installed = "✓",
			package_pending = "➜",
			package_uninstalled = "✗",
		},
	},
})

-- after adding to the ensure_installed list
-- we must activate server through nvim-lspcong.lua file
mason_tool_installer.setup({
	ensure_installed = {
		"lua_ls",
		"rust_analyzer",
		"pyright",
		"tailwindcss",
		"stylelint_lsp",
		"eslint",
		"tsserver",
		"emmet_language_server",
		"prettier",
		"stylua",
		"astro",
	},
})
