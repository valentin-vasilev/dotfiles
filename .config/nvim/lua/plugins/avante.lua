return {
	"yetone/avante.nvim",
	event = "VeryLazy",
	version = false, -- Never set this to "*" since the plugin uses release branches
	build = "make",
	dependencies = {
		"nvim-treesitter/nvim-treesitter",
		"stevearc/dressing.nvim",
		"nvim-lua/plenary.nvim",
		"MunifTanjim/nui.nvim",
		-- Optional dependencies
		"nvim-telescope/telescope.nvim", -- for file_selector provider telescope
		"hrsh7th/nvim-cmp", -- autocompletion for avante commands and mentions
		"nvim-tree/nvim-web-devicons", -- or echasnovski/mini.icons
		{
			-- Support for image pasting
			"HakonHarnes/img-clip.nvim",
			event = "VeryLazy",
			opts = {
				default = {
					embed_image_as_base64 = false,
					prompt_for_file_name = false,
					drag_and_drop = {
						insert_mode = true,
					},
				},
			},
		},
		{
			-- Make sure to set up properly if you have lazy=true
			"MeanderingProgrammer/render-markdown.nvim",
			opts = {
				file_types = { "markdown", "Avante" },
				heading = {
					width = "full",
					left_margin = 0,
					left_pad = 0,
					right_pad = 0,
					border = false,
					border_virtual = false,
					border_prefix = false,
				},
			},
			ft = { "markdown", "Avante" },
		},
	},
	opts = {
		-- Use Cline CLI as the ACP provider
		provider = "cline",
		-- Mode for interaction: "agentic" uses tools to automatically generate code
		mode = "agentic",
		-- ACP provider configurations
		acp_providers = {
			["cline"] = {
				command = "cline",
				args = { "--acp" },
				env = {
					NODE_NO_WARNINGS = "1",
				},
			},
		},
		-- Behavior settings
		behaviour = {
			auto_suggestions = false, -- Disable auto suggestions to avoid high API costs
			auto_set_keymaps = true,
			auto_set_highlight_group = true,
			support_paste_from_clipboard = true,
			minimize_diff = true,
		},
		-- Mappings
		mappings = {
			diff = {
				ours = "co",
				theirs = "ct",
				all_theirs = "ca",
				both = "cb",
				cursor = "cc",
				next = "]x",
				prev = "[x",
			},
			suggestion = {
				accept = "<M-l>",
				next = "<M-]>",
				prev = "<M-[>",
				dismiss = "<C-]>",
			},
			jump = {
				next = "]]",
				prev = "[[",
			},
			submit = {
				normal = "<CR>",
				insert = "<C-s>",
			},
			sidebar = {
				apply_all = "A",
				apply_cursor = "a",
				switch_windows = "<Tab>",
				reverse_switch_windows = "<S-Tab>",
			},
		},
		-- Hints (virtual text hints)
		hints = { enabled = true },
		-- Windows configuration
		windows = {
			position = "right",
			wrap = true,
			width = 40,
			sidebar_header = {
				enabled = true,
				align = "left",
				rounded = false,
			},
			input = {
				prefix = "> ",
				height = 8,
			},
			edit = {
				border = { " ", " ", " ", " ", " ", " ", " ", " " },
				start_insert = true,
			},
			ask = {
				floating = false,
				border = { " ", " ", " ", " ", " ", " ", " ", " " },
				start_insert = true,
				focus_on_apply = "ours",
			},
		},
		-- Highlight groups
		highlights = {
			diff = {
				current = "DiffText",
				incoming = "DiffAdd",
			},
		},
		-- Diff configuration
		diff = {
			autojump = true,
			list_opener = "copen",
			override_timeoutlen = 500,
		},
	},
}
