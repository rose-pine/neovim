--- Rosé Pine for toggleterm
--- https://github.com/epwalsh/obsidian.nvim
---
--- @usage
--- local highlights = require("rose-pine.plugins.obsidian")
--- require("obsidian").setup({ highlights = highlights })

local p = require("rose-pine.palette")

return {
	ObsidianBullet = { fg = p.muted },
	ObsidianRefText = { underline = true, fg = p.iris },
	ObsidianDone = { bold = true, fg = p.foam }
}
