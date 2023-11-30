local telescope_setup, telescope = pcall(require, "telescope")
if not telescope_setup then
	return
end

local actions_setup, actions = pcall(require, "telescope.actions")
if not actions_setup then
	return
end

local themes_setup, themes = pcall(require, "telescope.themes")
if not themes_setup then
	return
end

telescope.setup({
	defaults = {
		preview = {
			filesize_limit = 0.3, -- MB
		},
		mappings = {
			i = {
				["<C-k>"] = actions.move_selection_previous, -- move to prev result
				["<C-j>"] = actions.move_selection_next, -- move to next result
				["<C-q>"] = actions.send_selected_to_qflist + actions.open_qflist, -- send selected to quickfixlist
			},
		},

		-- vertical layout
		--[[
        --------------------
        |                  |
        |                  |
        |                  |
        |     preview      |
        |                  |
        |                  |
        --------------------
        |                  |
        |                  |
        |      prompt      |
        |                  |
        --------------------
        --]]
		layout_strategy = "vertical",
		layout_config = {
			height = vim.o.lines,
			width = vim.o.columns,
			prompt_position = "bottom", -- input prompt at bottom
			preview_height = 0.6,
		},
	},
	-- Default configuration for builtin pickers goes here
	pickers = {},
	-- Default configuration for builtin extensions goes here
	extensions = {
		["ui-select"] = {
			themes.get_ivy({}),
		},
	},
})

telescope.load_extension("fzf")
telescope.load_extension("ui-select")
telescope.load_extension("file_browser")
telescope.load_extension("frecency")
