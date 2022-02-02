local palette = require('rose-pine.palette')

local function opt(key, default)
	key = 'rose_pine_' .. key

	if vim.g[key] == nil then
		return default
	end

	if vim.g[key] == 0 or vim.g[key] == false then
		return false
	end

	return vim.g[key]
end

local config = {
	variant = opt('variant', 'main'),

	bold_vertical_split_line = opt('bold_vertical_split_line', false),
	disable_italics = opt('disable_italics', false),
	disable_background = opt('disable_background', false),
	disable_float_background = opt('disable_float_background', false),
	inactive_background = opt('inactive_background', false),

	colors = {
		border = palette.highlight_med,
		comment = palette.muted,
		link = palette.iris,
		punctuation = palette.subtle,

		error = palette.love,
		hint = palette.iris,
		info = palette.foam,
		warn = palette.gold,

		git_add = palette.foam,
		git_change = palette.rose,
		git_delete = palette.love,
		git_dirty = palette.rose,
		git_ignore = palette.muted,
		git_merge = palette.iris,
		git_rename = palette.pine,
		git_stage = palette.iris,
		git_text = palette.rose,

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
