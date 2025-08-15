return {
	"MeanderingProgrammer/markdown.nvim",
	main = "render-markdown",
	opts = {},
	name = "render-markdown",
	dependencies = { "nvim-treesitter/nvim-treesitter", "echasnovski/mini.nvim" },
	config = function()
		require("render-markdown").setup({
			anti_conceal = {
				enabled = false,
			},
			heading = {
				enabled = true,
				sign = false,
				icons = { "󰎤 ", "󰎧 ", "󰎪 ", "󰎭 " },
				signs = { "󰎤 ", "󰎧 ", "󰎪 ", "󰎭 " },
				backgrounds = {
					"RenderMarkdownH1Bg",
					"RenderMarkdownH2Bg",
					"RenderMarkdownH3Bg",
					"RenderMarkdownH4Bg",
					"RenderMarkdownH5Bg",
					"RenderMarkdownH6Bg",
				},
			},
			quote = {
				enabled = true,
				render_modes = false,
				icon = "▋",
				repeat_linebreak = true,
				highlight = {
					"RenderMarkdownQuote1",
					"RenderMarkdownQuote2",
					"RenderMarkdownQuote3",
					"RenderMarkdownQuote4",
					"RenderMarkdownQuote5",
					"RenderMarkdownQuote6",
				},
				win_options = {
					showbreak = {
						default = "",
						rendered = "  ",
					},
					breakindent = {
						default = false,
						rendered = true,
					},
					breakindentopt = {
						default = "",
						rendered = "",
					},
				},
			},
			code = {
				language = true,
				position = "left",
				language_icon = true,
				language_name = false,
				enabled = true,
				sign = false,
				style = "full",
				border = "hide",
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
