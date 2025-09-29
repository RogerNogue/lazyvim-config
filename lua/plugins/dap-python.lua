return {
  {
    "mfussenegger/nvim-dap-python",
    ft = "python",
    dependencies = { "mfussenegger/nvim-dap" },
    config = function()
      local path = "/usr/bin/python3"
      require("dap-python").setup(path)
    end,
  },
}
