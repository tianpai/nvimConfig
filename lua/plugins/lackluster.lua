return {
  "slugbyte/lackluster.nvim",
  opt = {
    -- tweak_highlight allows you to update or overwrite the value passed into
    -- vim.api.nvim_set_hl which allows you to have complete control over modifying all
    -- highlights on a granular level.
    tweak_highlight = {
      -- modify @keyword's highlights to be bold and italic
      ["@keyword"] = {
        overwrite = false, -- overwrite falsey will extend/update lackluster's defaults (nil also does this)
        bold = true,
        italic = true,
        -- see `:help nvim_set_hl` for all possible keys
      },
      -- overwrite @function to link to @keyword
      ["@function"] = {
        overwrite = true, -- overwrite == true will force overwrite lackluster's default highlights
        link = "@keyword",
      },
    },
  },
}
