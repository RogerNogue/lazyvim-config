return {
  {
    "vim-python/python-syntax",
    ft = { "python", "vyper" }, -- que funcione también para archivos .vy
    config = function()
      vim.api.nvim_create_autocmd({ "BufRead", "BufNewFile" }, {
        pattern = "*.vy",
        callback = function()
          vim.bo.filetype = "vyper"
        end,
      })
      -- vincular vyper al resaltado de python
      vim.api.nvim_create_autocmd("FileType", {
        pattern = "vyper",
        callback = function()
          vim.cmd("setlocal syntax=python")
        end,
      })
    end,
  },
}
