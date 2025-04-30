return {
  "mfussenegger/nvim-dap",
  keys = {
    { "<f8>", function() require("dap").continue() end, desc = "Continue" },
    { "<f9>", function() require("dap").step_into() end, desc = "Step into" },
    { "<f10>", function() require("dap").step_over() end, desc = "Step over" },
    { "<f11>", function() require("dap").step_out() end, desc = "Step out" },
    { "<f12>", function() require("dap").step_back() end, desc = "Step back" },
  }
}
