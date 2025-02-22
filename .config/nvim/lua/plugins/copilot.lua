return {
	{
		"zbirenbaum/copilot.lua",
		cmd = "Copilot",
		event = "InsertEnter",
		config = function()
			require("copilot").setup({
				suggestion = {
					enabled = false,
				},
				panel = {
					enabled = false,
				},
				filetypes = {
					markdown = false,
					yaml = false,
					toml = false,
					json = false,
					gitcommit = false,
					gitconfig = false,
					gitrebase = false,
					text = false,
				},
			})
		end,
	},
	{
		{
			"giuxtaposition/blink-cmp-copilot",
		},
	},
}
