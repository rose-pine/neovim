local M = {}

function M.colorscheme()
	if vim.g.colors_name then
		vim.cmd('hi clear')
	end

	vim.opt.termguicolors = true
	vim.g.colors_name = 'rose-pine'

	-- Match terminal theme if no variant is set
	if vim.g.rose_pine_variant == nil and vim.o.background == 'light' then
		vim.g.rose_pine_variant = 'dawn'
	elseif vim.g.rose_pine_variant == 'dawn' then
		vim.o.background = 'light'
	end

	---@param group string
	---@param color table<string, string>
	local function highlight(group, color)
		local style = color.style and 'gui=' .. color.style or 'gui=NONE'
		local fg = color.fg and 'guifg=' .. color.fg or 'guifg=NONE'
		local bg = color.bg and 'guibg=' .. color.bg or 'guibg=NONE'
		local sp = color.sp and 'guisp=' .. color.sp or ''

		local hl = 'highlight '
			.. group
			.. ' '
			.. style
			.. ' '
			.. fg
			.. ' '
			.. bg
			.. ' '
			.. sp

		vim.cmd(hl)
		if color.link then
			vim.cmd('highlight! link ' .. group .. ' ' .. color.link)
		end
	end

	for group, colors in pairs(require('rose-pine.theme')) do
		highlight(group, colors)
	end

	require('rose-pine.galaxyline.theme')
end

function M.set(variant)
	vim.g.rose_pine_variant = variant
	vim.cmd([[colorscheme rose-pine]])
end

function M.toggle(variants)
	variants = variants or { 'main', 'moon', 'dawn' }

	local index = {}
	for k, v in pairs(variants) do
		index[v] = k
	end

	if vim.g.rose_pine_current_variant == nil then
		vim.g.rose_pine_current_variant = index[vim.g.rose_pine_variant] or 0
	end

	vim.g.rose_pine_current_variant = (
			vim.g.rose_pine_current_variant % #variants
		) + 1

	M.set(variants[vim.g.rose_pine_current_variant])
end

return M
