return {
	"NeogitOrg/neogit",
	dependencies = {
		"nvim-lua/plenary.nvim",
		"sindrets/diffview.nvim",
		"nvim-telescope/telescope.nvim",
	},
	config = function()
		require("neogit").setup({
			signs = {
				hunk = { "", "" },
				item = { "", "" },
				section = { "", "" },
			},
			integrations = {
				telescope = true,
			},
		})
	end,
}
