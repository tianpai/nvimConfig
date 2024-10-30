-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here
--

local opt = vim.opt
-- line numbers
opt.relativenumber = false -- confusing when explaining code to someone
opt.number = true

-- tabs and indentation
opt.tabstop = 8
opt.shiftwidth = 8
opt.expandtab = true
opt.autoindent = true
opt.scrolloff = 10
-- line wrapping
opt.wrap = false

-- set _ as a keyword
-- so that _ is not considered
-- as a word boundary
opt.iskeyword:append("_")
opt.iskeyword:append("-")

-- search settings
opt.ignorecase = true
opt.smartcase = true

-- cursor line
opt.cursorline = true

-- appearance
----------------
opt.termguicolors = true
opt.background = "dark"
opt.signcolumn = "yes"

-- backspace
opt.backspace = "indent,eol,start"

-- using system clipboard
opt.clipboard:append("unnamedplus")

-- split direction
opt.splitright = true
opt.splitbelow = true

vim.wo.colorcolumn = "80"
