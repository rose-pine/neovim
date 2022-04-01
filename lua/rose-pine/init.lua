local util = require('rose-pine.util')

local M = {}
local show_init_messages = true

local function check_for_deprecated_opts()
	local alerts = {}
	local should_alert = false

	-- Deprecated options
	if vim.g.rose_pine_bold_vertical_split_line ~= nil then
		should_alert = true
		table.insert(alerts, 'vim.g.rose_pine_bold_vertical_split_line renamed to bold_vert_split')
	end

	if vim.g.rose_pine_inactive_background ~= nil then
		should_alert = true
		table.insert(alerts, 'vim.g.rose_pine_inactive_background renamed to dim_nc_background')
	end

	if vim.g.rose_pine_disable_background ~= nil then
		should_alert = true
		table.insert(alerts, 'vim.g.rose_pine_disable_background renamed to disable_background')
	end

	if vim.g.rose_pine_disable_float_background ~= nil then
		should_alert = true
		table.insert(
			alerts,
			'vim.g.rose_pine_disable_float_background renamed to disable_float_background'
		)
	end

	if vim.g.rose_pine_disable_italics ~= nil then
		should_alert = true
		table.insert(alerts, 'vim.g.rose_pine_disable_italics renamed to disable_italics')
	end

	if vim.g.rose_pine_colors ~= nil then
		should_alert = true
		table.insert(alerts, 'vim.g.rose_pine_colors renamed to groups')
	end

	if should_alert then
		local prefix = '   '
		print('Rosé Pine – https://github.com/rose-pine/neovim')
		print(prefix .. 'vim.g.rose_pine_<option> moved to lua setup:')
		print(prefix .. "   require('rose-pine').setup({ ... })")
		for _, message in ipairs(alerts) do
			print(prefix .. message)
		end
		should_alert = false
	end
end

---@class RosePineConfig
---@field bold_vert_split boolean
---@field dark_variant 'main'|'moon'
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
local config = {
	bold_vert_split = false,
	dark_variant = 'main',
	dim_nc_background = false,
	disable_background = false,
	disable_float_background = false,
	disable_italics = false,

	groups = {
		background = 'base',
		panel = 'surface',
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
	highlight_groups = {},
}

---@param opts RosePineConfig
function M.setup(opts)
	opts = opts or {}
	vim.g.rose_pine_variant = opts.dark_variant or 'main'

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

	config.user_variant = opts.dark_variant or nil
	config = vim.tbl_deep_extend('force', config, opts)
end

function M.colorscheme()
	if vim.g.colors_name then
		vim.cmd('hi clear')
	end

	vim.opt.termguicolors = true
	vim.g.colors_name = 'rose-pine'

	if show_init_messages then
		check_for_deprecated_opts()
		show_init_messages = false
	end

	local theme = require('rose-pine.theme').get(config)
	for group, color in pairs(theme) do
		if config.highlight_groups[group] ~= nil then
			util.highlight(group, config.highlight_groups[group])
		else
			util.highlight(group, color)
		end
	end

	require('rose-pine.galaxyline.theme')
end

return M
