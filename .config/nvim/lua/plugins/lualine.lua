return {
	-- [[ Install and configure lualine ]]
	"nvim-lualine/lualine.nvim",
	dependencies = { "nvim-tree/nvim-web-devicons" },
	config = function()
		require("lualine").setup({
			options = {
				theme = "auto",
				component_separators = "",
				section_separators = { left = "", right = "" },
			},
			sections = {
				lualine_a = {
					{
						"mode",
						icons_enabled = true,
						separator = { left = "" },
						right_padding = 2,
					},
				},
				lualine_b = {
					{
						"filename",
						icons_enabled = true,
						separator = { left = "", right = "" },
						symbols = { modified = "󰆗 ", readonly = " ", unnamed = " ", newfile = " " },
					},
					{ "branch", icons_enabled = true, icon = "" },
				},
				lualine_c = {},
				lualine_x = {},
				lualine_y = { "filetype", "encoding", "progress" },
				lualine_z = {
					{ "location", separator = { right = "" }, left_padding = 2 },
				},
			},
			inactive_sections = {
				lualine_a = { "filename" },
				lualine_b = {},
				lualine_c = {},
				lualine_x = {},
				lualine_y = {},
				lualine_z = { "location" },
			},
			tabline = {},
			extensions = {},
		})
	end,
}
