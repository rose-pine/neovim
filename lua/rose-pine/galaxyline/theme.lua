local present, galaxyline_colors = pcall(require, 'galaxyline.themes.colors')
if not present then
	return
end

local palette = require('rose-pine.palette')
local colors = palette[vim.g.rose_pine_variant or 'main']

galaxyline_colors['rose-pine'] = {
	bg = colors.overlay,
	fg = colors.text,
	fg_alt = colors.subtle,
	blue = colors.foam,
	cyan = colors.foam,
	green = colors.muted,
	magenta = colors.iris,
	orange = colors.rose,
	red = colors.love,
	yellow = colors.gold,
}
