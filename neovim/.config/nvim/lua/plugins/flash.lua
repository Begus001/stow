return {
  "folke/flash.nvim",
  opts = {
    rainbow = {
      enabled = true,
      shade = 5,
    },
    highlight = {
      backdrop = true,
      groups = {
        match = "FlashMatch",
        current = "FlashCurrent",
        backdrop = "FlashBackdrop",
        label = "FlashLabel",
      },
    },
  },
  config = function()
    vim.api.nvim_command("hi FlashLabel cterm=bold gui=bold guifg=#000000 guibg=#ff007c")
  end,
}
