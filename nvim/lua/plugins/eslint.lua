return {
  {
    "neovim/nvim-lspconfig",
    opts = function(_, opts)
      opts.servers = opts.servers or {}
      opts.servers.eslint = {
        settings = {
          format = true, -- Auto-fix errors on save
          run = "onSave", -- Run ESLint automatically when saving
          codeActionOnSave = {
            enable = true,
            mode = "all",
          },
          rulesCustomizations = {},
          experimental = {
            useFlatConfig = false,
          },
        },
      }
    end,
  },
}
