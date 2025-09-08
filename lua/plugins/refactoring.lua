return {
  "ThePrimeagen/refactoring.nvim",
  dependencies = {
    "nvim-lua/plenary.nvim",
    "nvim-treesitter/nvim-treesitter",
    "nvim-telescope/telescope.nvim",
  },
  config = function()
    require("refactoring").setup({})
    -- Opcional: integración con Telescope
    require("telescope").load_extension("refactoring")
  end,

  keys = {
    -- Grupo de refactor para which-key
    { "<leader>r", desc = "+refactor" },

    -- Modo visual
    {
      "<leader>re",
      function()
        return require("refactoring").refactor("Extract Function")
      end,
      desc = "Extract Function",
      mode = "x",
      expr = true,
      silent = true,
    },
    {
      "<leader>rf",
      function()
        return require("refactoring").refactor("Extract Function To File")
      end,
      desc = "Extract Function To File",
      mode = "x",
      expr = true,
      silent = true,
    },
    {
      "<leader>rv",
      function()
        return require("refactoring").refactor("Extract Variable")
      end,
      desc = "Extract Variable",
      mode = "x",
      expr = true,
      silent = true,
    },

    -- Modo normal
    {
      "<leader>ri",
      function()
        return require("refactoring").refactor("Inline Variable")
      end,
      desc = "Inline Variable",
      mode = "n",
      expr = true,
      silent = true,
    },
    {
      "<leader>rI",
      function()
        return require("refactoring").refactor("Inline Function")
      end,
      desc = "Inline Function",
      mode = "n",
      expr = true,
      silent = true,
    },
    {
      "<leader>rbb",
      function()
        return require("refactoring").refactor("Extract Block")
      end,
      desc = "Extract Block",
      mode = "n",
      expr = true,
      silent = true,
    },
    {
      "<leader>rbf",
      function()
        return require("refactoring").refactor("Extract Block To File")
      end,
      desc = "Extract Block To File",
      mode = "n",
      expr = true,
      silent = true,
    },
    -- Opcional: integración con Telescope
    {
      "<leader>rr",
      "<cmd>Telescope refactoring refactors<CR>",
      desc = "Telescope Refactoring",
      mode = "n",
    },
  },
}
