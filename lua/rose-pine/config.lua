---@alias Variant "main" | "moon" | "dawn"
---@alias Color { fg: string, bg: string, sp: string, bold: boolean, italic: boolean, undercurl: boolean, underline: boolean, underdouble: boolean, underdotted: boolean, underdashed: boolean, strikethrough: boolean }

local M = {}

---@class Options
M.options = {
	---Set the desired variant: "auto" will follow the vim background,
	---defaulting to "main" for dark and "dawn" for light. To change the dark
	---variant, use `options.dark_variant = "moon"`.
	---@type "auto" | Variant
	variant = 'auto',

	---Set the desired dark variant: applies when `options.variant` is set to
	---"auto" to match `vim.o.background`.
	---@type Variant
	dark_variant = 'main',

	bold_vert_split = false,

	dim_nc_background = false,

	disable_background = false,
	disable_float_background = false,
	disable_italics = false,

	groups = {
		background = 'base',
		background_nc = 'nc',
		panel = 'surface',
		panel_nc = 'base',
		border = 'highlight_med',
		comment = 'muted',
		link = 'iris',
		punctuation = 'muted',
		error = 'love',
		hint = 'iris',
		info = 'foam',
		warn = 'gold',
		git_add = 'foam',
		git_change = 'rose',
		git_delete = 'love',
		git_dirty = 'rose',
		git_ignore = 'muted',
		git_merge = 'iris',
		git_rename = 'pine',
		git_stage = 'iris',
		git_text = 'rose',
		headings = {
			h1 = 'iris',
			h2 = 'foam',
			h3 = 'rose',
			h4 = 'gold',
			h5 = 'pine',
			h6 = 'foam',
		},
	},

	---@type table<string, Color>
	highlight_groups = {},
}

---@param options Options|nil
function M.extend(options)
	M.options = vim.tbl_deep_extend('force', M.options, options or {})
end

return M
