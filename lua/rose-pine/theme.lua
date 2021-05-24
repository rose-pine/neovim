local p = require('rose-pine.palette')

local theme = {}

theme.loadSyntax = function()
	local syntax = {
		Boolean = { fg = p.gold },
		Character = { fg = p.gold },
		Comment = { fg = p.subtle, style = 'italic' },
		Conditional = { fg = p.pine },
		Constant = { fg = p.gold },
		Debug = { fg = p.rose },
		Define = { fg = p.iris },
		Delimiter = { fg = p.rose },
		Error = { fg = p.love },
		Exception = { fg = p.pine },
		Float = { fg = p.gold },
		Function = { fg = p.rose },
		Identifier = { fg = p.rose },
		-- Ignore = { fg = '' },
		Include = { fg = p.iris },
		Keyword = { fg = p.pine },
		Label = { fg = p.pine },
		Macro = { fg = p.iris },
		Number = { fg = p.gold },
		Operator = { fg = p.pine },
		PreCondit = { fg = p.iris },
		PreProc = { fg = p.iris },
		Repeat = { fg = p.pine },
		Special = { fg = p.rose },
		SpecialChar = { fg = p.rose },
		SpecialComment = { fg = p.iris },
		Statement = { fg = p.pine },
		StorageClass = { fg = p.foam },
		String = { fg = p.gold },
		Structure = { fg = p.foam },
		Tag = { fg = p.rose },
		Title = { fg = p.text },
		Todo = { fg = p.iris },
		Type = { fg = p.foam },
		Typedef = { fg = p.foam },
		Underlined = { fg = p.foam, style = 'underline' },

		-- htmlH1 = { fg = '' },
		-- htmlH2 = { fg = '' },
		-- htmlH3 = { fg = '' },
		-- htmlH4 = { fg = '' },
		-- htmlH5 = { fg = '' },
		-- htmlLink = { fg = '' },
		-- markdownH1 = { fg = '' },
		-- markdownH1Delimeter = { fg = '' },
		-- markdownH2 = { fg = '' },
		-- markdownH2Delimeter = { fg = '' },
		-- markdownH3 = { fg = '' },
		-- markdownH3Delimeter = { fg = '' },
	}

	return syntax
end

theme.loadEditor = function()
	local editor = {
		-- ColorColumn = {},
		-- Conceal = {},
		-- Cursor = {},
		-- CursorColumn = {},
		-- CursorIM = {},
		CursorLine = { bg = p.highlight_inactive },
		CursorLineNr = { fg = p.text },
		DiffAdd = { fg = '', bg = '' },
		DiffChange = { fg = '', bg = '' },
		DiffDelete = { fg = '', bg = '' },
		DiffText = { fg = '', bg = '' },
		Directory = { fg = p.foam },
		-- EndOfBuffer = {},
		ErrorMsg = { fg = p.love, style = 'bold' },
		-- FoldColumn = {},
		-- Folded = {},
		IncSearch = { bg = p.highlight },
		LineNr = { fg = p.inactive },
		MatchParen = { fg = p.text, bg = p.overlay },
		-- ModeMsg = {},
		MoreMsg = { fg = p.iris },
		NonText = { fg = p.inactive },
		Normal = { fg = p.text },
		-- NormalFloat = {},
		Pmenu = { fg = p.subtle, bg = p.surface },
		PmenuSbar = { bg = p.overlay },
		PmenuSel = { fg = p.text, bg = p.overlay },
		PmenuThumb = { bg = p.inactive },
		Question = { fg = p.gold },
		-- QuickFixLine = {},
		Search = { fg = p.iris, bg = p.highlight_overlay },
		SpecialKey = { fg = p.foam },
		-- SpellBad = {},
		-- SpellCap = {},
		-- SpellLocal = {},
		-- SpellRare = {},
		SignColumn = {},
		-- StatusLine = {},
		-- StatusLineNC = {},
		-- StatusLineTerm = {},
		-- StatusLineTermNC = {},
		-- TabLine = {},
		-- TabLineFill = {},
		-- TabLineSel = {},
		Title = { fg = p.rose },
		VertSplit = { fg = p.overlay },
		Visual = { bg = p.highlight },
		-- VisualNOS = {},
		WarningMsg = { fg = p.gold },
		-- Whitespace = {},
		-- WildMenu = {},
	}

	if vim.g.rose_pine_disable_background == true then
		editor.Normal = { fg = p.text, bg = p.none }
		editor.SignColumn = { fg = p.text, bg = p.none }
	else
		editor.Normal = { fg = p.text, bg = p.base }
		editor.SignColumn = { fg = p.text, bg = p.base }
	end

	return editor
end

theme.loadTerminal = function()
	-- black
	vim.g.terminal_color_0 = p.overlay
	vim.g.terminal_color_8 = p.subtle
	-- red
	vim.g.terminal_color_4 = p.love
	vim.g.terminal_color_12 = p.love
	-- green
	vim.g.terminal_color_2 = p.pine
	vim.g.terminal_color_10 = p.pine
	-- yellow
	vim.g.terminal_color_6 = p.gold
	vim.g.terminal_color_14 = p.gold
	-- blue
	vim.g.terminal_color_1 = p.foam
	vim.g.terminal_color_9 = p.foam
	-- magenta
	vim.g.terminal_color_5 = p.iris
	vim.g.terminal_color_13 = p.iris
	-- cyan
	vim.g.terminal_color_3 = p.rose
	vim.g.terminal_color_11 = p.rose
	-- white
	vim.g.terminal_color_7 = p.text
	vim.g.terminal_color_15 = p.text
end

theme.loadTreesitter = function()
	local treesitter = {
		-- TSAnnotation = {},
		-- TSAttribute = {},
		-- TSBoolean = {},
		-- TSCharacter = {},
		TSComment = { fg = p.subtle },
		-- TSConditional = {},
		TSConstBuiltin = { fg = p.love },
		-- TSConstMacro = {},
		-- TSConstant = {},
		TSConstructor = { fg = p.text },
		-- TSEmphasis = {},
		-- TSError = {},
		-- TSException = {},
		-- TSField = {},
		-- TSFloat = {},
		TSFuncBuiltin = { fg = p.love },
		-- TSFuncMacro = {},
		-- TSFunction = {},
		-- TSInclude = {},
		-- TSKeyword = {},
		-- TSKeywordFunction = {},
		-- TSLabel = {},
		-- TSLiteral = {},
		-- TSMethod = {},
		-- TSNamespace = {},
		-- TSNone = {},
		-- TSNumber = {},
		-- TSOperator = {},
		-- TSParameter = {},
		-- TSParameterReference = {},
		-- TSProperty = {},
		TSPunctBracket = { fg = p.subtle },
		TSPunctDelimiter = { fg = p.subtle },
		TSPunctSpecial = { fg = p.subtle },
		-- TSRepeat = {},
		-- TSStrike = {},
		-- TSString = {},
		TSStringEscape = { fg = p.pine },
		-- TSStringRegex = {},
		-- TSSymbol = {},
		TSTag = { fg = p.foam },
		TSTagDelimiter = { fg = p.subtle },
		-- TSText = {},
		-- TSTitle = {},
		-- TSType = {},
		-- TSTypeBuiltin = {},
		-- TSURI = {},
		-- TSUnderline = {},
		-- TSVariable = {},
		TSVariableBuiltin = { fg = p.love },
	}

	return treesitter
end

theme.loadLsp = function()
	local lsp = {
		LspDiagnosticsDefaultError = { fg = p.love },
		LspDiagnosticsDefaultHint = { fg = p.iris },
		LspDiagnosticsDefaultInformation = { fg = p.foam },
		LspDiagnosticsDefaultWarning = { fg = p.gold },
		LspDiagnosticsFloatingError = { fg = p.love },
		LspDiagnosticsFloatingHint = { fg = p.iris },
		LspDiagnosticsFloatingInformation = { fg = p.foam },
		LspDiagnosticsFloatingWarning = { fg = p.gold },
		LspDiagnosticsSignError = { fg = p.love },
		LspDiagnosticsSignHint = { fg = p.iris },
		LspDiagnosticsSignInformation = { fg = p.foam },
		LspDiagnosticsSignWarning = { fg = p.gold },
		LspDiagnosticsUnderlineError = { style = 'undercurl', sp = p.love },
		LspDiagnosticsUnderlineHint = { style = 'undercurl', sp = p.iris },
		LspDiagnosticsUnderlineInformation = { style = 'undercurl', sp = p.foam },
		LspDiagnosticsUnderlineWarning = { style = 'undercurl', sp = p.gold },
		LspDiagnosticsVirtualTextError = { fg = p.love },
		LspDiagnosticsVirtualTextHint = { fg = p.iris },
		LspDiagnosticsVirtualTextInformation = { fg = p.foam },
		LspDiagnosticsVirtualTextWarning = { fg = p.gold },
		LspReferenceRead = { fg = p.rose, bg = p.highlight },
		LspReferenceText = { fg = p.rose, bg = p.highlight },
		LspReferenceWrite = { fg = p.rose, bg = p.highlight },
	}

	return lsp
end

theme.loadPlugins = function()
	local plugins = {
		-- barbar.nvim
		-- https://github.com/romgrk/barbar.nvim
		BufferTabpageFill = { bg = p.none },
		BufferCurrent = { fg = p.text, bg = p.overlay },
		BufferCurrentMod = { fg = p.foam, bg = p.overlay },
		BufferCurrentSign = { fg = p.subtle, bg = p.overlay },
		BufferInactive = { fg = p.subtle },
		BufferInactiveMod = { fg = p.foam },
		BufferInactiveSign = { fg = p.subtle },
		BufferVisible = { fg = p.subtle },
		BufferVisibleMod = { fg = p.foam },
		BufferVisibleSign = { fg = p.subtle },
	}

	return plugins
end

return theme
