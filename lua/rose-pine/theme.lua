local M = {}

---@param options Options
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

	local float_background = options.dim_nc_background
			and (options.disable_float_background and groups.panel_nc or groups.panel)
		or maybe.surface

	M.defaults = {
		['ColorColumn'] = { bg = p.overlay },
		['Conceal'] = { bg = p.none },
		['CurSearch'] = { link = 'IncSearch' },
		['Cursor'] = { fg = p.text, bg = p.highlight_high },
		['CursorColumn'] = { bg = p.highlight_low },
		-- CursorIM = {},
		['CursorLine'] = { bg = p.highlight_low },
		['CursorLineNr'] = { fg = p.text },
		['DarkenedPanel'] = { bg = maybe.surface },
		['DarkenedStatusline'] = { bg = maybe.surface },
		['DiffAdd'] = { bg = groups.git_add, blend = 20 },

		['DiffChange'] = { bg = p.overlay },
		['DiffDelete'] = { bg = groups.git_delete, blend = 20 },
		['DiffText'] = { bg = groups.git_text, blend = 20 },
		['diffAdded'] = { link = 'DiffAdd' },
		['diffChanged'] = { link = 'DiffChange' },
		['diffRemoved'] = { link = 'DiffDelete' },
		['Directory'] = { fg = p.foam, bg = p.none },
		-- EndOfBuffer = {},
		['ErrorMsg'] = { fg = p.love, bold = true },
		['FloatBorder'] = { fg = groups.border, bg = maybe.surface },
		['FloatTitle'] = { fg = p.muted },
		['FoldColumn'] = { fg = p.muted },
		['Folded'] = { fg = p.text, bg = maybe.surface },
		['IncSearch'] = { fg = groups.background, bg = p.rose },
		['LineNr'] = { fg = p.muted },
		['MatchParen'] = { fg = p.text, bg = p.highlight_med },
		['ModeMsg'] = { fg = p.subtle },
		['MoreMsg'] = { fg = p.iris },
		['NonText'] = { fg = p.muted },
		['Normal'] = { fg = p.text, bg = maybe.base },
		['NormalFloat'] = { fg = p.text, bg = maybe.surface },
		['NormalNC'] = { fg = p.text, bg = maybe.dim_nc_background },
		['NvimInternalError'] = { fg = '#ffffff', bg = p.love },
		['Pmenu'] = { fg = p.subtle, bg = maybe.surface },
		['PmenuSbar'] = { bg = p.highlight_low },
		['PmenuSel'] = { fg = p.text, bg = p.overlay },
		['PmenuThumb'] = { bg = p.highlight_med },
		['Question'] = { fg = p.gold },
		-- QuickFixLine = {},
		-- RedrawDebugNormal = {}
		['RedrawDebugClear'] = { fg = '#ffffff', bg = p.gold },
		['RedrawDebugComposed'] = { fg = '#ffffff', bg = p.pine },
		['RedrawDebugRecompose'] = { fg = '#ffffff', bg = p.love },
		['Search'] = { bg = p.highlight_med },
		['SpecialKey'] = { fg = p.foam },
		['SpellBad'] = { sp = p.subtle, undercurl = true },
		['SpellCap'] = { sp = p.subtle, undercurl = true },
		['SpellLocal'] = { sp = p.subtle, undercurl = true },
		['SpellRare'] = { sp = p.subtle, undercurl = true },
		['SignColumn'] = {
			fg = p.text,
			bg = (options.dim_nc_background and p.none) or maybe.base,
		},
		['Substitute'] = { fg = p.base, bg = p.love },
		['StatusLine'] = { fg = p.subtle, bg = groups.panel },
		['StatusLineNC'] = { fg = p.muted, bg = groups.panel_nc },
		['StatusLineTerm'] = { link = 'StatusLine' },
		['StatusLineTermNC'] = { link = 'StatusLineNC' },
		['TabLine'] = { fg = p.subtle, bg = groups.panel },
		['TabLineFill'] = { bg = groups.panel },
		['TabLineSel'] = { fg = p.text, bg = p.overlay },
		['Title'] = { fg = p.text },
		['VertSplit'] = { fg = groups.border, bg = maybe.bold_vert_split },
		['Visual'] = { bg = p.highlight_med },
		-- VisualNOS = {},
		['WarningMsg'] = { fg = p.gold },
		-- Whitespace = {},
		['WildMenu'] = { link = 'IncSearch' },

		['Boolean'] = { fg = p.rose },
		['Character'] = { fg = p.gold },
		['Comment'] = { fg = groups.comment, italic = maybe.italic },
		['Conditional'] = { fg = p.pine },
		['Constant'] = { fg = p.gold },
		['Debug'] = { fg = p.rose },
		['Define'] = { fg = p.iris },
		['Delimiter'] = { fg = p.subtle },
		['Error'] = { fg = p.love },
		['Exception'] = { fg = p.pine },
		['Float'] = { fg = p.gold },
		['Function'] = { fg = p.rose },
		['Identifier'] = { fg = p.rose },
		-- Ignore = {},
		['Include'] = { fg = p.pine },
		['Keyword'] = { fg = p.pine },
		['Label'] = { fg = p.foam },
		['Macro'] = { fg = p.iris },
		['Number'] = { fg = p.gold },
		['Operator'] = { fg = p.subtle },
		['PreCondit'] = { fg = p.iris },
		['PreProc'] = { fg = p.iris },
		['Repeat'] = { fg = p.pine },
		['Special'] = { fg = p.rose },
		['SpecialChar'] = { fg = p.rose },
		['SpecialComment'] = { fg = p.iris },
		['Statement'] = { fg = p.pine },
		['StorageClass'] = { fg = p.foam },
		['String'] = { fg = p.gold },
		['Structure'] = { fg = p.foam },
		['Tag'] = { fg = p.foam },
		['Todo'] = { fg = p.iris },
		['Type'] = { fg = p.foam },
		['Typedef'] = { link = 'Type' },
		['Underlined'] = { underline = true },

		['htmlArg'] = { fg = p.iris },
		['htmlBold'] = { bold = true },
		['htmlEndTag'] = { fg = p.subtle },
		['htmlH1'] = { fg = groups.headings.h1, bold = true },
		['htmlH2'] = { fg = groups.headings.h2, bold = true },
		['htmlH3'] = { fg = groups.headings.h3, bold = true },
		['htmlH4'] = { fg = groups.headings.h4, bold = true },
		['htmlH5'] = { fg = groups.headings.h5, bold = true },
		['htmlItalic'] = { italic = maybe.italic },
		['htmlLink'] = { fg = groups.link },
		['htmlTag'] = { fg = p.subtle },
		['htmlTagN'] = { fg = p.text },
		['htmlTagName'] = { fg = p.foam },

		['markdownDelimiter'] = { fg = p.subtle },
		['markdownH1'] = { fg = groups.headings.h1, bold = true },
		['markdownH1Delimiter'] = { link = 'markdownH1' },
		['markdownH2'] = { fg = groups.headings.h2, bold = true },
		['markdownH2Delimiter'] = { link = 'markdownH2' },
		['markdownH3'] = { fg = groups.headings.h3, bold = true },
		['markdownH3Delimiter'] = { link = 'markdownH3' },
		['markdownH4'] = { fg = groups.headings.h4, bold = true },
		['markdownH4Delimiter'] = { link = 'markdownH4' },
		['markdownH5'] = { fg = groups.headings.h5, bold = true },
		['markdownH5Delimiter'] = { link = 'markdownH5' },
		['markdownH6'] = { fg = groups.headings.h6, bold = true },
		['markdownH6Delimiter'] = { link = 'markdownH6' },
		['markdownLinkText'] = { fg = groups.link, sp = groups.link, underline = true },
		['markdownUrl'] = { link = 'markdownLinkText' },

		['mkdCode'] = { fg = p.foam, italic = maybe.italic },
		['mkdCodeDelimiter'] = { fg = p.rose },
		['mkdCodeEnd'] = { fg = p.foam },
		['mkdCodeStart'] = { fg = p.foam },
		['mkdFootnotes'] = { fg = p.foam },
		['mkdID'] = { fg = p.foam, underline = true },
		['mkdInlineURL'] = { fg = groups.link, underline = true },
		['mkdLink'] = { link = 'mkdInlineURL' },
		['mkdLinkDef'] = { link = 'mkdInlineURL' },
		['mkdListItemLine'] = { fg = p.text },
		['mkdRule'] = { fg = p.subtle },
		['mkdURL'] = { link = 'mkdInlineURL' },

		['DiagnosticError'] = { fg = groups.error },
		['DiagnosticHint'] = { fg = groups.hint },
		['DiagnosticInfo'] = { fg = groups.info },
		['DiagnosticWarn'] = { fg = groups.warn },
		['DiagnosticDefaultError'] = { fg = groups.error },
		['DiagnosticDefaultHint'] = { fg = groups.hint },
		['DiagnosticDefaultInfo'] = { fg = groups.info },
		['DiagnosticDefaultWarn'] = { fg = groups.warn },
		['DiagnosticFloatingError'] = { fg = groups.error },
		['DiagnosticFloatingHint'] = { fg = groups.hint },
		['DiagnosticFloatingInfo'] = { fg = groups.info },
		['DiagnosticFloatingWarn'] = { fg = groups.warn },
		['DiagnosticSignError'] = { fg = groups.error },
		['DiagnosticSignHint'] = { fg = groups.hint },
		['DiagnosticSignInfo'] = { fg = groups.info },
		['DiagnosticSignWarn'] = { fg = groups.warn },
		['DiagnosticStatusLineError'] = { fg = groups.error, bg = groups.panel },
		['DiagnosticStatusLineHint'] = { fg = groups.hint, bg = groups.panel },
		['DiagnosticStatusLineInfo'] = { fg = groups.info, bg = groups.panel },
		['DiagnosticStatusLineWarn'] = { fg = groups.warn, bg = groups.panel },
		['DiagnosticUnderlineError'] = { sp = groups.error, undercurl = true },
		['DiagnosticUnderlineHint'] = { sp = groups.hint, undercurl = true },
		['DiagnosticUnderlineInfo'] = { sp = groups.info, undercurl = true },
		['DiagnosticUnderlineWarn'] = { sp = groups.warn, undercurl = true },
		['DiagnosticVirtualTextError'] = { fg = groups.error },
		['DiagnosticVirtualTextHint'] = { fg = groups.hint },
		['DiagnosticVirtualTextInfo'] = { fg = groups.info },
		['DiagnosticVirtualTextWarn'] = { fg = groups.warn },

		-- healthcheck
		['healthError'] = { fg = groups.error },
		['healthSuccess'] = { fg = groups.info },
		['healthWarning'] = { fg = groups.warn },

		-- Treesitter
		['@boolean'] = { link = 'Boolean' },
		['@character'] = { link = 'Character' },
		['@character.special'] = { link = '@character' },
		['@class'] = { fg = p.foam },
		['@comment'] = { link = 'Comment' },
		['@conditional'] = { link = 'Conditional' },
		['@constant'] = { link = 'Constant' },
		['@constant.builtin'] = { fg = p.love },
		['@constant.macro'] = { link = '@constant' },
		['@constructor'] = { fg = p.foam },
		['@field'] = { fg = p.foam },
		['@function'] = { link = 'Function' },
		['@function.builtin'] = { fg = p.love },
		['@function.macro'] = { link = '@function' },
		['@include'] = { link = 'Include' },
		['@interface'] = { fg = p.foam },
		['@keyword'] = { link = 'Keyword' },
		['@keyword.operator'] = { fg = p.subtle },
		['@label'] = { link = 'Label' },
		['@macro'] = { link = 'Macro' },
		['@method'] = { fg = p.rose },
		['@number'] = { link = 'Number' },
		['@operator'] = { link = 'Operator' },
		['@parameter'] = { fg = p.iris, italic = maybe.italic },
		['@preproc'] = { link = 'PreProc' },
		['@property'] = { fg = p.foam, italic = maybe.italic },
		['@punctuation'] = { fg = groups.punctuation },
		['@punctuation.bracket'] = { link = '@punctuation' },
		['@punctuation.delimiter'] = { link = '@punctuation' },
		['@punctuation.special'] = { link = '@punctuation' },
		['@regexp'] = { link = 'String' },
		['@repeat'] = { link = 'Repeat' },
		['@storageclass'] = { link = 'StorageClass' },
		['@string'] = { link = 'String' },
		['@string.escape'] = { fg = p.pine },
		['@string.special'] = { link = '@string' },
		['@symbol'] = { link = 'Identifier' },
		['@tag'] = { link = 'Tag' },
		['@tag.attribute'] = { fg = p.iris },
		['@tag.delimiter'] = { fg = p.subtle },
		['@text'] = { fg = p.text },
		['@text.strong'] = { bold = true },
		['@text.emphasis'] = { italic = true },
		['@text.underline'] = { underline = true },
		['@text.strike'] = { strikethrough = true },
		['@text.math'] = { link = 'Special' },
		['@text.environment'] = { link = 'Macro' },
		['@text.environment.name'] = { link = 'Type' },
		['@text.title'] = { link = 'Title' },
		['@text.uri'] = { fg = groups.link },
		['@text.note'] = { link = 'SpecialComment' },
		['@text.warning'] = { fg = groups.warn },
		['@text.danger'] = { fg = groups.error },
		['@todo'] = { link = 'Todo' },
		['@type'] = { link = 'Type' },
		['@variable'] = { fg = p.text, italic = maybe.italic },
		['@variable.builtin'] = { fg = p.love },
		['@namespace'] = { link = '@include' },

		-- LSP Semantic Token Groups
		['@lsp.type.comment'] = {},
		['@lsp.type.enum'] = { link = '@type' },
		['@lsp.type.keyword'] = { link = '@keyword' },
		['@lsp.type.interface'] = { link = '@interface' },
		['@lsp.type.namespace'] = { link = '@namespace' },
		['@lsp.type.parameter'] = { link = '@parameter' },
		['@lsp.type.property'] = { link = '@property' },
		['@lsp.type.variable'] = {}, -- use treesitter styles for regular variables
		['@lsp.typemod.function.defaultLibrary'] = { link = 'Special' },
		['@lsp.typemod.variable.defaultLibrary'] = { link = '@variable.builtin' },

		-- LSP Injected Groups
		['@lsp.typemod.operator.injected'] = { link = '@operator' },
		['@lsp.typemod.string.injected'] = { link = '@string' },
		['@lsp.typemod.variable.injected'] = { link = '@variable' },

		-- nvim-treesitter Markdown Headings
		['@text.title.1.markdown'] = { link = 'markdownH1' },
		['@text.title.1.marker.markdown'] = { link = 'markdownH1Delimiter' },
		['@text.title.2.markdown'] = { link = 'markdownH2' },
		['@text.title.2.marker.markdown'] = { link = 'markdownH2Delimiter' },
		['@text.title.3.markdown'] = { link = 'markdownH3' },
		['@text.title.3.marker.markdown'] = { link = 'markdownH3Delimiter' },
		['@text.title.4.markdown'] = { link = 'markdownH4' },
		['@text.title.4.marker.markdown'] = { link = 'markdownH4Delimiter' },
		['@text.title.5.markdown'] = { link = 'markdownH5' },
		['@text.title.5.marker.markdown'] = { link = 'markdownH5Delimiter' },
		['@text.title.6.markdown'] = { link = 'markdownH6' },
		['@text.title.6.marker.markdown'] = { link = 'markdownH6Delimiter' },

		-- vim.lsp.buf.document_highlight()
		['LspReferenceText'] = { bg = p.highlight_med },
		['LspReferenceRead'] = { bg = p.highlight_med },
		['LspReferenceWrite'] = { bg = p.highlight_med },

		-- lsp-highlight-codelens
		['LspCodeLens'] = { fg = p.subtle }, -- virtual text of code len
		['LspCodeLensSeparator'] = { fg = p.highlight_high }, -- separator between two or more code len

		-- romgrk/barbar.nvim
		['BufferCurrent'] = { fg = p.text, bg = p.overlay },
		['BufferCurrentIndex'] = { fg = p.text, bg = p.overlay },
		['BufferCurrentMod'] = { fg = p.foam, bg = p.overlay },
		['BufferCurrentSign'] = { fg = p.subtle, bg = p.overlay },
		['BufferCurrentTarget'] = { fg = p.gold, bg = p.overlay },
		['BufferInactive'] = { fg = p.subtle },
		['BufferInactiveIndex'] = { fg = p.subtle },
		['BufferInactiveMod'] = { fg = p.foam },
		['BufferInactiveSign'] = { fg = p.muted },
		['BufferInactiveTarget'] = { fg = p.gold },
		['BufferTabpageFill'] = { fg = groups.background, bg = groups.background },
		['BufferVisible'] = { fg = p.subtle },
		['BufferVisibleIndex'] = { fg = p.subtle },
		['BufferVisibleMod'] = { fg = p.foam },
		['BufferVisibleSign'] = { fg = p.muted },
		['BufferVisibleTarget'] = { fg = p.gold },

		-- lewis6991/gitsigns.nvim
		['GitSignsAdd'] = { fg = groups.git_add, bg = groups.background },
		['GitSignsChange'] = { fg = groups.git_change, bg = groups.background },
		['GitSignsDelete'] = { fg = groups.git_delete, bg = groups.background },
		['SignAdd'] = { link = 'GitSignsAdd' },
		['SignChange'] = { link = 'GitSignsChange' },
		['SignDelete'] = { link = 'GitSignsDelete' },

		-- mvllow/modes.nvim
		['ModesCopy'] = { bg = p.gold },
		['ModesDelete'] = { bg = p.love },
		['ModesInsert'] = { bg = p.foam },
		['ModesVisual'] = { bg = p.iris },

		-- kyazdani42/nvim-tree.lua
		['NvimTreeEmptyFolderName'] = { fg = p.muted },
		['NvimTreeFileDeleted'] = { fg = p.love },
		['NvimTreeFileDirty'] = { fg = p.rose },
		['NvimTreeFileMerge'] = { fg = p.iris },
		['NvimTreeFileNew'] = { fg = p.foam },
		['NvimTreeFileRenamed'] = { fg = p.pine },
		['NvimTreeFileStaged'] = { fg = p.iris },
		['NvimTreeFolderIcon'] = { fg = p.subtle },
		['NvimTreeFolderName'] = { fg = p.foam },
		['NvimTreeGitDeleted'] = { fg = groups.git_delete },
		['NvimTreeGitDirty'] = { fg = groups.git_dirty },
		['NvimTreeGitIgnored'] = { fg = groups.git_ignore },
		['NvimTreeGitMerge'] = { fg = groups.git_merge },
		['NvimTreeGitNew'] = { fg = groups.git_add },
		['NvimTreeGitRenamed'] = { fg = groups.git_rename },
		['NvimTreeGitStaged'] = { fg = groups.git_stage },
		['NvimTreeImageFile'] = { fg = p.text },
		['NvimTreeNormal'] = { fg = p.text },
		['NvimTreeOpenedFile'] = { fg = p.text, bg = p.highlight_med },
		['NvimTreeOpenedFolderName'] = { link = 'NvimTreeFolderName' },
		['NvimTreeRootFolder'] = { fg = p.iris },
		['NvimTreeSpecialFile'] = { link = 'NvimTreeNormal' },
		['NvimTreeWindowPicker'] = { fg = p.love, bg = p.love, blend = 10 },

		-- nvim-neo-tree/neo-tree.nvim
		['NeoTreeTitleBar'] = { fg = p.surface, bg = p.pine },
		['NeoTreeGitAdded'] = { fg = p.foam },
		['NeoTreeGitModified'] = { fg = p.rose },
		['NeoTreeGitDeleted'] = { fg = p.love },
		['NeoTreeGitRenamed'] = { fg = p.pine },
		['NeoTreeGitIgnored'] = { fg = p.muted },
		['NeoTreeGitUntracked'] = { fg = p.gold },
		['NeoTreeGitConflict'] = { fg = p.iris },

		-- folke/which-key.nvim
		['WhichKey'] = { fg = p.iris },
		['WhichKeyGroup'] = { fg = p.foam },
		['WhichKeySeparator'] = { fg = p.subtle },
		['WhichKeyDesc'] = { fg = p.gold },
		['WhichKeyFloat'] = { bg = maybe.surface },
		['WhichKeyValue'] = { fg = p.rose },

		-- luka-reineke/indent-blankline.nvim
		['IndentBlanklineChar'] = { fg = p.muted, nocombine = true },
		['IndentBlanklineSpaceChar'] = { fg = p.muted, nocombine = true },
		['IndentBlanklineSpaceCharBlankline'] = { fg = p.muted, nocombine = true },

		-- hrsh7th/nvim-cmp
		['CmpItemAbbr'] = { fg = p.subtle },
		['CmpItemAbbrDeprecated'] = { fg = p.subtle, strikethrough = true },
		['CmpItemAbbrMatch'] = { fg = p.text, bold = true },
		['CmpItemAbbrMatchFuzzy'] = { fg = p.text, bold = true },
		['CmpItemKind'] = { fg = p.subtle },
		['CmpItemKindClass'] = { fg = p.pine },
		['CmpItemKindFunction'] = { fg = p.rose },
		['CmpItemKindInterface'] = { fg = p.foam },
		['CmpItemKindMethod'] = { fg = p.iris },
		['CmpItemKindSnippet'] = { fg = p.gold },
		['CmpItemKindVariable'] = { fg = p.text },

		-- TimUntersberger/neogit
		['NeogitDiffAddHighlight'] = { fg = p.foam, bg = p.highlight_med },
		['NeogitDiffContextHighlight'] = { bg = p.highlight_low },
		['NeogitDiffDeleteHighlight'] = { fg = p.love, bg = p.highlight_med },
		['NeogitHunkHeader'] = { bg = p.highlight_low },
		['NeogitHunkHeaderHighlight'] = { bg = p.highlight_low },

		-- vimwiki/vimwiki
		['VimwikiHR'] = { fg = p.subtle },
		['VimwikiHeader1'] = { fg = groups.headings.h1, bold = true },
		['VimwikiHeader2'] = { fg = groups.headings.h2, bold = true },
		['VimwikiHeader3'] = { fg = groups.headings.h3, bold = true },
		['VimwikiHeader4'] = { fg = groups.headings.h4, bold = true },
		['VimwikiHeader5'] = { fg = groups.headings.h5, bold = true },
		['VimwikiHeader6'] = { fg = groups.headings.h6, bold = true },
		['VimwikiHeaderChar'] = { fg = p.pine },
		['VimwikiLink'] = { fg = groups.link, underline = true },
		['VimwikiList'] = { fg = p.iris },
		['VimwikiNoExistsLink'] = { fg = p.love },

		-- nvim-neorg/neorg
		['NeorgHeading1Prefix'] = { fg = groups.headings.h1, bold = true },
		['NeorgHeading1Title'] = { link = 'NeorgHeading1Prefix' },
		['NeorgHeading2Prefix'] = { fg = groups.headings.h2, bold = true },
		['NeorgHeading2Title'] = { link = 'NeorgHeading2Prefix' },
		['NeorgHeading3Prefix'] = { fg = groups.headings.h3, bold = true },
		['NeorgHeading3Title'] = { link = 'NeorgHeading3Prefix' },
		['NeorgHeading4Prefix'] = { fg = groups.headings.h4, bold = true },
		['NeorgHeading4Title'] = { link = 'NeorgHeading4Prefix' },
		['NeorgHeading5Prefix'] = { fg = groups.headings.h5, bold = true },
		['NeorgHeading5Title'] = { link = 'NeorgHeading5Prefix' },
		['NeorgHeading6Prefix'] = { fg = groups.headings.h6, bold = true },
		['NeorgHeading6Title'] = { link = 'NeorgHeading6Prefix' },
		['NeorgMarkerTitle'] = { fg = p.text, bold = true },

		-- tami5/lspsaga.nvim (fork of glepnir/lspsaga.nvim)
		['DefinitionCount'] = { fg = p.rose },
		['DefinitionIcon'] = { fg = p.rose },
		['DefintionPreviewTitle'] = { fg = p.rose, bold = true },
		['LspFloatWinBorder'] = { fg = groups.border },
		['LspFloatWinNormal'] = { bg = maybe.surface },
		['LspSagaAutoPreview'] = { fg = p.subtle },
		['LspSagaCodeActionBorder'] = { fg = groups.border },
		['LspSagaCodeActionContent'] = { fg = p.foam },
		['LspSagaCodeActionTitle'] = { fg = p.gold, bold = true },
		['LspSagaCodeActionTruncateLine'] = { link = 'LspSagaCodeActionBorder' },
		['LspSagaDefPreviewBorder'] = { fg = groups.border },
		['LspSagaDiagnosticBorder'] = { fg = groups.border },
		['LspSagaDiagnosticHeader'] = { fg = p.gold, bold = true },
		['LspSagaDiagnosticTruncateLine'] = { link = 'LspSagaDiagnosticBorder' },
		['LspSagaDocTruncateLine'] = { link = 'LspSagaHoverBorder' },
		['LspSagaFinderSelection'] = { fg = p.gold },
		['LspSagaHoverBorder'] = { fg = groups.border },
		['LspSagaLspFinderBorder'] = { fg = groups.border },
		['LspSagaRenameBorder'] = { fg = p.pine },
		['LspSagaRenamePromptPrefix'] = { fg = p.love },
		['LspSagaShTruncateLine'] = { link = 'LspSagaSignatureHelpBorder' },
		['LspSagaSignatureHelpBorder'] = { fg = p.pine },
		['ReferencesCount'] = { fg = p.rose },
		['ReferencesIcon'] = { fg = p.rose },
		['SagaShadow'] = { bg = p.overlay },
		['TargetWord'] = { fg = p.iris },

		-- ray-x/lsp_signature.nvim
		['LspSignatureActiveParameter'] = { bg = p.overlay },

		-- rlane/pounce.nvim
		['PounceAccept'] = { fg = p.love, bg = p.highlight_high },
		['PounceAcceptBest'] = { fg = p.base, bg = p.gold },
		['PounceGap'] = { link = 'Search' },
		['PounceMatch'] = { link = 'Search' },

		-- ggandor/leap.nvim
		['LeapMatch'] = { link = 'MatchParen' },
		['LeapLabelPrimary'] = { link = 'IncSearch' },
		['LeapLabelSecondary'] = { fg = p.base, bg = p.pine },

		-- phaazon/hop.nvim
		['HopNextKey'] = { fg = p.love },
		['HopNextKey1'] = { fg = p.foam },
		['HopNextKey2'] = { fg = p.pine },
		['HopUnmatched'] = { fg = p.highlight_high },

		-- nvim-telescope/telescope.nvim
		['TelescopeBorder'] = { fg = groups.border, bg = float_background },
		['TelescopeMatching'] = { fg = p.rose },
		['TelescopeNormal'] = { fg = p.subtle, bg = float_background },
		['TelescopePromptNormal'] = { fg = p.text, bg = float_background },
		['TelescopePromptPrefix'] = { fg = p.subtle },
		['TelescopeSelection'] = { fg = p.text, bg = p.overlay },
		['TelescopeSelectionCaret'] = { fg = p.rose, bg = p.overlay },
		['TelescopeTitle'] = { fg = p.subtle },

		-- rcarriga/nvim-notify
		['NotifyINFOBorder'] = { fg = p.foam },
		['NotifyINFOTitle'] = { link = 'NotifyINFOBorder' },
		['NotifyINFOIcon'] = { link = 'NotifyINFOBorder' },
		['NotifyWARNBorder'] = { fg = p.gold },
		['NotifyWARNTitle'] = { link = 'NotifyWARNBorder' },
		['NotifyWARNIcon'] = { link = 'NotifyWARNBorder' },
		['NotifyDEBUGBorder'] = { fg = p.muted },
		['NotifyDEBUGTitle'] = { link = 'NotifyDEBUGBorder' },
		['NotifyDEBUGIcon'] = { link = 'NotifyDEBUGBorder' },
		['NotifyTRACEBorder'] = { fg = p.iris },
		['NotifyTRACETitle'] = { link = 'NotifyTRACEBorder' },
		['NotifyTRACEIcon'] = { link = 'NotifyTRACEBorder' },
		['NotifyERRORBorder'] = { fg = p.love },
		['NotifyERRORTitle'] = { link = 'NotifyERRORBorder' },
		['NotifyERRORIcon'] = { link = 'NotifyERRORBorder' },

		-- rcarriga/nvim-dap-ui
		['DapUIVariable'] = { link = 'Normal' },
		['DapUIValue'] = { link = 'Normal' },
		['DapUIFrameName'] = { link = 'Normal' },
		['DapUIThread'] = { fg = p.gold },
		['DapUIWatchesValue'] = { link = 'DapUIThread' },
		['DapUIBreakpointsInfo'] = { link = 'DapUIThread' },
		['DapUIBreakpointsCurrentLine'] = { fg = p.gold, bold = true },
		['DapUIWatchesEmpty'] = { fg = p.love },
		['DapUIWatchesError'] = { link = 'DapUIWatchesEmpty' },
		['DapUIBreakpointsDisabledLine'] = { fg = p.muted },
		['DapUISource'] = { fg = p.iris },
		['DapUIBreakpointsPath'] = { fg = p.foam },
		['DapUIScope'] = { link = 'DapUIBreakpointsPath' },
		['DapUILineNumber'] = { link = 'DapUIBreakpointsPath' },
		['DapUIBreakpointsLine'] = { link = 'DapUIBreakpointsPath' },
		['DapUIFloatBorder'] = { link = 'DapUIBreakpointsPath' },
		['DapUIStoppedThread'] = { link = 'DapUIBreakpointsPath' },
		['DapUIDecoration'] = { link = 'DapUIBreakpointsPath' },
		['DapUIModifiedValue'] = { fg = p.foam, bold = true },

		-- glepnir/dashboard-nvim
		['DashboardShortcut'] = { fg = p.love },
		['DashboardHeader'] = { fg = p.pine },
		['DashboardCenter'] = { fg = p.gold },
		['DashboardFooter'] = { fg = p.iris },

		-- SmiteshP/nvim-navic
		['NavicIconsFile'] = { fg = p.base },
		['NavicIconsModule'] = { fg = p.rose },
		['NavicIconsNamespace'] = { fg = p.base },
		['NavicIconsPackage'] = { fg = p.base },
		['NavicIconsClass'] = { fg = p.foam },
		['NavicIconsMethod'] = { fg = p.iris },
		['NavicIconsProperty'] = { fg = p.foam },
		['NavicIconsField'] = { fg = p.foam },
		['NavicIconsConstructor'] = { fg = p.gold },
		['NavicIconsEnum'] = { fg = p.gold },
		['NavicIconsInterface'] = { fg = p.foam },
		['NavicIconsFunction'] = { fg = p.pine },
		['NavicIconsVariable'] = { fg = p.text },
		['NavicIconsConstant'] = { fg = p.gold },
		['NavicIconsString'] = { fg = p.gold },
		['NavicIconsNumber'] = { fg = p.gold },
		['NavicIconsBoolean'] = { fg = p.rose },
		['NavicIconsArray'] = { fg = p.gold },
		['NavicIconsObject'] = { fg = p.gold },
		['NavicIconsKey'] = { fg = p.iris },
		['NavicIconsKeyword'] = { fg = p.pine },
		['NavicIconsNull'] = { fg = p.love },
		['NavicIconsEnumMember'] = { fg = p.foam },
		['NavicIconsStruct'] = { fg = p.foam },
		['NavicIconsEvent'] = { fg = p.gold },
		['NavicIconsOperator'] = { fg = p.subtle },
		['NavicIconsTypeParameter'] = { fg = p.foam },
		['NavicText'] = { fg = p.subtle },
		['NavicSeparator'] = { fg = p.subtle },

		-- folke/noice.nvim
		['NoiceCursor'] = { fg = p.highlight_high, bg = p.text },

		-- echasnovski/mini.indentscope
		['MiniIndentscopeSymbol'] = { fg = p.highlight_med },
		['MiniIndentscopeSymbolOff'] = { fg = p.highlight_med },

		-- goolord/alpha-nvim
		['AlphaHeader'] = { fg = p.pine },
		['AlphaButtons'] = { fg = p.foam },
		['AlphaShortcut'] = { fg = p.rose },
		['AlphaFooter'] = { fg = p.gold },
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

	-- Set users highlight_group customisations.
	for group, opts in pairs(options.highlight_groups) do
		local default_opts = M.defaults[group]

		if (opts.inherit == nil or opts.inherit) and default_opts ~= nil then -- On merge.
			opts.inherit = nil -- Don't add this key to the highlight_group after merge.
			M.defaults[group] = vim.tbl_extend('force', default_opts, opts)
		else -- On overwrite.
			opts.inherit = nil -- Don't add this key to the highlight_group.
			M.defaults[group] = opts
		end
	end

	-- Set highlights.
	for group, color in pairs(M.defaults) do
		h(group, color)
	end
end

return M
