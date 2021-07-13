local select_variant = function(variant)
	vim.g.rose_pine_variant = variant
	local formatted_variant = ''
	if variant == 'base' then
		formatted_variant = ''
	else
		formatted_variant = variant:sub(1, 1):upper() .. variant:sub(2)
	end
	print('Rosé Pine', formatted_variant)
	vim.cmd([[colorscheme rose-pine]])
end

local toggle_variant = function(variants)
	local options = variants or { 'base', 'moon', 'dawn' }
	local index = {}
	for k, v in pairs(options) do
		index[v] = k
	end

	if vim.g.rose_pine_variant_switch == nil then
		-- Ensure theme toggles from correct position
		vim.g.rose_pine_variant_switch = index[vim.g.rose_pine_variant] or 0
	end

	vim.g.rose_pine_variant_switch = (
			vim.g.rose_pine_variant_switch % table.getn(options)
		) + 1

	select_variant(options[vim.g.rose_pine_variant_switch])
end

return {
	select_variant = select_variant,
	toggle_variant = toggle_variant,
}
