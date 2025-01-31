return {
	"echasnovski/mini.statusline",
  enabled = false,
  dependencies = {
    "echasnovski/mini.icons",
  },
	version = false,
  config = function ()
    require("mini.statusline").setup({
      use_icons = true,
    })
  end
}
