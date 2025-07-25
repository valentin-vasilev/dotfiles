return {
	"MeanderingProgrammer/markdown.nvim",
	main = "render-markdown",
	opts = {},
	name = "render-markdown",
	dependencies = { "nvim-treesitter/nvim-treesitter", "echasnovski/mini.nvim" }, -- if you use the mini.nvim suite
	config = function()
		require("render-markdown").setup({
			heading = {
				enabled = true,
				sign = true,
				icons = { "󰎤 ", "󰎧 ", "󰎪 ", "󰎭 " },
				signs = { "▸", "▹", "▪", "▫" },
				backgrounds = { "none", "none", "none", "none" },
			},
			quote = {
				enabled = true,
				icon = "",
				highlight = "RenderMarkdownQuote",
			},
			code = {
				enabled = true,
				sign = false,
				style = "full",
				border = "thin",
				above = "",
				language_border = "",
				below = "",
				highlight = "RenderMarkdownCode",
			},
			latex = { enabled = false },
			completions = {
				blink = { enabled = true },
				lsp = { enabled = true },
			},
		})
	end,
}
