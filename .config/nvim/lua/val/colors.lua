-- Rosepine Dawn color scheme
local colors = {
	base = "#faf4ed",
	surface = "#fffaf3",
	overlay = "#f2e9e1",
	muted = "#9893a5",
	subtle = "#797593",
	text = "#575279",
	love = "#b4637a",
	gold = "#ea9d34",
	rose = "#d7827e",
	pine = "#286983",
	foam = "#56949f",
	iris = "#907aa9",
	leaf = "#6d8f89",
	highlight_low = "#f4ede8",
	highlight_med = "#dfdad9",
	highlight_high = "#cecacd",
  highlight_add = "#d9e1dd",
  highlight_change = "#f3ddd7",
}

-- Search highlight groups
vim.api.nvim_set_hl(0, "Search", { fg = colors.iris, bg = colors.highlight_med })
vim.api.nvim_set_hl(0, "IncSearch", { fg = colors.iris, bg = colors.highlight_med })
vim.api.nvim_set_hl(0, "CurSearch", { fg = colors.iris, bg = colors.highlight_med })

-- Normal mode highlight colors
vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })
vim.api.nvim_set_hl(0, "ColorColumn", { bg = colors.rose })
vim.api.nvim_set_hl(0, "WinBar", { bg = "none" })
vim.api.nvim_set_hl(0, "WinBarNC", { bg = "none", blend = 0 })

-- Visual mode highlight colors
vim.api.nvim_set_hl(0, "Visual", { fg = colors.iris, bg = colors.highlight_med })
vim.api.nvim_set_hl(0, "VisualNC", { fg = colors.iris, bg = colors.highlight_med })

-- Telescope highlight colors
vim.api.nvim_set_hl(0, "TelescopeBorder", { fg = colors.leaf, bg = "none" })
vim.api.nvim_set_hl(0, "TelescopeNormal", { fg = colors.subtle, bg = "none" })
vim.api.nvim_set_hl(0, "TelescopeSelection", { fg = colors.iris, bg = colors.highlight_med })
vim.api.nvim_set_hl(0, "TelescopeSelectionCaret", { fg = colors.leaf, bg = "none" })
vim.api.nvim_set_hl(0, "TelescopeMultiSelection", { fg = colors.leaf, bg = "none" })
vim.api.nvim_set_hl(0, "TelescopeTitle", { fg = colors.base, bg = colors.leaf })
vim.api.nvim_set_hl(0, "TelescopePromptTitle", { fg = colors.base, bg = colors.leaf })
vim.api.nvim_set_hl(0, "TelescopePreviewTitle", { fg = colors.base, bg = colors.leaf })
vim.api.nvim_set_hl(0, "TelescopePromptNormal", { fg = colors.leaf, bg = "none" })
vim.api.nvim_set_hl(0, "TelescopePromptBorder", { fg = colors.leaf, bg = "none" })

-- Markdown highlight colors
vim.api.nvim_set_hl(0, "RenderMarkdownCode", { fg = colors.pine, bg = colors.highlight_high, italic = true })

-- Navic highlight colors
vim.api.nvim_set_hl(0, "NavicText", { fg = colors.pine, bg = "none" })

-- GitSigns highlight colors
vim.api.nvim_set_hl(0, "SignColumn", { bg = "none" })
vim.api.nvim_set_hl(0, "GitSignsAdd", { fg = colors.leaf, bg = "none" })
vim.api.nvim_set_hl(0, "GitSignsChange", { fg = colors.iris, bg = "none" })
vim.api.nvim_set_hl(0, "GitSignsDelete", { fg = colors.love, bg = "none" })

-- Lualine highlight colors
vim.api.nvim_set_hl(0, "lualine_a_normal", { fg = colors.base, bg = colors.leaf })
vim.api.nvim_set_hl(0, "lualine_a_inactive", { bg = colors.highlight_med })
vim.api.nvim_set_hl(0, "lualine_b_normal", { fg = colors.leaf, bg = colors.highlight_med })
vim.api.nvim_set_hl(0, "lualine_b_visual", { fg = colors.iris, bg = colors.highlight_med })
vim.api.nvim_set_hl(0, "lualine_b_insert", { fg = colors.foam, bg = colors.highlight_med })
vim.api.nvim_set_hl(0, "lualine_b_command", { fg = colors.love, bg = colors.highlight_med })
vim.api.nvim_set_hl(0, "lualine_b_inactive", { bg = colors.highlight_med })
vim.api.nvim_set_hl(0, "lualine_c_normal", { fg = colors.leaf, bg = colors.highlight_med })
vim.api.nvim_set_hl(0, "lualine_c_visual", { fg = colors.iris, bg = colors.highlight_med })
vim.api.nvim_set_hl(0, "lualine_c_insert", { fg = colors.foam, bg = colors.highlight_med })
vim.api.nvim_set_hl(0, "lualine_c_command", { fg = colors.love, bg = colors.highlight_med })
vim.api.nvim_set_hl(0, "lualine_c_inactive", { bg = colors.highlight_med })
vim.api.nvim_set_hl(0, "lualine_y_filetype_DevIconLua_normal", { fg = colors.leaf, bg = colors.highlight_med })
vim.api.nvim_set_hl(0, "lualine_y_filetype_DevIconLua_visual", { fg = colors.iris, bg = colors.highlight_med })
vim.api.nvim_set_hl(0, "lualine_y_filetype_DevIconLua_insert", { fg = colors.foam, bg = colors.highlight_med })
vim.api.nvim_set_hl(0, "lualine_y_filetype_DevIconLua_command", { fg = colors.love, bg = colors.highlight_med })
vim.api.nvim_set_hl(0, "lualine_y_filetype_DevIconLua_inactive", { bg = colors.highlight_med })
vim.api.nvim_set_hl(0, "lualine_y_filetype_DevIconTmux_normal", { fg = colors.leaf, bg = colors.highlight_med })
vim.api.nvim_set_hl(0, "lualine_y_filetype_DevIconTmux_visual", { fg = colors.iris, bg = colors.highlight_med })
vim.api.nvim_set_hl(0, "lualine_y_filetype_DevIconTmux_insert", { fg = colors.foam, bg = colors.highlight_med })
vim.api.nvim_set_hl(0, "lualine_y_filetype_DevIconTmux_command", { fg = colors.love, bg = colors.highlight_med })
vim.api.nvim_set_hl(0, "lualine_y_filetype_DevIconTmux_inactive", { bg = colors.highlight_med })
vim.api.nvim_set_hl(0, "lualine_y_filetype_DevIconDefault_normal", { fg = colors.leaf, bg = colors.highlight_med })
vim.api.nvim_set_hl(0, "lualine_y_filetype_DevIconDefault_visual", { fg = colors.iris, bg = colors.highlight_med })
vim.api.nvim_set_hl(0, "lualine_y_filetype_DevIconDefault_insert", { fg = colors.foam, bg = colors.highlight_med })
vim.api.nvim_set_hl(0, "lualine_y_filetype_DevIconDefault_command", { fg = colors.love, bg = colors.highlight_med })
vim.api.nvim_set_hl(0, "lualine_y_filetype_DevIconDefault_inactive", { bg = colors.highlight_med })

-- Mason highlight colors
vim.api.nvim_set_hl(0, "MasonHeader", { fg = colors.base, bg = colors.leaf })
vim.api.nvim_set_hl(0, "MasonHighlightBlock", { fg = colors.base, bg = colors.foam })
vim.api.nvim_set_hl(0, "MasonHighlightBlockBold", { fg = colors.base, bg = colors.foam })
vim.api.nvim_set_hl(0, "MasonMutedBlock", { fg = colors.base, bg = colors.leaf })

-- Dropbar highlight colors
vim.api.nvim_set_hl(0, "DropBarMenuHoverEntry", { fg = colors.iris, bg = colors.highlight_med })
vim.api.nvim_set_hl(0, "DropBarMenuHoverIcon", { fg = colors.iris, bg = colors.highlight_med })

-- Neogit highlight colors
vim.api.nvim_set_hl(0, "NeogitDiffAdd", { fg = colors.leaf, bg = colors.highlight_med })

-- Diff highlight colors
vim.api.nvim_set_hl(0, "DiffAdd", { fg = colors.leaf, bg = colors.highlight_add, blend=20 })
vim.api.nvim_set_hl(0, "DiffChange", { fg = colors.rose, bg = colors.highlight_change, blend=20 })
vim.api.nvim_set_hl(0, "DiffText", { fg = colors.rose, bg = colors.highlight_change, blend=20 })
vim.api.nvim_set_hl(0, "DiffDelete", { fg = colors.rose, bg = colors.highlight_change, blend=20 })

-- DiffView highlight colors
vim.api.nvim_set_hl(0, "DiffviewFilePanelFileName", { fg = colors.foam, bg = "none" })
vim.api.nvim_set_hl(0, "DiffviewFilePanelInsertions", { fg = colors.leaf, bg = "none" })
vim.api.nvim_set_hl(0, "DiffviewFilePanelDeletions", { fg = colors.rose, bg = "none" })
vim.api.nvim_set_hl(0, "DiffviewStatusAdded", { fg = colors.leaf, bg = "none" })
vim.api.nvim_set_hl(0, "DiffviewStatusModified", { fg = colors.rose, bg = "none" })

-- Trouble highlight colors
vim.api.nvim_set_hl(0, "TroubleCount", { fg = colors.rose, bg = "none" })

-- CopilotChat highlight colors
vim.api.nvim_set_hl(0, "CopilotChatHeader", { fg = colors.leaf, bg = "none" })
vim.api.nvim_set_hl(0, "CopilotChatSeparator", { fg = colors.leaf, bg = "none" })

-- Showkeys highlight colors
vim.api.nvim_set_hl(0, "SkFloatBorder", { fg = colors.leaf, bg = "none" })
vim.api.nvim_set_hl(0, "SkNormal", { fg = colors.leaf, bg = "none" })
vim.api.nvim_set_hl(0, "SkActive", { fg = colors.leaf, bg = "none" })
vim.api.nvim_set_hl(0, "SkInactive", { fg = colors.iris, bg = "none" })

