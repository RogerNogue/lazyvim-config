return {
  {
    "folke/tokyonight.nvim",
    opts = {
      on_highlights = function(hl, c)
        hl.Comment = { fg = "#1b7d00", italic = true }
        hl.DiagnosticUnnecessary = { fg = "#f6ff00", italic = true }
      end,
    },
  },
}
