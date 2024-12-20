return {
  "NeogitOrg/neogit",
  dependencies = {
    "nvim-lua/plenary.nvim",
    "sindrets/diffview.nvim",
    "nvim-telescope/telescope.nvim",
  },
  config = function()
    require("neogit").setup({
      disable_context_highlighting = true,
      signs = {
        hunk = { "", "" },
        item = { "", "" },
        section = { "", "" },
      },
      integrations = {
        telescope = true,
        diffview = true,
      },
    })
  end,
}

