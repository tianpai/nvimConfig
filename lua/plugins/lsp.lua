return {
  "neovim/nvim-lspconfig",
  opts = {
    diagnostics = {
      underline = true,
      update_in_insert = false,
      -- virtual_text = {
      --   spacing = 4,
      --   source = "if_many",
      --   prefix = "●",
      -- },
      virtual_text = false,
    },
    inlay_hints = {
      enabled = true,
      exclude = { "javascript" }, -- filetypes for which you don't want to enable inlay hints
    },
  },
}
