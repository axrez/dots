local map = vim.keymap.set
local togglet = require('toggleterm-config')

vim.g.mapleader = ' '

-- Easymotion
map("", "s", require'hop'.hint_char1)
map("", "S", require'hop'.hint_char2)

-- Telescope find stuff
map("n", "<leader>j", require('telescope.builtin').find_files)
map("n", "<leader>fg", require('telescope.builtin').live_grep)

-- Buffers
map("n", "<leader>bb", require('telescope.builtin').buffers)
map("n", "<leader>bc", ":bdelete<CR>")

-- Lsp
map("n", "gd", vim.lsp.buf.definition)
map("n", "gr", vim.lsp.buf.references)
map("n", "K", vim.lsp.buf.hover)
map("n", "<leader>rr", vim.lsp.buf.rename)
map("n", "<leader>.", vim.lsp.buf.code_action)

-- Terminal
map("t", "<C-j>", [[<C-\><C-n>]])
map("n", "<leader>gg", togglet.lg_toggle)

-- File explorer
map("n", "<leader>e", ":Neotree<CR>")
map("n", "<C-e>", ":NeoTreeShowToggle<CR>")

