return {
	"echasnovski/mini.statusline",
	enabled = true,
	dependencies = {
		"echasnovski/mini.icons",
	},
	version = false,
	config = function()
		require("mini.statusline").setup({
			use_icons = true,
		})
	end,
}
