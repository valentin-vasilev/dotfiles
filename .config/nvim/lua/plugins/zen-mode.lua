return {
	"folke/zen-mode.nvim",
	opts = {},
	config = function()
		require("zen-mode").setup({
			window = {
				backdrop = 0.95,
				width = 0.65,
			},
			plugins = {
				tmux = { enabled = "false" },
			},
		})
		vim.api.nvim_set_keymap("n", "<leader>zm", ":ZenMode<CR>", { noremap = true, silent = true, desc = "zen mode" })
	end,
}
