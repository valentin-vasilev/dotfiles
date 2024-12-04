return {
	"nvimdev/dashboard-nvim",
  enabled = true,
	dependencies = { { "nvim-tree/nvim-web-devicons" } },
	event = "VimEnter",
	config = function()
		require("dashboard").setup({
			theme = "hyper",
			config = {
				week_header = {
					enable = true,
				},
				shortcut = {
					{ desc = "󱑤 Update", group = "@property", action = "Lazy update", key = "u" },
					{
						icon = " ",
						-- icon_hl = "@variable",
						desc = "Files",
						group = "Label",
						action = "Telescope find_files",
						key = "f",
					},
					{ desc = "New file", icon = "󰓏 ", group = "@property", action = "enew", key = "n" },
				},
        packages = { enable = false },
        mru = { enable = false },
        footer = { "Hi, Val!" },
			},
		})
	end,
}
