vim.g.mapleader = " "
vim.g.maplocalleader = "\\"

vim.g.autoformat = true


vim.g.lazygit_config = true
-- Hide deprecation warnings
vim.g.deprecation_warnings = false


-- Set filetype to `bigfile` for files larger than 1.5 MB
-- Only vim syntax will be enabled (with the correct filetype)
-- LSP, treesitter and other ft plugins will be disabled.
-- mini.animate will also be disabled.
vim.g.bigfile_size = 1024 * 1024 * 1.5 -- 1.5 MB


local opt = vim.opt

opt.autowrite = true

-- only set clipboard if not in ssh, to make sure the OSC 52
-- integration works automatically. Requires Neovim >= 0.10.0
opt.clipboard = vim.env.SSH_TTY and "" or "unnamedplus" -- Sync with system clipboard
opt.completeopt = "menu,menuone,noselect"
opt.conceallevel = 2
opt.confirm = true
opt.cursorline = true
opt.grepprg = "rg --vimgrep"
opt.ignorecase = true
opt.mouse = "a" -- Enable mouse mode
opt.number = true -- Print line number
opt.relativenumber = false
opt.pumblend = 10 -- Popup blend
opt.pumheight = 10 -- Maximum number of entries in a popup
opt.scrolloff = 4 -- Lines of context
opt.shiftwidth = 4
opt.shiftround = true
opt.sidescrolloff = 8 -- Columns of context
opt.signcolumn = "yes" -- Always show the signcolumn, otherwise it would shift the text each time
opt.smartcase = true -- Don't ignore case with capitals
opt.smartindent = true -- Insert indents automatically
opt.spelllang = { "en" }
opt.splitbelow = true -- Put new windows below current
opt.splitkeep = "screen"
opt.splitright = true -- Put new windows right of current
opt.tabstop = 4 -- Number of spaces tabs count for
opt.undofile = true
opt.wrap = false -- Disable line wrap
opt.winminwidth = 5 -- Minimum window width
opt.wildmode = "longest:full,full" -- Command-line completion mode

vim.g.markdown_recommended_style = 0
vim.g.lazyvim_picker = "fzf"

