return {
	{
		"nvim-treesitter/nvim-treesitter",
		branch = "main",
		lazy = false,
		build = ":TSUpdate",
		config = function()
			require("nvim-treesitter").setup()
			require("nvim-treesitter").install({
				"bash", "diff", "dockerfile", "editorconfig", "helm",
				"go", "json", "lua", "markdown_inline", "python",
				"regex", "terraform", "vim", "vimdoc", "yaml",
			}):wait(300000)
		end,
	},
	{
		"nvim-treesitter/nvim-treesitter-textobjects",
		branch = "main",
		lazy = false,
		dependencies = { "nvim-treesitter/nvim-treesitter" },
		init = function()
			vim.g.no_plugin_maps = true
		end,
		config = function()
			require("nvim-treesitter-textobjects").setup({
				select = { lookahead = true },
			})

			local select = require("nvim-treesitter-textobjects.select")
			local keymaps = {
				["a="] = "@assignment.outer",
				["i="] = "@assignment.inner",
				["l="] = "@assignment.lhs",
				["r="] = "@assignment.rhs",
				["ai"] = "@conditional.outer",
				["ii"] = "@conditional.inner",
				["af"] = "@function.outer",
				["if"] = "@function.inner",
				["ac"] = "@class.outer",
				["ic"] = "@class.inner",
				["al"] = "@loop.outer",
				["il"] = "@loop.inner",
			}
			for lhs, query in pairs(keymaps) do
				vim.keymap.set({ "x", "o" }, lhs, function()
					select.select_textobject(query, "textobjects")
				end)
			end
		end,
	},
}
