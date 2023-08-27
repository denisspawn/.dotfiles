vim.g.buffergator_hsplit_size = 10
vim.g.buffergator_viewport_split_policy = "B"

-- truecolor 24-bit 256-colors
vim.o.termguicolors = true

-- allows you to search for hidden files using Ctrlp plugin,
-- but may increase indexing time.
vim.g.ctrlp_show_hidden = 1

vim.opt.colorcolumn = "80"
vim.opt.pastetoggle = "<F2>"

-- status line if there is more than one window
vim.opt.laststatus = 1

-- enable mouse wheel
vim.opt.mouse = "a"

vim.opt.fileformat = "unix"
vim.opt.encoding = "utf-8"

vim.opt.swapfile = false
vim.opt.scrolloff = 7
-- set syntax on
vim.opt.syntax = "ON"

vim.opt.hlsearch = true
vim.opt.incsearch = true

vim.opt.number = true
-- set top and buttom number
vim.opt.rnu = true

-- use spaces instead tabs
vim.opt.expandtab = true
-- set smartindent
vim.opt.autoindent = true
vim.opt.smartindent = true
vim.opt.smarttab = true --
vim.opt.breakindent = true --
vim.opt.tabstop = 2
vim.opt.softtabstop = 2
vim.opt.shiftwidth = 2

vim.opt.wrap = true -- no wrap lines

-- enable hotkeys for Russian layout
vim.opt.langmap =
	"ФИСВУАПРШОЛДЬТЩЗЙКЫЕГМЦЧНЯ;ABCDEFGHIJKLMNOPQRSTUVWXYZ,фисвуапршолдьтщзйкыегмцчня;abcdefghijklmnopqrstuvwxyz"
