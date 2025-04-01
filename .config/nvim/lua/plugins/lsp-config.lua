return {
	{
		-- [[ Install and config mason ]]
		"williamboman/mason.nvim",
		lazy = false,
		opts = {
			ensure_installed = {
				"pyright",
				"ruff",
			},
		},
		config = function()
			require("mason").setup({
				ui = {
					border = "rounded",
				},
			})
		end,
	},
	{
		-- [[ Install and configure mason-lspconfig ]]
		"williamboman/mason-lspconfig.nvim",
		lazy = false,
		config = function()
			require("mason-lspconfig").setup({
				ensure_installed = {
					"bashls",
					"dockerls",
					"docker_compose_language_service",
					"jsonls",
					"lua_ls",
					"yamlls",
					"gopls",
				},
			})
		end,
		opts = {
			auto_install = true,
		},
	},
	{
		"WhoIsSethDaniel/mason-tool-installer.nvim",
		config = function()
			require("mason-tool-installer").setup({
				ensure_installed = {
					"black",
					"ruff",
					"stylua",
          "shfmt",
				},
			})
		end,
	},
	{
		-- [[ Install and configure nvim-lspconfig ]]
		"neovim/nvim-lspconfig",
		dependencies = { "saghen/blink.cmp" },
		lazy = false,
		config = function()
			local lspconfig = require("lspconfig")
			local capabilities = require("blink.cmp").get_lsp_capabilities()

			lspconfig["bashls"].setup({
				capabilities = capabilities,
			})
			lspconfig["dockerls"].setup({
				capabilities = capabilities,
			})
			lspconfig["lua_ls"].setup({
				capabilities = capabilities,
			})
			lspconfig["pyright"].setup({
				capabilities = capabilities,
				settings = {
					pyright = {
						-- Using Ruff's import organizer
						disableOrganizeImports = true,
					},
					python = {
						analysis = {
							-- Ignore all files for analysis to exclusively use Ruff for linting
							ignore = { "*" },
						},
					},
				},
			})
			lspconfig["ruff"].setup({
				capabilities = capabilities,
			})
			lspconfig["gopls"].setup({
				capabilities = capabilities,
			})
			vim.lsp.handlers["textDocument/hover"] = vim.lsp.with(vim.lsp.handlers.hover, {
				border = "rounded",
			})
		end,
	},
}
