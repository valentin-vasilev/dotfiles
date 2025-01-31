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
				},
			})
		end,
	},
	{
		-- [[ Install and configure nvim-lspconfig ]]
		"neovim/nvim-lspconfig",
		lazy = false,
		config = function()
			local lspconfig = require("lspconfig")
			local capabilities = require("cmp_nvim_lsp").default_capabilities()
			local lsp_attach = function(client, bufnr) end

			lspconfig.bashls.setup({
				capabilities = capabilities,
			})
			lspconfig.dockerls.setup({
				capabilities = capabilities,
			})
			lspconfig.lua_ls.setup({
				capabilities = capabilities,
			})
			lspconfig.pyright.setup({
				capabilities = capabilities,
				on_attach = lsp_attach,
				filetypes = { "python" },
			})
			lspconfig.ruff.setup({
				capabilities = capabilities,
			})
			lspconfig.gopls.setup({
				capabilities = capabilities,
			})
		end,
	},
}
