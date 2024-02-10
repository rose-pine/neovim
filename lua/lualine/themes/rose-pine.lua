local p = require('rose-pine.palette')
local blend = require('rose-pine.util').blend

local mix = 0.08


return {
	normal = {
		a = { bg = p.rose, fg = p.base, gui = 'bold' },
		b = { bg = blend(p.text, p.overlay, mix), fg = p.rose },
		c = { bg = p.surface, fg = p.text },
	},
	insert = {
		a = { bg = p.love, fg = p.base, gui = 'bold' },
		b = { bg = blend(p.love, p.overlay, mix), fg = p.love },
		c = { bg = blend(p.love, p.base, mix), fg = p.text },
	},
	visual = {
		a = { bg = p.iris, fg = p.base, gui = 'bold' },
		b = { bg = blend(p.iris, p.overlay, mix), fg = p.iris },
		c = { bg = blend(p.iris, p.base, mix), fg = p.text },
	},
	replace = {
		a = { bg = p.pine, fg = p.base, gui = 'bold' },
		b = { bg = blend(p.pine, p.overlay, mix), fg = p.pine },
		c = { bg = blend(p.pine, p.base, mix), fg = p.text },
	},
	command = {
		a = { bg = p.foam, fg = p.base, gui = 'bold' },
		b = { bg = blend(p.foam, p.overlay, mix), fg = p.foam },
		c = { bg = blend(p.foam, p.base, mix), fg = p.text },
	},
	inactive = {
		a = { bg = p.surface, fg = p.muted, gui = 'bold' },
		b = { bg = p.surface, fg = p.muted },
		c = { bg = p.surface, fg = p.muted },
	},
}
