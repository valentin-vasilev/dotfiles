return {
	"nvimdev/dashboard-nvim",
	enabled = true,
	dependencies = { "nvim-tree/nvim-web-devicons" },
	event = "VimEnter",
	config = function()
		require("dashboard").setup({
			theme = "hyper",
			config = {
				week_header = {
					enable = true,
				},
				shortcut = {
					{ desc = "Update", icon = "󱑤 ", group = "Label", action = "Lazy update", key = "u" },
					{
						desc = "Files",
						icon = " ",
						group = "Label",
						action = "Telescope find_files",
						key = "f",
					},
					{ desc = "New file", icon = "󰓏 ", group = "Label", action = "enew", key = "n" },
				},
				packages = { enable = false },
				mru = { enable = false },
				footer = { "Hi, Val!" },
			},
		})
	end,
}
