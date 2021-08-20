local p = require('rose-pine.palette')

return {
	normal = {
		a = { bg = p.rose, fg = p.base, gui = 'bold' },
		b = { bg = p.overlay, fg = p.rose },
		c = { bg = p.base, fg = p.text },
	},
	insert = {
		a = { bg = p.foam, fg = p.base, gui = 'bold' },
		b = { bg = p.overlay, fg = p.foam },
		c = { bg = p.base, fg = p.text },
	},
	visual = {
		a = { bg = p.iris, fg = p.base, gui = 'bold' },
		b = { bg = p.overlay, fg = p.iris },
		c = { bg = p.base, fg = p.text },
	},
	replace = {
		a = { bg = p.pine, fg = p.base, gui = 'bold' },
		b = { bg = p.overlay, fg = p.pine },
		c = { bg = p.base, fg = p.text },
	},
	command = {
		a = { bg = p.love, fg = p.base, gui = 'bold' },
		b = { bg = p.overlay, fg = p.love },
		c = { bg = p.base, fg = p.text },
	},
	inactive = {
		a = { bg = p.base, fg = p.inactive, gui = 'bold' },
		b = { bg = p.base, fg = p.inactive },
		c = { bg = p.base, fg = p.inactive },
	},
}
