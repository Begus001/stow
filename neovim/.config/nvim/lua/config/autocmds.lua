-- Change Ctrl+c behavior in command window
vim.api.nvim_create_augroup("CmdwinMappings", { clear = true })
vim.api.nvim_create_autocmd("CmdwinEnter", {
  group = "CmdwinMappings",
  callback = function()
    vim.keymap.set({ "i", "v" }, "<C-c>", "<Esc>", { buffer = true, remap = true })
  end,
})

-- Spelling
vim.api.nvim_create_autocmd("FileType", {
  callback = function()
    vim.opt_local.spell = true
    vim.opt_local.spelllang = "en,de"
  end,
  pattern = "markdown"
})
