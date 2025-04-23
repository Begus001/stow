-- Disable copilot on startup
vim.api.nvim_create_autocmd("BufEnter", {
  callback = function()
    vim.cmd("Copilot disable")
    vim.b.copilot_enabled = false
  end,
})

vim.api.nvim_create_augroup("CmdwinMappings", { clear = true })
vim.api.nvim_create_autocmd("CmdwinEnter", {
  group = "CmdwinMappings",
  callback = function()
    vim.keymap.set({ "i", "v" }, "<C-c>", "<Esc>", { buffer = true, remap = true })
  end,
})
