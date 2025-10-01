return {
  {
    "neovim/nvim-lspconfig",
    opts = {
      servers = {
        nixd = {
          -- optional settings for nixd
          settings = {
            nixd = {
              nixpkgs = {
                expr = "import <nixpkgs> {}",
              },
              formatting = {
                command = { "nixfmt" }, -- or "alejandra"
              },
            },
          },
        },
      },
    },
  },
}
