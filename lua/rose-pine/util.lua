local util = {}

local function get_byte(value, offset)
	return bit.band(bit.rshift(value, offset), 0xFF)
end

local function get_color(color)
	color = vim.api.nvim_get_color_by_name(color)

	if color == -1 then
		color = vim.opt.background:get() == 'dark' and 000 or 255255255
	end

	return { get_byte(color, 16), get_byte(color, 8), get_byte(color, 0) }
end

---@param fg string foreground color
---@param bg string background color
---@param alpha number number between 0 and 1. 0 results in bg, 1 results in fg
function util.blend(fg, bg, alpha)
	bg = get_color(bg)
	fg = get_color(fg)

	local blendChannel = function(i)
		local ret = (alpha * fg[i] + ((1 - alpha) * bg[i]))
		return math.floor(math.min(math.max(0, ret), 255) + 0.5)
	end

	return string.format(
		'#%02X%02X%02X',
		blendChannel(1),
		blendChannel(2),
		blendChannel(3)
	)
end

return util
