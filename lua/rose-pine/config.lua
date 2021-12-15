local palette = require('rose-pine.palette')

local config = {
	bold_vert_split = vim.g.rose_pine_bold_verical_split_line or false,
	inactive_background = vim.g.rose_pine_inactive_background or false,
	no_background = vim.g.rose_pine_disable_background or false,
	no_float_background = vim.g.rose_pine_disable_float_background or false,
	no_italics = vim.g.rose_pine_disable_italics or false,
	colors = {
		punctuation = palette.subtle,
		comment = palette.subtle,
		hint = palette.iris,
		info = palette.foam,
		warn = palette.gold,
		error = palette.love,

		-- TODO: Expose these once matched with syntax and cmp kind
		-- variable = '',
		-- class = '',
		-- interface = '',
		-- ['function'] = '',
		-- method = '',

		---@type string|table<string, string>
		headings = {
			h1 = palette.iris,
			h2 = palette.foam,
			h3 = palette.rose,
			h4 = palette.gold,
			h5 = palette.pine,
			h6 = palette.foam,
		},
	},
}

local colors = vim.g.rose_pine_colors or {}

if type(colors.headings) == 'string' then
	colors.headings = {
		h1 = colors.headings,
		h2 = colors.headings,
		h3 = colors.headings,
		h4 = colors.headings,
		h5 = colors.headings,
		h6 = colors.headings,
	}
end

config.colors = vim.tbl_deep_extend('force', config.colors, colors)

return config
