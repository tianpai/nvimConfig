--    ___ _   _ ___ _____
--   |_ _| \ | |_ _|_   _|
--    | ||  \| || |  | |
--    | || |\  || |  | |
--   |___|_| \_|___| |_|
--

-- must be the first
require("tp.plugin-manager")

-- core setting and options
require("tp.core.options")
require("tp.core.theme")
require("tp.core.keymap")

-- plugins
require("tp.plugins.autopairs")
require("tp.plugins.gitsign")
require("tp.plugins.lualine")
require("tp.plugins.nvim-cmp")
require("tp.plugins.nvim-tree")
require("tp.plugins.scroller")
require("tp.plugins.telescope")
require("tp.plugins.treesitter")
require("tp.plugins.trouble")
require("tp.plugins.toggleterm")
require("tp.plugins.which-key")
require("tp.plugins.wilder")
require("tp.plugins.orgmode")

-- LSP
require("tp.plugins.lsp.lspconfig")
require("tp.plugins.lsp.mason")
require("tp.plugins.lsp.null-ls")

-- themes
require("tp.plugins.themes.catppuccin")
require("tp.plugins.themes.nvim-colorizer")

-- alpha dashboard/welcome screen
require("tp.plugins.alpha.alpha-nvim")
