return {
  {
    "mfussenegger/nvim-dap-python",
    ft = "python",
    dependencies = { "mfussenegger/nvim-dap" },
    config = function()
      local path = "~/.virtualenvs/debugpy/bin/python" -- ajusta a tu entorno real
      require("dap-python").setup(path)
    end,
  },
}
