return {
  "neovim/nvim-lspconfig",
  opts = {
    -- servers = {
    --   rust_analyzer = false,
    -- },
    diagnostics = {
      underline = true,
      update_in_insert = false,
      virtual_text = false,
    },
    inlay_hints = {
      enabled = true,
      exclude = { "javascript", "python" }, -- filetypes for which you don't want to enable inlay hints
    },
  },
}
