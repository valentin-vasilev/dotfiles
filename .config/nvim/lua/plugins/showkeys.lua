return {
	"nvzone/showkeys",
	cmd = "ShowkeysToggle",
	config = function()
		require("showkeys").setup({
			timeout = 3, -- in seconds
			maxkeys = 5, -- maximum number of keys to show
			show_count = true, -- show the number of keys pressed
			position = "bottom-right", -- position of the window
			winopts = {
				border = "rounded", -- border style for the window
			},
      winhl = "FloatBorder:SkFloatBorder,Normal:SkNormal", -- highlight groups for the window
		})
	end,
}
