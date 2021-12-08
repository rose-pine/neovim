local config = require('rose-pine.config')
local p = require('rose-pine.palette')

-- TODO: Refactor `maybe` logic
local maybe_inactive_background = p.none
local maybe_background = p.base
local maybe_float_background = p.surface
local maybe_italic = 'italic'
local maybe_bold_vert_split = { fg = p.overlay }

if config.bold_vert_split then
	maybe_bold_vert_split = { fg = p.surface, bg = p.surface }
end

if config.inactive_background then
	maybe_inactive_background = p.surface
end

if config.no_background then
	maybe_background = p.none
end

if config.no_float_background then
	maybe_float_background = p.none
end

if config.no_italics then
	maybe_italic = nil
end

local theme = {
	ColorColumn = { bg = p.highlight_high },
	Conceal = { bg = p.none },
	-- Cursor = {},
	CursorColumn = { bg = p.highlight_med },
	-- CursorIM = {},
	CursorLine = { bg = p.highlight_low },
	CursorLineNr = { fg = p.text },
	DarkenedPanel = { bg = p.surface },
	DarkenedStatusline = { bg = p.surface },
	DiffAdd = { fg = p.foam },
	DiffChange = { fg = p.rose },
	DiffDelete = { fg = p.love },
	DiffText = { fg = p.text },
	diffAdded = { link = 'DiffAdd' },
	diffChanged = { link = 'DiffChange' },
	diffRemoved = { link = 'DiffDelete' },
	Directory = { fg = p.foam, bg = p.none },
	-- EndOfBuffer = {},
	ErrorMsg = { fg = p.love, style = 'bold' },
	FloatBorder = { fg = p.subtle },
	FoldColumn = {},
	Folded = { fg = p.text, bg = p.surface },
	IncSearch = { bg = p.highlight_med },
	LineNr = { fg = p.inactive },
	MatchParen = { fg = p.text, bg = p.highlight_med },
	ModeMsg = { fg = p.subtle },
	MoreMsg = { fg = p.iris },
	NonText = { fg = p.inactive },
	Normal = { fg = p.text, bg = maybe_background },
	NormalNC = { fg = p.text, bg = maybe_inactive_background },
	NormalFloat = { fg = p.text, bg = maybe_float_background },
	Pmenu = { fg = p.subtle, bg = maybe_float_background },
	PmenuSbar = { bg = p.overlay },
	PmenuSel = { fg = p.text, bg = p.overlay },
	PmenuThumb = { bg = p.inactive },
	Question = { fg = p.gold },
	-- QuickFixLine = {},
	Search = { fg = p.iris, bg = p.highlight_high },
	SpecialKey = { fg = p.foam },
	SpellBad = { style = 'undercurl', sp = p.love },
	SpellCap = { style = 'undercurl', sp = p.subtle },
	SpellLocal = { style = 'undercurl', sp = p.subtle },
	SpellRare = { style = 'undercurl', sp = p.subtle },
	SignColumn = { fg = p.text, bg = maybe_background },
	StatusLine = { fg = p.text, bg = p.surface },
	StatusLineNC = { fg = p.subtle, bg = p.surface },
	-- StatusLineTerm = {},
	-- StatusLineTermNC = {},
	TabLine = { fg = p.subtle, bg = p.overlay },
	TabLineFill = { bg = p.surface },
	TabLineSel = { fg = p.text, bg = p.inactive },
	Title = { fg = p.text },
	VertSplit = maybe_bold_vert_split,
	Visual = { bg = p.highlight_med },
	-- VisualNOS = {},
	WarningMsg = { fg = p.gold },
	-- Whitespace = {},
	-- WildMenu = {},

	Boolean = { fg = p.gold },
	Character = { fg = p.gold },
	Comment = {
		fg = config.colors.comment,
		style = maybe_italic,
	},
	Conditional = { fg = p.pine },
	Constant = { fg = p.gold },
	Debug = { fg = p.rose },
	Define = { fg = p.iris },
	Delimiter = { fg = p.subtle },
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
	htmlBold = { fg = p.text, style = 'bold' },
	htmlEndTag = { fg = p.subtle },
	htmlH1 = { fg = config.colors.headings.h1, style = 'bold' },
	htmlH2 = { fg = config.colors.headings.h2, style = 'bold' },
	htmlH3 = { fg = config.colors.headings.h3, style = 'bold' },
	htmlH4 = { fg = config.colors.headings.h4, style = 'bold' },
	htmlH5 = { fg = config.colors.headings.h5, style = 'bold' },
	htmlItalic = { fg = p.text, style = maybe_italic },
	htmlLink = { fg = p.text },
	htmlTag = { fg = p.subtle },
	htmlTagN = { fg = p.text },
	htmlTagName = { fg = p.foam },

	markdownH1 = { fg = config.colors.headings.h1, style = 'bold' },
	markdownH1Delimiter = { fg = config.colors.headings.h1 },
	markdownH2 = { fg = config.colors.headings.h2, style = 'bold' },
	markdownH2Delimiter = { fg = config.colors.headings.h2 },
	markdownH3 = { fg = config.colors.headings.h3, style = 'bold' },
	markdownH3Delimiter = { fg = config.colors.headings.h3 },
	markdownH4 = { fg = config.colors.headings.h4, style = 'bold' },
	markdownH4Delimiter = { fg = config.colors.headings.h4 },
	markdownH5 = { fg = config.colors.headings.h5, style = 'bold' },
	markdownH5Delimiter = { fg = config.colors.headings.h5 },
	markdownH6 = { fg = config.colors.headings.h6, style = 'bold' },
	markdownH6Delimiter = { fg = config.colors.headings.h6 },
	markdownDelimiter = { fg = p.subtle },
	markdownLinkText = { fg = p.iris, style = 'underline' },
	markdownUrl = { fg = p.iris, style = 'underline' },
	mkdCode = { fg = p.foam, style = maybe_italic },
	mkdCodeDelimiter = { fg = p.rose },
	mkdCodeEnd = { fg = p.foam },
	mkdCodeStart = { fg = p.foam },
	mkdFootnotes = { fg = p.foam },
	mkdID = { fg = p.foam, style = 'underline' },
	mkdInlineURL = { fg = p.foam, style = 'underline' },
	mkdLink = { fg = p.rose, style = 'bold' },
	mkdLinkDef = { fg = p.rose, style = 'bold' },
	mkdListItemLine = { fg = p.text },
	mkdRule = { fg = p.subtle },
	mkdURL = { fg = p.foam, style = 'underline' },

	-- Fix background mismatch if user sets custom float background
	-- In LSP hover float: (paramater)
	--                     ^         ^
	typescriptParens = { bg = p.none },

	DiagnosticHint = { fg = config.colors.hint },
	DiagnosticInfo = { fg = config.colors.info },
	DiagnosticWarn = { fg = config.colors.warn },
	DiagnosticError = { fg = config.colors.error },
	DiagnosticDefaultHint = { fg = config.colors.hint },
	DiagnosticDefaultInfo = { fg = config.colors.info },
	DiagnosticDefaultWarn = { fg = config.colors.warn },
	DiagnosticDefaultError = { fg = config.colors.error },
	DiagnosticFloatingHint = { fg = config.colors.hint },
	DiagnosticFloatingInfo = { fg = config.colors.info },
	DiagnosticFloatingWarn = { fg = config.colors.warn },
	DiagnosticFloatingError = { fg = config.colors.error },
	DiagnosticSignHint = { fg = config.colors.hint },
	DiagnosticSignInfo = { fg = config.colors.info },
	DiagnosticSignWarn = { fg = config.colors.warn },
	DiagnosticSignError = { fg = config.colors.error },
	DiagnosticUnderlineHint = { style = 'undercurl', sp = config.colors.hint },
	DiagnosticUnderlineInfo = { style = 'undercurl', sp = config.colors.info },
	DiagnosticUnderlineWarn = { style = 'undercurl', sp = config.colors.warn },
	DiagnosticUnderlineError = {
		style = 'undercurl',
		sp = config.colors.error,
	},
	DiagnosticVirtualTextHint = { fg = config.colors.hint },
	DiagnosticVirtualTextInfo = { fg = config.colors.info },
	DiagnosticVirtualTextWarn = { fg = config.colors.warn },
	DiagnosticVirtualTextError = { fg = config.colors.error },

	LspReferenceText = { fg = p.rose, bg = p.highlight_med },
	LspReferenceRead = { fg = p.rose, bg = p.highlight_med },
	LspReferenceWrite = { fg = p.rose, bg = p.highlight_med },

	-- TODO: Deprecate in favour of 0.6.0 groups
	LspDiagnosticsSignWarning = { link = 'DiagnosticSignWarn' },
	LspDiagnosticsDefaultWarning = { link = 'DiagnosticDefaultWarn' },
	LspDiagnosticsFloatingWarning = { link = 'DiagnosticFloatingWarn' },
	LspDiagnosticsVirtualTextWarning = { link = 'DiagnosticVirtualTextWarn' },
	LspDiagnosticsUnderlineWarning = { link = 'DiagnosticUnderlineWarn' },
	LspDiagnosticsSignHint = { link = 'DiagnosticSignHint' },
	LspDiagnosticsDefaultHint = { link = 'DiagnosticDefaultHint' },
	LspDiagnosticsVirtualTextHint = { link = 'DiagnosticFloatingHint' },
	LspDiagnosticsFloatingHint = { link = 'DiagnosticVirtualTextHint' },
	LspDiagnosticsUnderlineHint = { link = 'DiagnosticUnderlineHint' },
	LspDiagnosticsSignError = { link = 'DiagnosticSignError' },
	LspDiagnosticsDefaultError = { link = 'DiagnosticDefaultError' },
	LspDiagnosticsFloatingError = { link = 'DiagnosticFloatingError' },
	LspDiagnosticsVirtualTextError = { link = 'DiagnosticVirtualTextError' },
	LspDiagnosticsUnderlineError = { link = 'DiagnosticUnderlineError' },
	LspDiagnosticsSignInformation = { link = 'DiagnosticSignInfo' },
	LspDiagnosticsDefaultInformation = { link = 'DiagnosticDefaultInfo' },
	LspDiagnosticsFloatingInformation = { link = 'DiagnosticFloatingInfo' },
	LspDiagnosticsVirtualTextInformation = {
		link = 'DiagnosticVirtualTextInfo',
	},
	LspDiagnosticsUnderlineInformation = { link = 'DiagnosticUnderlineInfo' },

	-- RedrawDebugNormal
	RedrawDebugClear = { fg = '#ffffff', bg = p.gold },
	RedrawDebugComposed = { fg = '#ffffff', bg = p.pine },
	RedrawDebugRecompose = { fg = '#ffffff', bg = p.love },

	NvimInternalError = { fg = '#ffffff', bg = p.love },

	-- TSAnnotation = {},
	-- TSAttribute = {},
	TSBoolean = { fg = p.rose },
	-- TSCharacter = {},
	TSComment = {
		fg = config.colors.comment,
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
	TSPunctBracket = { fg = config.colors.punctuation },
	TSPunctDelimiter = { fg = config.colors.punctuation },
	TSPunctSpecial = { fg = config.colors.punctuation },
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

	-- barbar.nvim
	-- https://github.com/romgrk/barbar.nvim
	BufferTabpageFill = { fg = p.base, bg = p.base },
	BufferCurrent = { fg = p.text, bg = p.overlay },
	BufferCurrentIndex = { fg = p.text, bg = p.overlay },
	BufferCurrentMod = { fg = p.foam, bg = p.overlay },
	BufferCurrentSign = { fg = p.subtle, bg = p.overlay },
	BufferInactive = { fg = p.subtle },
	BufferInactiveIndex = { fg = p.subtle },
	BufferInactiveMod = { fg = p.foam },
	BufferInactiveSign = { fg = p.inactive },
	BufferVisible = { fg = p.subtle },
	BufferVisibleIndex = { fg = p.subtle },
	BufferVisibleMod = { fg = p.foam },
	BufferVisibleSign = { fg = p.inactive },

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
	NvimTreeImageFile = { fg = p.text },
	NvimTreeOpenedFile = { fg = p.text, bg = p.highlight_med },
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
	CmpItemKindVariable = { fg = p.foam },
	CmpItemKindClass = { fg = p.gold },
	CmpItemKindInterface = { fg = p.gold },
	CmpItemKindFunction = { fg = p.iris },
	CmpItemKindMethod = { fg = p.iris },
	CmpItemKindSnippet = { fg = p.iris },

	-- neogit
	-- https://github.com/TimUntersberger/neogit
	NeogitDiffAddHighlight = { fg = p.foam, bg = p.highlight_med },
	NeogitDiffDeleteHighlight = {
		fg = p.love,
		bg = p.highlight_med,
	},
	NeogitDiffContextHighlight = { bg = p.highlight_low },
	NeogitHunkHeader = { bg = p.highlight_low },
	NeogitHunkHeaderHighlight = { bg = p.highlight_low },

	-- VimWiki
	-- https://github.com/vimwiki/vimwiki
	VimwikiHR = { fg = p.subtle },
	VimwikiHeader1 = { fg = config.colors.headings.h1, style = 'bold' },
	VimwikiHeader2 = { fg = config.colors.headings.h2, style = 'bold' },
	VimwikiHeader3 = { fg = config.colors.headings.h3, style = 'bold' },
	VimwikiHeader4 = { fg = config.colors.headings.h4, style = 'bold' },
	VimwikiHeader5 = { fg = config.colors.headings.h5, style = 'bold' },
	VimwikiHeader6 = { fg = config.colors.headings.h6, style = 'bold' },
	VimwikiHeaderChar = { fg = p.pine },
	VimwikiLink = { fg = p.rose },
	VimwikiList = { fg = p.iris },
	VimwikiNoExistsLink = { fg = p.love },
}

vim.g.terminal_color_0 = p.overlay -- black
vim.g.terminal_color_8 = p.subtle -- bright black
vim.g.terminal_color_1 = p.love -- red
vim.g.terminal_color_9 = p.love -- bright red
vim.g.terminal_color_2 = p.pine -- green
vim.g.terminal_color_10 = p.pine -- bright green
vim.g.terminal_color_3 = p.gold -- yellow
vim.g.terminal_color_11 = p.gold -- bright yellow
vim.g.terminal_color_4 = p.foam -- blue
vim.g.terminal_color_12 = p.foam -- bright blue
vim.g.terminal_color_5 = p.iris -- magenta
vim.g.terminal_color_13 = p.iris -- bright magenta
vim.g.terminal_color_6 = p.rose -- cyan
vim.g.terminal_color_14 = p.rose -- bright cyan
vim.g.terminal_color_7 = p.text -- white
vim.g.terminal_color_15 = p.text -- bright white

return theme
