-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

-- Switch between header and source file cpp
vim.keymap.set("n", "gh", "<Cmd>ClangdSwitchSourceHeader<CR>", { desc = "Toggle header/source file" })

-- Set diagnostic popup
vim.keymap.set("n", "gk", function()
	vim.diagnostic.open_float()
end, { desc = "Open diagnostic popup" })

-- Toggle copilot
vim.keymap.set("n", "<leader>ae", function()
	if vim.g.copilot_enabled then
		vim.cmd("Copilot disable")
		print("Copilot disabled")
	else
		vim.cmd("Copilot enable")
		print("Copilot enabled")
	end
	vim.g.copilot_enabled = not vim.g.copilot_enabled
end, { desc = "Toggle copilot" })

-- Navigate popup with left right
local cmp = require("blink-cmp")
vim.keymap.set({ "i", "s" }, "<C-l>", function()
	cmp.select_next()
end)
vim.keymap.set({ "i", "s" }, "<C-h>", function()
	cmp.select_prev()
end)

