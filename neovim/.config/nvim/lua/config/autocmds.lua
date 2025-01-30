-- Disable copilot on startup
vim.api.nvim_create_autocmd("VimEnter", { callback = function()
	print("Copilot disabled")
	vim.cmd("Copilot disable")
	vim.g.copilot_enabled = false
end })
