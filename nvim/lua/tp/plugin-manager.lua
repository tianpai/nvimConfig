--     ___           _
--    / _ \__ _  ___| | _____ _ __
--   / /_)/ _` |/ __| |/ / _ \ '__|
--  / ___/ (_| | (__|   <  __/ |
--  \/    \__,_|\___|_|\_\___|_|
--

-- auto install packer if not installed
-- (kinda useless since packer is already installed, but why not)
local ensure_packer = function()
	local fn = vim.fn
	local install_path = fn.stdpath("data") .. "/site/pack/packer/start/packer.nvim"
	if fn.empty(fn.glob(install_path)) > 0 then
		fn.system({ "git", "clone", "--depth", "1", "https://github.com/wbthomason/packer.nvim", install_path })
		vim.cmd([[packadd packer.nvim]])
		return true
	end
	return false
end
local packer_bootstrap = ensure_packer() -- used at the end of this file

-- autocommand that reloads neovim and installs/updates/removes plugins
-- when file is saved
vim.cmd([[ 
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins-setup.lua source <afile> | PackerSync
  augroup end
]])

-- import packer safely
local status, packer = pcall(require, "packer")
if not status then
	return
end

--         _             _
--   _ __ | |_   _  __ _(_)_ __  ___
--  | '_ \| | | | |/ _` | | '_ \/ __|
--  | |_) | | |_| | (_| | | | | \__ \
--  | .__/|_|\__,_|\__, |_|_| |_|___/
--  |_|            |___/
--  (I will be as organized as I can.)
return packer.startup(function(use)
	--    _               _
	--   | |__   __ _ ___(_) ___
	--   | '_ \ / _` / __| |/ __|
	--   | |_) | (_| \__ \ | (__
	--   |_.__/ \__,_|___/_|\___|
	--
	use("wbthomason/packer.nvim") -- package manager, DONT REMOVE
	use("nvim-lua/plenary.nvim")
	use("nvim-tree/nvim-web-devicons") -- just icons

	--          _ _
	--     __ _(_) |_
	--    / _` | | __|
	--   | (_| | | |_
	--    \__, |_|\__|
	--    |___/
	use("kdheepak/lazygit.nvim") -- git GUI in neovim!
	use("lewis6991/gitsigns.nvim") -- show line modifications on left hand side

	--    _   _ ___
	--   | | | |_ _|
	--   | | | || |
	--   | |_| || |
	--    \___/|___|
	--
	use("nvim-lualine/lualine.nvim")
	use("nvim-tree/nvim-tree.lua")
	use({
		"gelguy/wilder.nvim",
		config = function()
			-- config goes here
		end,
	})
	use("goolord/alpha-nvim")
	use("petertriho/nvim-scrollbar")
	--    _   _
	--   | |_| |__   ___ _ __ ___   ___
	--   | __| '_ \ / _ \ '_ ` _ \ / _ \
	--   | |_| | | |  __/ | | | | |  __/
	--    \__|_| |_|\___|_| |_| |_|\___|
	--
	use("Shatur/neovim-ayu")

	--    _     ____  ____
	--   | |   / ___||  _ \
	--   | |   \___ \| |_) |
	--   | |___ ___) |  __/
	--   |_____|____/|_|
	--
	-- treesitter configuration
	use({
		"nvim-treesitter/nvim-treesitter",
		run = function()
			local ts_update = require("nvim-treesitter.install").update({ with_sync = true })
			ts_update()
		end,
	})
	-- managing & installing lsp servers, linters & formatters
	use("williamboman/mason.nvim") -- in charge of managing lsp servers, linters & formatters
	use("williamboman/mason-lspconfig.nvim") -- bridges gap b/w mason & lspconfig
	-- autocompletion
	use("hrsh7th/nvim-cmp") -- completion plugin
	use("hrsh7th/cmp-buffer") -- source for text in buffer
	use("hrsh7th/cmp-path") -- source for file system paths
	-- snippets
	use("L3MON4D3/LuaSnip") -- snippet engine
	use("saadparwaiz1/cmp_luasnip") -- for autocompletion
	use("rafamadriz/friendly-snippets") -- useful snippets
	-- configuring lsp servers
	use("neovim/nvim-lspconfig") -- easily configure language servers
	use("hrsh7th/cmp-nvim-lsp") -- for autocompletion
	use("jose-elias-alvarez/typescript.nvim") -- additional functionality for typescript server
	use("onsails/lspkind.nvim") -- vs-code like icons for autocompletion
	use({
		"smjonas/inc-rename.nvim",
		config = function()
			require("inc_rename").setup()
		end,
	})

	--     __                            _      ___     _ _       _   _
	--    / _| ___  _ __ _ __ ___   __ _| |_   ( _ )   | (_)_ __ | |_(_)_ __   __ _
	--   | |_ / _ \| '__| '_ ` _ \ / _` | __|  / _ \/\ | | | '_ \| __| | '_ \ / _` |
	--   |  _| (_) | |  | | | | | | (_| | |_  | (_>  < | | | | | | |_| | | | | (_| |
	--   |_|  \___/|_|  |_| |_| |_|\__,_|\__|  \___/\/ |_|_|_| |_|\__|_|_| |_|\__, |
	--                                                                        |___/
	use("windwp/nvim-autopairs") -- auto close brackets, quotes, etc
	use("jose-elias-alvarez/null-ls.nvim") -- configure formatters & linters
	use("jayp0521/mason-null-ls.nvim") -- bridges gap b/w mason & null-ls

	--    _              _
	--   | |_ ___   ___ | |___
	--   | __/ _ \ / _ \| / __|
	--   | || (_) | (_) | \__ \
	--    \__\___/ \___/|_|___/
	--
	use("folke/which-key.nvim")
	use({ "nvim-telescope/telescope-fzf-native.nvim", run = "make" }) -- dependency for better sorting performance
	use({ "nvim-telescope/telescope.nvim", branch = "0.1.x" }) -- fuzzy finder
	use({ "nvim-telescope/telescope-ui-select.nvim" }) -- for showing lsp code actions
	use("nvim-orgmode/orgmode") -- just like EMACS org-mode but for neovim
	use("folke/trouble.nvim") -- for showing diagnostics, references, etc

	-- just don't remove this
	if packer_bootstrap then
		require("packer").sync()
	end
end)
