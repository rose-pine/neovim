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
---@param alpha number number between 0 (background) and 1 (foreground)
function util.blend(fg, bg, alpha)
	bg = get_color(bg)
	fg = get_color(fg)

	local function blend_channel(i)
		local ret = (alpha * fg[i] + ((1 - alpha) * bg[i]))
		return math.floor(math.min(math.max(0, ret), 255) + 0.5)
	end

	return string.format('#%02X%02X%02X', blend_channel(1), blend_channel(2), blend_channel(3))
end

return util
