return {
  {
    "nvim-neotest/neotest",
    dependencies = {
      "nsidorenco/neotest-vstest",
    },
    config = function()
      require("neotest").setup({
        adapters = {
          require("neotest-vstest")({
            -- Opcional: si el sdk no se detecta automáticamente
            -- sdk_path = "/usr/local/dotnet/sdk/9.0.101/",
            dap_settings = {
              type = "netcoredbg", -- requerido si quieres depuración
            },
            -- Opcional: selector de soluciones
            solution_selector = function(solutions)
              return nil
            end,
          }),
        },
      })
    end,
  },
}
