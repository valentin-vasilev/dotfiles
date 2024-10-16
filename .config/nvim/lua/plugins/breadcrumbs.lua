return {
	"LunarVim/breadcrumbs.nvim",
	dependencies = {
		{ "SmiteshP/nvim-navic" },
	},
	config = function()
		require("breadcrumbs").setup({
			auto_enable = true,
			icons = {
				default = " ",
				git = " ",
				home = " ",
			},
			separator = " > ",
		})
	end,
}
