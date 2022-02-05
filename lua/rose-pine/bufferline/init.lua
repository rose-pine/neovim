local palette = require('rose-pine.palette')
local colors = palette[vim.g.rose_pine_variant or 'main']

-- TODO: Someone who uses bufferline.nvim is free to PR with this addition
--       `:h bufferline-highlights`
--
--       The intended use would be (or any better solution):
--
--       ```
--       local highlights = require('rose-pine.bufferline')
--       require('bufferline').setup({
--         highlights = highlights
--       })
--       ```
return {
	fill = {
		guifg = colors.text,
		guibg = colors.base,
	},
	background = {
		guifg = colors.text,
		guibg = colors.base,
	},
}
