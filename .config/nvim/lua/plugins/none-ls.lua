return {
	"nvimtools/none-ls.nvim",
	config = function()
		local null_ls = require("null-ls")
		null_ls.setup({
			sources = {
				null_ls.builtins.formatting.stylua,
				null_ls.builtins.formatting.black,
				null_ls.builtins.formatting.shfmt,
        -- null_ls.builtins.formatting.shellharden,
			},
		})
		vim.keymap.set("n", "<leader>bf", vim.lsp.buf.format, { desc = "buffer format" })
	end,
}
