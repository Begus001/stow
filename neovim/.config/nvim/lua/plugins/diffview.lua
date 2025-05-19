return {
  "sindrets/diffview.nvim",
  config = function()
    vim.keymap.set("n", "<leader>gdo", function()
      vim.ui.input({ prompt = "refs" }, function(refs)
        vim.cmd(":DiffviewOpen " .. refs)
      end)
    end, { desc = "Open diffview" })

    vim.keymap.set("n", "<leader>gdc", "<cmd>DiffviewClose<cr>", { desc = "Close diffview" })
  end,
}
