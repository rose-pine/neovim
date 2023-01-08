local util = {}

local function byte(value, offset)
	return bit.band(bit.rshift(value, offset), 0xFF)
end

local function rgb(color)
	color = vim.api.nvim_get_color_by_name(color)

	if color == -1 then
		color = vim.opt.background:get() == 'dark' and 000 or 255255255
	end

	return { byte(color, 16), byte(color, 8), byte(color, 0) }
end

local function parse_color(color)
	if color == nil then
		return print('invalid color')
	end

	color = color:lower()

	if not color:find('#') and color ~= 'none' then
		color = require('rose-pine.palette')[color]
			or vim.api.nvim_get_color_by_name(color)
	end

	return color
end

---@param fg string foreground color
---@param bg string background color
---@param alpha number number between 0 (background) and 1 (foreground)
util.blend = function(fg, bg, alpha)
	local fg_rgb = rgb(parse_color(fg))
	local bg_rgb = rgb(parse_color(bg))

	local function blend_channel(i)
		local ret = (alpha * fg_rgb[i] + ((1 - alpha) * bg_rgb[i]))
		return math.floor(math.min(math.max(0, ret), 255) + 0.5)
	end

	return string.format(
		'#%02X%02X%02X',
		blend_channel(1),
		blend_channel(2),
		blend_channel(3)
	)
end

---@param group string
---@param color table<string, any>
util.highlight = function(group, color)
	local fg = color.fg and parse_color(color.fg) or 'none'
	local bg = color.bg and parse_color(color.bg) or 'none'
	local sp = color.sp and parse_color(color.sp) or ''

	if
		color.blend ~= nil
		and (color.blend >= 0 or color.blend <= 100)
		and bg ~= nil
	then
		bg = util.blend(bg, parse_color('base') or '', color.blend / 100)
	end

	color = vim.tbl_extend('force', color, { fg = fg, bg = bg, sp = sp })
	vim.api.nvim_set_hl(0, group, color)
end

return util
