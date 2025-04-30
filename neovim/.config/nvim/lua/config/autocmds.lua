-- Change Ctrl+c behavior in command window
vim.api.nvim_create_augroup("CmdwinMappings", { clear = true })
vim.api.nvim_create_autocmd("CmdwinEnter", {
  group = "CmdwinMappings",
  callback = function()
    vim.keymap.set({ "i", "v" }, "<C-c>", "<Esc>", { buffer = true, remap = true })
  end,
})

-- Spelling
vim.api.nvim_create_augroup("MarkdownGrp", { clear = true })
vim.api.nvim_create_autocmd("FileType", {
  group = "MarkdownGrp",
  callback = function()
    vim.opt_local.spell = true
    vim.opt_local.spelllang = "en,de"
  end,
  pattern = "markdown"
})

-- Meson indent
vim.api.nvim_create_augroup("MesonGrp", { clear = true })
vim.api.nvim_create_autocmd("BufEnter", {
  group = "MesonGrp",
  callback = function()
    vim.opt.indentexpr = "nvim_treesitter#indent()"
  end,
  pattern = "meson.build"
})
