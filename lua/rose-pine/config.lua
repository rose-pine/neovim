---@alias Variant "main" | "moon" | "dawn"
---@alias Palette { base: string, surface: string, overlay: string, muted: string, subtle: string, text: string, love: string, gold: string, rose: string, pine: string, foam: string, iris: string }
---@alias PaletteColor "base" | "surface" | "overlay" | "muted" | "subtle" | "text" | "love" | "gold" | "rose" | "pine" | "foam" | "iris" | "highlight_low" | "highlight_med" | "highlight_high"
---@alias Highlight { fg: string, bg: string, sp: string, bold: boolean, italic: boolean, undercurl: boolean, underline: boolean, underdouble: boolean, underdotted: boolean, underdashed: boolean, strikethrough: boolean }

local config = {}

---@class Options
config.options = {
	---Set the desired variant: "auto" will follow the vim background,
	---defaulting to `dark_variant` or "main" for dark and "dawn" for light.
	---@type "auto" | Variant
	variant = "auto",

	---Set the desired dark variant when `options.variant` is set to "auto".
	---@type Variant
	dark_variant = "main",

	---Differentiate between active and inactive windows and panels.
	dim_inactive_windows = false,

	---Extend background behind borders. Appearance differs based on which
	---border characters you are using.
	extend_background_behind_borders = true,

	enable = {
		terminal = true,
		migrations = true,
	},

	styles = {
		bold = true,
		italic = true,
		transparency = false,
	},

	---@type table<string, string | PaletteColor>
	groups = {
		border = "muted",
		link = "iris",
		panel = "surface",

		error = "love",
		hint = "iris",
		info = "foam",
		warn = "gold",

		git_add = "foam",
		git_change = "rose",
		git_delete = "love",
		git_dirty = "rose",
		git_ignore = "muted",
		git_merge = "iris",
		git_rename = "pine",
		git_stage = "iris",
		git_text = "rose",
		git_untracked = "subtle",

		---@type string | PaletteColor | table<string, string | PaletteColor>
		headings = {
			h1 = "iris",
			h2 = "foam",
			h3 = "rose",
			h4 = "gold",
			h5 = "pine",
			h6 = "foam",
		},

		---@deprecated Replaced by `options.highlight_groups["Normal"]`
		-- background = "base",
		---@deprecated Replaced by `options.highlight_groups["Comment"]`
		-- comment = "subtle",
		---@deprecated Replaced by `options.highlight_groups["@punctuation"]`
		-- punctuation = "muted",
	},

	---@type table<string, Highlight>
	highlight_groups = {},

	---Called before each highlight group, before setting the highlight.
	---@param group string
	---@param highlight Highlight
	---@param palette Palette
	---@diagnostic disable-next-line: unused-local
	before_highlight = function(group, highlight, palette) end,

	---@deprecated Replaced by `options.dim_inactive_windows`
	-- dim_nc_background = false,
	---@deprecated Replaced by `options.enable.transparency`
	-- disable_background = false,
	---@deprecated Replaced by `options.highlight_groups["NormalFloat"]`
	-- disable_float_background = false,
	---@deprecated Replaced by `options.styles.italic`
	-- disable_italics = false,
	---@deprecated Replaced by `options.highlight_groups`
	-- bold_vert_split = false
}

local function migrate(options)
	if options.bold_vert_split then
		local border = options.groups.border or "muted"
		options.highlight_groups["VertSplit"] = { fg = border, bg = border }
		options.highlight_groups["WinSeparator"] = { fg = border, bg = border }
	end

	if options.disable_float_background then
		options.highlight_groups["NormalFloat"] = { bg = "NONE" }
	end

	options.dim_inactive_windows = options.dim_nc_background or options.dim_inactive_windows

	if options.groups.background ~= nil then
		options.highlight_groups["Normal"] = { bg = options.groups.background }
	end

	if options.groups.comment ~= nil then
		options.highlight_groups["Comment"] = { fg = options.groups.comment }
	end

	if options.groups.punctuation ~= nil then
		options.highlight_groups["@punctuation"] = { fg = options.groups.punctuation }
	end

	options.styles.transparency = options.disable_background or options.styles.transparency

	-- These never actually existed, but may be set intuitively by the user
	-- because of `disable_italics` existing.
	options.styles.bold = (options.disable_bold or options.disable_bolds) and false or options.styles.bold

	-- Similar to bold options, `disable_italic` never existed but could be a
	-- common typo of the actual `disable_italics`.
	options.styles.italic = (options.disable_italic or options.disable_italics) and false or options.styles.italic

	-- Set h1 through h6 to the same color if only one is specified
	if type(options.groups.headings) == "string" then
		options.groups.headings = {
			h1 = options.groups.headings,
			h2 = options.groups.headings,
			h3 = options.groups.headings,
			h4 = options.groups.headings,
			h5 = options.groups.headings,
			h6 = options.groups.headings,
		}
	end

	return options
end

---@param options Options | nil
function config.extend_options(options)
	config.options = vim.tbl_deep_extend("force", config.options, options or {})

	if config.options.enable.migrations then
		config.options = migrate(config.options)
	end
end

return config
