local p = require('rose-pine.palette')

local theme = {}

theme.loadSyntax = function()
	local syntax = {
		Boolean = { fg = p.gold },
		Character = { fg = p.gold },
		Comment = {
			fg = p.subtle,
			style = vim.g.rose_pine_enable_italics and 'italic',
		},
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
		Label = { fg = p.foam },
		Macro = { fg = p.iris },
		Number = { fg = p.gold },
		Operator = { fg = p.subtle },
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
		DarkenedPanel = { bg = p.surface },
		DarkenedStatusline = { bg = p.surface },
		DiffAdd = { fg = p.foam },
		DiffChange = { fg = p.rose },
		DiffDelete = { fg = p.love },
		DiffText = { fg = p.text },
		Directory = { fg = p.foam, bg = p.none },
		-- EndOfBuffer = {},
		ErrorMsg = { fg = p.love, style = 'bold' },
		-- FoldColumn = {},
		Folded = { fg = p.text, bg = p.surface },
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
		SpellBad = { style = 'undercurl', sp = p.love },
		SpellCap = { style = 'undercurl', sp = p.subtle },
		SpellLocal = { style = 'undercurl', sp = p.subtle },
		SpellRare = { style = 'undercurl', sp = p.subtle },
		SignColumn = {},
		StatusLine = { fg = p.text, bg = p.surface },
		StatusLineNC = { fg = p.subtle, bg = p.surface },
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
	vim.g.terminal_color_1 = p.love
	vim.g.terminal_color_9 = p.love
	-- green
	vim.g.terminal_color_2 = p.pine
	vim.g.terminal_color_10 = p.pine
	-- yellow
	vim.g.terminal_color_3 = p.gold
	vim.g.terminal_color_11 = p.gold
	-- blue
	vim.g.terminal_color_4 = p.foam
	vim.g.terminal_color_12 = p.foam
	-- magenta
	vim.g.terminal_color_5 = p.iris
	vim.g.terminal_color_13 = p.iris
	-- cyan
	vim.g.terminal_color_6 = p.rose
	vim.g.terminal_color_14 = p.rose
	-- white
	vim.g.terminal_color_7 = p.text
	vim.g.terminal_color_15 = p.text
end

theme.loadTreesitter = function()
	local treesitter = {
		-- TSAnnotation = {},
		-- TSAttribute = {},
		TSBoolean = { fg = p.rose },
		-- TSCharacter = {},
		TSComment = {
			fg = p.subtle,
			style = vim.g.rose_pine_enable_italics and 'italic',
		},
		-- TSConditional = {},
		TSConstBuiltin = { fg = p.love },
		-- TSConstMacro = {},
		TSConstant = { fg = p.foam },
		TSConstructor = { fg = p.foam },
		-- TSEmphasis = {},
		-- TSError = {},
		-- TSException = {},
		-- TSField = {},
		-- TSFloat = {},
		TSFuncBuiltin = { fg = p.love },
		-- TSFuncMacro = {},
		TSFunction = { fg = p.rose },
		TSInclude = { fg = p.pine },
		TSKeyword = { fg = p.pine },
		-- TSKeywordFunction = {},
		TSKeywordOperator = { fg = p.pine },
		TSLabel = { fg = p.foam },
		-- TSLiteral = {},
		-- TSMethod = {},
		-- TSNamespace = {},
		-- TSNone = {},
		-- TSNumber = {},
		TSOperator = { fg = p.pine },
		TSParameter = {
			fg = p.iris,
			style = vim.g.rose_pine_enable_italics and 'italic',
		},
		-- TSParameterReference = {},
		TSProperty = {
			fg = p.iris,
			style = vim.g.rose_pine_enable_italics and 'italic',
		},
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
		TSURI = { fg = p.gold, style = 'underline' },
		-- TSUnderline = {},
		TSVariable = {
			fg = p.text,
			style = vim.g.rose_pine_enable_italics and 'italic',
		},
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
		BufferCurrentIndex = { fg = p.text, bg = p.overlay },
		BufferCurrentMod = { fg = p.foam, bg = p.overlay },
		BufferCurrentSign = { fg = p.subtle, bg = p.overlay },
		BufferInactive = { fg = p.subtle },
		BufferInactiveIndex = { fg = p.subtle },
		BufferInactiveMod = { fg = p.foam },
		BufferInactiveSign = { fg = p.subtle },
		BufferVisible = { fg = p.subtle },
		BufferVisibleIndex = { fg = p.subtle },
		BufferVisibleMod = { fg = p.foam },
		BufferVisibleSign = { fg = p.subtle },

		-- gitsigns.nvim
		-- https://github.com/lewis6991/gitsigns.nvim
		SignAdd = { fg = p.foam },
		SignChange = { fg = p.rose },
		SignDelete = { fg = p.love },
		GitSignsAdd = { fg = p.foam },
		GitSignsChange = { fg = p.rose },
		GitSignsDelete = { fg = p.love },

		-- nvim-tree.lua
		-- https://github.com/kyazdani42/nvim-tree.lua
		NvimTreeNormal = { fg = p.text },

		NvimTreeEmptyFolderName = { fg = p.inactive },
		NvimTreeFolderIcon = { fg = p.subtle },
		NvimTreeFolderName = { fg = p.foam },
		NvimTreeOpenedFile = { fg = p.text, bg = p.highlight },
		NvimTreeOpenedFolderName = { fg = p.foam },
		NvimTreeRootFolder = { fg = p.iris },

		NvimTreeGitDeleted = { fg = p.love },
		NvimTreeGitDirty = { fg = p.rose },
		NvimTreeGitMerge = { fg = p.iris },
		NvimTreeGitNew = { fg = p.foam },
		NvimTreeGitRenamed = { fg = p.pine },
		NvimTreeGitStaged = { fg = p.iris },

		NvimTreeFileDeleted = { fg = p.love },
		NvimTreeFileDirty = { fg = p.rose },
		NvimTreeFileMerge = { fg = p.iris },
		NvimTreeFileNew = { fg = p.foam },
		NvimTreeFileRenamed = { fg = p.pine },
		NvimTreeFileStaged = { fg = p.iris },

		-- which-key.nvim
		-- https://github.com/folke/which-key.nvim
		WhichKey = { fg = p.iris },
		WhichKeyGroup = { fg = p.foam },
		WhichKeySeparator = { fg = p.subtle },
		WhichKeyDesc = { fg = p.gold },
		WhichKeyFloat = { bg = p.surface },
		WhichKeyValue = { fg = p.rose },
	}

	return plugins
end

return theme
