-- Keymaps for better default experience

-- Set <space> as the leader key
-- See `:help mapleader`
--  NOTE: Must happen before plugins are required (otherwise wrong leader will be used)
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- Disable arrow keys in normal mode
vim.keymap.set("n", "<left>", '<cmd>echo "Use h to move!!"<CR>')
vim.keymap.set("n", "<right>", '<cmd>echo "Use l to move!!"<CR>')
vim.keymap.set("n", "<up>", '<cmd>echo "Use k to move!!"<CR>')
vim.keymap.set("n", "<down>", '<cmd>echo "Use j to move!!"<CR>')

-- Disable the default behavior of the space bar in normal and visual modes
vim.keymap.set({ "n", "v" }, "<Space>", "<Nop>", { silent = true })

-- Keep cursor in the same place when J
vim.keymap.set("n", "J", "mzJ`z", { silent = true })

-- Center screen when scrolling down by half screen
vim.keymap.set("n", "<C-d>", "<C-d>:normal zz<CR>", { noremap = true, silent = true })
vim.keymap.set("v", "<C-d>", "<C-c>:normal zz<CR>", { noremap = true, silent = true })

-- Center screen when scrolling up by half screen
vim.keymap.set("n", "<C-u>", "<C-u>:normal zz<CR>", { noremap = true, silent = true })
vim.keymap.set("v", "<C-u>", "<C-c>:normal zz<CR>", { noremap = true, silent = true })

-- Center screen when jumping on search results
vim.keymap.set("n", "n", "nzzzv", { silent = true })
vim.keymap.set("n", "N", "Nzzzv", { silent = true })

-- Dealing with word wrap
vim.keymap.set("n", "k", "v:count == 0 ? 'gk' : 'k'", { expr = true, silent = true })
vim.keymap.set("n", "j", "v:count == 0 ? 'gj' : 'j'", { expr = true, silent = true })

-- Replace the selected text with the content of the unnamed register, essentially acting as a cut-and-replace
vim.keymap.set("x", "<leader>p", [["_dP]])

-- Move highlight text in visual mode with J and K
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv", { silent = true })
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv", { silent = true })

-- Use C-c as Esc in inser mode
vim.keymap.set("i", "<C-c>", "<Esc>")
-- Disable "s" in normal mode
vim.keymap.set("n", "s", "<Nop>", { noremap = true, silent = true })

-- Autocommands
-- vim.api.nvim_create_autocmd({ "BufWritePre" }, {
-- 	pattern = { "*.py", "*.lua", "*.sh" },
-- 	callback = function()
-- 		vim.lsp.buf.format({ timeout = 2000 })
-- 	end,
-- })

vim.api.nvim_create_autocmd("TextYankPost", {
  desc = "Highlight when yanking (copying) text",
  group = vim.api.nvim_create_augroup("kickstart-highlight-yank", { clear = true }),
  callback = function()
    vim.highlight.on_yank()
  end,
})
