return {
	{
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

			set({"n", "x"}, "-a", mc.matchAllAddCursors, { desc = "Add cursors to all matches" })

			set("x", "-m", mc.matchCursors, { desc = "Add cursors to regex match" })

			set({"n", "x"}, "-<c-a>", mc.sequenceIncrement, { desc = "Increment numbers under cursors" })
			set({"n", "x"}, "-<c-x>", mc.sequenceDecrement, { desc = "Decrement numbers under cursors" })

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
	},
	-- {
	-- 	"mg979/vim-visual-multi",
	-- 	branch = "master",
	-- },
	-- {
	-- 	"smoka7/multicursors.nvim",
	-- 	event = "VeryLazy",
	-- 	dependencies = {
	-- 		"nvimtools/hydra.nvim",
	-- 	},
	-- 	opts = {},
	-- 	cmd = { "MCstart", "MCvisual", "MCclear", "MCpattern", "MCvisualPattern", "MCunderCursor" },
	-- 	keys = {
	-- 		{
	-- 			mode = { "v", "n" },
	-- 			"<Leader>m",
	-- 			"<cmd>MCstart<cr>",
	-- 			desc = "Create a selection for selected text or word under the cursor",
	-- 		},
	-- 	},
	-- },
	{
		"mbbill/undotree",
		enabled = true,
		keys = {
			{
				mode = { "v", "n" },
				"<leader>cu",
				"<cmd>UndotreeToggle<cr>",
				desc = "Toggle undotree",
			},
		},
	},
	{ "tpope/vim-sleuth" },
	{
		"kdheepak/lazygit.nvim",
		lazy = true,
		cmd = {
			"LazyGit",
			"LazyGitConfig",
			"LazyGitCurrentFile",
			"LazyGitFilter",
			"LazyGitFilterCurrentFile",
		},
		-- optional for floating window border decoration
		dependencies = {
			"nvim-lua/plenary.nvim",
		},
		-- setting the keybinding for LazyGit with 'keys' is recommended in
		-- order to load the plugin when the command is run for the first time
		keys = {
			{ "<leader>gl", "<cmd>LazyGit<cr>", desc = "LazyGit" },
		},
	},
	{
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
	},
	{
		"neovim/nvim-lspconfig",
		opts = {
			servers = {
				qmlls = {
					cmd = { "qmlls6" },
				},
			},
		},
	},
	{
		"echasnovski/mini.align",
		version = "*",
		config = function()
			require("mini.align").setup()
		end,
	},
	{
		"windwp/nvim-ts-autotag",
		enabled = false,
	}
}
