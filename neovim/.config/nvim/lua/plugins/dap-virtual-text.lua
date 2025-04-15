return {
  "theHamsta/nvim-dap-virtual-text",
  opts = {
    enabled = false,
  },
  keys = {
    {
      "<leader>dv",
      function()
        local vt = require("nvim-dap-virtual-text")
        vim.g.dap_virtual_text_enabled = not vim.g.dap_virtual_text_enabled
        if vim.g.dap_virtual_text_enabled then
          vt.enable()
          print("Enabled virtual text")
        else
          vt.disable()
          print("Disabled virtual text")
        end
      end,
      desc = "Toggle DAP virtual text",
    },
  },
}
