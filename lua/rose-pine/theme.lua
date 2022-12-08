local blend = require("rose-pine.util").blend

local M = {}

function M.get_theme()
  local p = require("rose-pine.palette")

  local theme = {}
  local groups = {
    background = "base",
    panel = "surface",
    border = "highlight_med",
    comment = "muted",
    link = "iris",
    punctuation = "muted",

    error = "crimson",
    hint = "foam",
    info = "iris",
    warn = "gold",

    git_add = "foam",
    git_change = "rose",
    git_delete = "crimson",
    git_dirty = "rose",
    git_ignore = "muted",
    git_merge = "iris",
    git_rename = "sand",
    git_stage = "iris",
    git_text = "rose",

    headings = {
      h1 = "iris",
      h2 = "foam",
      h3 = "rose",
      h4 = "gold",
      h5 = "sand",
      h6 = "foam"
    }
  }

  local styles = {
    italic = "italic",
    bold = "bold",
    vert_split = p.none,
    background = groups.background,
    float_background = groups.panel
  }
  styles.nc_background = styles.background

  theme = {
    ColorColumn = {bg = p.overlay},
    Conceal = {bg = p.none},
    CurSearch = {link = "IncSearch"},
    -- Cursor = {},
    CursorColumn = {bg = p.highlight_low},
    -- CursorIM = {},
    CursorLine = {bg = p.highlight_low},
    CursorLineNr = {fg = p.text},
    DarkenedPanel = {bg = groups.panel},
    DarkenedStatusline = {bg = groups.panel},
    DiffAdd = {bg = blend(groups.git_add, groups.background, 0.5)},
    DiffChange = {bg = p.overlay},
    DiffDelete = {bg = blend(groups.git_delete, groups.background, 0.5)},
    DiffText = {bg = blend(groups.git_text, groups.background, 0.5)},
    diffAdded = {link = "DiffAdd"},
    diffChanged = {link = "DiffChange"},
    diffRemoved = {link = "DiffDelete"},
    Directory = {fg = p.foam, bg = p.none},
    -- EndOfBuffer = {},
    ErrorMsg = {fg = p.crimson, style = styles.bold},
    FloatBorder = {fg = groups.border},
    FloatTitle = {fg = p.muted},
    FoldColumn = {fg = p.muted},
    Folded = {fg = p.text, bg = groups.panel},
    IncSearch = {fg = p.base, bg = p.rose},
    LineNr = {fg = p.subtle},
    MatchParen = {fg = p.text, bg = p.highlight_med},
    ModeMsg = {fg = p.subtle},
    MoreMsg = {fg = p.iris},
    NonText = {fg = p.muted},
    Normal = {fg = p.text, bg = styles.background},
    NormalFloat = {fg = p.text, bg = styles.float_background},
    NormalNC = {fg = p.text, bg = styles.nc_background},
    NvimInternalError = {fg = "#ffffff", bg = p.crimson},
    Pmenu = {fg = p.subtle, bg = styles.float_background},
    PmenuSbar = {bg = p.highlight_low},
    PmenuSel = {fg = p.text, bg = p.overlay},
    PmenuThumb = {bg = p.highlight_med},
    Question = {fg = p.gold},
    -- QuickFixLine = {},
    -- RedrawDebugNormal = {}
    RedrawDebugClear = {fg = "#ffffff", bg = p.gold},
    RedrawDebugComposed = {fg = "#ffffff", bg = p.sand},
    RedrawDebugRecompose = {fg = "#ffffff", bg = p.crimson},
    Search = {bg = p.highlight_med},
    SpecialKey = {fg = p.foam},
    SpellBad = {sp = p.subtle, style = "undercurl"},
    SpellCap = {sp = p.subtle, style = "undercurl"},
    SpellLocal = {sp = p.subtle, style = "undercurl"},
    SpellRare = {sp = p.subtle, style = "undercurl"},
    SignColumn = {fg = p.text, bg = styles.background},
    StatusLine = {fg = p.subtle, bg = styles.float_background},
    StatusLineNC = {fg = p.muted, bg = styles.background},
    StatusLineTerm = {link = "StatusLine"},
    StatusLineTermNC = {link = "StatusLineNC"},
    TabLine = {fg = p.subtle, bg = styles.float_background},
    TabLineFill = {bg = styles.float_background},
    TabLineSel = {fg = p.text, bg = p.overlay},
    Title = {fg = p.text},
    VertSplit = {fg = groups.border, bg = styles.vert_split},
    Visual = {bg = p.highlight_med},
    -- VisualNOS = {},
    WarningMsg = {fg = p.gold},
    -- Whitespace = {},
    WildMenu = {link = "IncSearch"},

    Boolean = {fg = p.blu, style = styles.italic},
    Character = {fg = p.gold},
    Comment = {fg = groups.comment, style = styles.italic},
    Conditional = {fg = p.sand},
    Constant = {fg = p.gold},
    Debug = {fg = p.rose},
    Define = {fg = p.iris},
    Delimiter = {fg = p.subtle},
    Error = {fg = p.crimson},
    Exception = {fg = p.sand},
    Float = {fg = p.gold},
    Function = {fg = p.ocean},
    Identifier = {fg = p.rose},
    -- Ignore = {},
    Include = {fg = p.iris},
    Keyword = {fg = p.sand, style = styles.italic},
    Label = {fg = p.foam},
    Macro = {fg = p.iris},
    Number = {fg = p.gold},
    Operator = {fg = p.subtle},
    PreCondit = {fg = p.iris},
    PreProc = {fg = p.iris},
    Repeat = {fg = p.sand},
    Special = {fg = p.rose},
    SpecialChar = {fg = p.rose},
    SpecialComment = {fg = p.iris},
    Statement = {fg = p.sand},
    StorageClass = {fg = p.foam},
    String = {fg = p.calm},
    Structure = {fg = p.foam},
    Tag = {fg = p.rose},
    Todo = {fg = p.iris},
    Type = {fg = p.foam},
    Typedef = {fg = p.foam},
    Underlined = {style = "underline"},

    htmlArg = {fg = p.iris},
    htmlBold = {style = styles.bold},
    htmlEndTag = {fg = p.subtle},
    htmlH1 = {fg = groups.headings.h1, style = styles.bold},
    htmlH2 = {fg = groups.headings.h2, style = styles.bold},
    htmlH3 = {fg = groups.headings.h3, style = styles.bold},
    htmlH4 = {fg = groups.headings.h4, style = styles.bold},
    htmlH5 = {fg = groups.headings.h5, style = styles.bold},
    htmlItalic = {style = styles.italic},
    htmlLink = {fg = groups.link},
    htmlTag = {fg = p.subtle},
    htmlTagN = {fg = p.text},
    htmlTagName = {fg = p.foam},

    markdownDelimiter = {fg = p.subtle},
    markdownH1 = {fg = groups.headings.h1, style = styles.bold},
    markdownH1Delimiter = {link = "markdownH1"},
    markdownH2 = {fg = groups.headings.h2, style = styles.bold},
    markdownH2Delimiter = {link = "markdownH2"},
    markdownH3 = {fg = groups.headings.h3, style = styles.bold},
    markdownH3Delimiter = {link = "markdownH3"},
    markdownH4 = {fg = groups.headings.h4, style = styles.bold},
    markdownH4Delimiter = {link = "markdownH4"},
    markdownH5 = {fg = groups.headings.h5, style = styles.bold},
    markdownH5Delimiter = {link = "markdownH5"},
    markdownH6 = {fg = groups.headings.h6, style = styles.bold},
    markdownH6Delimiter = {link = "markdownH6"},
    markdownLinkText = {fg = groups.link, style = "underline"},
    markdownUrl = {link = "markdownLinkText"},

    mkdCode = {fg = p.foam, style = styles.italic},
    mkdCodeDelimiter = {fg = p.rose},
    mkdCodeEnd = {fg = p.foam},
    mkdCodeStart = {fg = p.foam},
    mkdFootnotes = {fg = p.foam},
    mkdID = {fg = p.foam, style = "underline"},
    mkdInlineURL = {fg = groups.link, style = "underline"},
    mkdLink = {link = "mkdInlineURL"},
    mkdLinkDef = {link = "mkdInlineURL"},
    mkdListItemLine = {fg = p.text},
    mkdRule = {fg = p.subtle},
    mkdURL = {link = "mkdInlineURL"},

    DiagnosticError = {fg = groups.error},
    DiagnosticHint = {fg = groups.hint},
    DiagnosticInfo = {fg = groups.info},
    DiagnosticWarn = {fg = groups.warn},
    DiagnosticDefaultError = {fg = groups.error},
    DiagnosticDefaultHint = {fg = groups.hint},
    DiagnosticDefaultInfo = {fg = groups.info},
    DiagnosticDefaultWarn = {fg = groups.warn},
    DiagnosticFloatingError = {fg = groups.error},
    DiagnosticFloatingHint = {fg = groups.hint},
    DiagnosticFloatingInfo = {fg = groups.info},
    DiagnosticFloatingWarn = {fg = groups.warn},
    DiagnosticSignError = {fg = groups.error},
    DiagnosticSignHint = {fg = groups.hint},
    DiagnosticSignInfo = {fg = groups.info},
    DiagnosticSignWarn = {fg = groups.warn},
    DiagnosticStatusLineError = {fg = groups.error, bg = groups.panel},
    DiagnosticStatusLineHint = {fg = groups.hint, bg = groups.panel},
    DiagnosticStatusLineInfo = {fg = groups.info, bg = groups.panel},
    DiagnosticStatusLineWarn = {fg = groups.warn, bg = groups.panel},
    DiagnosticUnderlineError = {sp = groups.error, style = "undercurl"},
    DiagnosticUnderlineHint = {sp = groups.hint, style = "undercurl"},
    DiagnosticUnderlineInfo = {sp = groups.info, style = "undercurl"},
    DiagnosticUnderlineWarn = {sp = groups.warn, style = "undercurl"},
    DiagnosticVirtualTextError = {fg = groups.error},
    DiagnosticVirtualTextHint = {fg = groups.hint},
    DiagnosticVirtualTextInfo = {fg = groups.info},
    DiagnosticVirtualTextWarn = {fg = groups.warn},

    -- healthcheck
    healthError = {fg = groups.error},
    healthSuccess = {fg = groups.info},
    healthWarning = {fg = groups.warn},

    -- TSAttribute = {},
    TSBoolean = {link = "Boolean"},
    TSCharacter = {link = "Character"},
    TSComment = {link = "Comment"},
    TSConditional = {link = "Conditional"},
    TSConstBuiltin = {fg = p.love},
    -- TSConstMacro = {},
    TSConstant = {fg = p.foam},
    TSConstructor = {fg = p.foam},
    -- TSEmphasis = {},
    -- TSError = {},
    -- TSException = {},
    TSField = {fg = p.pink},
    -- TSFloat = {},
    TSFuncBuiltin = {fg = p.love},
    -- TSFuncMacro = {},
    TSFunction = {fg = p.ocean},
    TSInclude = {fg = p.sand},
    TSKeyword = {fg = p.sand},
    -- TSKeywordFunction = {},
    TSKeywordOperator = {fg = p.subtle},
    TSLabel = {fg = p.foam},
    -- TSLiteral = {},
    -- TSMethod = {},
    -- TSNamespace = {},
    -- TSNone = {},
    TSNumber = {link = "Number"},
    TSOperator = {fg = p.subtle},
    TSParameter = {fg = p.iris, style = styles.italic},
    -- TSParameterReference = {},
    TSProperty = {fg = p.iris, style = styles.italic},
    TSPunctBracket = {fg = groups.punctuation},
    TSPunctDelimiter = {fg = groups.punctuation},
    TSPunctSpecial = {fg = groups.punctuation},
    -- TSRepeat = {},
    -- TSStrike = {},
    TSString = {link = "String"},
    TSStringEscape = {fg = p.sand},
    -- TSStringRegex = {},
    TSStringSpecial = {link = "TSString"},
    -- TSSymbol = {},
    TSTag = {fg = p.foam},
    TSTagDelimiter = {fg = p.subtle},
    TSText = {fg = p.text},
    TSTitle = {fg = groups.headings.h1, style = styles.bold},
    TSType = {link = "Type"},
    -- TSTypeBuiltin = {},
    TSURI = {fg = groups.link},
    -- TSUnderline = {},
    TSVariable = {fg = p.text, style = styles.italic},
    TSVariableBuiltin = {fg = p.love},

    -- Treesitter
    ["@annotation"] = {link = "PreProc"},
    ["@attribute"] = {link = "PreProc"},
    ["@boolean"] = {link = "TSBoolean"},
    ["@character"] = {link = "TSCharacter"},
    ["@comment"] = {link = "TSComment"},
    ["@conditional"] = {link = "Conditional"},
    ["@constant"] = {link = "TSConstant"},
    ["@constant.builtin"] = {link = "TSConstBuiltin"},
    ["@constructor"] = {link = "TSConstructor"},
    ["@field"] = {link = "TSField"},
    ["@function"] = {link = "TSFunction"},
    ["@function.builtin"] = {link = "TSFuncBuiltin"},
    ["@include"] = {link = "TSInclude"},
    ["@keyword"] = {link = "TSKeyword"},
    ["@keyword.operator"] = {link = "TSKeywordOperator"},
    ["@label"] = {link = "TSLabel"},
    ["@namespace"] = {link = "Include"},
    ["@number"] = {link = "TSNumber"},
    ["@operator"] = {link = "TSOperator"},
    ["@parameter"] = {link = "TSParameter"},
    ["@property"] = {link = "TSProperty"},
    ["@punctuation.bracket"] = {fg = groups.punctuation},
    ["@punctuation.delimiter"] = {fg = groups.punctuation},
    ["@punctuation.special"] = {fg = groups.punctuation},
    ["@string"] = {link = "TSString"},
    ["@string.escape"] = {link = "TSStringEscape"},
    ["@string.special"] = {link = "TSStringSpecial"},
    ["@symbol"] = {link = "Identifier"},
    ["@tag"] = {link = "TSTag"},
    ["@tag.attribute"] = {link = "@property"},
    ["@tag.delimiter"] = {link = "TSTagDelimiter"},
    ["@text"] = {link = "TSText"},
    ["@text.strong"] = {bold = true},
    ["@text.emphasis"] = {italic = true},
    ["@text.underline"] = {underline = true},
    ["@text.strike"] = {strikethrough = true},
    ["@text.math"] = {link = "Special"},
    ["@text.environment"] = {link = "Macro"},
    ["@text.environment.name"] = {link = "Type"},
    ["@text.title"] = {link = "TSTitle"},
    ["@text.uri"] = {fg = groups.link},
    ["@text.note"] = {link = "SpecialComment"},
    ["@text.warning"] = {link = "Todo"},
    ["@text.danger"] = {link = "WarningMsg"},
    ["@todo"] = {link = "Todo"},
    ["@type"] = {link = "Type"},
    ["@variable"] = {link = "TSVariable"},
    ["@variable.builtin"] = {link = "TSVariableBuiltin"},

    -- vim.lsp.buf.document_highlight()
    LspReferenceText = {bg = p.highlight_med},
    LspReferenceRead = {bg = p.highlight_med},
    LspReferenceWrite = {bg = p.highlight_med},

    -- lsp-highlight-codelens
    LspCodeLens = {fg = p.subtle}, -- virtual text of code lens
    LspCodeLensSeparator = {fg = p.highlight_high}, -- separator between two or more code lens

    -- romgrk/barbar.nvim
    BufferCurrent = {fg = p.text, bg = p.overlay},
    BufferCurrentIndex = {fg = p.text, bg = p.overlay},
    BufferCurrentMod = {fg = p.foam, bg = p.overlay},
    BufferCurrentSign = {fg = p.subtle, bg = p.overlay},
    BufferCurrentTarget = {fg = p.gold, bg = p.overlay},
    BufferInactive = {fg = p.subtle},
    BufferInactiveIndex = {fg = p.subtle},
    BufferInactiveMod = {fg = p.foam},
    BufferInactiveSign = {fg = p.muted},
    BufferInactiveTarget = {fg = p.gold},
    BufferTabpageFill = {fg = groups.background, bg = groups.background},
    BufferVisible = {fg = p.subtle},
    BufferVisibleIndex = {fg = p.subtle},
    BufferVisibleMod = {fg = p.foam},
    BufferVisibleSign = {fg = p.muted},
    BufferVisibleTarget = {fg = p.gold},

    -- lewis6991/gitsigns.nvim
    GitSignsAdd = {fg = groups.git_add},
    GitSignsChange = {fg = groups.git_change},
    GitSignsDelete = {fg = groups.git_delete},
    SignAdd = {link = "GitSignsAdd"},
    SignChange = {link = "GitSignsChange"},
    SignDelete = {link = "GitSignsDelete"},

    -- mvllow/modes.nvim
    ModesCopy = {bg = p.gold},
    ModesDelete = {bg = p.crimson},
    ModesInsert = {bg = p.foam},
    ModesVisual = {bg = p.iris},

    -- kyazdani42/nvim-tree.lua
    NvimTreeEmptyFolderName = {fg = p.muted},
    NvimTreeFileDeleted = {fg = p.crimson},
    NvimTreeFileDirty = {fg = p.rose},
    NvimTreeFileMerge = {fg = p.iris},
    NvimTreeFileNew = {fg = p.foam},
    NvimTreeFileRenamed = {fg = p.sand},
    NvimTreeFileStaged = {fg = p.iris},
    NvimTreeFolderIcon = {fg = p.subtle},
    NvimTreeFolderName = {fg = p.foam},
    NvimTreeGitDeleted = {fg = groups.git_delete},
    NvimTreeGitDirty = {fg = groups.git_dirty},
    NvimTreeGitIgnored = {fg = groups.git_ignore},
    NvimTreeGitMerge = {fg = groups.git_merge},
    NvimTreeGitNew = {fg = groups.git_add},
    NvimTreeGitRenamed = {fg = groups.git_rename},
    NvimTreeGitStaged = {fg = groups.git_stage},
    NvimTreeImageFile = {fg = p.text},
    NvimTreeNormal = {fg = p.text},
    NvimTreeOpenedFile = {fg = p.text, bg = p.highlight_med},
    NvimTreeOpenedFolderName = {link = "NvimTreeFolderName"},
    NvimTreeRootFolder = {fg = p.iris},
    NvimTreeSpecialFile = {link = "NvimTreeNormal"},
    NvimTreeWindowPicker = {fg = groups.background, bg = p.iris},

    -- folke/which-key.nvim
    WhichKey = {fg = p.iris},
    WhichKeyGroup = {fg = p.foam},
    WhichKeySeparator = {fg = p.subtle},
    WhichKeyDesc = {fg = p.gold},
    WhichKeyFloat = {bg = groups.panel},
    WhichKeyValue = {fg = p.rose},

    -- luka-reineke/indent-blankline.nvim
    IndentBlanklineChar = {fg = p.muted},

    -- hrsh7th/nvim-cmp
    CmpItemAbbr = {fg = p.subtle},
    CmpItemAbbrDeprecated = {fg = p.subtle, style = "strikethrough"},
    CmpItemAbbrMatch = {fg = p.text, style = styles.bold},
    CmpItemAbbrMatchFuzzy = {fg = p.text, style = styles.bold},
    CmpItemKind = {fg = p.iris},
    CmpItemKindClass = {fg = p.gold},
    CmpItemKindFunction = {fg = p.iris},
    CmpItemKindInterface = {fg = p.gold},
    CmpItemKindMethod = {fg = p.iris},
    CmpItemKindSnippet = {fg = p.iris},
    CmpItemKindVariable = {fg = p.foam},

    -- TimUntersberger/neogit
    NeogitDiffAddHighlight = {fg = p.foam, bg = p.highlight_med},
    NeogitDiffContextHighlight = {bg = p.highlight_low},
    NeogitDiffDeleteHighlight = {fg = p.crimson, bg = p.highlight_med},
    NeogitHunkHeader = {bg = p.highlight_low},
    NeogitHunkHeaderHighlight = {bg = p.highlight_low},

    -- vimwiki/vimwiki
    VimwikiHR = {fg = p.subtle},
    VimwikiHeader1 = {fg = groups.headings.h1, style = styles.bold},
    VimwikiHeader2 = {fg = groups.headings.h2, style = styles.bold},
    VimwikiHeader3 = {fg = groups.headings.h3, style = styles.bold},
    VimwikiHeader4 = {fg = groups.headings.h4, style = styles.bold},
    VimwikiHeader5 = {fg = groups.headings.h5, style = styles.bold},
    VimwikiHeader6 = {fg = groups.headings.h6, style = styles.bold},
    VimwikiHeaderChar = {fg = p.sand},
    VimwikiLink = {fg = groups.link, style = "underline"},
    VimwikiList = {fg = p.iris},
    VimwikiNoExistsLink = {fg = p.crimson},

    -- nvim-neorg/neorg
    NeorgHeading1Prefix = {fg = groups.headings.h1, style = styles.bold},
    NeorgHeading1Title = {link = "NeorgHeading1Prefix"},
    NeorgHeading2Prefix = {fg = groups.headings.h2, style = styles.bold},
    NeorgHeading2Title = {link = "NeorgHeading2Prefix"},
    NeorgHeading3Prefix = {fg = groups.headings.h3, style = styles.bold},
    NeorgHeading3Title = {link = "NeorgHeading3Prefix"},
    NeorgHeading4Prefix = {fg = groups.headings.h4, style = styles.bold},
    NeorgHeading4Title = {link = "NeorgHeading4Prefix"},
    NeorgHeading5Prefix = {fg = groups.headings.h5, style = styles.bold},
    NeorgHeading5Title = {link = "NeorgHeading5Prefix"},
    NeorgHeading6Prefix = {fg = groups.headings.h6, style = styles.bold},
    NeorgHeading6Title = {link = "NeorgHeading6Prefix"},
    NeorgMarkerTitle = {fg = p.text, style = styles.bold},

    -- tami5/lspsaga.nvim (fork of glepnir/lspsaga.nvim)
    DefinitionCount = {fg = p.rose},
    DefinitionIcon = {fg = p.rose},
    DefintionPreviewTitle = {fg = p.rose, style = styles.bold},
    LspFloatWinBorder = {fg = groups.border},
    LspFloatWinNormal = {bg = groups.background},
    LspSagaAutoPreview = {fg = p.subtle},
    LspSagaCodeActionBorder = {fg = groups.border},
    LspSagaCodeActionContent = {fg = p.foam},
    LspSagaCodeActionTitle = {fg = p.gold, style = styles.bold},
    LspSagaCodeActionTruncateLine = {link = "LspSagaCodeActionBorder"},
    LspSagaDefPreviewBorder = {fg = groups.border},
    LspSagaDiagnosticBorder = {fg = groups.border},
    LspSagaDiagnosticHeader = {fg = p.gold, style = styles.bold},
    LspSagaDiagnosticTruncateLine = {link = "LspSagaDiagnosticBorder"},
    LspSagaDocTruncateLine = {link = "LspSagaHoverBorder"},
    LspSagaFinderSelection = {fg = p.gold},
    LspSagaHoverBorder = {fg = groups.border},
    LspSagaLspFinderBorder = {fg = groups.border},
    LspSagaRenameBorder = {fg = p.sand},
    LspSagaRenamePromptPrefix = {fg = p.love},
    LspSagaShTruncateLine = {link = "LspSagaSignatureHelpBorder"},
    LspSagaSignatureHelpBorder = {fg = p.sand},
    ReferencesCount = {fg = p.rose},
    ReferencesIcon = {fg = p.rose},
    SagaShadow = {bg = p.overlay},
    TargetWord = {fg = p.iris},

    -- ray-x/lsp_signature.nvim
    LspSignatureActiveParameter = {bg = p.overlay},

    -- rlane/pounce.nvim
    PounceAccept = {fg = p.love, bg = p.highlight_high},
    PounceAcceptBest = {fg = p.base, bg = p.gold},
    PounceGap = {link = "Search"},
    PounceMatch = {link = "Search"},

    -- nvim-telescope/telescope.nvim
    TelescopeBorder = {fg = groups.border},
    TelescopeMatching = {fg = p.rose},
    TelescopeNormal = {fg = p.subtle},
    TelescopePromptNormal = {fg = p.text},
    TelescopePromptPrefix = {fg = p.subtle},
    TelescopeSelection = {fg = p.text, bg = p.overlay},
    TelescopeSelectionCaret = {fg = p.rose, bg = p.overlay},
    TelescopeTitle = {fg = p.subtle},

    -- rcarriga/nvim-notify
    NotifyINFOBorder = {fg = p.foam},
    NotifyINFOTitle = {link = "NotifyINFOBorder"},
    NotifyINFOIcon = {link = "NotifyINFOBorder"},
    NotifyWARNBorder = {fg = p.gold},
    NotifyWARNTitle = {link = "NotifyWARNBorder"},
    NotifyWARNIcon = {link = "NotifyWARNBorder"},
    NotifyDEBUGBorder = {fg = p.muted},
    NotifyDEBUGTitle = {link = "NotifyDEBUGBorder"},
    NotifyDEBUGIcon = {link = "NotifyDEBUGBorder"},
    NotifyTRACEBorder = {fg = p.iris},
    NotifyTRACETitle = {link = "NotifyTRACEBorder"},
    NotifyTRACEIcon = {link = "NotifyTRACEBorder"},
    NotifyERRORBorder = {fg = p.crimson},
    NotifyERRORTitle = {link = "NotifyERRORBorder"},
    NotifyERRORIcon = {link = "NotifyERRORBorder"},

    -- rcarriga/nvim-dap-ui
    DapUIVariable = {link = "Normal"},
    DapUIValue = {link = "Normal"},
    DapUIFrameName = {link = "Normal"},
    DapUIThread = {fg = p.gold},
    DapUIWatchesValue = {link = "DapUIThread"},
    DapUIBreakpointsInfo = {link = "DapUIThread"},
    DapUIBreakpointsCurrentLine = {fg = p.gold, style = styles.bold},
    DapUIWatchesEmpty = {fg = p.crimson},
    DapUIWatchesError = {link = "DapUIWatchesEmpty"},
    DapUIBreakpointsDisabledLine = {fg = p.muted},
    DapUISource = {fg = p.iris},
    DapUIBreakpointsPath = {fg = p.foam},
    DapUIScope = {link = "DapUIBreakpointsPath"},
    DapUILineNumber = {link = "DapUIBreakpointsPath"},
    DapUIBreakpointsLine = {link = "DapUIBreakpointsPath"},
    DapUIFloatBorder = {link = "DapUIBreakpointsPath"},
    DapUIStoppedThread = {link = "DapUIBreakpointsPath"},
    DapUIDecoration = {link = "DapUIBreakpointsPath"},
    DapUIModifiedValue = {fg = p.foam, style = styles.bold},

    -- glepnir/dashboard-nvim
    DashboardShortcut = {fg = p.love},
    DashboardHeader = {fg = p.sand},
    DashboardCenter = {fg = p.gold},
    DashboardFooter = {fg = p.iris}
  }

  vim.g.terminal_color_0 = p.overlay -- black
  vim.g.terminal_color_8 = p.subtle -- bright black
  vim.g.terminal_color_1 = p.love -- red
  vim.g.terminal_color_9 = p.love -- bright red
  vim.g.terminal_color_2 = p.sand -- green
  vim.g.terminal_color_10 = p.sand -- bright green
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
end

return M
