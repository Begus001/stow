return {
  "jake-stewart/multicursor.nvim",
  branch = "main",
  config = function()
    local mc = require("multicursor-nvim")
    mc.setup()

    local set = vim.keymap.set
    local del = vim.keymap.del

    -- Add or skip cursor above/below the main cursor.
    set({ "n", "x" }, "-k", function()
      mc.lineAddCursor(-1)
    end, { desc = "Add cursor up" })
    set({ "n", "x" }, "-j", function()
      mc.lineAddCursor(1)
    end, { desc = "Add cursor down" })
    set({ "n", "x" }, "-K", function()
      mc.lineSkipCursor(-1)
    end, { desc = "Skip cursor up" })
    set({ "n", "x" }, "-J", function()
      mc.lineSkipCursor(1)
    end, { desc = "Skip cursor down" })

    set({ "n", "x" }, "-n", function()
      mc.matchAddCursor(1)
    end, { desc = "Add cursor to next match" })
    set({ "n", "x" }, "-q", function()
      mc.matchSkipCursor(1)
    end, { desc = "Skip cursor to next match" })
    set({ "n", "x" }, "-N", function()
      mc.matchAddCursor(-1)
    end, { desc = "Add cursor to previous match" })
    set({ "n", "x" }, "-Q", function()
      mc.matchSkipCursor(-1)
    end, { desc = "Skip cursor to previous match" })

    -- Add and remove cursors with control + left click.
    set("n", "<c-leftmouse>", mc.handleMouse)
    set("n", "<c-leftdrag>", mc.handleMouseDrag)
    set("n", "<c-leftrelease>", mc.handleMouseRelease)

    set({ "n", "x" }, "-e", mc.toggleCursor, { desc = "Toggle cursor" })

    set("x", "-s", mc.splitCursors, { desc = "Split cursors" })

    -- Mappings defined in a keymap layer only apply when there are
    -- multiple cursors. This lets you have overlapping mappings.
    mc.addKeymapLayer(function(layerSet)
      -- Select a different cursor as the main one.
      layerSet({ "n", "x" }, "-h", mc.prevCursor)
      layerSet({ "n", "x" }, "-l", mc.nextCursor)

      -- Delete the main cursor.
      layerSet({ "n", "x" }, "-x", mc.deleteCursor)

      -- Enable and clear cursors using escape.
      layerSet("n", "<esc>", function()
        if not mc.cursorsEnabled() then
          mc.enableCursors()
        else
          mc.clearCursors()
        end
      end)
    end)

    set("n", "-r", mc.restoreCursors, { desc = "Restore cursors" })

    set({ "n", "x" }, "-a", mc.matchAllAddCursors, { desc = "Add cursors to all matches" })

    set("x", "-m", mc.matchCursors, { desc = "Add cursors to regex match" })

    set({ "n", "x" }, "-<c-a>", mc.sequenceIncrement, { desc = "Increment numbers under cursors" })
    set({ "n", "x" }, "-<c-x>", mc.sequenceDecrement, { desc = "Decrement numbers under cursors" })

    -- Customize how cursors look.
    local hl = vim.api.nvim_set_hl
    hl(0, "MultiCursorCursor", { reverse = true })
    hl(0, "MultiCursorVisual", { link = "Visual" })
    hl(0, "MultiCursorSign", { link = "SignColumn" })
    hl(0, "MultiCursorMatchPreview", { link = "Search" })
    hl(0, "MultiCursorDisabledCursor", { reverse = true })
    hl(0, "MultiCursorDisabledVisual", { link = "Visual" })
    hl(0, "MultiCursorDisabledSign", { link = "SignColumn" })
  end,
}
