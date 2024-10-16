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
			-- Change specific vim highlight groups
			-- https://github.com/rose-pine/neovim/wiki/Recipes
			highlight_groups = {
				Normal = { bg = "none" },
				NormalFloat = { bg = "none" },
				ColorColumn = { bg = "rose" },
				WinBar = { bg = "none" },
				WinBarNC = { bg = "none", blend = 0 },
				-- Visual mode highlight colors
				Visual = { fg = "base", bg = "iris" },
				VisualNC = { fg = "base", bg = "iris" },
				-- Search highlight colors
				Search = { fg = "overlay", bg = "foam" },
				IncSearch = { fg = "overlay", bg = "foam" },
				CurSearch = { fg = "overlay", bg = "foam" },
				-- Telescope color settings
				TelescopeBorder = { fg = "text", bg = "none" },
				TelescopeNormal = { fg = "subtle", bg = "none" },
				TelescopeSelection = { fg = "text", bg = "none" },
				TelescopeSelectionCaret = { fg = "love", bg = "none" },
				TelescopeMultiSelection = { fg = "text", bg = "none" },
				TelescopeTitle = { fg = "base", bg = "text" },
				TelescopePromptTitle = { fg = "base", bg = "text" },
				TelescopePreviewTitle = { fg = "base", bg = "text" },
				TelescopePromptNormal = { fg = "text", bg = "none" },
				TelescopePromptBorder = { fg = "text", bg = "none" },
				-- Markdown highlight colors
				RenderMarkdownCode = { fg = "pine", bg = "highlight_high", italic = true },
				-- Navic highlight colors
				NavicText = { fg = "pine", bg = "none" },
				-- Remove background for git signs highlight groups
				SignColumn = { bg = "none" },
				GitSignsAdd = { bg = "none" },
				GitSignsChange = { bg = "none" },
				GitSignsDelete = { bg = "none" },
			},
		})
		vim.cmd.colorscheme("rose-pine")
	end,
}
