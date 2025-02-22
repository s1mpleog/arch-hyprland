return {
  {
    "neovim/nvim-lspconfig",
    opts = function(_, opts)
      opts.servers = opts.servers or {}
      opts.servers.gopls = {
        settings = {
          gopls = {
            analyses = {
              unusedparams = true,
              nilness = true,
              shadow = true,
              unusedwrite = true,
            },
            staticcheck = true,
            gofumpt = true, -- Auto-format using `gofumpt`
            usePlaceholders = true,
          },
        },
      }
    end,
  },
}
