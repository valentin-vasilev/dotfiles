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
			highlight_headers = true,
			show_help = false,
			headers = {
				user = " ", -- Header to use for user questions
				assistant = " ", -- Header to use for AI answers
				tool = " ", -- Header to use for tool calls
			},
			separator = "───",
		},
	},
}
