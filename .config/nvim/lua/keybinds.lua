local map = vim.keymap.set
local togglet = require('toggleterm-config')

vim.g.mapleader = ' '

-- Easymotion
map("", "<leader>fb", require'hop'.hint_char1)
map("", "<leader>fB", require'hop'.hint_char2)

-- Spell checking
map("n", "<leader>sf", require('telescope.builtin').spell_suggest)
map("n", "<leader>st", ":set spell!<CR>")

-- Telescope find stuff
map("n", "<leader>j", require('telescope.builtin').find_files)
map("n", "<leader>fg", require('telescope.builtin').live_grep)

-- Buffers
map("n", "<leader>bb", require('telescope.builtin').buffers)
map("n", "<leader>bc", ":bdelete<CR>")
map("n", "<leader>bd", ":bdelete<CR>")

-- Lsp
map("n", "gd", require('telescope.builtin').lsp_definitions)
map("n", "gr", require('telescope.builtin').lsp_references)
map("n", "K", vim.lsp.buf.hover)
map("n", "<leader>rr", vim.lsp.buf.rename)
map("n", "<leader>.", vim.lsp.buf.code_action)

-- Terminal
map("t", "<C-j>", [[<C-\><C-n>]])
map("n", "<leader>gg", togglet.lg_toggle)

-- File explorer
map("n", "<leader>e", ":NeoTreeFloatToggle<CR>")
map("n", "<C-e>", ":NeoTreeFloatToggle<CR>")

