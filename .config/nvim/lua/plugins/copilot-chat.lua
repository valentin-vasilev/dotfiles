return {
	{
		"CopilotC-Nvim/CopilotChat.nvim",
		branch = "main",
		dependencies = {
			"zbirenbaum/copilot.lua",
			"nvim-lua/plenary.nvim",
		},
		build = "make tiktoken",
		opts = {
			window = {
				layout = "vertical",
				height = 1,
				width = 0.5,
			},
      highlight_headers = false,
			show_help = false,
			question_header = " ",
			answer_header = " ",
			error_header = " ",
			separator = "───",
		},
	},
}
