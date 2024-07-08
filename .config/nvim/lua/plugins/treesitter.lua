return {
	{ -- [[ Install and configure treesitter ]]
		-- Highlight, edit, and navigate code
		"nvim-treesitter/nvim-treesitter",
		build = ":TSUpdate",
		event = { "BufReadPre", "BufNewFile" },
		dependencies = {
			"nvim-treesitter/nvim-treesitter-textobjects",
		},
		config = function()
			local config = require("nvim-treesitter.configs")
			config.setup({
				ensure_installed = { "lua", "python", "bash", "vim", "vimdoc", "terraform", "regex", "markdown_inline" },
				sync_install = false,
				auto_install = true,
				modules = {},
				highlight = { enable = true },
				indent = { enable = true },
				incremental_selection = {
					enable = true,
					keymaps = {
						init_selection = "<C-n>",
						node_incremental = "<C-n>",
						scope_incremental = "<C-s>",
						node_decremental = "<C-r>",
					},
				},
				font = {
					enable = true,
				},
			})
		end,
	},
	{
		"nvim-treesitter/nvim-treesitter-textobjects",
		lazy = true,
		config = function()
			require("nvim-treesitter.configs").setup({
				textobjects = {
					select = {
						enable = true,
						lookahead = true,
						keymaps = {
							["a="] = { query = "@assignment.outer", desc = "select outer part of an assignment" },
							["i="] = { query = "@assignment.inner", desc = "select inner part of an assignment" },
							["l="] = { query = "@assignment.lhs", desc = "select left hand side of an assignment" },
							["r="] = { query = "@assignment.rhs", desc = "select right hand side of an assignment" },
							["ai"] = { query = "@conditional.outer", desc = "select outer part of a conditional" },
							["ii"] = { query = "@conditional.inner", desc = "select inner part of a conditional" },
							["af"] = { query = "@function.outer", desc = "select outer part of a function definition" },
							["if"] = { query = "@function.inner", desc = "select inner part of a function definition" },
							["ac"] = { query = "@class.outer", desc = "select outer part of a class definition" },
							["ic"] = { query = "@class.inner", desc = "select inner part of a class definition" },
							["al"] = { query = "@loop.outer", desc = "select outer part of a loop" },
							["il"] = { query = "@loop.inner", desc = "select inner part of a loop" },
						},
					},
				},
			})
		end,
	},
}
