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

return M
