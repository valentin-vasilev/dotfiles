return {
  -- [[ Install and configure which-key ]]
  -- Useful plugin to show you pending keybinds.
  "folke/which-key.nvim",
  init = function()
    vim.o.timeout = true
    vim.o.timeoutlen = 300
  end,
  opts = {},
  config = function()
    require("which-key").setup({
      icons = {
        breadcrumb = " ", -- symbol used in the command line area that shows your active key combo
        separator = " ", -- symbol used between a key and it's label
        group = " ", -- symbol prepended to a group
      },
      win = {
        no_overlap = true,
        border = "single", -- none, single, double, shadow
        padding = { 1, 2 }, -- extra window padding [top, right, bottom, left]
        title = true,     -- display a title in the popup window
        title_pos = "center", -- title position: 'left', 'center', 'right'
        zindex = 1000,    -- positive value to position WhichKey above other floating windows.
        wo = {
          winblend = 0,
        },
      },
      layout = {
        height = { min = 4, max = 25 }, -- min and max height of the columns
        width = { min = 20, max = 50 }, -- min and max width of the columns
        spacing = 3,                -- spacing between columns
        align = "left",             -- align columns left, center or right
      },
    })
    local wk = require("which-key")
    -- buffer keymaps
    wk.add({
      { "<leader>b", icon = " ", group = "buffer" },
      { "<leader>bk", "<cmd>bd!<cr>", desc = "buffer kill" },
      { "<leader>bn", "<cmd>bn<cr>", desc = "buffer next" },
      { "<leader>bp", "<cmd>bp<cr>", desc = "buffer previous" },
      { "<leader>br", "<cmd>edit<cr>", noremap = true, silent = true, desc = "reload buffer" },
    })
    -- Replace case insensitive the word under the cursor in the whole buffer
    wk.add({
      {
        "<leader>S",
        [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/g<Left><Left>]],
        icon = "󰬳 ",
        desc = "substitute string",
      },
    })
    -- gitops keymaps [gitsigns and neogit]
    wk.add({
      { "<leader>g",  group = "gitops" },
      { "<leader>gb", "<cmd>lua require('gitsigns').blame_line()<cr>",   desc = "blame line" },
      { "<leader>gf", "<cmd>lua require('gitsigns').diffthis('~1')<cr>", desc = "diff this" },
      {
        "<leader>gg",
        "<cmd>:Neogit<cr>",
        desc = "git status neogit",
        remap = false,
      },
      { "<leader>gn", "<cmd>lua require('gitsigns').next_hunk()<cr>",       desc = "next hunk" },
      { "<leader>gp", "<cmd>lua require('gitsigns').preview_hunk()<cr>",    desc = "preview hunk" },
      { "<leader>gr", "<cmd>lua require('gitsigns').reset_hunk()<cr>",      desc = "reset hunk" },
      { "<leader>gs", "<cmd>lua require('gitsigns').stage_hunk()<cr>",      desc = "stage hunk" },
      { "<leader>gu", "<cmd>lua require('gitsigns').undo_stage_hunk()<cr>", desc = "undo stage hunk" },
    })
    -- copilot chat keymaps
    wk.add({
      { "<leader>c", icon = " ", group = "copilot", mode = { "n", "v" } },
      { "<leader>cc", icon = "󰭻 ", group = "chat", mode = { "n", "v" } },
      {
        "<leader>cct",
        "<cmd>CopilotChatToggle<cr>",
        desc = "copilot chat toggle",
      },
      {
        "<leader>ccs",
        "<cmd>CopilotChatTests<cr>",
        desc = "copilot chat generate tests",
      },
      {
        "<leader>ccd",
        "<cmd>CopilotChatDocs<cr>",
        desc = "copilot chat add docs",
        mode = { "n", "v" },
      },
      {
        "<leader>cce",
        "<cmd>CopilotChatExplain<cr>",
        desc = "copilot chat explain code",
        mode = { "n", "v" },
      },
      {
        "<leader>cs",
        "<cmd>Copilot status<cr>",
        desc = "copilot status",
      },
      {
        "<leader>ce",
        "<cmd>Copilot enable<cr>",
        desc = "copilot enable",
      },
      {
        "<leader>cd",
        "<cmd>Copilot disable<cr>",
        desc = "copilot disable",
      },
    })
    -- telescope search keymaps
    wk.add({
      { "<leader>s", group = "search" },
      {
        "<leader>s/",
        "<cmd>lua require('telescope.builtin').current_buffer_fuzzy_find()<cr>",
        desc = "search in current buffer",
      },
      {
        "<leader>s<space>",
        "<cmd>lua require('telescope.builtin').buffers()<cr>",
        desc = "search opened buffers",
      },
      {
        "<leader>s?",
        "<cmd>lua require('telescope.builtin').oldfiles()<cr>",
        desc = "search old files",
      },
      {
        "<leader>sd",
        "<cmd>lua require('telescope.builtin').lsp_definitions()<cr>",
        desc = "search definitions",
      },
      {
        "<leader>sf",
        "<cmd>lua require('telescope.builtin').find_files()<cr>",
        desc = "search files",
      },
      {
        "<leader>sg",
        "<cmd>lua require('telescope.builtin').live_grep()<cr>",
        desc = "search by grep",
      },
      {
        "<leader>sh",
        "<cmd>lua require('telescope.builtin').help_tags()<cr>",
        desc = "search help",
      },
      {
        "<leader>si",
        "<cmd>lua require('telescope.builtin').diagnostics()<cr>",
        desc = "search diagnostics",
      },
      {
        "<leader>sk",
        "<cmd>lua require('telescope.builtin').keymaps()<cr>",
        desc = "search keymaps",
      },
      {
        "<leader>sm",
        "<cmd>lua require('telescope.builtin').marks()<cr>",
        desc = "search marks",
      },
      {
        "<leader>sr",
        "<cmd>lua require('telescope.builtin').lsp_references()<cr>",
        desc = "search references",
      },
      {
        "<leader>ss",
        "<cmd>lua require('telescope.builtin').lsp_document_symbols()<cr>",
        desc = "search symbols",
      },
      {
        "<leader>sw",
        "<cmd>lua require('telescope.builtin').grep_string()<cr>",
        desc = "search current word",
      },
    })
  end,
}
