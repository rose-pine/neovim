local M = {}

---@param options Config
function M._load(options)
	local h = require('rose-pine.util').highlight
	local p = require('rose-pine.palette')

	local groups = options.groups or {}
	local maybe = {
		base = (options.disable_background and p.none) or groups.background,
		surface = (options.disable_float_background and p.none) or groups.panel,
		italic = not options.disable_italics,
	}
	maybe.bold_vert_split = (options.bold_vert_split and groups.border)
		or p.none
	maybe.dim_nc_background = (
		options.dim_nc_background and groups.background_nc
	) or maybe.base

	h('ColorColumn', { bg = p.overlay })
	h('Conceal', { bg = p.none })
	h('CurSearch', { link = 'IncSearch' })
	h('Cursor', { fg = p.text, bg = p.highlight_high })
	h('CursorColumn', { bg = p.highlight_low })
	-- CursorIM = {},
	h('CursorLine', { bg = p.highlight_low })
	h('CursorLineNr', { fg = p.text })
	h('DarkenedPanel', { bg = maybe.surface })
	h('DarkenedStatusline', { bg = maybe.surface })
	h('DiffAdd', { bg = groups.git_add, blend = 20 })

	h('DiffChange', { bg = p.overlay })
	h('DiffDelete', { bg = groups.git_delete, blend = 20 })
	h('DiffText', { bg = groups.git_text, blend = 20 })
	h('diffAdded', { link = 'DiffAdd' })
	h('diffChanged', { link = 'DiffChange' })
	h('diffRemoved', { link = 'DiffDelete' })
	h('Directory', { fg = p.foam, bg = p.none })
	-- EndOfBuffer = {},
	h('ErrorMsg', { fg = p.love, bold = true })
	h('FloatBorder', { fg = groups.border, bg = maybe.surface })
	h('FloatTitle', { fg = p.muted })
	h('FoldColumn', { fg = p.muted })
	h('Folded', { fg = p.text, bg = maybe.surface })
	h('IncSearch', { fg = groups.background, bg = p.rose })
	h('LineNr', { fg = p.muted })
	h('MatchParen', { fg = p.text, bg = p.highlight_med })
	h('ModeMsg', { fg = p.subtle })
	h('MoreMsg', { fg = p.iris })
	h('NonText', { fg = p.muted })
	h('Normal', { fg = p.text, bg = maybe.base })
	h('NormalFloat', { fg = p.text, bg = maybe.surface })
	h('NormalNC', { fg = p.text, bg = maybe.dim_nc_background })
	h('NvimInternalError', { fg = '#ffffff', bg = p.love })
	h('Pmenu', { fg = p.subtle, bg = maybe.surface })
	h('PmenuSbar', { bg = p.highlight_low })
	h('PmenuSel', { fg = p.text, bg = p.overlay })
	h('PmenuThumb', { bg = p.highlight_med })
	h('Question', { fg = p.gold })
	-- QuickFixLine = {},
	-- RedrawDebugNormal = {}
	h('RedrawDebugClear', { fg = '#ffffff', bg = p.gold })
	h('RedrawDebugComposed', { fg = '#ffffff', bg = p.pine })
	h('RedrawDebugRecompose', { fg = '#ffffff', bg = p.love })
	h('Search', { bg = p.highlight_med })
	h('SpecialKey', { fg = p.foam })
	h('SpellBad', { sp = p.subtle, undercurl = true })
	h('SpellCap', { sp = p.subtle, undercurl = true })
	h('SpellLocal', { sp = p.subtle, undercurl = true })
	h('SpellRare', { sp = p.subtle, undercurl = true })
	h('SignColumn', {
		fg = p.text,
		bg = (options.dim_nc_background and p.none) or maybe.base,
	})
	h('StatusLine', { fg = p.subtle, bg = groups.panel })
	h('StatusLineNC', { fg = p.muted, bg = groups.panel_nc })
	h('StatusLineTerm', { link = 'StatusLine' })
	h('StatusLineTermNC', { link = 'StatusLineNC' })
	h('TabLine', { fg = p.subtle, bg = groups.panel })
	h('TabLineFill', { bg = groups.panel })
	h('TabLineSel', { fg = p.text, bg = p.overlay })
	h('Title', { fg = p.text })
	h('VertSplit', { fg = groups.border, bg = maybe.bold_vert_split })
	h('Visual', { bg = p.highlight_med })
	-- VisualNOS = {},
	h('WarningMsg', { fg = p.gold })
	-- Whitespace = {},
	h('WildMenu', { link = 'IncSearch' })

	h('Boolean', { fg = p.rose })
	h('Character', { fg = p.gold })
	h('Comment', { fg = groups.comment, italic = maybe.italic })
	h('Conditional', { fg = p.pine })
	h('Constant', { fg = p.gold })
	h('Debug', { fg = p.rose })
	h('Define', { fg = p.iris })
	h('Delimiter', { fg = p.subtle })
	h('Error', { fg = p.love })
	h('Exception', { fg = p.pine })
	h('Float', { fg = p.gold })
	h('Function', { fg = p.rose })
	h('Identifier', { fg = p.rose })
	-- Ignore = {},
	h('Include', { fg = p.iris })
	h('Keyword', { fg = p.pine })
	h('Label', { fg = p.foam })
	h('Macro', { fg = p.iris })
	h('Number', { fg = p.gold })
	h('Operator', { fg = p.subtle })
	h('PreCondit', { fg = p.iris })
	h('PreProc', { fg = p.iris })
	h('Repeat', { fg = p.pine })
	h('Special', { fg = p.rose })
	h('SpecialChar', { fg = p.rose })
	h('SpecialComment', { fg = p.iris })
	h('Statement', { fg = p.pine })
	h('StorageClass', { fg = p.foam })
	h('String', { fg = p.gold })
	h('Structure', { fg = p.foam })
	h('Tag', { fg = p.rose })
	h('Todo', { fg = p.iris })
	h('Type', { fg = p.foam })
	h('Typedef', { link = 'Type' })
	h('Underlined', { underline = true })

	h('htmlArg', { fg = p.iris })
	h('htmlBold', { bold = true })
	h('htmlEndTag', { fg = p.subtle })
	h('htmlH1', { fg = groups.headings.h1, bold = true })
	h('htmlH2', { fg = groups.headings.h2, bold = true })
	h('htmlH3', { fg = groups.headings.h3, bold = true })
	h('htmlH4', { fg = groups.headings.h4, bold = true })
	h('htmlH5', { fg = groups.headings.h5, bold = true })
	h('htmlItalic', { italic = maybe.italic })
	h('htmlLink', { fg = groups.link })
	h('htmlTag', { fg = p.subtle })
	h('htmlTagN', { fg = p.text })
	h('htmlTagName', { fg = p.foam })

	h('markdownDelimiter', { fg = p.subtle })
	h('markdownH1', { fg = groups.headings.h1, bold = true })
	h('markdownH1Delimiter', { link = 'markdownH1' })
	h('markdownH2', { fg = groups.headings.h2, bold = true })
	h('markdownH2Delimiter', { link = 'markdownH2' })
	h('markdownH3', { fg = groups.headings.h3, bold = true })
	h('markdownH3Delimiter', { link = 'markdownH3' })
	h('markdownH4', { fg = groups.headings.h4, bold = true })
	h('markdownH4Delimiter', { link = 'markdownH4' })
	h('markdownH5', { fg = groups.headings.h5, bold = true })
	h('markdownH5Delimiter', { link = 'markdownH5' })
	h('markdownH6', { fg = groups.headings.h6, bold = true })
	h('markdownH6Delimiter', { link = 'markdownH6' })
	h(
		'markdownLinkText',
		{ fg = groups.link, sp = groups.link, underline = true }
	)
	h('markdownUrl', { link = 'markdownLinkText' })

	h('mkdCode', { fg = p.foam, italic = maybe.italic })
	h('mkdCodeDelimiter', { fg = p.rose })
	h('mkdCodeEnd', { fg = p.foam })
	h('mkdCodeStart', { fg = p.foam })
	h('mkdFootnotes', { fg = p.foam })
	h('mkdID', { fg = p.foam, underline = true })
	h('mkdInlineURL', { fg = groups.link, underline = true })
	h('mkdLink', { link = 'mkdInlineURL' })
	h('mkdLinkDef', { link = 'mkdInlineURL' })
	h('mkdListItemLine', { fg = p.text })
	h('mkdRule', { fg = p.subtle })
	h('mkdURL', { link = 'mkdInlineURL' })

	h('DiagnosticError', { fg = groups.error })
	h('DiagnosticHint', { fg = groups.hint })
	h('DiagnosticInfo', { fg = groups.info })
	h('DiagnosticWarn', { fg = groups.warn })
	h('DiagnosticDefaultError', { fg = groups.error })
	h('DiagnosticDefaultHint', { fg = groups.hint })
	h('DiagnosticDefaultInfo', { fg = groups.info })
	h('DiagnosticDefaultWarn', { fg = groups.warn })
	h('DiagnosticFloatingError', { fg = groups.error })
	h('DiagnosticFloatingHint', { fg = groups.hint })
	h('DiagnosticFloatingInfo', { fg = groups.info })
	h('DiagnosticFloatingWarn', { fg = groups.warn })
	h('DiagnosticSignError', { fg = groups.error })
	h('DiagnosticSignHint', { fg = groups.hint })
	h('DiagnosticSignInfo', { fg = groups.info })
	h('DiagnosticSignWarn', { fg = groups.warn })
	h('DiagnosticStatusLineError', { fg = groups.error, bg = groups.panel })
	h('DiagnosticStatusLineHint', { fg = groups.hint, bg = groups.panel })
	h('DiagnosticStatusLineInfo', { fg = groups.info, bg = groups.panel })
	h('DiagnosticStatusLineWarn', { fg = groups.warn, bg = groups.panel })
	h('DiagnosticUnderlineError', { sp = groups.error, undercurl = true })
	h('DiagnosticUnderlineHint', { sp = groups.hint, undercurl = true })
	h('DiagnosticUnderlineInfo', { sp = groups.info, undercurl = true })
	h('DiagnosticUnderlineWarn', { sp = groups.warn, undercurl = true })
	h('DiagnosticVirtualTextError', { fg = groups.error })
	h('DiagnosticVirtualTextHint', { fg = groups.hint })
	h('DiagnosticVirtualTextInfo', { fg = groups.info })
	h('DiagnosticVirtualTextWarn', { fg = groups.warn })

	-- healthcheck
	h('healthError', { fg = groups.error })
	h('healthSuccess', { fg = groups.info })
	h('healthWarning', { fg = groups.warn })

	-- Treesitter
	h('@boolean', { link = 'Boolean' })
	h('@character', { link = 'Character' })
	h('@character.special', { link = '@character' })
	h('@class', { fg = p.foam })
	h('@comment', { link = 'Comment' })
	h('@conditional', { link = 'Conditional' })
	h('@constant', { link = 'Constant' })
	h('@constant.builtin', { fg = p.love })
	h('@constant.macro', { link = '@constant' })
	h('@constructor', { fg = p.foam })
	h('@field', { fg = p.foam })
	h('@function', { link = 'Function' })
	h('@function.builtin', { fg = p.love })
	h('@function.macro', { link = '@function' })
	h('@include', { link = 'Include' })
	h('@interface', { fg = p.foam })
	h('@keyword', { link = 'Keyword' })
	h('@keyword.operator', { fg = p.subtle })
	h('@label', { link = 'Label' })
	h('@macro', { link = 'Macro' })
	h('@method', { fg = p.iris })
	h('@number', { link = 'Number' })
	h('@operator', { link = 'Operator' })
	h('@parameter', { fg = p.iris, italic = maybe.italic })
	h('@preproc', { link = 'PreProc' })
	h('@property', { fg = p.foam, italic = maybe.italic })
	h('@punctuation', { fg = groups.punctuation })
	h('@punctuation.bracket', { link = '@punctuation' })
	h('@punctuation.delimiter', { link = '@punctuation' })
	h('@punctuation.special', { link = '@punctuation' })
	h('@regexp', { link = 'String' })
	h('@repeat', { link = 'Repeat' })
	h('@storageclass', { link = 'StorageClass' })
	h('@string', { link = 'String' })
	h('@string.escape', { fg = p.pine })
	h('@string.special', { link = '@string' })
	h('@symbol', { link = 'Identifier' })
	h('@tag', { link = 'Tag' })
	h('@tag.attribute', { fg = p.iris })
	h('@tag.delimiter', { fg = p.subtle })
	h('@text', { fg = p.text })
	h('@text.strong', { bold = true })
	h('@text.emphasis', { italic = true })
	h('@text.underline', { underline = true })
	h('@text.strike', { strikethrough = true })
	h('@text.math', { link = 'Special' })
	h('@text.environment', { link = 'Macro' })
	h('@text.environment.name', { link = 'Type' })
	h('@text.title', { link = 'Title' })
	h('@text.uri', { fg = groups.link })
	h('@text.note', { link = 'SpecialComment' })
	h('@text.warning', { fg = groups.warn })
	h('@text.danger', { fg = groups.error })
	h('@todo', { link = 'Todo' })
	h('@type', { link = 'Type' })
	h('@variable', { fg = p.text, italic = maybe.italic })
	h('@variable.builtin', { fg = p.love })
	h('@namespace', { link = '@include' })

	-- LSP Semantic Token Groups
	h('@lsp.type.enum', { link = '@type' })
	h('@lsp.type.keyword', { link = '@keyword' })
	h('@lsp.type.interface', { link = '@interface' })
	h('@lsp.type.namespace', { link = '@namespace' })
	h('@lsp.type.parameter', { link = '@parameter' })
	h('@lsp.type.property', { link = '@property' })
	h('@lsp.type.variable', {}) -- use treesitter styles for regular variables
	h('@lsp.typemod.function.defaultLibrary', { link = 'Special' })
	h('@lsp.typemod.variable.defaultLibrary', { link = '@variable.builtin' })

	-- vim.lsp.buf.document_highlight()
	h('LspReferenceText', { bg = p.highlight_med })
	h('LspReferenceRead', { bg = p.highlight_med })
	h('LspReferenceWrite', { bg = p.highlight_med })

	-- lsp-highlight-codelens
	h('LspCodeLens', { fg = p.subtle }) -- virtual text of code len
	h('LspCodeLensSeparator', { fg = p.highlight_high }) -- separator between two or more code len

	-- romgrk/barbar.nvim
	h('BufferCurrent', { fg = p.text, bg = p.overlay })
	h('BufferCurrentIndex', { fg = p.text, bg = p.overlay })
	h('BufferCurrentMod', { fg = p.foam, bg = p.overlay })
	h('BufferCurrentSign', { fg = p.subtle, bg = p.overlay })
	h('BufferCurrentTarget', { fg = p.gold, bg = p.overlay })
	h('BufferInactive', { fg = p.subtle })
	h('BufferInactiveIndex', { fg = p.subtle })
	h('BufferInactiveMod', { fg = p.foam })
	h('BufferInactiveSign', { fg = p.muted })
	h('BufferInactiveTarget', { fg = p.gold })
	h('BufferTabpageFill', { fg = groups.background, bg = groups.background })
	h('BufferVisible', { fg = p.subtle })
	h('BufferVisibleIndex', { fg = p.subtle })
	h('BufferVisibleMod', { fg = p.foam })
	h('BufferVisibleSign', { fg = p.muted })
	h('BufferVisibleTarget', { fg = p.gold })

	-- lewis6991/gitsigns.nvim
	h('GitSignsAdd', { fg = groups.git_add })
	h('GitSignsChange', { fg = groups.git_change })
	h('GitSignsDelete', { fg = groups.git_delete })
	h('SignAdd', { link = 'GitSignsAdd' })
	h('SignChange', { link = 'GitSignsChange' })
	h('SignDelete', { link = 'GitSignsDelete' })

	-- mvllow/modes.nvim
	h('ModesCopy', { bg = p.gold })
	h('ModesDelete', { bg = p.love })
	h('ModesInsert', { bg = p.foam })
	h('ModesVisual', { bg = p.iris })

	-- kyazdani42/nvim-tree.lua
	h('NvimTreeEmptyFolderName', { fg = p.muted })
	h('NvimTreeFileDeleted', { fg = p.love })
	h('NvimTreeFileDirty', { fg = p.rose })
	h('NvimTreeFileMerge', { fg = p.iris })
	h('NvimTreeFileNew', { fg = p.foam })
	h('NvimTreeFileRenamed', { fg = p.pine })
	h('NvimTreeFileStaged', { fg = p.iris })
	h('NvimTreeFolderIcon', { fg = p.subtle })
	h('NvimTreeFolderName', { fg = p.foam })
	h('NvimTreeGitDeleted', { fg = groups.git_delete })
	h('NvimTreeGitDirty', { fg = groups.git_dirty })
	h('NvimTreeGitIgnored', { fg = groups.git_ignore })
	h('NvimTreeGitMerge', { fg = groups.git_merge })
	h('NvimTreeGitNew', { fg = groups.git_add })
	h('NvimTreeGitRenamed', { fg = groups.git_rename })
	h('NvimTreeGitStaged', { fg = groups.git_stage })
	h('NvimTreeImageFile', { fg = p.text })
	h('NvimTreeNormal', { fg = p.text })
	h('NvimTreeOpenedFile', { fg = p.text, bg = p.highlight_med })
	h('NvimTreeOpenedFolderName', { link = 'NvimTreeFolderName' })
	h('NvimTreeRootFolder', { fg = p.iris })
	h('NvimTreeSpecialFile', { link = 'NvimTreeNormal' })
	h('NvimTreeWindowPicker', { fg = p.love, bg = p.love, blend = 10 })

  -- nvim-neo-tree/neo-tree.nvim
  h('NeoTreeTitleBar', { fg = p.surface, bg = p.pine })

	-- folke/which-key.nvim
	h('WhichKey', { fg = p.iris })
	h('WhichKeyGroup', { fg = p.foam })
	h('WhichKeySeparator', { fg = p.subtle })
	h('WhichKeyDesc', { fg = p.gold })
	h('WhichKeyFloat', { bg = maybe.surface })
	h('WhichKeyValue', { fg = p.rose })

	-- luka-reineke/indent-blankline.nvim
	h('IndentBlanklineChar', { fg = p.muted })
	h('IndentBlanklineSpaceChar', { fg = p.muted })
	h('IndentBlanklineSpaceCharBlankline', { fg = p.muted })

	-- hrsh7th/nvim-cmp
	h('CmpItemAbbr', { fg = p.subtle })
	h('CmpItemAbbrDeprecated', { fg = p.subtle, strikethrough = true })
	h('CmpItemAbbrMatch', { fg = p.text, bold = true })
	h('CmpItemAbbrMatchFuzzy', { fg = p.text, bold = true })
	h('CmpItemKind', { fg = p.subtle })
	h('CmpItemKindClass', { fg = p.pine })
	h('CmpItemKindFunction', { fg = p.rose })
	h('CmpItemKindInterface', { fg = p.foam })
	h('CmpItemKindMethod', { fg = p.iris })
	h('CmpItemKindSnippet', { fg = p.gold })
	h('CmpItemKindVariable', { fg = p.text })

	-- TimUntersberger/neogit
	h('NeogitDiffAddHighlight', { fg = p.foam, bg = p.highlight_med })
	h('NeogitDiffContextHighlight', { bg = p.highlight_low })
	h('NeogitDiffDeleteHighlight', { fg = p.love, bg = p.highlight_med })
	h('NeogitHunkHeader', { bg = p.highlight_low })
	h('NeogitHunkHeaderHighlight', { bg = p.highlight_low })

	-- vimwiki/vimwiki
	h('VimwikiHR', { fg = p.subtle })
	h('VimwikiHeader1', { fg = groups.headings.h1, bold = true })
	h('VimwikiHeader2', { fg = groups.headings.h2, bold = true })
	h('VimwikiHeader3', { fg = groups.headings.h3, bold = true })
	h('VimwikiHeader4', { fg = groups.headings.h4, bold = true })
	h('VimwikiHeader5', { fg = groups.headings.h5, bold = true })
	h('VimwikiHeader6', { fg = groups.headings.h6, bold = true })
	h('VimwikiHeaderChar', { fg = p.pine })
	h('VimwikiLink', { fg = groups.link, underline = true })
	h('VimwikiList', { fg = p.iris })
	h('VimwikiNoExistsLink', { fg = p.love })

	-- nvim-neorg/neorg
	h('NeorgHeading1Prefix', { fg = groups.headings.h1, bold = true })
	h('NeorgHeading1Title', { link = 'NeorgHeading1Prefix' })
	h('NeorgHeading2Prefix', { fg = groups.headings.h2, bold = true })
	h('NeorgHeading2Title', { link = 'NeorgHeading2Prefix' })
	h('NeorgHeading3Prefix', { fg = groups.headings.h3, bold = true })
	h('NeorgHeading3Title', { link = 'NeorgHeading3Prefix' })
	h('NeorgHeading4Prefix', { fg = groups.headings.h4, bold = true })
	h('NeorgHeading4Title', { link = 'NeorgHeading4Prefix' })
	h('NeorgHeading5Prefix', { fg = groups.headings.h5, bold = true })
	h('NeorgHeading5Title', { link = 'NeorgHeading5Prefix' })
	h('NeorgHeading6Prefix', { fg = groups.headings.h6, bold = true })
	h('NeorgHeading6Title', { link = 'NeorgHeading6Prefix' })
	h('NeorgMarkerTitle', { fg = p.text, bold = true })

	-- tami5/lspsaga.nvim (fork of glepnir/lspsaga.nvim)
	h('DefinitionCount', { fg = p.rose })
	h('DefinitionIcon', { fg = p.rose })
	h('DefintionPreviewTitle', { fg = p.rose, bold = true })
	h('LspFloatWinBorder', { fg = groups.border })
	h('LspFloatWinNormal', { bg = maybe.surface })
	h('LspSagaAutoPreview', { fg = p.subtle })
	h('LspSagaCodeActionBorder', { fg = groups.border })
	h('LspSagaCodeActionContent', { fg = p.foam })
	h('LspSagaCodeActionTitle', { fg = p.gold, bold = true })
	h('LspSagaCodeActionTruncateLine', { link = 'LspSagaCodeActionBorder' })
	h('LspSagaDefPreviewBorder', { fg = groups.border })
	h('LspSagaDiagnosticBorder', { fg = groups.border })
	h('LspSagaDiagnosticHeader', { fg = p.gold, bold = true })
	h('LspSagaDiagnosticTruncateLine', { link = 'LspSagaDiagnosticBorder' })
	h('LspSagaDocTruncateLine', { link = 'LspSagaHoverBorder' })
	h('LspSagaFinderSelection', { fg = p.gold })
	h('LspSagaHoverBorder', { fg = groups.border })
	h('LspSagaLspFinderBorder', { fg = groups.border })
	h('LspSagaRenameBorder', { fg = p.pine })
	h('LspSagaRenamePromptPrefix', { fg = p.love })
	h('LspSagaShTruncateLine', { link = 'LspSagaSignatureHelpBorder' })
	h('LspSagaSignatureHelpBorder', { fg = p.pine })
	h('ReferencesCount', { fg = p.rose })
	h('ReferencesIcon', { fg = p.rose })
	h('SagaShadow', { bg = p.overlay })
	h('TargetWord', { fg = p.iris })

	-- ray-x/lsp_signature.nvim
	h('LspSignatureActiveParameter', { bg = p.overlay })

	-- rlane/pounce.nvim
	h('PounceAccept', { fg = p.love, bg = p.highlight_high })
	h('PounceAcceptBest', { fg = p.base, bg = p.gold })
	h('PounceGap', { link = 'Search' })
	h('PounceMatch', { link = 'Search' })

	local float_background = options.dim_nc_background
			and (options.disable_float_background and groups.panel_nc or groups.panel)
		or maybe.surface

	-- ggandor/leap.nvim
	h('LeapMatch', { link = 'MatchParen' })
	h('LeapLabelPrimary', { link = 'IncSearch' })
	h('LeapLabelSecondary', { fg = p.base, bg = p.pine })

	-- nvim-telescope/telescope.nvim
	h('TelescopeBorder', { fg = groups.border, bg = float_background })
	h('TelescopeMatching', { fg = p.rose })
	h('TelescopeNormal', { fg = p.subtle, bg = float_background })
	h('TelescopePromptNormal', { fg = p.text, bg = float_background })
	h('TelescopePromptPrefix', { fg = p.subtle })
	h('TelescopeSelection', { fg = p.text, bg = p.overlay })
	h('TelescopeSelectionCaret', { fg = p.rose, bg = p.overlay })
	h('TelescopeTitle', { fg = p.subtle })

	-- rcarriga/nvim-notify
	h('NotifyINFOBorder', { fg = p.foam })
	h('NotifyINFOTitle', { link = 'NotifyINFOBorder' })
	h('NotifyINFOIcon', { link = 'NotifyINFOBorder' })
	h('NotifyWARNBorder', { fg = p.gold })
	h('NotifyWARNTitle', { link = 'NotifyWARNBorder' })
	h('NotifyWARNIcon', { link = 'NotifyWARNBorder' })
	h('NotifyDEBUGBorder', { fg = p.muted })
	h('NotifyDEBUGTitle', { link = 'NotifyDEBUGBorder' })
	h('NotifyDEBUGIcon', { link = 'NotifyDEBUGBorder' })
	h('NotifyTRACEBorder', { fg = p.iris })
	h('NotifyTRACETitle', { link = 'NotifyTRACEBorder' })
	h('NotifyTRACEIcon', { link = 'NotifyTRACEBorder' })
	h('NotifyERRORBorder', { fg = p.love })
	h('NotifyERRORTitle', { link = 'NotifyERRORBorder' })
	h('NotifyERRORIcon', { link = 'NotifyERRORBorder' })

	-- rcarriga/nvim-dap-ui
	h('DapUIVariable', { link = 'Normal' })
	h('DapUIValue', { link = 'Normal' })
	h('DapUIFrameName', { link = 'Normal' })
	h('DapUIThread', { fg = p.gold })
	h('DapUIWatchesValue', { link = 'DapUIThread' })
	h('DapUIBreakpointsInfo', { link = 'DapUIThread' })
	h('DapUIBreakpointsCurrentLine', { fg = p.gold, bold = true })
	h('DapUIWatchesEmpty', { fg = p.love })
	h('DapUIWatchesError', { link = 'DapUIWatchesEmpty' })
	h('DapUIBreakpointsDisabledLine', { fg = p.muted })
	h('DapUISource', { fg = p.iris })
	h('DapUIBreakpointsPath', { fg = p.foam })
	h('DapUIScope', { link = 'DapUIBreakpointsPath' })
	h('DapUILineNumber', { link = 'DapUIBreakpointsPath' })
	h('DapUIBreakpointsLine', { link = 'DapUIBreakpointsPath' })
	h('DapUIFloatBorder', { link = 'DapUIBreakpointsPath' })
	h('DapUIStoppedThread', { link = 'DapUIBreakpointsPath' })
	h('DapUIDecoration', { link = 'DapUIBreakpointsPath' })
	h('DapUIModifiedValue', { fg = p.foam, bold = true })

	-- glepnir/dashboard-nvim
	h('DashboardShortcut', { fg = p.love })
	h('DashboardHeader', { fg = p.pine })
	h('DashboardCenter', { fg = p.gold })
	h('DashboardFooter', { fg = p.iris })

	-- SmiteshP/nvim-navic
	h('NavicIconsFile', { fg = p.base })
	h('NavicIconsModule', { fg = p.rose })
	h('NavicIconsNamespace', { fg = p.base })
	h('NavicIconsPackage', { fg = p.base })
	h('NavicIconsClass', { fg = p.foam })
	h('NavicIconsMethod', { fg = p.iris })
	h('NavicIconsProperty', { fg = p.foam })
	h('NavicIconsField', { fg = p.foam })
	h('NavicIconsConstructor', { fg = p.gold })
	h('NavicIconsEnum', { fg = p.gold })
	h('NavicIconsInterface', { fg = p.foam })
	h('NavicIconsFunction', { fg = p.pine })
	h('NavicIconsVariable', { fg = p.text })
	h('NavicIconsConstant', { fg = p.gold })
	h('NavicIconsString', { fg = p.gold })
	h('NavicIconsNumber', { fg = p.gold })
	h('NavicIconsBoolean', { fg = p.rose })
	h('NavicIconsArray', { fg = p.gold })
	h('NavicIconsObject', { fg = p.gold })
	h('NavicIconsKey', { fg = p.iris })
	h('NavicIconsKeyword', { fg = p.pine })
	h('NavicIconsNull', { fg = p.love })
	h('NavicIconsEnumMember', { fg = p.foam })
	h('NavicIconsStruct', { fg = p.foam })
	h('NavicIconsEvent', { fg = p.gold })
	h('NavicIconsOperator', { fg = p.subtle })
	h('NavicIconsTypeParameter', { fg = p.foam })
	h('NavicText', { fg = p.subtle })
	h('NavicSeparator', { fg = p.subtle })

	-- folke/noice.nvim
	h('NoiceCursor', { fg = p.highlight_high, bg = p.text })

	-- echasnovski/mini.indentscope
	h('MiniIndentscopeSymbol', { fg = p.highlight_med })
	h('MiniIndentscopeSymbolOff', { fg = p.highlight_med })

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

	-- Set user highlights
	for group, color in pairs(options.highlight_groups) do
		h(group, color)
	end
end

return M
