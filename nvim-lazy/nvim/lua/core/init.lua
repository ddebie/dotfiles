-- Map Space as leader
vim.g.mapleader = " "

-- Tabs should be spaces
vim.opt.tabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true

-- Relative line numbers
vim.opt.number = true
vim.opt.relativenumber = true

-- Highlight the line that your cursor is on
vim.opt.cursorline = true

-- Start scrolling down in last 10 lines to always have context
vim.opt.scrolloff = 10

-- Wrap long lines
vim.opt.wrap = true

-- Ignore case unless searching with capitals
vim.opt.ignorecase = true
vim.opt.smartcase = true

-- nvim-tree
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1
vim.g.termguicolors = true
