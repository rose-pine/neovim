local present, galaxyline_colors = pcall(require, 'galaxyline.themes.colors')
if not present then
	return
end

local p = require('rose-pine.palette')

galaxyline_colors['rose-pine'] = {
	bg = p.overlay,
	fg = p.text,
	fg_alt = p.subtle,
	blue = p.foam,
	cyan = p.foam,
	green = p.muted,
	magenta = p.iris,
	orange = p.rose,
	red = p.love,
	yellow = p.gold,
}
