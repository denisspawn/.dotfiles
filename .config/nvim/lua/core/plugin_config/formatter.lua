local status, formatter = pcall(require, "formatter")
if not status then
	return
end

-- Utilities for creating configurations
local status_util, util = pcall(require, "formatter.util")
if not status_util then
	return
end

local common_prettier_conf = function()
	-- prettier
	return {
		exe = "prettier",
		args = {
			"--no-semi",
			"--single-quote",
			"--jsx-single-quote",
			util.escape_path(util.get_current_buffer_file_path()),
			--vim.api.nvim_buf_get_name(0),
		},
		stdin = true,
	}
end

-- Provides the Format, FormatWrite, FormatLock, and FormatWriteLock commands
formatter.setup({
	-- Enable or disable logging
	logging = true,
	-- Set the log level
	log_level = vim.log.levels.WARN,
	-- All formatter configurations are opt-in
	filetype = {
		-- Formatter configurations for filetype "lua" go here
		-- and will be executed in order
		lua = {
			-- "formatter.filetypes.lua" defines default configurations for the
			-- "lua" filetype
			require("formatter.filetypes.lua").stylua,

			-- You can also define your own configuration
			function()
				-- Supports conditional formatting
				if util.get_current_buffer_file_name() == "special.lua" then
					return nil
				end

				-- Full specification of configurations is down below and in Vim help
				-- files
				return {
					exe = "stylua",
					args = {
						"--search-parent-directories",
						"--stdin-filepath",
						util.escape_path(util.get_current_buffer_file_path()),
						"--",
						"-",
					},
					stdin = true,
				}
			end,
		},

		javascript = {
			require("formatter.filetypes.javascript").prettier,
		},
		typescript = {
			require("formatter.filetypes.typescript").prettier,
		},
		html = {
			require("formatter.filetypes.html").prettier,
		},
		json = {
			require("formatter.filetypes.json").prettier,
		},
		-- [""] Brackets are needed for extensions that are not in lua/formatter/filetypes
		astro = { common_prettier_conf },

		-- Use the special "*" filetype for defining formatter configurations on
		-- any filetype
		["*"] = {
			-- "formatter.filetypes.any" defines default configurations for any
			-- filetype
			require("formatter.filetypes.any").remove_trailing_whitespace,
		},
	},
})

-- create autocommand for run FormatWrite after saving
vim.api.nvim_create_autocmd({ "BufWritePost" }, {
	pattern = { "*" },
	command = "FormatWrite",
})
