-- bootstrap lazy.nvim, LazyVim and your plugins
require("config.lazy")
if vim.g.neovide then
  -- Put anything you want to happen only in Neovide here
  vim.g.neovide_scale_factor = 1.5
end
