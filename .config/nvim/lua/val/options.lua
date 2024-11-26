-- [[ Setting options ]]
-- See `:help vim.o`

-- Set highlight on search, but clear on pressing <Esc> in normal mode
vim.opt.hlsearch = true
vim.keymap.set("n", "<Esc>", "<cmd>nohlsearch<CR>")

-- Don't show the mode, since it's already in the status line
vim.opt.showmode = false

-- Set tab and indentation settings
vim.opt.expandtab = true
vim.opt.tabstop = 2
vim.opt.softtabstop = 2
vim.opt.shiftwidth = 2

-- Make line numbers default
vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.signcolumn = "yes"

-- Enable mouse mode
vim.opt.mouse = "a"

-- Sync clipboard between OS and Neovim.
vim.opt.clipboard = "unnamedplus"

-- Enable break indent
vim.opt.breakindent = true

-- Save undo history
vim.opt.undofile = true

-- Case insensitive searching UNLESS /C or capital in search
vim.opt.ignorecase = true
vim.opt.smartcase = true

-- Open vertical splits to the right
vim.opt.splitright = true

-- Scroll off
vim.opt.scrolloff = 18

-- Decrease update time
vim.opt.updatetime = 250
vim.opt.timeout = true
vim.opt.timeoutlen = 300

-- Set completeopt to have a better completion experience
vim.opt.completeopt = "menuone,noselect"

-- Set support for terminal gui colors
vim.opt.termguicolors = true

-- Display characters as dots in visual mode
vim.opt.list = false
vim.opt.listchars = {
	tab = "  ",
	multispace = ".",
	extends = "»",
	precedes = "«",
	trail = "•",
}
