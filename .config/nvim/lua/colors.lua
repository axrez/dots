local catppuccin = require("catppuccin")

catppuccin.setup()

vim.g.catppuccin_flavour = "frappe" -- latte, frappe, macchiato, mocha
vim.cmd[[colorscheme catppuccin]]
vim.cmd[[highlight Normal guibg=none]]
