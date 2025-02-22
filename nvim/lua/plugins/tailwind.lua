return {
  {
    "neovim/nvim-lspconfig",
    opts = function(_, opts)
      opts.servers = opts.servers or {}
      opts.servers.tailwindcss = {
        settings = {
          tailwindCSS = {
            experimental = {
              classRegex = { "tw`([^`]*)", 'tw="([^"]*)', 'tw={"([^"}]*)' }, -- Add more patterns if needed
            },
            validate = true,
          },
        },
      }
    end,
  },
}
