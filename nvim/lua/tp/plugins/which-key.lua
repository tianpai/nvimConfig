-- import which-key
local status, wk = pcall(require, "which-key")
if not status then
	return
end

-- after 300ms of inactivity
-- which-key will show up
vim.o.timeout = true
vim.o.timeoutlen = 500

wk.setup({
	plugins = {
		marks = true, -- shows a list of your marks on ' and `
		registers = false, -- shows your registers on " in NORMAL or <C-r> in INSERT mode
		-- the presets plugin, adds help for a bunch of default keybindings in Neovim
		-- No actual key bindings are created
		spelling = {
			enabled = true, -- enabling this will show WhichKey when pressing z= to select spelling suggestions
			suggestions = 9, -- how many suggestions should be shown in the list?
		},
		presets = {
			operators = true, -- adds help for operators like d, y, ...
			motions = true, -- adds help for motions
			text_objects = true, -- help for text objects triggered after entering an operator
			windows = true, -- default bindings on <c-w>
			nav = true, -- misc bindings to work with windows
			z = true, -- bindings for folds, spelling and others prefixed with z
			g = true, -- bindings for prefixed with g
		},
	},
	-- add operators that will trigger motion and text object completion
	-- to enable all native operators, set the preset / operators plugin above
	operators = { gc = "Comments" },
	key_labels = {
		-- override the label used to display some keys.
		-- It doesn't effect WK in any other way.
		["<space>"] = "SPACE",
		["<leader>"] = "SPACE",
		["<cr>"] = "ENTER",
		["<tab>"] = "TAB",
	},
	motions = {
		count = true,
	},
	icons = {
		breadcrumb = "»", -- symbol used in the command line area that shows your active key combo
		separator = "➜", -- symbol used between a key and it's label
		group = "+", -- symbol prepended to a group
	},
	popup_mappings = {
		scroll_up = "<c-k>", -- binding to scroll up inside the popup
		scroll_down = "<c-j>", -- binding to scroll down inside the popup
	},
	window = {
		border = "single", -- none, single, double, shadow
		position = "bottom", -- bottom, top
		-- extra window margin [top, right, bottom, left].
		-- When between 0 and 1, will be treated as a percentage of the screen size.
		margin = { 1, 0, 1, 0 },
		padding = { 1, 2, 1, 2 }, -- extra window padding [top, right, bottom, left]
		winblend = 0, -- value between 0-100 0 for fully opaque and 100 for fully transparent
		zindex = 1000, -- positive value to position WhichKey above other floating windows.
	},
	layout = {
		height = { min = 4, max = 30 }, -- min and max height of the columns
		width = { min = 20, max = 90 }, -- min and max width of the columns
		spacing = 5, -- spacing between columns
		align = "center", -- align columns left, center or right
	},
	ignore_missing = false, -- enable this to hide mappings for which you didn't specify a label
	hidden = { "<silent>", "<cmd>", "<Cmd>", "<CR>", "^:", "^ ", "^call ", "^lua " }, -- hide mapping boilerplate
	show_help = true, -- show a help message in the command line for using WhichKey
	show_keys = true, -- show the currently pressed key and its label as a message in the command line
	triggers = "auto", -- automatically setup triggers
	-- triggers = {"<leader>"} -- or specifiy a list manually
	-- list of triggers, where WhichKey should not wait for timeoutlen and show immediately
	triggers_nowait = {
		-- marks
		"`",
		"'",
		"g`",
		"g'",
		-- registers
		'"',
		"<c-r>",
		-- spelling
		"z=",
		"<c>",
	},
	triggers_blacklist = {
		-- list of mode / prefixes that should never be hooked by WhichKey
		-- this is mostly relevant for keymaps that start with a native binding
		i = { "j", "k" },
		v = { "j", "k" },
	},
	-- disable the WhichKey popup for certain buf types and file types.
	-- Disabled by default for Telescope
	disable = {
		buftypes = {},
		filetypes = {},
	},
})

wk.register({

	["<leader>P"] = { name = "PACKER" },
	["<leader>Ps"] = { "<cmd>PackerSync<cr>", "Packer Sync" },
	["<leader>Pu"] = { "<cmd>PackerUpdate<cr>", "Packer Update" },
	--    _____ ___ _     _____
	--   |  ___|_ _| |   | ____|
	--   | |_   | || |   |  _|
	--   |  _|  | || |___| |___
	--   |_|   |___|_____|_____|
	--
	["<leader>f"] = { name = "FILE/FIND" },
	["<leader>ff"] = { "<cmd>Telescope find_files<cr>", "Find File" },
	["<leader>fr"] = { "<cmd>Telescope oldfiles<cr>", "Open Recent File" },
	["<leader>fn"] = { "<cmd>enew<cr>", "New File" },
	["<leader>fh"] = { "<cmd>Telescope help_tags<cr>", "Help Tags" },
	["<leader>fS"] = { "<cmd>Telescope live_grep<cr>", "String in Current Directory" },
	["<leader>fs"] = { "<cmd>Telescope current_buffer_fuzzy_find<cr>", "String in Current Buffer" },
	["<leader>fc"] = { "<cmd>Telescope grep_string<cr>", "String under Cursor in Current Directory" },
	["<leader>fe"] = { "<cmd>NvimTreeToggle<cr>", "Toggle File Tree" },
	["<leader>ft"] = { "<cmd>NvimTreeFindFile<cr>", "Find in File Explorer" },
	--     ____ ___ _____
	["<leader>b"] = { name = "BUFFER" },
	["<leader>bb"] = { "<cmd>Telescope buffers<cr>", "Find Buffer" },
	["<leader>bn"] = { "<cmd>bn<cr>", "Next Buffer" },
	["<leader>bp"] = { "<cmd>bp<cr>", "Previous Buffer" },
	--    / ___|_ _|_   _|
	--   | |  _ | |  | |
	--   | |_| || |  | |
	--    \____|___| |_|
	--
	["<leader>g"] = { name = "GIT" },
	["<leader>gg"] = { "<cmd>LazyGit<cr>", "Git TUI" },
	--     ___  ____   ____                     _
	--    / _ \|  _ \ / ___|_ __ ___   ___   __| | ___
	--   | | | | |_) | |  _| '_ ` _ \ / _ \ / _` |/ _ \
	--   | |_| |  _ <| |_| | | | | | | (_) | (_| |  __/
	--    \___/|_| \_\\____|_| |_| |_|\___/ \__,_|\___|
	--
	["<leader>o"] = { name = "ORG MODE" },
	["<leader>oa"] = { "Open Orgmode" },
	["<leader>oc"] = { "Orgmode Capter" },
	--   __        ___           _
	--   \ \      / (_)_ __   __| | _____      __
	--    \ \ /\ / /| | '_ \ / _` |/ _ \ \ /\ / /
	--     \ V  V / | | | | | (_| | (_) \ V  V /
	--      \_/\_/  |_|_| |_|\__,_|\___/ \_/\_/
	--
	["<leader>w"] = { name = "WINDOW" },
	["<leader>wh"] = { "<cmd>split<cr>", "Split Horizontally" },
	["<leader>wv"] = { "<cmd>vsplit<cr>", "Split Vertically" },
	--    _____  _    ____
	--   |_   _|/ \  | __ )
	--     | | / _ \ |  _ \
	--     | |/ ___ \| |_) |
	--     |_/_/   \_\____/
	--
	["<leader>t"] = { name = "TABS" },
	["<leader>to"] = { "<cmd>tabnew<cr>", "Open a New Tab" },
	["<leader>tc"] = { "<cmd>tabclose<cr>", "Close Tab" },
	["<leader>tp"] = { "<cmd>tabprevious<cr>", "Previous Tab" },
	["<leader>tn"] = { "<cmd>tabnext<cr>", "Next Tab" },
	--    _   _ _   _ _ _ _   _
	--   | | | | |_(_) (_) |_(_) ___  ___
	--   | | | | __| | | | __| |/ _ \/ __|
	--   | |_| | |_| | | | |_| |  __/\__ \
	--    \___/ \__|_|_|_|\__|_|\___||___/
	--
	["<leader>u"] = { name = "UTILS" },
	["<leader>uk"] = { "<cmd>Telescope keymaps<cr>", "Show Keymaps" },
	["<leader>ut"] = { "<cmd>Telescope colorscheme<cr>", "Show Themes" },
	["<leader>uc"] = { "<cmd>Telescope commands<cr>", "Show All Commands" },
	["<leader>uch"] = { "<cmd>Telescope commands_history<cr>", "Show All Commands History" },
	["<leader>ur"] = { "<cmd>Telescope registers<cr>", "Show Clipboard" },

	["<leader>T"] = { name = "Trouble" },
	["<leader>Tt"] = { "<cmd>TroubleToggle<cr>", "Trouble Toggle" },
	["<leader>Td"] = { "<cmd>TroubleToggle document_diagonistics<cr>", "Document Diagonistics" },
	["<leader>Tw"] = { "<cmd>TroubleToggle lsp_workspace_diagonistics<cr>", "Workspace Diagonistics" },

	--   | | | |_ _|  _ \|  _ \| ____| \ | |
	--   | |_| || || | | | | | |  _| |  \| |
	--   |  _  || || |_| | |_| | |___| |\  |
	--   |_| |_|___|____/|____/|_____|_| \_|
	--
	["<leader>d"] = "which_key_ignore",
	["<leader>D"] = "which_key_ignore",
	["<leader>+"] = "which_key_ignore",
	["<leader>c"] = "which_key_ignore",
	["<leader>ca"] = "which_key_ignore",
	["<leader>r"] = "which_key_ignore",
	["<leader>n"] = "which_key_ignore",
})
