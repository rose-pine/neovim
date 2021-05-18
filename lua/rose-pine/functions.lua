if vim.g.rose_pine_variant_switch == nil then
	vim.g.rose_pine_variant_switch = 0
end

local select_variant = function(variant)
	vim.g.rose_pine_variant = variant
	print("Rosé Pine", variant)
	vim.cmd([[colorscheme rose-pine]])
end

local toggle_variant = function(variants)
	local options = variants or { "base", "moon", "dawn" }

	vim.g.rose_pine_variant_switch = (vim.g.rose_pine_variant_switch % table.getn(options)) + 1

	select_variant(options[vim.g.rose_pine_variant_switch])
end

return {
	select_variant = select_variant,
	toggle_variant = toggle_variant,
}
