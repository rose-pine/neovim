local M = {}

function M.alternate(p)
	return {
		normal = {
			a = { bg = p.surface, fg = p.rose, gui = "bold" },
			b = { bg = p.surface, fg = p.text },
			c = { bg = p.surface, fg = p.subtle, gui = "italic" },
		},
		insert = {
			a = { bg = p.surface, fg = p.foam, gui = "bold" },
		},
		visual = {
			a = { bg = p.surface, fg = p.iris, gui = "bold" },
		},
		replace = {
			a = { bg = p.surface, fg = p.pine, gui = "bold" },
		},
		command = {
			a = { bg = p.surface, fg = p.love, gui = "bold" },
		},
		inactive = {
			a = { bg = p.base, fg = p.subtle, gui = "bold" },
			b = { bg = p.base, fg = p.subtle },
			c = { bg = p.base, fg = p.subtle, gui = "italic" },
		},
	}
end

function M.normal(p)
	local config = require("rose-pine.config")

	local bg_base = p.base
	if config.options.styles.transparency then
		bg_base = "NONE"
	end

	return {
		normal = {
			a = { bg = p.rose, fg = p.base, gui = "bold" },
			b = { bg = p.overlay, fg = p.rose },
			c = { bg = bg_base, fg = p.text },
		},
		insert = {
			a = { bg = p.foam, fg = p.base, gui = "bold" },
			b = { bg = p.overlay, fg = p.foam },
			c = { bg = bg_base, fg = p.text },
		},
		visual = {
			a = { bg = p.iris, fg = p.base, gui = "bold" },
			b = { bg = p.overlay, fg = p.iris },
			c = { bg = bg_base, fg = p.text },
		},
		replace = {
			a = { bg = p.pine, fg = p.base, gui = "bold" },
			b = { bg = p.overlay, fg = p.pine },
			c = { bg = bg_base, fg = p.text },
		},
		command = {
			a = { bg = p.love, fg = p.base, gui = "bold" },
			b = { bg = p.overlay, fg = p.love },
			c = { bg = bg_base, fg = p.text },
		},
		inactive = {
			a = { bg = bg_base, fg = p.muted, gui = "bold" },
			b = { bg = bg_base, fg = p.muted },
			c = { bg = bg_base, fg = p.muted },
		},
	}
end

return M
