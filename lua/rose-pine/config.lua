local M = {}

---@class Highlight
---@field fg string
---@field bg string
---@field sp string
---@field bold boolean
---@field italic boolean
---@field undercurl boolean
---@field underline boolean
---@field underdouble boolean
---@field underdotted boolean
---@field underdashed boolean
---@field strikethrough boolean

---@alias Variant 'main' | 'moon' | 'dawn'

---@class Config
local defaults = {
	---@type 'auto' | Variant
	variant = 'auto',

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

	---@type table<string, Highlight>
	highlight_groups = {},
}

---@type Config
M.options = {}

---@param options Config|nil
function M.setup(options)
	M.options = vim.tbl_deep_extend('force', {}, defaults, options or {})
end

---@param options Config|nil
function M.extend(options)
	M.options =
		vim.tbl_deep_extend('force', {}, M.options or defaults, options or {})
end

M.setup()

return M
