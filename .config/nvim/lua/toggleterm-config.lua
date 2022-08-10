require('toggleterm').setup{
	open_mapping = [[<C-t>]],
	direction = 'vertical',
	size = function(term)
		if term.direction == "horizontal" then
			return 15
		elseif term.direction == "vertical" then
			return vim.o.columns * 0.4
    		end
  	end,
}

local Terminal = require('toggleterm.terminal').Terminal

local lazygit = Terminal:new({ 
	cmd = "lazygit", 
	hidden = true,
	direction = "tab"
})

function _lazygit_toggle() 
	lazygit:toggle()
end

local M = {}

M.lg_toggle = _lazygit_toggle

return M
