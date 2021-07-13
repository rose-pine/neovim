local util = {}
local theme = require('rose-pine.theme')

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
	vim.cmd('hi clear')
	if vim.fn.exists('syntax_on') then
		vim.cmd('syntax reset')
	end
	if vim.g.rose_pine_variant == 'dawn' then
		vim.o.background = 'light'
	else
		vim.o.background = 'dark'
	end
	vim.o.termguicolors = true
	vim.g.colors_name = 'rose-pine'

	local async
	async = vim.loop.new_async(vim.schedule_wrap(function()
		theme.loadTerminal()
		local plugins = theme.loadPlugins()
		local treesitter = theme.loadTreesitter()
		local lsp = theme.loadLsp()

		for group, colors in pairs(plugins) do
			util.highlight(group, colors)
		end

		for group, colors in pairs(treesitter) do
			util.highlight(group, colors)
		end

		for group, colors in pairs(lsp) do
			util.highlight(group, colors)
		end

		async:close()
	end))

	-- load priority groups first
	local editor = theme.loadEditor()
	local syntax = theme.loadSyntax()

	for group, colors in pairs(editor) do
		util.highlight(group, colors)
	end

	for group, colors in pairs(syntax) do
		util.highlight(group, colors)
	end

	-- load enhancements (eg. lsp, treesitter, plugins)
	async:send()
end

return util
