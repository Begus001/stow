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

if vim.g.neovide then
  vim.g.snacks_animate = false

  vim.g.neovide_cursor_animation_length = 0.1
  vim.g.neovide_cursor_trail_size = 1.00
  vim.g.neovide_cursor_animate_in_insert_mode = true
  vim.g.neovide_cursor_animate_command_line = true
  vim.g.neovide_cursor_unfocused_outline_width = 0.05
  vim.g.neovide_cursor_smooth_blink = true

  vim.g.neovide_scroll_animation_length = 0.20
  vim.g.neovide_scroll_animation_far_lines = 1

  vim.g.neovide_opacity = 1.00
  vim.g.neovide_normal_opacity = 1.00

  vim.g.neovide_floating_blur_amount_x = 10.0
  vim.g.neovide_floating_blur_amount_y = 10.0

  vim.g.neovide_position_animation_length = 0.25

  vim.g.neovide_floating_corner_radius = 0.4

  local scale = 0.80
  local step = 1.05
  vim.g.neovide_scale_factor = scale

  vim.keymap.set({ "n", "i", "x" }, "<C-+>", function()
    vim.g.neovide_scale_factor = vim.g.neovide_scale_factor * step
    print(vim.g.neovide_scale_factor)
  end)

  vim.keymap.set({ "n", "i", "x" }, "<C-->", function()
    vim.g.neovide_scale_factor = vim.g.neovide_scale_factor / step
    print(vim.g.neovide_scale_factor)
  end)

  vim.keymap.set({ "n", "i", "x" }, "<C-0>", function()
    vim.g.neovide_scale_factor = scale
    print(vim.g.neovide_scale_factor)
  end)

end
