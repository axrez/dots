local catppuccin = require("catppuccin")

catppuccin.setup({
    flavour = "mocha", -- latte, frappe, macchiato, mocha
})

vim.cmd[[colorscheme catppuccin]]
vim.cmd[[highlight Normal guibg=none]]
vim.opt.cursorline = true

