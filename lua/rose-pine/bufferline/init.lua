local p = require('rose-pine.palette')

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
		guifg = p.text,
		guibg = p.base,
	},
	background = {
		guifg = p.text,
		guibg = p.base,
	},
}
