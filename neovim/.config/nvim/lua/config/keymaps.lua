-- Switch between header and source file cpp
vim.keymap.set("n", "gh", "<Cmd>ClangdSwitchSourceHeader<CR>", { desc = "Toggle header/source file" })

-- Set diagnostic popup
vim.keymap.set("n", "gk", function()
  vim.diagnostic.open_float()
end, { desc = "Open diagnostic popup" })

-- Toggle copilot
vim.keymap.set("n", "<leader>ae", function()
  if vim.b.copilot_enabled then
    vim.cmd("Copilot disable")
    print("Copilot disabled")
  else
    vim.cmd("Copilot enable")
    print("Copilot enabled")
  end
  vim.b.copilot_enabled = not vim.b.copilot_enabled
end, { desc = "Toggle copilot" })
