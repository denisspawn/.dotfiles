local status, treesitter = pcall(require, "nvim-treesitter.configs")
if not status then
	return
end

treesitter.setup({
	-- A list of parser names, or 'all'
	ensure_installed = {
		"c",
		"lua",
		"rust",
		"ruby",
		"python",
		"vim",
		"javascript",
		"tsx",
		"json",
		"css",
		"html",
		"markdown",
	},

	-- Install parsers synchronously (only applied to 'ensure_installed')
	sync_install = false,
	auto_install = true,
	highlight = {
		enable = true,
	},
	indent = {
		enable = true,
	},
})
