-- bootstrap lazy.nvim, LazyVim and your plugins
require("config.lazy")
if vim.g.neovide then
  -- Put anything you want to happen only in Neovide here
  vim.g.neovide_scale_factor = 1.5
end

-- Enable file type detection
vim.cmd("filetype plugin indent on")

-- Set indentation based on file type
vim.api.nvim_create_autocmd("FileType", {
  pattern = "python",
  command = "setlocal shiftwidth=4 tabstop=4 expandtab",
})

vim.api.nvim_create_autocmd("FileType", {
  pattern = { "javascript", "typescript" },
  command = "setlocal shiftwidth=2 tabstop=2 expandtab",
})
