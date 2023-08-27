local status, null_ls = pcall(require, "null-ls")
if not status then
	return
end

local lsp_formatting = function(bufnr)
	vim.lsp.buf.format({
		filter = function(client)
			-- apply whatever logic you want (in this example, we'll only use null-ls)
			return client.name == "null-ls"
		end,
		bufnr = bufnr,
	})
end

-- if you want to set up formatting on save, you can use this as a callback
local augroup = vim.api.nvim_create_augroup("LspFormatting", {})

-- add to your shared on_attach callback
local on_attach = function(client, bufnr)
	if client.supports_method("textDocument/formatting") then
		vim.api.nvim_clear_autocmds({ group = augroup, buffer = bufnr })
		vim.api.nvim_create_autocmd("BufWritePre", {
			group = augroup,
			buffer = bufnr,
			callback = function()
				lsp_formatting(bufnr)
			end,
		})
	end
end

-- settin formatting parameters
null_ls.setup({
	sources = {
		--null_ls.builtins.diagnostics.some_linter,
		-- config for stylua formatting
		null_ls.builtins.formatting.stylua,
		-- config for prettierd formatting
		null_ls.builtins.formatting.prettierd.with({
			extra_args = {
				"--no-semi",
				"--single-quote",
				"--jsx-single-quote",
			},
		}),
	},
	on_attach = on_attach,
})

-- making a new user command for nvim (:DisableLspFormatting)
-- which disable formatting for a while
vim.api.nvim_create_user_command("DisableLspFormatting", function()
	vim.api.nvim_clear_autocmds({ group = augroup, buffer = 0 })
end, { nargs = 0 })
