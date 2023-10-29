local opt = vim.opt

-- line number 
opt.relativenumber = true
opt.number = true

-- tabs and indentation 
opt.tabstop = 4
opt.shiftwidth = 2
opt.expandtab = true
opt.autoindent = true

-- line wrapping 
opt.wrap = false

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


