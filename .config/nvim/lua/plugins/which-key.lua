return {
	-- [[ Install and configure which-key ]]
	-- Useful plugin to show you pending keybinds.
	"folke/which-key.nvim",
  event = "VeryLazy",
	init = function()
		vim.o.timeout = true
		vim.o.timeoutlen = 300
	end,
	opts = {},
	config = function()
		require("which-key").setup({
      preset = "modern",
			icons = {
				breadcrumb = " ",
				separator = " ",
				group = " ",
			},
			win = {
				no_overlap = true,
				border = "rounded",
				padding = { 1, 2 },
				title = true,
				title_pos = "center",
				zindex = 1000,
				wo = {
					winblend = 0,
				},
			},
			layout = {
				height = { min = 4, max = 25 },
				width = { min = 20, max = 50 },
				spacing = 3,
				align = "center",
			},
		})
		local wk = require("which-key")
		-- buffer keymaps
		wk.add({
			{ "<leader>b", icon = " ", group = "buffer" },
			{ "<leader>bk", "<cmd>bd!<cr>", desc = "buffer kill" },
			{ "<leader>bc", "<cmd>close<cr>", desc = "buffer close" },
			{ "<leader>bn", "<cmd>bn<cr>", desc = "buffer next" },
			{ "<leader>bp", "<cmd>bp<cr>", desc = "buffer previous" },
			{ "<leader>br", "<cmd>edit<cr>", noremap = true, silent = true, desc = "reload buffer" },
		})
		-- yank keymaps
		wk.add({
			{ "<leader>y", icon = "󰆏 ", group = "yank" },
			{ "<leader>yr", "<cmd>CopyRegexMatchesToRegister<cr>", desc = "yank regex search matches to register" },
		})
		-- file explorer keymaps
		wk.add({
			{ "<leader>e", icon = " ", group = "explorer" },
			{ "<leader>ec", "<cmd>NvimTreeCollapse<cr>", desc = "explorer collapse" },
			{ "<leader>ee", "<cmd>NvimTreeToggle<cr>", desc = "explorer toggle" },
			{ "<leader>ef", "<cmd>NvimTreeFindFile<cr>", desc = "explorer find file" },
			{ "<leader>er", "<cmd>NvimTreeRefresh<cr>", desc = "explorer refresh" },
		})
		-- lsp keymaps
		wk.add({
			{ "<leader>l", icon = " ", group = "lsp" },
			{ "<leader>la", icon = " ", "<cmd>lua vim.lsp.buf.code_action()<cr>", desc = "code action" },
			{ "<leader>lh", icon = "󰘥 ", "<cmd>lua vim.lsp.buf.hover()<cr>", desc = "hover" },
			{ "<leader>lr", icon = "󱖘 ", "<cmd>lua vim.lsp.buf.rename()<cr>", desc = "rename" },
		})
		-- diagnostics keymaps
		wk.add({
			{ "<leader>d", icon = "󰁨 ", group = "diagnostics" },
			{ "<leader>dn", icon = "󱖘 ", "<cmd>lua vim.diagnostic.goto_next()<cr>", desc = "diagnostics next" },
			{ "<leader>dp", icon = "󱖚 ", "<cmd>lua vim.diagnostic.goto_prev()<cr>", desc = "diagnostics previous" },
		})
		-- gitops keymaps [gitsigns and neogit]
		wk.add({
			{ "<leader>g", icon = " ", group = "gitops" },
			{ "<leader>gd", group = "diff" },
			{
				"<leader>gdo",
				function()
					local commit = vim.fn.input("Enter index to diff (default origin/master): ", "origin/master")
					vim.cmd("DiffviewOpen " .. commit)
				end,
				desc = "diffview open",
			},
			{
				"<leader>gdc",
				"<cmd>set hidden<cr><cmd>DiffviewClose<cr><cmd>set nohidden<cr>",
				desc = "diffview close",
			},
			{ "<leader>gb", "<cmd>lua require('gitsigns').blame_line()<cr>", desc = "blame line" },
			{ "<leader>gf", "<cmd>lua require('gitsigns').diffthis('~1')<cr>", desc = "diff this" },
			{
				"<leader>gg",
				"<cmd>:Neogit<cr>",
				desc = "git status neogit",
				remap = false,
			},
			{ "<leader>gn", "<cmd>lua require('gitsigns').next_hunk()<cr>", desc = "next hunk" },
			{ "<leader>gp", "<cmd>lua require('gitsigns').preview_hunk()<cr>", desc = "preview hunk" },
			{ "<leader>gr", "<cmd>lua require('gitsigns').reset_hunk()<cr>", desc = "reset hunk" },
			{ "<leader>gs", "<cmd>lua require('gitsigns').stage_hunk()<cr>", desc = "stage hunk" },
			{ "<leader>gu", "<cmd>lua require('gitsigns').undo_stage_hunk()<cr>", desc = "undo stage hunk" },
		})
		-- copilot chat keymaps
		wk.add({
			{ "<leader>c", icon = " ", group = "copilot", mode = { "n", "v" } },
			{ "<leader>cc", icon = "󰻞 ", group = "chat", mode = { "n", "v" } },
			{
				"<leader>cct",
				"<cmd>CopilotChatToggle<cr>",
				desc = "copilot chat toggle",
			},
			{
				"<leader>ccs",
				"<cmd>CopilotChatTests<cr>",
				desc = "copilot chat generate tests",
			},
			{
				"<leader>ccd",
				"<cmd>CopilotChatDocs<cr>",
				desc = "copilot chat add docs",
				mode = { "n", "v" },
			},
			{
				"<leader>cce",
				"<cmd>CopilotChatExplain<cr>",
				desc = "copilot chat explain code",
				mode = { "n", "v" },
			},
			{
				"<leader>cs",
				"<cmd>Copilot status<cr>",
				desc = "copilot status",
			},
			{
				"<leader>ce",
				"<cmd>Copilot enable<cr>",
				desc = "copilot enable",
			},
			{
				"<leader>cd",
				"<cmd>Copilot disable<cr>",
				desc = "copilot disable",
			},
		})
		-- telescope search keymaps
		wk.add({
			{ "<leader>s", icon = " ", group = "search" },
			{
				"<leader>s/",
				icon = "󰮗 ",
				"<cmd>lua require('telescope.builtin').current_buffer_fuzzy_find()<cr>",
				desc = "search in current buffer",
			},
			{
				"<leader>so",
				icon = " ",
				"<cmd>lua require('telescope.builtin').buffers()<cr>",
				desc = "search opened buffers",
			},
			{
				"<leader>s?",
				icon = " ",
				"<cmd>lua require('telescope.builtin').oldfiles()<cr>",
				desc = "search old files",
			},
			{
				"<leader>sd",
				icon = " ",
				"<cmd>lua require('telescope.builtin').lsp_definitions()<cr>",
				desc = "search definitions",
			},
			{
				"<leader>sf",
				icon = " ",
				"<cmd>lua require('telescope.builtin').find_files()<cr>",
				desc = "search files",
			},
			{
				"<leader>sg",
				icon = "󰱽 ",
				"<cmd>lua require('telescope.builtin').live_grep()<cr>",
				desc = "search by grep",
			},
			{
				"<leader>sh",
				icon = "󰘥 ",
				"<cmd>lua require('telescope.builtin').help_tags()<cr>",
				desc = "search help",
			},
			{
				"<leader>si",
				icon = " ",
				"<cmd>lua require('telescope.builtin').diagnostics()<cr>",
				desc = "search diagnostics",
			},
			{
				"<leader>sk",
				icon = " ",
				"<cmd>lua require('telescope.builtin').keymaps()<cr>",
				desc = "search keymaps",
			},
			{
				"<leader>sm",
				icon = " ",
				"<cmd>lua require('telescope.builtin').marks()<cr>",
				desc = "search marks",
			},
			{
				"<leader>sr",
				icon = " ",
				"<cmd>lua require('telescope.builtin').lsp_references()<cr>",
				desc = "search references",
			},
			{
				"<leader>ss",
				icon = " ",
				"<cmd>lua require('telescope.builtin').lsp_document_symbols()<cr>",
				desc = "search symbols",
			},
			{
				"<leader>sw",
				"<cmd>lua require('telescope.builtin').grep_string()<cr>",
				icon = "󰱽 ",
				desc = "search current word",
			},
		})
	end,
}
