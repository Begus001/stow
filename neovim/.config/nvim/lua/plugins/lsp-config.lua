return {
  "neovim/nvim-lspconfig",
  opts = {
    servers = {
      clangd = {
        cmd = {
          "clangd",
          "--background-index",
          "--clang-tidy",
          "--header-insertion=iwyu",
          "--completion-style=detailed",
          "--function-arg-placeholders",
          "--fallback-style=llvm",
          "--header-insertion-decorators",
          "--compile-commands-dir=build",
        },
      },
      qmlls = {
        cmd = { "qmlls6" },
      },
      mesonlsp = {
        cmd = { "mesonlsp", "--lsp", "--full" },
      },
    },
  },
}
