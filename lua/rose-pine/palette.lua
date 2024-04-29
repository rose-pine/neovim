local options = require("rose-pine.config").options
local variants = require("rose-pine.variants")

if variants[options.variant] ~= nil then
	return variants[options.variant]
end

return vim.o.background == "light" and variants.dawn or variants[options.dark_variant or "main"]
