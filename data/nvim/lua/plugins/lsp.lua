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
        gopls = {
          settings = {
            gopls = {
              -- Format On Save
              format = {
                enable = true,
              },
              -- Use gopls' built-in formatting (default is gofmt)
              gofumpt = true,
              -- Enable or disable diagnostics
              diagnostics = {
                enable = true,
              },
              -- Autocomplete and signature help
              completion = {
                disable = false,
              },
              -- Additional settings for gopls can go here
            },
          },
        },
      },
    },
  },
}
