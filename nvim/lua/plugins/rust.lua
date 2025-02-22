return {
  {
    "neovim/nvim-lspconfig",
    opts = function(_, opts)
      opts.servers = opts.servers or {}
      opts.servers.rust_analyzer = {
        settings = {
          ["rust-analyzer"] = {
            cargo = {
              loadOutDirsFromCheck = true,
              features = "all", -- You can change this to limit features
            },
            procMacro = {
              enable = true,
            },
            diagnostics = {
              enable = true,
              disabled = { "unresolved-proc-macro" },
            },
            checkOnSave = {
              command = "clippy", -- Use `clippy` instead of `check` for better linting
              extraArgs = { "--no-deps" }, -- Prevent checking dependencies
            },
            completion = {
              autoimport = {
                enable = true,
              },
            },
            files = {
              excludeDirs = { "target", "node_modules" }, -- Ignore heavy folders
            },
          },
        },
      }
    end,
  },
}
