return {
  {
    -- [[ Install and config mason ]]
    "williamboman/mason.nvim",
    lazy = false,
    opts = {
      ensure_installed = {
        "pyright",
        "mypy",
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
          "ansiblels",
          "bashls",
          "dockerls",
          "docker_compose_language_service",
          "jsonls",
          "lua_ls",
          "pyright",
          "terraformls",
          "tflint",
          "yamlls",
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
          "ansible-lint",
          "black",
          "flake8",
          "isort",
          "mypy",
          "pylint",
          "pyright",
          "ruff",
          "stylua",
          "tflint",
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

      lspconfig.ansiblels.setup({
        capabilities = capabilities,
      })
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
      lspconfig.terraformls.setup({
        capabilities = capabilities,
      })
      lspconfig.tflint.setup({
        capabilities = capabilities,
      })

      vim.keymap.set("n", "K", vim.lsp.buf.hover, { desc = "Knowledge" })
      vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, { desc = "code action" })
      vim.keymap.set("n", "<leader>dn", vim.diagnostic.goto_next, { desc = "diagnostics next" })
      vim.keymap.set("n", "<leader>dp", vim.diagnostic.goto_prev, { desc = "diagnostics previous" })
    end,
  },
}
