-- ~/.config/nvim/lua/plugins/roslyn.lua

return {
  {
    "seblyng/roslyn.nvim",
    ft = { "cs", "razor" }, -- solo para C# y Razor
    dependencies = {
      "neovim/nvim-lspconfig",
      "williamboman/mason.nvim",
    },
    opts = {
      -- Las opciones por defecto, puedes personalizar
      exe = {
        -- Ruta al roslyn dll. Aquí suponemos que lo has instalado en data/roslyn
        "dotnet",
        vim.fs.joinpath(vim.fn.stdpath("data"), "roslyn", "Microsoft.CodeAnalysis.LanguageServer.dll"),
      },
      args = {
        "--logLevel=Information",
        "--extensionLogDirectory=" .. vim.fs.dirname(vim.lsp.get_log_path()),
        "--stdio",
      },
      filewatching = true, -- puedes poner false si hay problemas de rendimiento
      broad_search = false, -- si quieres que busque `.sln` en directorios superiores
      lock_target = false, -- si hay múltiples soluciones, si fija una
      -- Puedes añadir configuración específica para features:
      config = {
        settings = {
          ["csharp|inlay_hints"] = {
            dotnet_enable_inlay_hints_for_implicit_object_creation = true,
            dotnet_enable_inlay_hints_for_implicit_variable_types = true,
            -- etc según lo que necesites
          },
          ["csharp|code_lens"] = {
            dotnet_enable_references_code_lens = true,
          },
          ["csharp|symbol_search"] = {
            dotnet_search_reference_assemblies = true,
          },
        },
      },
    },
    config = function(_, opts)
      -- Inicializar mason si no lo has hecho ya
      require("mason").setup()
      -- Si quieres que roslyn sea instalable a través de mason
      -- Necesitas registrar el registro custom
      local mr = require("mason-registry")
      -- Si es necesario, añadir el registro
      -- por ejemplo: "github:Crashdummyy/mason-registry" según roslyn.nvim docs :contentReference[oaicite:6]{index=6}

      -- Aquí configurar el plugin
      require("roslyn").setup(opts)
    end,
  },
}
