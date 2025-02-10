local telescope = require("telescope")

return {
	{
		"nvim-telescope/telescope.nvim",
		version = "*",
		dependencies = {
			"nvim-lua/plenary.nvim",
			{ "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
			"nvim-telescope/telescope-ui-select.nvim",
		},
		config = function()
			telescope.setup({
				defaults = {
					mappings = {
						i = {
							["<C-u>"] = false,
							["<C-d>"] = "delete_buffer",
						},
					},
				},
				pickers = {
					find_files = {
						hidden = true,
					},
					live_grep = {},
					buffers = {},
					help_tags = {},
				},
				extensions = {
					fzf = {},
					["ui-select"] = {
						require("telescope.themes").get_dropdown({}),
					},
				},
			})
			telescope.load_extension("fzf")
			telescope.load_extension("ui-select")
		end,
	},
}
