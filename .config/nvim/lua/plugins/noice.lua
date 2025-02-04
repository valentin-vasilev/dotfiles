return {
	"folke/noice.nvim",
  enabled = false,
	event = "VeryLazy",
	opts = {},
	dependencies = {
		"MunifTanjim/nui.nvim",
		"rcarriga/nvim-notify",
	},
	config = function()
    local noice = require("noice")
		noice.setup({
			cmdline = {
				format = {
					cmdline = { pattern = "^:", icon = " ", lang = "vim" },
					search_down = { kind = "search", pattern = "^/", icon = "  ", lang = "regex" },
					search_up = { kind = "search", pattern = "^%?", icon = "  ", lang = "regex" },
				},
			},
			lsp = {
				override = {
					["vim.lsp.util.convert_input_to_markdown_lines"] = true,
					["vim.lsp.util.stylize_markdown"] = true,
					["cmp.entry.get_documentation"] = true, -- requires hrsh7th/nvim-cmp
				},
			},
			presets = {
				lsp_doc_border = true,
				long_message_to_split = true,
			},
			views = {
				cmdline_popup = {
					position = {
						row = 7,
						col = "50%",
					},
					size = {
						width = 80,
						height = "auto",
					},
				},
				popupmenu = {
					relative = "editor",
					position = {
						row = 10,
						col = "50%",
					},
					size = {
						width = 80,
						height = 10,
					},
					border = {
						style = "rounded",
						padding = { 0, 1 },
					},
					win_options = {
						winhighlight = { Normal = "Normal", FloatBorder = "DiagnosticInfo" },
					},
				},
			},
      routes = {
      {
        view = "notify",
        filter = { event = "msg_showmode" },
        },
      },
		})
	end,
}
