local status, nvim_tree = pcall(require, "nvim-tree")
if not status then
	return
end

vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

nvim_tree.setup()

vim.keymap.set("n", "<leader><leader>", ":NvimTreeFindFileToggle<CR>")
-- помещает курсор на файл с которым работаешь в плагине nvim-tree
vim.keymap.set("n", "<c-m>", ":NvimTreeFindFileToggle<CR>")
