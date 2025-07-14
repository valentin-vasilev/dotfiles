return {
	"Bekaboo/dropbar.nvim",
	config = function()
		require("dropbar").setup({
			dependencies = {
				"nvim-telescope/telescope-fzf-native.nvim",
				build = "make",
			},
			icons = {
				enable = true,
				ui = {
					bar = {
						separator = "  ",
						extends = "…",
					},
					menu = {
						separator = " ",
						indicator = "",
					},
				},
			},
		})
	end,
}
