return {
	-- [[ Install and configure which-key ]]
	-- Useful plugin to show you pending keybinds.
	"folke/which-key.nvim",
	init = function()
		vim.o.timeout = true
		vim.o.timeoutlen = 300
	end,
	opts = {},
	config = function()
		require("which-key").setup({
			icons = {
				breadcrumb = "", -- symbol used in the command line area that shows your active key combo
				separator = "", -- symbol used between a key and it's label
				group = " ", -- symbol prepended to a group
			},
			window = {
				border = "single", -- none, single, double, shadow
				position = "bottom", -- bottom, top
				margin = { 1, 0, 1, 0 }, -- extra window margin [top, right, bottom, left]. When between 0 and 1, will be treated as a percentage of the screen size.
				padding = { 1, 2, 1, 2 }, -- extra window padding [top, right, bottom, left]
				winblend = 0, -- value between 0-100 0 for fully opaque and 100 for fully transparent
				zindex = 1000, -- positive value to position WhichKey above other floating windows.
			},
			layout = {
				height = { min = 4, max = 25 }, -- min and max height of the columns
				width = { min = 20, max = 50 }, -- min and max width of the columns
				spacing = 3, -- spacing between columns
				align = "left", -- align columns left, center or right
			},
		})
		local wk = require("which-key")
		-- gitops keymaps [gitsigns and neogit]
		wk.register({
			g = {
				name = "gitops",
				s = { "<cmd>lua require('gitsigns').stage_hunk()<cr>", "stage hunk" },
				u = { "<cmd>lua require('gitsigns').undo_stage_hunk()<cr>", "undo stage hunk" },
				r = { "<cmd>lua require('gitsigns').reset_hunk()<cr>", "reset hunk" },
				p = { "<cmd>lua require('gitsigns').preview_hunk()<cr>", "preview hunk" },
				b = { "<cmd>lua require('gitsigns').blame_line()<cr>", "blame line" },
				f = { "<cmd>lua require('gitsigns').diffthis('~1')<cr>", "diff this" },
				n = { "<cmd>lua require('gitsigns').next_hunk()<cr>", "next hunk" },
				g = { "<cmd>:Neogit<cr>", "git status neogit", noremap = true, silent = true },
			},
		}, { prefix = "<leader>" })
		wk.register({
			s = {
				name = "search",
				["?"] = { "<cmd>lua require('telescope.builtin').oldfiles()<cr>", "search old files" },
				["<space>"] = { "<cmd>lua require('telescope.builtin').buffers()<cr>", "search opened buffers" },
				["/"] = {
					"<cmd>lua require('telescope.builtin').current_buffer_fuzzy_find()<cr>",
					"search in current buffer",
				},
				f = { "<cmd>lua require('telescope.builtin').find_files()<cr>", "search files" },
				h = { "<cmd>lua require('telescope.builtin').help_tags()<cr>", "search help" },
				w = { "<cmd>lua require('telescope.builtin').grep_string()<cr>", "search current word" },
				g = { "<cmd>lua require('telescope.builtin').live_grep()<cr>", "search by grep" },
				i = { "<cmd>lua require('telescope.builtin').diagnostics()<cr>", "search diagnostics" },
				d = { "<cmd>lua require('telescope.builtin').lsp_definitions()<cr>", "search definitions" },
				s = { "<cmd>lua require('telescope.builtin').lsp_document_symbols()<cr>", "search symbols" },
				r = { "<cmd>lua require('telescope.builtin').lsp_references()<cr>", "search references" },
				k = { "<cmd>lua require('telescope.builtin').keymaps()<cr>", "search keymaps" },
			},
		}, { prefix = "<leader>" })
	end,
}
