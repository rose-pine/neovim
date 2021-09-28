local p = require('rose-pine.palette')

local theme = {}
local maybe_base = p.base
local maybe_italic = 'italic'

if vim.g.rose_pine_disable_background then
	maybe_base = p.none
end

if vim.g.rose_pine_disable_italics then
	maybe_italic = nil
end

theme.base = {
	ColorColumn = { bg = p.highlight_overlay },
	Conceal = { bg = p.none },
	-- Cursor = {},
	CursorColumn = { bg = p.highlight },
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
	FloatBorder = { fg = p.subtle, bg = p.surface },
	FoldColumn = {},
	Folded = { fg = p.text, bg = p.surface },
	IncSearch = { bg = p.highlight },
	LineNr = { fg = p.inactive },
	MatchParen = { fg = p.text, bg = p.overlay },
	-- ModeMsg = {},
	MoreMsg = { fg = p.iris },
	NonText = { fg = p.inactive },
	Normal = { fg = p.text, bg = maybe_base },
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
	SignColumn = { fg = p.text, bg = maybe_base },
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

	Boolean = { fg = p.gold },
	Character = { fg = p.gold },
	Comment = {
		fg = p.subtle,
		style = maybe_italic,
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
	Todo = { fg = p.iris },
	Type = { fg = p.foam },
	Typedef = { fg = p.foam },
	Underlined = { fg = p.foam, style = 'underline' },

	htmlArg = { fg = p.iris },
	htmlEndTag = { fg = p.subtle },
	htmlLink = { fg = p.text },
	htmlTag = { fg = p.subtle },
	htmlTagN = { fg = p.love },
	htmlTagName = { fg = p.foam },

	DiagnosticDefaultHint = { fg = p.iris },
	DiagnosticDefaultInfo = { fg = p.foam },
	DiagnosticDefaultWarn = { fg = p.gold },
	DiagnosticDefaultError = { fg = p.love },

	DiagnosticFloatingHint = { fg = p.iris },
	DiagnosticFloatingInfo = { fg = p.foam },
	DiagnosticFloatingWarn = { fg = p.gold },
	DiagnosticFloatingError = { fg = p.love },

	DiagnosticSignHint = { fg = p.iris },
	DiagnosticSignInfo = { fg = p.foam },
	DiagnosticSignWarn = { fg = p.gold },
	DiagnosticSignError = { fg = p.love },

	DiagnosticUnderlineHint = { style = 'undercurl', sp = p.iris },
	DiagnosticUnderlineInfo = { style = 'undercurl', sp = p.foam },
	DiagnosticUnderlineWarn = { style = 'undercurl', sp = p.gold },
	DiagnosticUnderlineError = { style = 'undercurl', sp = p.love },

	DiagnosticVirtualTextHint = { fg = p.iris },
	DiagnosticVirtualTextInfo = { fg = p.foam },
	DiagnosticVirtualTextWarn = { fg = p.gold },
	DiagnosticVirtualTextError = { fg = p.love },

	LspReferenceText = { fg = p.rose, bg = p.highlight },
	LspReferenceRead = { fg = p.rose, bg = p.highlight },
	LspReferenceWrite = { fg = p.rose, bg = p.highlight },

	--Lsp color groups for nvim 0.5.x
	LspDiagnosticsSignWarning =            { link = "DiagnosticSignWarn" },
	LspDiagnosticsDefaultWarning =         { link = "DiagnosticDefaultWarn" },
	LspDiagnosticsFloatingWarning =        { link = "DiagnosticFloatingWarn" },
	LspDiagnosticsVirtualTextWarning =     { link = "DiagnosticVirtualTextWarn" },
	LspDiagnosticsUnderlineWarning =       { link = "DiagnosticUnderlineWarn" },

	LspDiagnosticsSignHint =               { link = "DiagnosticSignHint" },
	LspDiagnosticsDefaultHint =            { link = "DiagnosticDefaultHint" },
	LspDiagnosticsVirtualTextHint =        { link = "DiagnosticFloatingHint" },
	LspDiagnosticsFloatingHint =           { link = "DiagnosticVirtualTextHint" },
	LspDiagnosticsUnderlineHint =          { link = "DiagnosticUnderlineHint" },

	LspDiagnosticsSignError =              { link = "DiagnosticSignError" },
	LspDiagnosticsDefaultError =           { link = "DiagnosticDefaultError" },
	LspDiagnosticsFloatingError =          { link = "DiagnosticFloatingError" },
	LspDiagnosticsVirtualTextError =       { link = "DiagnosticVirtualTextError" },
	LspDiagnosticsUnderlineError =         { link = "DiagnosticUnderlineError" },

	LspDiagnosticsSignInformation =        { link = "DiagnosticSignInfo" },
	LspDiagnosticsDefaultInformation =     { link = "DiagnosticDefaultInfo" },
	LspDiagnosticsFloatingInformation =    { link = "DiagnosticFloatingInfo" },
	LspDiagnosticsVirtualTextInformation = { link = "DiagnosticVirtualTextInfo" },
	LspDiagnosticsUnderlineInformation =   { link = "DiagnosticUnderlineInfo" },
}

function theme.load_terminal()
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

theme.treesitter = {
	-- TSAnnotation = {},
	-- TSAttribute = {},
	TSBoolean = { fg = p.rose },
	-- TSCharacter = {},
	TSComment = {
		fg = p.subtle,
		style = maybe_italic,
	},
	-- TSConditional = {},
	TSConstBuiltin = { fg = p.love },
	-- TSConstMacro = {},
	TSConstant = { fg = p.foam },
	TSConstructor = { fg = p.foam },
	-- TSEmphasis = {},
	-- TSError = {},
	-- TSException = {},
	TSField = { fg = p.foam },
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
		style = maybe_italic,
	},
	-- TSParameterReference = {},
	TSProperty = {
		fg = p.iris,
		style = maybe_italic,
	},
	TSPunctBracket = { fg = p.subtle },
	TSPunctDelimiter = { fg = p.subtle },
	TSPunctSpecial = { fg = p.subtle },
	-- TSRepeat = {},
	-- TSStrike = {},
	TSString = { fg = p.gold },
	TSStringEscape = { fg = p.pine },
	-- TSStringRegex = {},
	-- TSSymbol = {},
	TSTag = { fg = p.foam },
	TSTagDelimiter = { fg = p.subtle },
	TSText = { fg = p.text },
	-- TSTitle = {},
	-- TSType = {},
	-- TSTypeBuiltin = {},
	TSURI = { fg = p.gold },
	-- TSUnderline = {},
	TSVariable = {
		fg = p.text,
		style = maybe_italic,
	},
	TSVariableBuiltin = { fg = p.love },
}

theme.plugins = {
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

	-- modes.nvim
	-- https://github.com/mvllow/modes.nvim
	ModesCopy = { bg = p.gold },
	ModesDelete = { bg = p.love },
	ModesInsert = { bg = p.foam },
	ModesVisual = { bg = p.iris },

	-- nvim-tree.lua
	-- https://github.com/kyazdani42/nvim-tree.lua
	NvimTreeNormal = { fg = p.text },

	NvimTreeFileDeleted = { fg = p.love },
	NvimTreeFileDirty = { fg = p.rose },
	NvimTreeFileMerge = { fg = p.iris },
	NvimTreeFileNew = { fg = p.foam },
	NvimTreeFileRenamed = { fg = p.pine },
	NvimTreeFileStaged = { fg = p.iris },

	NvimTreeEmptyFolderName = { fg = p.inactive },
	NvimTreeFolderIcon = { fg = p.subtle },
	NvimTreeFolderName = { fg = p.foam },
	NvimTreeOpenedFile = { fg = p.text, bg = p.highlight },
	NvimTreeOpenedFolderName = { fg = p.foam },
	NvimTreeRootFolder = { fg = p.iris },
	NvimTreeSpecialFile = { link = 'NvimTreeNormal' },

	NvimTreeGitDeleted = { fg = p.love },
	NvimTreeGitDirty = { fg = p.rose },
	NvimTreeGitIgnored = { fg = p.subtle },
	NvimTreeGitMerge = { fg = p.iris },
	NvimTreeGitNew = { fg = p.foam },
	NvimTreeGitRenamed = { fg = p.pine },
	NvimTreeGitStaged = { fg = p.iris },

	NvimTreeWindowPicker = { fg = p.base, bg = p.iris },

	-- which-key.nvim
	-- https://github.com/folke/which-key.nvim
	WhichKey = { fg = p.iris },
	WhichKeyGroup = { fg = p.foam },
	WhichKeySeparator = { fg = p.subtle },
	WhichKeyDesc = { fg = p.gold },
	WhichKeyFloat = { bg = p.surface },
	WhichKeyValue = { fg = p.rose },

	-- indent-blankline.nvim
	-- https://github.com/lukas-reineke/indent-blankline.nvim
	IndentBlanklineChar = { fg = p.subtle },

	-- nvim-cmp
	-- https://github.com/hrsh7th/nvim-cmp
	CmpItemKind = { fg = p.iris },
	CmpItemAbbr = { fg = p.subtle },
	CmpItemAbbrMatch = { fg = p.text, style = 'bold' },
	CmpItemAbbrMatchFuzzy = { fg = p.text, style = 'bold' },
	CmpItemAbbrDeprecated = { fg = p.subtle, style = 'strikethrough' },
}

return theme
