--- Rosé Pine for toggleterm
--- https://github.com/akinsho/toggleterm.nvim
---
--- @usage
--- local highlights = require("rose-pine.plugins.toggleterm")
--- require("toggleterm").setup({ highlights = highlights })

return {
	Normal = { link = "Normal" },
	NormalFloat = { link = "Normal" },
	FloatBorder = { link = "FloatBorder" },
	SignColumn = { link = "SignColumn" },
	StatusLine = { link = "StatusLine" },
	StatusLineNC = { link = "StatusLineNC" },
}
