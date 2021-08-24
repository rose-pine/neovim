local util = {}

util.highlight = function(group, color)
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

function util.load()
	if vim.g.colors_name then
		vim.cmd('hi clear')
	end

	vim.o.termguicolors = true
	vim.g.colors_name = 'rose-pine'

	if vim.o.background == 'light' and vim.g.rose_pine_variant == nil then
		vim.g.rose_pine_variant = 'dawn'
	elseif
		vim.g.rose_pine_variant == 'dawn'
		or vim.g.rose_pine_variant == 'rose-pine-dawn'
	then
		vim.o.background = 'light'
	end

	local theme = require('rose-pine.theme')

	theme.load_terminal()

	for group, colors in pairs(theme.base) do
		util.highlight(group, colors)
	end

	for group, colors in pairs(theme.treesitter) do
		util.highlight(group, colors)
	end

	for group, colors in pairs(theme.plugins) do
		util.highlight(group, colors)
	end
end

return util
