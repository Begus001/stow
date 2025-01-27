-- Disable copilot on startup
vim.api.nvim_create_autocmd("VimEnter", { command = "Copilot disable" })
vim.g.copilot_enabled = false
