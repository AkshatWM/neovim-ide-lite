-- Leader keys
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- Disable unused language providers (keeps :checkhealth clean)
vim.g.loaded_node_provider = 0
vim.g.loaded_perl_provider = 0
vim.g.loaded_ruby_provider = 0
vim.g.loaded_python3_provider = 0

-- nvim-tree replaces netrw
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

-- Faster module loading
vim.loader.enable()

-- Editing behavior
vim.opt.expandtab = true -- Convert tabs to spaces
vim.opt.shiftwidth = 4 -- Amount to indent with <<, >>, and Enter
vim.opt.tabstop = 4 -- How many spaces a Tab character displays as
vim.opt.softtabstop = 4 -- How many spaces Tab/Backspace feels like in Insert mode
vim.opt.smartindent = true -- Smart auto-indenting on new lines
vim.opt.cindent = true
vim.wo.relativenumber = true
vim.opt.cursorline = true
vim.opt.clipboard = "unnamedplus"
vim.opt.ignorecase = true
vim.opt.termguicolors = true
