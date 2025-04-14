-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here

-- Disable inlay hints
vim.lsp.inlay_hint.enable(false)

vim.opt.tabstop = 2
vim.opt.shiftwidth = 2
vim.opt.softtabstop = 2
vim.opt.smartindent = true
vim.opt.expandtab = true
vim.g.autoformat = false
vim.opt.wrap = true

-- Set root to the argument given to nvim
vim.g.root_spec = {
  function()
    local args = vim.fn.argv()
    if #args > 0 then
      if vim.fn.isdirectory(args[1]) == 1 then
        return args[1]
      end
    end
  end,
  "lsp",
  "lua",
  "cwd",
}
