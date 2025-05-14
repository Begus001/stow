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
          "--function-arg-placeholders=0",
          "--fallback-style=llvm",
          "--header-insertion-decorators",
          "--compile-commands-dir=build",
          -- "--experimental-modules-support",
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
