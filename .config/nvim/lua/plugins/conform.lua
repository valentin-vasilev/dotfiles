return {
	"stevearc/conform.nvim",
	event = { "BufWritePre" },
	cmd = { "ConformInfo" },
	keys = {
		{
			"<leader>bf",
			function()
				require("conform").format({ async = true })
			end,
			mode = "n",
			desc = "buffer format",
		},
	},
	---@module "conform"
	opts = {
		formatters_by_ft = {
			go = { "gofmt", "goimports" },
			json = { "prettier" },
			lua = { "stylua" },
			markdown = { "prettier" },
			python = { "ruff_format", "ruff_fix", "ruff_organize_imports" },
			sh = { "shfmt" },
			terraform = { "terraform_fmt" },
			tf = { "terraform_fmt" },
			["terraform-vars"] = { "terraform_fmt" },
			-- yaml = { "prettier" },
		},
		format_on_save = {
			timeout_ms = 500,
			lsp_format = "never",
		},
	},
}
