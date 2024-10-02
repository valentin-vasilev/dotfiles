return {
  -- [[ Install and configure nvim-notify ]]
  "rcarriga/nvim-notify",
  config = function()
    require("notify").setup({
      background_colour = "#000000",
    })
  end,
}
