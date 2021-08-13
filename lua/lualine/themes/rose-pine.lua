local colors = require('rose-pine.palette')

return {
	normal = {
		a = { bg = colors.rose, fg = colors.base, gui = 'bold' },
		b = { bg = colors.overlay, fg = colors.rose },
		c = { bg = colors.base, fg = colors.text },
	},
	insert = {
		a = { bg = colors.foam, fg = colors.base, gui = 'bold' },
		b = { bg = colors.overlay, fg = colors.foam },
		c = { bg = colors.base, fg = colors.text },
	},
	visual = {
		a = { bg = colors.iris, fg = colors.base, gui = 'bold' },
		b = { bg = colors.overlay, fg = colors.iris },
		c = { bg = colors.base, fg = colors.text },
	},
	replace = {
		a = { bg = colors.pine, fg = colors.base, gui = 'bold' },
		b = { bg = colors.overlay, fg = colors.pine },
		c = { bg = colors.base, fg = colors.text },
	},
	command = {
		a = { bg = colors.love, fg = colors.base, gui = 'bold' },
		b = { bg = colors.overlay, fg = colors.love },
		c = { bg = colors.base, fg = colors.text },
	},
	inactive = {
		a = { bg = colors.base, fg = colors.inactive, gui = 'bold' },
		b = { bg = colors.base, fg = colors.inactive },
		c = { bg = colors.base, fg = colors.inactive },
	},
}
