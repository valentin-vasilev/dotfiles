return {
	{
		-- [[ Install and configure Telescope ]]
		-- Fuzzy Finder (files, lsp, etc)
		"nvim-telescope/telescope.nvim",
		version = "*",
		dependencies = { "nvim-lua/plenary.nvim" },
		config = function()
      local telescope = require("telescope")
      telescope.setup({
			defaults = {
				mappings = {
					i = {
						["<C-u>"] = false,
						["<C-d>"] = "delete_buffer",
					},
				},
			}
      })
		end,
	},
	{
		"nvim-telescope/telescope-ui-select.nvim",
		config = function()
			require("telescope").setup({
				extensions = {
					["ui-select"] = {
						require("telescope.themes").get_dropdown({}),
					},
				},
				pickers = {
					find_files = {
						hidden = true,
					},
				},
			})
			require("telescope").load_extension("ui-select")
		end,
	},
}
