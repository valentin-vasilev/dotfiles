return {
	"folke/trouble.nvim",
	auto_preview = true,
	auto_refresh = true,
	warn_no_results = false,
	opts = {
		icons = {
			indent = {
				top = "│ ",
				middle = "├╴",
				last = "╰╴",
				fold_open = " ",
				fold_closed = " ",
				ws = "  ",
			},
		},
	},
	modes = {
		preview_float = {
			mode = "diagnostics",
			preview = {
				type = "float",
				relative = "editor",
				border = "rounded",
				title = "Preview",
				title_pos = "center",
				position = { 0, -2 },
				size = { width = 0.3, height = 0.3 },
				zindex = 200,
			},
		},
	},
	cmd = "Trouble",
}
