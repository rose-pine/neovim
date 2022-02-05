local palette = require('rose-pine.palette')

local M = {}

---@class RosePineConfig
---@field variant 'main'|'moon'|'dawn'
---@field bold_vert_split boolean
---@field dim_nc_background boolean
---@field disable_background boolean
---@field disable_float_background boolean
---@field disable_italics boolean
---@field groups RosePineGroups

---@class RosePineGroups
---@field border string
---@field comment string
---@field link string
---@field punctuation string
---@field error string
---@field hint string
---@field info string
---@field warn string
---@field git RosePineGit
---@field headings string|RosePineHeadings

---@class RosePineGit
---@field add string
---@field change string
---@field delete string
---@field dirty string
---@field ignore string
---@field merge string
---@field rename string
---@field stage string
---@field text string

---@class RosePineHeadings
---@field h1 string
---@field h2 string
---@field h3 string
---@field h4 string
---@field h5 string
---@field h6 string

---@type RosePineConfig
local config = {}

---@param opts RosePineConfig
function M.setup(opts)
	vim.g.rose_pine_variant = opts.variant or 'main'

	local default_config = {
		variant = 'main',
		bold_vert_split = false,
		dim_nc_background = false,
		disable_background = false,
		disable_float_background = false,
		disable_italics = false,

		groups = {
			border = 'highlight_med',
			comment = 'muted',
			link = 'iris',
			punctuation = 'subtle',

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
	}

	if opts.groups and type(opts.groups.headings) == 'string' then
		opts.groups.headings = {
			h1 = opts.groups.headings,
			h2 = opts.groups.headings,
			h3 = opts.groups.headings,
			h4 = opts.groups.headings,
			h5 = opts.groups.headings,
			h6 = opts.groups.headings,
		}
	end

	config.user_variant = opts.variant or nil
	config = vim.tbl_deep_extend('force', default_config, opts)
end

function M.colorscheme()
	if vim.g.colors_name then
		vim.cmd('hi clear')
	end

	vim.opt.termguicolors = true
	vim.g.colors_name = 'rose-pine'

	-- match variant to vim background
	if config.user_variant == nil and vim.o.background == 'light' then
		config.variant = 'dawn'
	end

	-- match vim background to variant
	if config.user_variant == 'main' or config.user_variant == 'moon' then
		vim.o.background = 'dark'
	elseif config.user_variant == 'dawn' then
		vim.o.background = 'light'
	end

	---@param color string
	local function get_palette_color(color)
		if color and not color:find('#') then
			return palette[config.variant][color:lower()]
		end

		return color:lower()
	end

	---@param group string
	---@param color table<string, string>
	local function highlight(group, color)
		local style = color.style and 'gui=' .. color.style or 'gui=NONE'
		local fg = color.fg and 'guifg=' .. get_palette_color(color.fg) or 'guifg=NONE'
		local bg = color.bg and 'guibg=' .. get_palette_color(color.bg) or 'guibg=NONE'
		local sp = color.sp and 'guisp=' .. get_palette_color(color.sp) or ''

		local hl = 'highlight ' .. group .. ' ' .. style .. ' ' .. fg .. ' ' .. bg .. ' ' .. sp

		vim.cmd(hl)
		if color.link then
			vim.cmd('highlight! link ' .. group .. ' ' .. color.link)
		end
	end

	local theme = require('rose-pine.theme').get(config)
	for group, color in pairs(theme) do
		highlight(group, color)
	end

	require('rose-pine.galaxyline.theme')
end

function M.set(variant)
	config.variant = variant
	vim.cmd('colorscheme rose-pine')
end

function M.toggle(variants)
	variants = variants or { 'main', 'moon', 'dawn' }

	local index = {}
	for k, v in pairs(variants) do
		index[v] = k
	end

	if vim.g.rose_pine_current_variant == nil then
		vim.g.rose_pine_current_variant = index[config.variant] or 0
	end

	vim.g.rose_pine_current_variant = (vim.g.rose_pine_current_variant % #variants) + 1

	M.set(variants[vim.g.rose_pine_current_variant])
end

return M
