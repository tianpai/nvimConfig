local lspconfig = require("lspconfig")

lspconfig.rust_analyzer.setup({
  on_attach = function(client, bufnr)
    vim.lsp.inlay_hint.enable(true, { bufnr = bufnr })
  end,
  settings = {
    ["rust-analyzer"] = {
      imports = {
        granularity = {
          group = "module",
        },
        prefix = "self",
      },
      cargo = {
        buildScripts = {
          enable = true,
        },
      },
      procMacro = {
        enable = true,
      },
    },
  },
})

return {
  "neovim/nvim-lspconfig",
  opts = {
    servers = {
      -- rust_analyzer = false,
    },
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
