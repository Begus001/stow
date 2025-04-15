-- Disable copilot on startup
vim.api.nvim_create_autocmd("BufEnter", {
  callback = function()
    vim.cmd("Copilot disable")
    vim.b.copilot_enabled = false
  end,
})
