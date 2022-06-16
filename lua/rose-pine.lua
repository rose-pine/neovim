local util = require('rose-pine.util')

local M = {}

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

	local theme = require('rose-pine.theme').get(config)

	-- Set theme highlights
	for group, color in pairs(theme) do
		-- Skip highlight group if user overrides
		if config.highlight_groups[group] == nil then
			util.highlight(group, color)
		end
	end

	-- Set user highlights
	for group, color in pairs(config.highlight_groups) do
		util.highlight(group, color)
	end
end

return M
