-- Switch between header and source file cpp
vim.keymap.set("n", "gh", "<Cmd>ClangdSwitchSourceHeader<CR>", { desc = "Toggle header/source file" })

-- Set diagnostic popup
vim.keymap.set("n", "gk", function()
  vim.diagnostic.open_float()
end, { desc = "Open diagnostic popup" })

-- Toggle copilot
vim.keymap.set("n", "<leader>ae", function()
  local cmd = require("copilot.command")
  local client = require("copilot.client")

  if client.is_disabled() then
    cmd.enable()
    print("Copilot enabled")
  else
    cmd.disable()
    print("Copilot disabled")
  end

end, { desc = "Toggle copilot" })

vim.keymap.set("n", "<leader>as", "<cmd>Copilot status<cr>")

vim.keymap.set({ "n", "i" }, "<C-c>", "<esc>")

vim.keymap.set({ "n", "x" }, "ü", "[", { remap = true })
vim.keymap.set({ "n", "x" }, "+", "]", { remap = true })

vim.keymap.set({ "n", "x" }, "<leader>ci", ":TSCppDefineClassFunc<cr>")

