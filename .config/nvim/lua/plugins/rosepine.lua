return {
	-- [[ Install and configure rose pine theme ]]
	-- All natural pine, faux fur and a bit of soho vibes for the classy minimalist
	"rose-pine/neovim",
	lazy = false,
	priority = 1000,
	name = "rose-pine",
	config = function()
		require("rose-pine").setup({
			variant = "dawn",
			dark_variant = "main",
			dim_inactive_windows = false,
			extend_background_behind_borders = true,
			enable = {
				terminal = true,
				legacy_highlights = true,
				migrations = true,
			},
			styles = {
				bold = true,
				italic = true,
				transparency = true,
			},
			groups = {
				border = "muted",
				link = "iris",
				panel = "surface",

				error = "love",
				hint = "iris",
				info = "foam",
				note = "pine",
				todo = "rose",
				warn = "gold",

				git_add = "foam",
				git_change = "rose",
				git_delete = "love",
				git_dirty = "rose",
				git_ignore = "muted",
				git_merge = "iris",
				git_rename = "pine",
				git_stage = "iris",
				git_text = "rose",
				git_untracked = "subtle",

				h1 = "iris",
				h2 = "foam",
				h3 = "rose",
				h4 = "gold",
				h5 = "pine",
				h6 = "foam",
			},
			highlight_groups = {
				-- Search highlight groups
				Search = { fg = "none", bg = "love", blend = 30, inherit = false },
				IncSearch = { fg = "none", bg = "love", blend = 30, inherit = false },
				CurSearch = { fg = "base", bg = "love", blend = 60, inherit = false },

				-- Normal mode highlight palette
				Normal = { bg = "none", inherit = false },
				NormalFloat = { bg = "none", inherit = false },
				ColorColumn = { bg = "rose", inherit = false },
				WinBar = { bg = "none", inherit = false },
				WinBarNC = { bg = "none", inherit = false },

				-- Visual mode highlight palette
				Visual = { fg = "none", bg = "iris", blend = 30, inherit = false },
				VisualNC = { fg = "none", bg = "iris", blend = 30, inherit = false },

				-- Telescope highlight palette
				TelescopeBorder = { fg = "pine", bg = "none", inherit = false },
				TelescopeNormal = { fg = "subtle", bg = "none", inherit = false },
				TelescopeSelection = { fg = "iris", bg = "iris", blend = 30, inherit = false },
				TelescopeSelectionCaret = { fg = "pine", bg = "none", inherit = false },
				TelescopeMultiSelection = { fg = "pine", bg = "none", inherit = false },
				TelescopeTitle = { fg = "base", bg = "pine", inherit = false },
				TelescopePromptTitle = { fg = "base", bg = "pine", inherit = false },
				TelescopePreviewTitle = { fg = "base", bg = "pine", inherit = false },
				TelescopePromptNormal = { fg = "pine", bg = "none", inherit = false },
				TelescopePromptBorder = { fg = "pine", bg = "none", inherit = false },

				-- Markdown highlight palette
				RenderMarkdownCode = { fg = "none", bg = "none", inherit = false },
				Rm_RmCodeBorder_bg_as_fg = { fg = "none", bg = "none", inherit = false },

				-- Navic highlight palette
				NavicText = { fg = "pine", bg = "none", inherit = false },

				-- GitSigns highlight palette
				SignColumn = { bg = "none", inherit = false },
				GitSignsAdd = { fg = "pine", bg = "none", inherit = false },
				GitSignsChange = { fg = "iris", bg = "none", inherit = false },
				GitSignsDelete = { fg = "love", bg = "none", inherit = false },

				-- -- Lualine highlight palette
				-- lualine_a_normal = { fg = "base", bg = "pine", inherit = false },
				-- lualine_a_inactive = { bg = "highlight_med", inherit = false },
				-- lualine_b_normal = { fg = "pine", bg = "highlight_med", inherit = false },
				-- lualine_b_visual = { fg = "iris", bg = "highlight_med", inherit = false },
				-- lualine_b_insert = { fg = "foam", bg = "highlight_med", inherit = false },
				-- lualine_b_command = { fg = "love", bg = "highlight_med", inherit = false },
				-- lualine_b_inactive = { bg = "highlight_med", inherit = false },
				-- lualine_c_normal = { fg = "pine", bg = "highlight_med", inherit = false },
				-- lualine_c_visual = { fg = "iris", bg = "highlight_med", inherit = false },
				-- lualine_c_insert = { fg = "foam", bg = "highlight_med", inherit = false },
				-- lualine_c_command = { fg = "love", bg = "highlight_med", inherit = false },
				-- lualine_c_inactive = { bg = "highlight_med", inherit = false },
				-- lualine_y_filetype_DevIconLua_normal = { fg = "pine", bg = "highlight_med", inherit = false },
				-- lualine_y_filetype_DevIconLua_visual = { fg = "iris", bg = "highlight_med", inherit = false },
				-- lualine_y_filetype_DevIconLua_insert = { fg = "foam", bg = "highlight_med", inherit = false },
				-- lualine_y_filetype_DevIconLua_command = { fg = "love", bg = "highlight_med", inherit = false },
				-- lualine_y_filetype_DevIconLua_inactive = { bg = "highlight_med", inherit = false },
				-- lualine_y_filetype_DevIconTmux_normal = { fg = "pine", bg = "highlight_med", inherit = false },
				-- lualine_y_filetype_DevIconTmux_visual = { fg = "iris", bg = "highlight_med", inherit = false },
				-- lualine_y_filetype_DevIconTmux_insert = { fg = "foam", bg = "highlight_med", inherit = false },
				-- lualine_y_filetype_DevIconTmux_command = { fg = "love", bg = "highlight_med", inherit = false },
				-- lualine_y_filetype_DevIconTmux_inactive = { bg = "highlight_med", inherit = false },
				-- lualine_y_filetype_DevIconDefault_normal = { fg = "pine", bg = "highlight_med", inherit = false },
				-- lualine_y_filetype_DevIconDefault_visual = { fg = "iris", bg = "highlight_med", inherit = false },
				-- lualine_y_filetype_DevIconDefault_insert = { fg = "foam", bg = "highlight_med", inherit = false },
				-- lualine_y_filetype_DevIconDefault_command = { fg = "love", bg = "highlight_med", inherit = false },
				-- lualine_y_filetype_DevIconDefault_inactive = { bg = "highlight_med", inherit = false },

				-- Mason highlight palette
				MasonHeader = { fg = "base", bg = "pine", inherit = false },
				MasonHighlightBlock = { fg = "base", bg = "foam", inherit = false },
				MasonHighlightBlockBold = { fg = "base", bg = "foam", inherit = false },
				MasonMutedBlock = { fg = "base", bg = "pine", inherit = false },

				-- Dropbar highlight palette
				DropBarMenuHoverEntry = { fg = "iris", bg = "highlight_med", inherit = false },
				DropBarMenuHoverIcon = { fg = "iris", bg = "highlight_med", inherit = false },

				-- Neogit highlight palette
				NeogitDiffAdd = { fg = "pine", bg = "highlight_med", inherit = false },

				-- Diff highlight palette
				DiffAdd = { fg = "pine", bg = "highlight_low", blend = 20, inherit = false },
				DiffChange = { fg = "rose", bg = "highlight_med", blend = 20, inherit = false },
				DiffText = { fg = "rose", bg = "highlight_med", blend = 20, inherit = false },
				DiffDelete = { fg = "rose", bg = "highlight_high", blend = 20, inherit = false },

				-- DiffView highlight palette
				DiffviewFilePanelFileName = { fg = "foam", bg = "none", inherit = false },
				DiffviewFilePanelInsertions = { fg = "pine", bg = "none", inherit = false },
				DiffviewFilePanelDeletions = { fg = "rose", bg = "none", inherit = false },
				DiffviewStatusAdded = { fg = "pine", bg = "none", inherit = false },
				DiffviewStatusModified = { fg = "rose", bg = "none", inherit = false },

				-- Trouble highlight palette
				TroubleCount = { fg = "rose", bg = "none", inherit = false },

				-- CopilotChat highlight palette
				CopilotChatHeader = { fg = "pine", bg = "none", inherit = false },
				CopilotChatSeparator = { fg = "pine", bg = "none", inherit = false },

				-- Showkeys highlight palette
				SkFloatBorder = { fg = "pine", bg = "none", inherit = false },
				SkNormal = { fg = "pine", bg = "none", inherit = false },
				SkActive = { fg = "pine", bg = "none", inherit = false },
				SkInactive = { fg = "iris", bg = "none", inherit = false },

				-- Blink highlight palette
				BlinkCmpDoc = { bg = "none", inherit = false },
				BlinkCmpDocSeparator = { bg = "none", inherit = false },
				BlinkCmpDocCursorLine = { bg = "none", inherit = false },
				BlinkCmpDocBorder = { fg = "iris", inherit = false },

				-- Diagnostics highlight palette
				DiagnosticError = { fg = "love", bg = "love", blend = 30, inherit = false },
				DiagnosticWarn = { fg = "gold", bg = "gold", blend = 30, inherit = false },
				DiagnosticInfo = { fg = "iris", bg = "iris", blend = 30, inherit = false },
				DiagnosticHint = { fg = "foam", bg = "foam", blend = 30, inherit = false },

				-- Statusline
				MiniStatuslineDevinfo = { bg = "highlight_med", inherit = false },
				MiniStatuslineFileinfo = { bg = "highlight_med", inherit = false },
				MiniStatuslineFilename = { bg = "highlight_med", inherit = false },
			},
		})
		vim.cmd.colorscheme("rose-pine")
	end,
}
