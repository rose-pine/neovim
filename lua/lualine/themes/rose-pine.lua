local palette = require('rose-pine.palette')
local colors = palette[vim.g.rose_pine_variant or 'main']

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
		a = { bg = colors.base, fg = colors.muted, gui = 'bold' },
		b = { bg = colors.base, fg = colors.muted },
		c = { bg = colors.base, fg = colors.muted },
	},
}
