--- Rosé Pine for bufferline
--- https://github.com/akinsho/bufferline.nvim
---
--- @usage
--- local highlights = require('rose-pine.plugins.bufferline')
--- require('bufferline').setup({ highlights = highlights })

local p = require('rose-pine.palette')

return {
	-- fill = {
	-- 	fg = '<color-value-here>',
	-- 	bg = '<color-value-here>',
	-- },
	background = {
		fg = p.subtle,
		bg = p.surface,
	},
	tab = {
		fg = p.muted,
		bg = p.surface,
	},
	tab_selected = {
		fg = p.text,
		bg = p.overlay,
	},
	-- tab_close = {
	-- 	fg = '<color-value-here>',
	-- 	bg = '<color-value-here>',
	-- },
	close_button = {
		-- fg = '<color-value-here>',
		bg = p.surface,
	},
	close_button_visible = {
		-- fg = p.iris,
		bg = p.highlight_low,
	},
	close_button_selected = {
		fg = p.subtle,
		bg = p.overlay,
	},
	numbers = {
		fg = p.subtle,
		bg = p.surface,
	},
	numbers_selected = {
		fg = p.text,
		bg = p.overlay,
		bold = true,
		italic = false,
		-- sp = '<color-value-here>',
		-- underline = '<color-value-here>',
	},
	numbers_visible = {
		fg = p.subtle,
		bg = p.surface,
	},
	buffer = { -- new
		fg = p.subtle,
		bg = p.surface,
	},
	buffer_visible = {
		fg = p.text,
		bg = p.highlight_low,
		-- bold = true,
	},
	buffer_selected = {
		fg = p.text,
		bg = p.overlay,
		bold = true,
		italic = false,
	},
	-- diagnostic = {
	-- 	fg = '<color-value-here>',
	-- 	bg = '<color-value-here>',
	-- },
	-- diagnostic_visible = {
	-- 	fg = '<color-value-here>',
	-- 	bg = '<color-value-here>',
	-- },
	-- diagnostic_selected = {
	-- 	fg = '<color-value-here>',
	-- 	bg = '<color-value-here>',
	-- 	bold = true,
	-- 	italic = true,
	-- },
	-- info = {
	-- 	fg = '<color-value-here>',
	-- 	sp = '<color-value-here>',
	-- 	bg = '<color-value-here>',
	-- },
	-- info_visible = {
	-- 	fg = '<color-value-here>',
	-- 	bg = '<color-value-here>',
	-- },
	-- info_selected = {
	-- 	fg = '<color-value-here>',
	-- 	bg = '<color-value-here>',
	-- 	bold = true,
	-- 	italic = true,
	-- 	sp = '<color-value-here>',
	-- },
	-- info_diagnostic = {
	-- 	fg = '<color-value-here>',
	-- 	sp = '<color-value-here>',
	-- 	bg = '<color-value-here>',
	-- },
	-- info_diagnostic_visible = {
	-- 	fg = '<color-value-here>',
	-- 	bg = '<color-value-here>',
	-- },
	-- info_diagnostic_selected = {
	-- 	fg = '<color-value-here>',
	-- 	bg = '<color-value-here>',
	-- 	bold = true,
	-- 	italic = true,
	-- 	sp = '<color-value-here>',
	-- },
	-- warning = {
	-- 	fg = '<color-value-here>',
	-- 	sp = '<color-value-here>',
	-- 	bg = '<color-value-here>',
	-- },
	-- warning_visible = {
	-- 	fg = '<color-value-here>',
	-- 	bg = '<color-value-here>',
	-- },
	-- warning_selected = {
	-- 	fg = '<color-value-here>',
	-- 	bg = '<color-value-here>',
	-- 	bold = true,
	-- 	italic = true,
	-- 	sp = '<color-value-here>',
	-- },
	-- warning_diagnostic = {
	-- 	fg = '<color-value-here>',
	-- 	sp = '<color-value-here>',
	-- 	bg = '<color-value-here>',
	-- },
	-- warning_diagnostic_visible = {
	-- 	fg = '<color-value-here>',
	-- 	bg = '<color-value-here>',
	-- },
	-- warning_diagnostic_selected = {
	-- 	fg = '<color-value-here>',
	-- 	bg = '<color-value-here>',
	-- 	bold = true,
	-- 	italic = true,
	-- 	sp = warning_diagnostic_fg,
	-- },
	-- error = {
	-- 	fg = '<color-value-here>',
	-- 	bg = '<color-value-here>',
	-- 	sp = '<color-value-here>',
	-- },
	-- error_visible = {
	-- 	fg = '<color-value-here>',
	-- 	bg = '<color-value-here>',
	-- },
	-- error_selected = {
	-- 	fg = '<color-value-here>',
	-- 	bg = '<color-value-here>',
	-- 	bold = true,
	-- 	italic = true,
	-- 	sp = '<color-value-here>',
	-- },
	-- error_diagnostic = {
	-- 	fg = '<color-value-here>',
	-- 	bg = '<color-value-here>',
	-- 	sp = '<color-value-here>',
	-- },
	-- error_diagnostic_visible = {
	-- 	fg = '<color-value-here>',
	-- 	bg = '<color-value-here>',
	-- },
	-- error_diagnostic_selected = {
	-- 	fg = '<color-value-here>',
	-- 	bg = '<color-value-here>',
	-- 	bold = true,
	-- 	italic = true,
	-- 	sp = '<color-value-here>',
	-- },
	modified = {
		fg = p.muted,
		bg = p.surface,
	},
	modified_visible = {
		fg = p.muted,
		bg = p.highlight_low,
	},
	modified_selected = {
		fg = p.foam,
		bg = p.overlay,
	},
	duplicate_selected = {
		fg = p.subtle,
		italic = false,
		bg = p.overlay,
	},
	duplicate_visible = {
		fg = p.subtle,
		italic = false,
		bg = p.highlight_low,
	},
	duplicate = {
		fg = p.muted,
		italic = false,
		bg = p.surface,
	},
	separator_selected = {
		fg = p.foam,
		-- bg = '<color-value-here>',
	},
	-- separator_visible = {
	-- 	fg = '<color-value-here>',
	-- 	bg = '<color-value-here>',
	-- },
	-- separator = {
	-- 	fg = '<color-value-here>',
	-- 	bg = '<color-value-here>',
	-- },
	tab_separator = {
		fg = p.base,
		bg = p.surface,
	},
	tab_separator_selected = {
		fg = p.base,
		bg = p.overlay,
		-- sp = underline_sp,
		-- underline = has_underline_indicator,
	},
	indicator_selected = {
		fg = p.rose,
		bg = p.overlay,
	},
	indicator_visible = {
		fg = p.muted,
		bg = p.overlay,
	},
	pick_selected = {
		fg = p.love,
		bg = p.overlay,
		italic = true,
	},
	pick_visible = {
		fg = p.love,
		bg = p.surface,
		bold = true,
		italic = true,
	},
	pick = {
		fg = p.love,
		bg = p.surface,
		bold = true,
		italic = true,
	},
	offset_separator = {
		fg = p.iris,
		-- bg = '<color-value-here>',
	},
}
