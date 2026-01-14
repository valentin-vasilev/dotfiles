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
					"docker_compose_language_service",
					"dockerls",
					"golangci_lint_ls",
					"gopls",
					"groovyls",
					"helm_ls",
					"jsonls",
					"lua_ls",
					"terraformls",
					"yamlls",
				},
				automatic_enable = {
					exclude = { "lua_ls", "gopls", "ruff", "pyright" },
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
					"goimports",
					"hadolint",
					"ruff",
					"shfmt",
					"stylua",
					"prettier",
				},
			})
		end,
	},
	{
		-- [[ Install and configure nvim-lspconfig ]]
		"neovim/nvim-lspconfig",
		dependencies = { "saghen/blink.cmp" },
		lazy = false,
		event = { "BufReadPre", "BufNewFile", "BufEnter" },
		config = function()
			local capabilities = require("blink.cmp").get_lsp_capabilities()

			vim.lsp.config("bashls", {
				capabilities = capabilities,
			})
			vim.lsp.enable({ "bashls" })

			vim.lsp.config("dockerls", {
				capabilities = capabilities,
			})
			vim.lsp.enable({ "dockerls" })

			vim.lsp.config("luals", {
				capabilities = capabilities,
			})

			vim.lsp.config("terraformls", {
				capabilities = capabilities,
			})

			vim.lsp.enable({ "luals" })

			vim.lsp.config("pyright", {
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
			vim.lsp.enable({ "pyright" })

			vim.lsp.config("ruff", {
				capabilities = capabilities,
			})
			vim.lsp.enable({ "ruff" })

			vim.lsp.config("gopls", {
				capabilities = capabilities,
			})
			vim.lsp.enable({ "gopls" })

			vim.lsp.config("golangci_lint_ls", {
				capabilities = capabilities,
				cmd = { "golangci-lint-langserver" },
				filetypes = { "go", "gomod" },
				init_options = {
					command = {
						"golangci-lint",
						"run",
						"--output.json.path",
						"stdout",
						"--show-stats=false",
						"--issues-exit-code=1",
					},
				},
			})
			vim.lsp.enable({ "golangci_lint_ls" })

			vim.lsp.config("helm_ls", {
				settings = {
					["helm-ls"] = {
						yamlls = {
							path = "yaml-language-server",
						},
					},
				},
				filetypes = { "helm" },
				root_dir = require("lspconfig.util").root_pattern("Chart.yaml"),
			})
			vim.lsp.enable({ "helm_ls" })

			vim.lsp.config("yamlls", {
				settings = {
					yaml = {
						schemas = {
							["https://raw.githubusercontent.com/argoproj/argo-workflows/master/api/jsonschema/schema.json"] = "templates/**/*workflow*.yaml",
						},
					},
				},
			})
			vim.lsp.enable({ "yamlls" })

			vim.lsp.config("groovyls", {
				capabilities = capabilities,
				cmd = { "groovy-language-server" },
				filetypes = { "groovy" },
				root_dir = require("lspconfig.util").root_pattern("settings.gradle", "build.gradle", ".git"),
			})
			vim.lsp.enable({ "groovyls" })
		end,
	},
}
