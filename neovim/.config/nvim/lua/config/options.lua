-- Disable inlay hints
vim.lsp.inlay_hint.enable(false)

vim.opt.tabstop = 4
vim.opt.shiftwidth = 4
vim.opt.softtabstop = 4
vim.opt.smartindent = true
vim.opt.expandtab = true
vim.g.autoformat = false
vim.opt.wrap = true

-- Spelling
vim.o.spell = true
vim.o.spelllang = "en,de"

-- Change directory when given as argument
local args = vim.fn.argv()
if #args > 0 then
  if vim.fn.isdirectory(args[1]) then
    vim.fn.chdir(args[1])
  end
end

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
