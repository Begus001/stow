return {
  "neovim/nvim-lspconfig",
  opts = {
    servers = {
      qmlls = {
        cmd = { "qmlls6" },
      },
      mesonlsp = {
        cmd = { "mesonlsp", "--lsp", "--full" },
      }
    },
  },
}
