---@alias Highlight { link: string } | { fg: string, bg: string, sp: string, bold: boolean, italic: boolean, undercurl: boolean, underline: boolean, underdouble: boolean, underdotted: boolean, underdashed: boolean, strikethrough: boolean, blend: number, extend: boolean }

local M = {}

---@param hex string A string representing the hex colour, e.g. "#fa8072"
---@return integer Red, integer Green, integer Blue
---@private
local function hex_to_rgb(hex)
	hex = hex:gsub("#", "")
	return tonumber(hex:sub(1, 2), 16), tonumber(hex:sub(3, 4), 16), tonumber(hex:sub(5, 6), 16)
end

---@param r number Red (0-255)
---@param g number Green (0-255)
---@param b number Blue (0-255)
---@return string
---@private
local function rgb_to_hex(r, g, b)
	return string.format("#%02x%02x%02x", r, g, b)
end

local blend_cache = {}

---@param fg string The foreground colour as a hex string, e.g. "#fa8072"
---@param bg string The background colour as a hex string, e.g. "#000000"
---@param alpha number A number between 0 (background) and 1 (foreground)
---@return string
---@private
local function blend(fg, bg, alpha)
	local cache_key = fg .. bg .. alpha
	if blend_cache[cache_key] then
		return blend_cache[cache_key]
	end

	local r1, g1, b1 = hex_to_rgb(fg)
	local r2, g2, b2 = hex_to_rgb(bg)

	local r = r1 * alpha + r2 * (1 - alpha)
	local g = g1 * alpha + g2 * (1 - alpha)
	local b = b1 * alpha + b2 * (1 - alpha)

	local result = rgb_to_hex(math.floor(r), math.floor(g), math.floor(b))

	blend_cache[cache_key] = result
	return result
end

---@param palette Palette
---@param key string
---@return string
---@private
local function find_palette_value_by_key(palette, key)
	return palette[key] or key or ""
end

M.colorscheme = function()
	---@class Config
	local config = {
		appearance = vim.tbl_extend("force", {
			bold = true,
			italic = true,
			transparent = false,
		}, vim.g.rose_pine_appearance or {}),

		--- Helper table to set user highlight groups, extending the theme's
		--- group values. The palette is accessible by name, e.g. "love":
		--- ```lua
		--- vim.g.rose_pine_groups = {
		---   Normal = { fg = "love" }
		--- }
		--- ```
		---
		--- To override a value completely, use the Neovim api directly:
		--- ```lua
		--- vim.api.nvim_create_autocmd("ColorScheme", {
		---   pattern = { "rose-pine", "rose-pine-main", "rose-pine-moon", "rose-pine-dawn" },
		---   callback = function()
		---     vim.api.nvim_set_hl(0, { ... })
		---   end
		--- })
		--- ```
		groups = vim.g.rose_pine_groups or {},

		--- Table to set shared styles.
		--- ```lua
		--- vim.g.rose_pine_styles = {
		---   git_add = "iris"
		--- }
		--- ```
		styles = vim.tbl_extend("force", {
			git_add           = "foam",
			git_change        = "rose",
			git_delete        = "love",
			git_dirty         = "rose",
			git_ignore        = "muted",
			git_merge         = "iris",
			git_rename        = "pine",
			git_stage         = "iris",
			git_text          = "rose",
			git_untracked     = "subtle",

			status_deprecated = "muted",
			status_error      = "love",
			status_hint       = "iris",
			status_info       = "foam",
			status_note       = "subtle",
			status_ok         = "pine",
			status_todo       = "rose",
			status_warn       = "gold",
		}, vim.g.rose_pine_groups or {})
	}

	if vim.g.colors_name then
		vim.cmd("hi clear")
		vim.cmd("syntax reset")
	end
	vim.g.colors_name = "rose-pine"

	---@class Palette
	local palette = {
		base    = "#faf4ed",
		surface = "#fffaf3",
		overlay = "#f2e9e1",
		muted   = "#9893a5",
		subtle  = "#797593",
		text    = "#464261",
		love    = "#b4637a",
		gold    = "#ea9d34",
		rose    = "#d7827e",
		pine    = "#286983",
		foam    = "#56949f",
		iris    = "#907aa9",
	}

	if vim.o.background == "dark" then
		if vim.g.rose_pine_dark_variant == "moon" then
			palette = {
				base    = "#232136",
				surface = "#2a273f",
				overlay = "#393552",
				muted   = "#6e6a86",
				subtle  = "#908caa",
				text    = "#e0def4",
				love    = "#eb6f92",
				gold    = "#f6c177",
				rose    = "#ea9a97",
				pine    = "#3e8fb0",
				foam    = "#9ccfd8",
				iris    = "#c4a7e7",
			}
		else
			palette = {
				base    = "#191724",
				surface = "#1f1d2e",
				overlay = "#26233a",
				muted   = "#6e6a86",
				subtle  = "#908caa",
				text    = "#e0def4",
				love    = "#eb6f92",
				gold    = "#f6c177",
				rose    = "#ebbcba",
				pine    = "#31748f",
				foam    = "#9ccfd8",
				iris    = "#c4a7e7",
			}
		end
	end

	local styles = {}
	for style, value in pairs(config.styles) do
		styles[style] = find_palette_value_by_key(palette, value)
	end

	local dynamic_styles = {
		float_bg = vim.o.winborder == "none" and palette.surface or palette.base
	}

	-- TODO: Check that winborder option exists
	-- Reload colorscheme on relevant option change
	vim.api.nvim_create_autocmd("OptionSet", {
		pattern = { "winborder" },
		callback = function()
			vim.cmd.colorscheme(vim.g.colors_name)
		end
	})

	local highlights = {
		-- Interface
		CursorLine               = { bg = palette.muted, fg = palette.text, opacity = 0.15 },
		Directory                = { fg = palette.text, bold = true },
		LineNr                   = { fg = palette.muted },
		SpecialKey               = { fg = palette.muted },
		Normal                   = { bg = palette.base, fg = palette.text },
		QuickFixLine             = { bg = palette.muted, fg = palette.foam, opacity = 0.1 },
		StatusLine               = { bg = palette.surface, fg = palette.subtle },
		StatusLineNC             = { bg = palette.surface, fg = palette.muted },
		Visual                   = { bg = palette.iris, fg = palette.iris, opacity = 0.2 },
		WinSeparator             = { fg = palette.overlay },

		-- Message area
		ModeMsg                  = { fg = palette.muted },
		MoreMsg                  = { fg = palette.muted },
		-- hl(0, "MsgArea", { bg = palette.surface, fg = palette.subtle })

		-- Menus
		Pmenu                    = { bg = palette.surface, fg = palette.subtle },
		PmenuExtra               = { fg = palette.muted, italic = true },
		PmenuExtraSel            = { bg = palette.muted, fg = palette.subtle, opacity = 0.2, italic = true },
		PmenuKind                = { fg = palette.muted, italic = true },
		PmenuKindSel             = { bg = palette.muted, fg = palette.subtle, opacity = 0.2, italic = true },
		PmenuMatch               = { fg = palette.iris },
		PmenuMatchSel            = { fg = palette.iris, bold = true },
		PmenuSbar                = { bg = palette.overlay },
		PmenuSel                 = { bg = palette.muted, fg = palette.text, opacity = 0.2, bold = true },
		PmenuThumb               = { bg = palette.muted },

		-- Floats
		FloatBorder              = { bg = dynamic_styles.float_bg, fg = palette.overlay },
		FloatFooter              = { bg = dynamic_styles.float_bg, fg = palette.muted },
		FloatTitle               = { bg = dynamic_styles.float_bg, fg = palette.text, bold = true },
		NormalFloat              = { bg = dynamic_styles.float_bg, fg = palette.subtle },

		-- Search
		CurSearch                = { bg = palette.gold, fg = palette.base },
		IncSearch                = { bg = palette.text, fg = palette.base },
		Search                   = { bg = palette.overlay, fg = palette.text },

		-- Diagnostics
		DiagnosticDeprecated     = { fg = styles.status_deprecated, strikethrough = true },
		DiagnosticError          = { fg = styles.status_error },
		DiagnosticHint           = { fg = styles.status_hint },
		DiagnosticInfo           = { fg = styles.status_info },
		DiagnosticOk             = { fg = styles.status_ok },
		DiagnosticWarn           = { fg = styles.status_warn },
		DiagnosticUnderlineError = { sp = styles.status_error, undercurl = true },
		DiagnosticUnderlineHint  = { sp = styles.status_hint, undercurl = true },
		DiagnosticUnderlineInfo  = { sp = styles.status_info, undercurl = true },
		DiagnosticUnderlineOk    = { sp = styles.status_ok, undercurl = true },
		DiagnosticUnderlineWarn  = { sp = styles.status_warn, undercurl = true },

		-- Diff
		Added                    = { fg = styles.git_add },
		Changed                  = { fg = styles.git_change },
		Removed                  = { fg = styles.git_delete },
		DiffAdd                  = { bg = styles.git_add, fg = styles.git_add, opacity = 0.2 },
		DiffChange               = { bg = styles.git_change, fg = styles.git_change, opacity = 0.2 },
		DiffDelete               = { bg = styles.git_delete, fg = styles.git_delete, opacity = 0.2 },
		DiffText                 = { bg = styles.git_text, fg = styles.git_text, opacity = 0.2 },

		-- Syntax
		Comment                  = { fg = palette.muted },
		Constant                 = { fg = palette.subtle },
		Delimiter                = { fg = palette.muted },
		Function                 = { fg = palette.rose },
		Identifier               = { fg = palette.text },
		MatchParen               = { bg = palette.text, fg = palette.base, underline = true },
		NonText                  = { fg = palette.muted, opacity = 0.5 },
		Operator                 = { fg = palette.muted },
		Question                 = { fg = palette.subtle },
		Special                  = { fg = palette.foam },
		SpellBad                 = { sp = palette.muted, underdotted = true },
		SpellCap                 = { sp = palette.muted, underdotted = true },
		SpellRare                = { sp = palette.muted, underdotted = true },
		SpellLocal               = { sp = palette.muted, underdotted = true },
		Statement                = { fg = palette.text },
		String                   = { fg = palette.gold },
		Type                     = { fg = palette.text, bold = true },
		Underlined               = { sp = palette.muted, underline = true },

		-- Treesitter syntax
		["@variable"]            = { fg = palette.text },
	}

	-- Merge user highlight groups
	for group, highlight in pairs(config.groups) do
		local original = highlights[group] or {}
		local base = highlight

		-- Find root link to extend its properties
		while original.link ~= nil do
			original = highlights[original.link] or {}
		end
		while base.link ~= nil do
			base = highlights[base.link] or {}
		end

		local parsed_highlight = vim.tbl_extend("force", {}, base)

		if highlight.fg ~= nil then
			parsed_highlight.fg = find_palette_value_by_key(palette, highlight.fg)
		end

		if highlight.bg ~= nil then
			parsed_highlight.bg = find_palette_value_by_key(palette, highlight.bg)
		end

		if highlight.sp ~= nil then
			parsed_highlight.sp = find_palette_value_by_key(palette, highlight.sp)
		end

		highlights[group] = vim.tbl_extend("force", original, parsed_highlight)
	end

	-- Apply all highlights
	for group, highlight in pairs(highlights) do
		if highlight.opacity ~= nil then
			if highlight.bg ~= nil then
				highlight.bg = blend(highlight.bg, palette.base, highlight.opacity)
			else
				highlight.fg = blend(highlight.fg, palette.base, highlight.opacity)
			end

			highlight.opacity = nil
		end

		if config.appearance.transparent then
			if highlight.bg ~= nil and highlight.bg == palette.base then
				highlight.bg = "NONE"
			end
		end

		vim.api.nvim_set_hl(0, group, highlight)
	end
end

return M
