local present, galaxyline_colors = pcall(require, 'galaxyline.themes.colors')
if not present then
	return
end

local palette = require('rose-pine.palette')

galaxyline_colors['rose-pine'] = {
	bg = palette.overlay,
	fg = palette.text,
	fg_alt = palette.subtle,
	blue = palette.foam,
	cyan = palette.foam,
	green = palette.muted,
	magenta = palette.iris,
	orange = palette.rose,
	red = palette.love,
	yellow = palette.gold,
}
