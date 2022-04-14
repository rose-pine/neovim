---Rosé Pine
---@plugin akinsho/toggleterm.nvim
---@usage
---	local highlights = require('rose-pine.plugins.toggleterm')
---	require('toggleterm').setup({ highlights = highlights })

local p = require('rose-pine.palette')

return {
	Normal = {
		guibg = p.base,
	},
}
