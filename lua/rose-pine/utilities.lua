local utilities = {}

---@param color string
local function color_to_rgb(color)
	local function byte(value, offset)
		return bit.band(bit.rshift(value, offset), 0xFF)
	end

	local new_color = vim.api.nvim_get_color_by_name(color)
	if new_color == -1 then
		new_color = vim.opt.background:get() == "dark" and 000 or 255255255
	end

	return { byte(new_color, 16), byte(new_color, 8), byte(new_color, 0) }
end

---@param color string Palette key or hex value
function utilities.parse_color(color)
	if color == nil then
		return print("Invalid color: " .. color)
	end

	color = color:lower()

	if not color:find("#") and color ~= "NONE" then
		color = require("rose-pine.palette")[color] or vim.api.nvim_get_color_by_name(color)
	end

	return color
end

---@param fg string Foreground color
---@param bg string Background color
---@param alpha number Between 0 (background) and 1 (foreground)
function utilities.blend(fg, bg, alpha)
	local fg_rgb = color_to_rgb(fg)
	local bg_rgb = color_to_rgb(bg)

	local function blend_channel(i)
		local ret = (alpha * fg_rgb[i] + ((1 - alpha) * bg_rgb[i]))
		return math.floor(math.min(math.max(0, ret), 255) + 0.5)
	end

	return string.format("#%02X%02X%02X", blend_channel(1), blend_channel(2), blend_channel(3))
end

return utilities
