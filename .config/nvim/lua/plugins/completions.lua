return {
	"saghen/blink.cmp",
	dependencies = "rafamadriz/friendly-snippets",
	version = "*",
	---@module 'blink.cmp'
	---@type blink.cmp.Config
	opts = {
		-- 'default' for mappings similar to built-in completion
		-- 'super-tab' for mappings similar to vscode (tab to accept, arrow keys to navigate)
		-- 'enter' for mappings similar to 'super-tab' but with 'enter' to accept
		-- See the full "keymap" documentation for information on defining your own keymap.
		keymap = { preset = "default" },
		completion = {
			menu = {
				border = "rounded",
				draw = {
					columns = {
						{ "label", "label_description", gap = 1 },
						{ "kind_icon", "kind" },
					},
				},
			},
			ghost_text = { enabled = true },
			documentation = { auto_show = true, auto_show_delay_ms = 500, window = { border = "rounded" } },
		},
		signature = { window = { border = "rounded" } },
		appearance = {
			-- Sets the fallback highlight groups to nvim-cmp's highlight groups
			-- Useful for when your theme doesn't support blink.cmp
			-- Will be removed in a future release
			use_nvim_cmp_as_default = true,
			-- Set to 'mono' for 'Nerd Font Mono' or 'normal' for 'Nerd Font'
			-- Adjusts spacing to ensure icons are aligned
			nerd_font_variant = "mono",
			kind_icons = {
				Text = "󰉿 ",
				Method = "󰊕 ",
				Function = "󰊕 ",
				Constructor = "󰒓 ",

				Field = "󰜢 ",
				Variable = "󰆦 ",
				Property = "󰖷 ",

				Class = "󱡠 ",
				Interface = "󱡠 ",
				Struct = "󱡠 ",
				Module = "󰅩 ",

				Unit = "󰪚 ",
				Value = "󰦨 ",
				Enum = "󰦨 ",
				EnumMember = "󰦨 ",

				Keyword = "󰻾 ",
				Constant = "󰏿 ",

				Snippet = "󱄽 ",
				Color = "󰏘 ",
				File = "󰈔 ",
				Reference = "󰬲 ",
				Folder = "󰉋 ",
				Event = "󱐋 ",
				Operator = "󰪚 ",
				TypeParameter = "󰬛 ",
			},
		},

		-- Default list of enabled providers defined so that you can extend it
		-- elsewhere in your config, without redefining it, due to `opts_extend`
		sources = {
			default = { "lsp", "path", "snippets", "buffer" },
			per_filetype = {
				markdown = { "path", "snippets", "buffer" },
				yaml = { "path", "snippets", "buffer" },
				json = { "path", "snippets", "buffer" },
				providers = {
					lsp = {
						name = "lsp",
						enabled = true,
						module = "blink.cmp.sources.lsp",
						kind = "LSP",
						min_keyword_length = 2,
						score_offset = 90,
					},
					path = {
						name = "path",
						module = "blink.cmp.sources.path",
						score_offset = 25,
						-- show snippets and buffer suggestions, only if there are no path suggestions
						fallbacks = { "snippets", "buffer" },
						min_keyword_length = 2,
						opts = {
							trailing_slash = false,
							label_trailing_slash = true,
							get_cwd = function(context)
								return vim.fn.expand(("#%d:p:h"):format(context.bufnr))
							end,
							show_hidden_files_by_default = true,
						},
					},
					copilot = {
						name = "copilot",
						enabled = true,
						module = "blink-cmp-copilot",
						kind = "Copilot",
						score_offset = 100,
						async = true,
					},
				},
			},
		},
	},
	opts_extend = { "sources.default" },
}
