vim.cmd("set noexpandtab")
vim.cmd("set tabstop=2")
vim.cmd("set softtabstop=2")
vim.cmd("set shiftwidth=2")
--vim.opt.guicursor = ""
vim.opt.nu = true
--vim.opt.tabstop = 4
--vim.opt.softtabstop = 4
--vim.opt.shiftwidth = 4
vim.opt.expandtab = true
vim.opt.smartindent = true
--vim.cmd("set guicursor=n-v-c-i:block") --block
--vim.cmd("set guicursor=i:hor10") --underscore
vim.cmd("set guicursor=i:ver25") -- vertical
vim.opt.wrap = false
vim.g.mapleader = " "
vim.opt.number = true
vim.opt.cursorline = true
vim.wo.relativenumber = true
vim.opt.scrolloff = 8
vim.opt.colorcolumn = "80"
vim.opt.termguicolors = true
-- Lower updatetime
vim.o.updatetime = 50
