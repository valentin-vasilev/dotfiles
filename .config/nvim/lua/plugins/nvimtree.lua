return {
	"nvim-tree/nvim-tree.lua",
	dependencies = { "nvim-tree/nvim-web-devicons" },
	config = function()
		local nvimtree = require("nvim-tree")
		vim.g.loaded_netrw = 1
		vim.g.loaded_netrwPlugin = 1
		nvimtree.setup({
			view = {
				width = 50,
			},
			renderer = {
				indent_markers = {
					enable = false,
				},
				icons = {
					show = {
						hidden = true,
					},
					web_devicons = {
						file = {
							enable = true,
							color = true,
						},
						folder = {
							enable = false,
							color = true,
						},
					},
					glyphs = {
						folder = {
							arrow_closed = "",
							arrow_open = "",
						},
						git = {
							unstaged = "×",
							staged = "",
							unmerged = "󰧾",
							untracked = "󱙒",
							renamed = "",
							deleted = "",
							ignored = "󱙝",
						},
					},
					git_placement = "after",
					modified_placement = "signcolumn",
					diagnostics_placement = "signcolumn",
					bookmarks_placement = "signcolumn",
				},
			},
			actions = {
				open_file = {
					window_picker = {
						enable = false,
					},
				},
			},
			filters = {
				custom = { ".DS_Store" },
			},
			git = {
				ignore = false,
			},
		})
	end,
}
