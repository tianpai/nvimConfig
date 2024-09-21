-- change some telescope options and a keymap to browse plugin files
return {
  "nvim-telescope/telescope.nvim",
  -- change some options
  opts = {
    defaults = {
      mappings = {
        i = {
          ["<esc>"] = require("telescope.actions").close,
          ["<C-j>"] = require("telescope.actions").move_selection_next,
          ["<C-k>"] = require("telescope.actions").move_selection_previous,
        },
      },
      -- vertical view
      layout_strategy = "vertical",
      layout_config = {
        width = 0.95,
      },
      preview = { filesize_limit = 0.2 }, -- MB
    },
  },
}
