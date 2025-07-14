vim.api.nvim_create_autocmd({ "BufRead", "BufNewFile" }, {
  pattern = "*/templates/*.yaml",
  callback = function(args)
    local fname = vim.fn.fnamemodify(args.file, ":t")
    if fname:match("workflow") then
      vim.bo.filetype = "yaml"
    else
      vim.bo.filetype = "helm"
    end
  end,
})
