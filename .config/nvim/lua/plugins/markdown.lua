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
				icons = { "✿ ", "◉ ", "○ ", "✸ " },
				signs = { "▸", "▹", "▪", "▫" },
				backgrounds = { "none", "none", "none", "none" },
			},
			quote = {
				enabled = true,
				icon = "▋",
				highlight = "RenderMarkdownQuote",
			},
			code = {
				enabled = true,
				sign = true,
				style = "full",
				leftpad = 2,
				border = "thin",
				above = "▄",
				below = "▀",
				highlight = "RenderMarkdownCode",
			},
		})
	end,
}
