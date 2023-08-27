vim.g.mapleader = ","

-- turn off search highlight
vim.keymap.set("n", "<leader><space>", ":nohlsearch<CR>")
-- inser newline without entering insert mode
vim.keymap.set("n", "<leader>o", "o<Esc>")
vim.keymap.set("n", "<leader>O", "O<Esc>")

-- copy and paste keybinding '*'
-- for PRIMARY bufer (middle button of mouse), '+'
-- for CLIPBOARD bufer 'Ctrl+c' and 'Ctrl+v'
-- this combination work only in gVim if you using VIM or NEOVIM
-- or install package 'xclip'
-- another instruction :help clipboard
vim.keymap.set("v", "<leader>y", '"*y')
vim.keymap.set("v", "<leader>p", '"*p')
vim.keymap.set("v", "<leader>Y", '"+y')
vim.keymap.set("v", "<leader>P", '"+p')

-- включает буфер vim его последних редактируемых файлов
vim.keymap.set("n", "<leader>b", ":buffers<CR>")
-- при нажатии клавиши Leade + s начинает работать плаги easymotion
vim.keymap.set("n", "<leader>", "<Plug>(easymotion-prefix)")

-- Map ctrl-movement keys to window switching
vim.keymap.set("n", "<C-k>", "<C-w><Up>")
vim.keymap.set("n", "<C-j>", "<C-w><Down>")
vim.keymap.set("n", "<C-l>", "<C-w><Right>")
vim.keymap.set("n", "<C-h>", "<C-w><Left>")
