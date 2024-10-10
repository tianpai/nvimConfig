--     ____      _                              _
--    / ___|__ _| |_ _ __  _ __  _   _  ___ ___(_)_ __
--   | |   / _` | __| '_ \| '_ \| | | |/ __/ __| | '_ \
--   | |__| (_| | |_| |_) | |_) | |_| | (_| (__| | | | |
--    \____\__,_|\__| .__/| .__/ \__,_|\___\___|_|_| |_|
--                  |_|   |_|

-- I mainly use the mocha color palette on catppuccin
local mocha = {
  base = "#010101",
  blue = "#89b4fa",
  crust = "#11111b",
  flamingo = "#f2cdcd",
  green = "#a6e3a1",
  lavender = "#b4befe",
  mantle = "#181825",
  maroon = "#eba0ac",
  mauve = "#cba6f7",
  overlay0 = "#6c7086",
  overlay1 = "#7f849c",
  overlay2 = "#9399b2",
  peach = "#fab387",
  pink = "#f5c2e7",
  red = "#f38ba8",
  rosewater = "#f5e0dc",
  sapphire = "#74c7ec",
  sky = "#89dceb",
  subtext0 = "#a6adc8",
  subtext1 = "#bac2de",
  surface0 = "#313244",
  surface1 = "#45475a",
  surface2 = "#585b70",
  teal = "#94e2d5",
  text = "#cdd6f4",
  yellow = "#f9e2af",
}

local color_overrides = {
  mocha = mocha,
}

local custom_highlights_mocha = function(colors)
  return {}
end

local catppuccin_intergration = {
  aerial = true,
  alpha = true,
  cmp = true,
  dashboard = true,
  flash = true,
  gitsigns = true,
  headlines = true,
  illuminate = true,
  indent_blankline = { enabled = true },
  leap = true,
  lsp_trouble = true,
  mason = true,
  markdown = true,
  mini = true,
  native_lsp = {
    enabled = true,
    underlines = {
      errors = { "undercurl" },
      hints = { "undercurl" },
      warnings = { "undercurl" },
      information = { "undercurl" },
    },
  },
  navic = { enabled = true, custom_bg = "lualine" },
  neotest = true,
  neotree = true,
  noice = true,
  notify = true,
  semantic_tokens = true,
  telescope = { enabled = true, style = "nvchad" },
  treesitter = true,
  treesitter_context = true,
  which_key = true,
}

--             _
--    ___  ___| |_ _   _ _ __
--   / __|/ _ \ __| | | | '_ \
--   \__ \  __/ |_| |_| | |_) |
--   |___/\___|\__|\__,_| .__/
--                      |_|

return {

  -- load cat ppuccin theme
  {
    "catppuccin/nvim",
    lazy = false,
    name = "catppuccin",
    opts = {
      flavor = "mocha",
      color_overrides = color_overrides,
      custom_highlights = custom_highlights_mocha,
      integrations = catppuccin_intergration,
    },
  },

  {
    "slugbyte/lackluster.nvim",
    lazy = false,
    priority = 1000,
    init = function()
      vim.cmd.colorscheme("lackluster")
      -- vim.cmd.colorscheme("lackluster-hack") -- my favorite
      -- vim.cmd.colorscheme("lackluster-mint")
    end,
  },

  {
    "bettervim/yugen.nvim",
    lazy = false,
    priority = 1000,
    init = function()
      vim.cmd.colorscheme("yugen")
    end,
  },
  -- config LazyVim to use catppuccin theme
  {
    "LazyVim/LazyVim",
    opts = {
      -- colorscheme = "catppuccin",
      colorscheme = "lackluster-hack",
    },
  },

  -- change trouble config
  {
    "folke/trouble.nvim",
    -- opts will be merged with the parent spec
    opts = { use_diagnostic_signs = true },
  },

  -- disable notify
  { "rcarriga/nvim-notify", enabled = false },
}
