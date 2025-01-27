return {
	{
		"smoka7/multicursors.nvim",
		event = "VeryLazy",
		dependencies = {
			"nvimtools/hydra.nvim",
		},
		opts = {},
		cmd = { "MCstart", "MCvisual", "MCclear", "MCpattern", "MCvisualPattern", "MCunderCursor" },
		keys = {
			{
				mode = { "v", "n" },
				"<Leader>m",
				"<cmd>MCstart<cr>",
				desc = "Create a selection for selected text or word under the cursor",
			},
		},
	},
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
			enabled = false
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
				desc = "Toggle DAP virtual text"
			},
		},
	},
}
