vim.api.nvim_create_autocmd({ "BufRead", "BufNewFile" }, {
	pattern = { "*/templates/*.yaml", "*/templates/*.tpl", "*.tpl", "helmfile*.yaml" },
	callback = function(args)
		local fname = vim.fn.fnamemodify(args.file, ":t")
		if fname:match("workflow") then
			vim.bo.filetype = "yaml"
		else
			vim.bo.filetype = "helm"
		end
	end,
})

vim.api.nvim_create_autocmd("FileType", {
	pattern = "helm",
	callback = function()
		vim.treesitter.start(0, "yaml")
	end,
})

vim.api.nvim_create_autocmd("FileType", {
	pattern = { "markdown", "text", "gitcommit" },
	callback = function()
		vim.opt_local.spell = true
	end,
})

vim.api.nvim_create_autocmd("FileType", {
	pattern = "netrw",
	callback = function()
		vim.keymap.set("n", "%", function()
			local filename = vim.fn.input("New file: ")
			if filename == "" then
				return
			end

			-- current netrw directory
			local dir = vim.b.netrw_curdir or vim.fn.getcwd()
			local filepath = dir .. "/" .. filename

			-- create empty file if it doesn't exist
			if vim.fn.filereadable(filepath) == 0 then
				vim.fn.writefile({}, filepath)
			end

			-- go to previous window and open file there
			vim.cmd("wincmd p")
			vim.cmd("edit " .. vim.fn.fnameescape(filepath))

			-- optionally return focus to netrw sidebar:
			-- vim.cmd("wincmd p")
		end, {
			buffer = true,
			desc = "Create file and open outside netrw",
		})
	end,
})
