require("remap")
require("plugins")

-- leader key
vim.g.mapleader = " "

-- disable netrw at the very start of your init.lua
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

-- set termguicolors to enable highlight groups
vim.opt.termguicolors = true

-- line numbers
vim.wo.number = true

-- 4 space indent
vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true
vim.opt.smartindent = true

-- search options (/)
vim.opt.hlsearch = false
vim.opt.incsearch = true

-- The length of time Vim waits after you stop typing before it triggers the
-- plugin is governed by the setting updatetime in ms
vim.opt.updatetime = 50

-- color column
vim.opt.colorcolumn = "80"
