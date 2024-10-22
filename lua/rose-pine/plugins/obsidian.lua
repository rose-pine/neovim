--- Rosé Pine for toggleterm
--- https://github.com/epwalsh/obsidian.nvim
---
--- @usage
--- local highlights = require("rose-pine.plugins.obsidian")
--- require("obsidian").setup({ highlights = highlights })

return {
	hl_groups = {
		ObsidianBullet = { fg = "muted" },
		ObsidianRefText = { underline = true, fg = "iris" },
		ObsidianDone = { bold = true, fg = "foam" }
	}
}
