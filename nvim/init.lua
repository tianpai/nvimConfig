--    _____ _   _ _____ _______
--   |_   _| \ | |_   _|__   __|
--     | | |  \| | | |    | |
--     | | | . ` | | |    | |
--    _| |_| |\  |_| |_   | |
--   |_____|_| \_|_____|  |_|
--
--

require("tp.plugin-manager") -- must be the first

require("tp.core.options")
require("tp.core.theme")
require("tp.core.keymap")
-- require("tp.core.plugin-keymap") -- Moved to tp.plugins.which-key

require("tp.plugins.autopairs")
require("tp.plugins.alpha-nvim")
require("tp.plugins.gitsign")
require("tp.plugins.lualine")
require("tp.plugins.nvim-cmp")
require("tp.plugins.nvim-tree")
require("tp.plugins.telescope")
require("tp.plugins.treesitter")
require("tp.plugins.vimtex")
require("tp.plugins.which-key")
require("tp.plugins.orgmode")

require("tp.plugins.lsp.lspconfig")
require("tp.plugins.lsp.mason")
require("tp.plugins.lsp.null-ls")
