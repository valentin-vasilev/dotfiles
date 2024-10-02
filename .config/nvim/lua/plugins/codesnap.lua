return {
  "mistricky/codesnap.nvim",
  build = "make",
  keys = {
    { "<leader>cc", "<cmd>CodeSnap<cr>",     mode = "x", desc = "Save selected code snapshot into clipboard" },
    { "<leader>cs", "<cmd>CodeSnapSave<cr>", mode = "x", desc = "Save selected code snapshot in ~/temp" },
  },
  opts = {
    save_path = "~/temp",
    has_breadcrumbs = false,
    bg_theme = "#535c68",
  },
  config = function()
    require("codesnap").setup({
      watermark = "",
      has_line_numbers = true,
    })
  end,
}
