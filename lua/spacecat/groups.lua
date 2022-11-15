---@class Highlight
---@field fg string color name or "#RRGGBB"
---@field foreground string same fg, color name or "#RRGGBB"
---@field bg string color name or "#RRGGBB"
---@field background string same bg, color name or "#RRGGBB"
---@field sp string color name or "#RRGGBB"
---@field special string same sg, color name or "#RRGGBB"
---@field blend integer value between 0 and 100
---@field bold boolean
---@field standout boolean
---@field underline boolean
---@field undercurl boolean
---@field underdouble boolean
---@field underdotted boolean
---@field underdashed boolean
---@field strikethrough boolean
---@field italic boolean
---@field reverse boolean
---@field nocombine boolean
---@field link string name of another highlight group to link to, see |:hi-link|.
---@field default string Don't override existing definition |:hi-default|
---@field ctermfg integer Sets foreground of cterm color |highlight-ctermfg|
---@field ctermbg integer Sets background of cterm color |highlight-ctermbg|
---@field cterm table cterm attribute map, like |highlight-args|.

---setup highlight groups
---@param configs DefaultConfig
---@return table<string, Highlight>
---@nodiscard
local function setup(configs)
   local colors = configs.colors
   local endOfBuffer = {
      fg = configs.show_end_of_buffer and colors.visual or colors.bg,
   }

   return {
      Normal = { fg = colors.fg, bg = colors.bg, },
      NormalFloat = { fg = colors.fg, bg = colors.bg, },
      Comment = { fg = colors.comment, italic = configs.italic_comment, },
      Constant = { fg = colors.matcha, },
      String = { fg = colors.purple, },
      Character = { fg = colors.teal, },
      Number = { fg = colors.orange, },
      Boolean = { fg = colors.cyan, },
      Float = { fg = colors.orange, },
      FloatBorder = { fg = colors.white, },
      Operator = { fg = colors.pink, },
      Keyword = { fg = colors.cyan, },
      Keywords = { fg = colors.cyan, },
      Identifier = { fg = colors.cyan, },
      Function = { fg = colors.cyan, },
      Statement = { fg = colors.orange, },
      Conditional = { fg = colors.pink, },
      Repeat = { fg = colors.pink, },
      Label = { fg = colors.cyan, },
      Exception = { fg = colors.orange, },
      PreProc = { fg = colors.matcha, },
      Include = { fg = colors.purple, },
      Define = { fg = colors.pink, },
      Title = { fg = colors.cyan, },
      Macro = { fg = colors.purple, },
      PreCondit = { fg = colors.cyan, },
      Type = { fg = colors.cyan, },
      StorageClass = { fg = colors.white, },
      Structure = { fg = colors.matcha, },
      TypeDef = { fg = colors.matcha, },
      Special = { fg = colors.teal, italic = true },
      SpecialComment = { fg = colors.comment, italic = true, },
      Error = { fg = colors.bright_pink, },
      Todo = { fg = colors.purple, bold = true, italic = true, },
      Underlined = { fg = colors.cyan, underline = true, },

      Cursor = { reverse = true, },
      CursorLineNr = { fg = colors.fg, bold = true, },

      SignColumn = { bg = colors.bg, },

      Conceal = { fg = colors.comment, },
      CursorColumn = { bg = colors.black, },
      CursorLine = { bg = colors.selection, },
      ColorColumn = { bg = colors.selection, },

      StatusLine = { fg = colors.white, bg = colors.black, },
      StatusLineNC = { fg = colors.comment, },
      StatusLineTerm = { fg = colors.white, bg = colors.black, },
      StatusLineTermNC = { fg = colors.comment, },

      Directory = { fg = colors.cyan, },
      DiffAdd = { fg = colors.bg, bg = colors.teal, },
      DiffChange = { fg = colors.orange, },
      DiffDelete = { fg = colors.pink, },
      DiffText = { fg = colors.comment, },

      ErrorMsg = { fg = colors.bright_pink, },
      VertSplit = { fg = colors.black, },
      Folded = { fg = colors.comment, },
      FoldColumn = {},
      Search = { fg = colors.black, bg = colors.orange, },
      IncSearch = { fg = colors.orange, bg = colors.comment, },
      LineNr = { fg = colors.nontext, },
      MatchParen = { fg = colors.fg, underline = true, },
      NonText = { fg = colors.nontext, },
      Pmenu = { fg = colors.white, bg = colors.menu, },
      PmenuSel = { fg = colors.white, bg = colors.purple, },
      PmenuSbar = { bg = colors.bg, },
      PmenuThumb = { bg = colors.purple, },

      Question = { fg = colors.purple, },
      QuickFixLine = { fg = colors.black, bg = colors.matcha, },
      SpecialKey = { fg = colors.nontext, },

      SpellBad = { fg = colors.bright_pink, underline = true, },
      SpellCap = { fg = colors.matcha, },
      SpellLocal = { fg = colors.matcha, },
      SpellRare = { fg = colors.matcha, },

      TabLine = { fg = colors.comment, },
      TabLineSel = { fg = colors.white, },
      TabLineFill = { bg = colors.bg, },
      Terminal = { fg = colors.white, bg = colors.black, },
      Visual = { bg = colors.visual, },
      VisualNOS = { fg = colors.visual, },
      WarningMsg = { fg = colors.matcha, },
      WildMenu = { fg = colors.black, bg = colors.white, },

      EndOfBuffer = endOfBuffer,

      -- TreeSitter
      ['@error'] = { fg = colors.bright_pink, },
      ['@punctuation.delimiter'] = { fg = colors.fg, },
      ['@punctuation.bracket'] = { fg = colors.fg, },
      ['@punctuation.special'] = { fg = colors.fg, },

      ['@constant'] = { fg = colors.purple, },
      ['@constant.builtin'] = { fg = colors.purple, },

      ['@constant.macro'] = { fg = colors.cyan, },
      ['@string.regex'] = { fg = colors.pink, },
      ['@string'] = { fg = colors.purple, },
      ['@string.escape'] = { fg = colors.cyan, },
      ['@character'] = { fg = colors.teal, },
      ['@number'] = { fg = colors.orange, },
      ['@boolean'] = { fg = colors.purple, },
      ['@float'] = { fg = colors.teal, },
      ['@annotation'] = { fg = colors.matcha, },
      ['@attribute'] = { fg = colors.cyan, },
      ['@namespace'] = { fg = colors.orange, },

      ['@function.builtin'] = { fg = colors.cyan, },
      ['@function'] = { fg = colors.pink, },
      ['@function.macro'] = { fg = colors.teal, },
      ['@parameter'] = { fg = colors.orange, },
      ['@parameter.reference'] = { fg = colors.orange, },
      ['@method'] = { fg = colors.teal, },
      ['@field'] = { fg = colors.orange, },
      ['@property'] = { fg = colors.fg, },
      ['@constructor'] = { fg = colors.cyan, },

      ['@conditional'] = { fg = colors.pink, },
      ['@repeat'] = { fg = colors.pink, },
      ['@label'] = { fg = colors.cyan, },

      ['@keyword'] = { fg = colors.pink, },
      ['@keyword.function'] = { fg = colors.sakura, },
      ['@keyword.operator'] = { fg = colors.pink, },
      ['@operator'] = { fg = colors.pink, },
      ['@exception'] = { fg = colors.purple, },
      ['@type'] = { fg = colors.bright_cyan, },
      ['@type.builtin'] = { fg = colors.cyan, italic = true, },
      ['@structure'] = { fg = colors.purple, },
      ['@include'] = { fg = colors.pink, },

      ['@variable'] = { fg = colors.fg, },
      ['@variable.builtin'] = { fg = colors.purple, },

      ['@text'] = { fg = colors.orange, },
      ['@text.strong'] = { fg = colors.orange, bold = true, }, -- bold
      ['@text.emphasis'] = { fg = colors.matcha, italic = true, }, -- italic
      ['@text.underline'] = { fg = colors.orange, },
      ['@text.title'] = { fg = colors.pink, }, -- title
      ['@text.literal'] = { fg = colors.matcha, }, -- inline code
      ['@text.uri'] = { fg = colors.matcha, italic = true, }, -- urls

      ['@tag'] = { fg = colors.cyan, },
      ['@tag.delimiter'] = { fg = colors.white, },

      -- HTML
      htmlArg = { fg = colors.matcha, },
      htmlBold = { fg = colors.matcha, bold = true, },
      htmlEndTag = { fg = colors.white, },
      htmlH1 = { fg = colors.pink, },
      htmlH2 = { fg = colors.pink, },
      htmlH3 = { fg = colors.pink, },
      htmlH4 = { fg = colors.pink, },
      htmlH5 = { fg = colors.pink, },
      htmlH6 = { fg = colors.pink, },
      htmlItalic = { fg = colors.purple, italic = true, },
      htmlLink = { fg = colors.purple, underline = true, },
      htmlSpecialChar = { fg = colors.matcha, },
      htmlSpecialTagName = { fg = colors.cyan, },
      htmlTag = { fg = colors.pink, },
      htmlTagN = { fg = colors.pink, },
      htmlTagName = { fg = colors.cyan, },
      htmlTitle = { fg = colors.white, },

      -- Markdown
      markdownBlockquote = { fg = colors.matcha, italic = true, },
      markdownBold = { fg = colors.orange, bold = true, },
      markdownCode = { fg = colors.teal, },
      markdownCodeBlock = { fg = colors.orange, },
      markdownCodeDelimiter = { fg = colors.pink, },
      markdownH1 = { fg = colors.pink, bold = true, },
      markdownH2 = { fg = colors.pink, bold = true, },
      markdownH3 = { fg = colors.pink, bold = true, },
      markdownH4 = { fg = colors.pink, bold = true, },
      markdownH5 = { fg = colors.pink, bold = true, },
      markdownH6 = { fg = colors.pink, bold = true, },
      markdownHeadingDelimiter = { fg = colors.pink, },
      markdownHeadingRule = { fg = colors.comment, },
      markdownId = { fg = colors.purple, },
      markdownIdDeclaration = { fg = colors.cyan, },
      markdownIdDelimiter = { fg = colors.purple, },
      markdownItalic = { fg = colors.matcha, italic = true, },
      markdownLinkDelimiter = { fg = colors.purple, },
      markdownLinkText = { fg = colors.pink, },
      markdownListMarker = { fg = colors.cyan, },
      markdownOrdepinkListMarker = { fg = colors.pink, },
      markdownRule = { fg = colors.comment, },

      --  Diff
      diffAdded = { fg = colors.teal, },
      diffRemoved = { fg = colors.pink, },
      diffFileId = { fg = colors.matcha, bold = true, reverse = true, },
      diffFile = { fg = colors.nontext, },
      diffNewFile = { fg = colors.teal, },
      diffOldFile = { fg = colors.pink, },

      debugPc = { bg = colors.cyan, },
      debugBreakpoint = { fg = colors.pink, reverse = true, },

      -- Git Signs
      GitSignsAdd = { fg = colors.bright_teal, },
      GitSignsChange = { fg = colors.cyan, },
      GitSignsDelete = { fg = colors.bright_pink, },
      GitSignsAddLn = { fg = colors.black, bg = colors.bright_teal, },
      GitSignsChangeLn = { fg = colors.black, bg = colors.cyan, },
      GitSignsDeleteLn = { fg = colors.black, bg = colors.bright_pink, },

      -- Telescope
      TelescopePromptBorder = { fg = colors.comment, },
      TelescopeResultsBorder = { fg = colors.comment, },
      TelescopePreviewBorder = { fg = colors.comment, },
      TelescopeSelection = { fg = colors.white, bg = colors.selection, },
      TelescopeMultiSelection = { fg = colors.purple, bg = colors.selection, },
      TelescopeNormal = { fg = colors.fg, bg = colors.bg, },
      TelescopeMatching = { fg = colors.teal, },
      TelescopePromptPrefix = { fg = colors.purple, },

      -- NvimTree
      NvimTreeNormal = { fg = colors.fg, bg = colors.menu, },
      NvimTreeVertSplit = { fg = colors.bg, bg = colors.bg, },
      NvimTreeRootFolder = { fg = colors.fg, bold = true, },
      NvimTreeGitDirty = { fg = colors.matcha, },
      NvimTreeGitNew = { fg = colors.bright_teal, },
      NvimTreeImageFile = { fg = colors.pink, },
      NvimTreeFolderIcon = { fg = colors.purple, },
      NvimTreeIndentMarker = { fg = colors.nontext, },
      NvimTreeEmptyFolderName = { fg = colors.comment, },
      NvimTreeFolderName = { fg = colors.fg, },
      NvimTreeSpecialFile = { fg = colors.pink, underline = true, },
      NvimTreeOpenedFolderName = { fg = colors.fg, },
      NvimTreeCursorLine = { bg = colors.selection, },
      NvimTreeIn = { bg = colors.selection, },

      NvimTreeEndOfBuffer = endOfBuffer,

      -- NeoTree
      NeoTreeNormal = { fg = colors.fg },
      NeoTreeNormalNC = { fg = colors.fg },
      NeoTreeDirectoryName = { fg = colors.fg },
      NeoTreeGitUnstaged = { fg = colors.bright_purple },
      NeoTreeGitModified = { fg = colors.bright_purple },
      NeoTreeGitUntracked = { fg = colors.bright_teal },
      NeoTreeDirectoryIcon = { fg = colors.purple },
      NeoTreeIndentMarker = { fg = colors.nontext },
      NeoTreeDotfile = { fg = colors.comment },

      -- Bufferline
      BufferLineIndicatorSelected = { fg = colors.purple, },
      BufferLineFill = { bg = colors.black, },

      -- LSP
      DiagnosticError = { fg = colors.pink, },
      DiagnosticWarn = { fg = colors.matcha, },
      DiagnosticInfo = { fg = colors.cyan, },
      DiagnosticHint = { fg = colors.cyan, },
      DiagnosticUnderlineError = { undercurl = true, sp = colors.pink, },
      DiagnosticUnderlineWarn = { undercurl = true, sp = colors.matcha, },
      DiagnosticUnderlineInfo = { undercurl = true, sp = colors.cyan, },
      DiagnosticUnderlineHint = { undercurl = true, sp = colors.cyan, },
      DiagnosticSignError = { fg = colors.pink, },
      DiagnosticSignWarn = { fg = colors.matcha, },
      DiagnosticSignInfo = { fg = colors.cyan, },
      DiagnosticSignHint = { fg = colors.cyan, },
      DiagnosticFloatingError = { fg = colors.pink, },
      DiagnosticFloatingWarn = { fg = colors.matcha, },
      DiagnosticFloatingInfo = { fg = colors.cyan, },
      DiagnosticFloatingHint = { fg = colors.cyan, },
      DiagnosticVirtualTextError = { fg = colors.pink, },
      DiagnosticVirtualTextWarn = { fg = colors.matcha, },
      DiagnosticVirtualTextInfo = { fg = colors.cyan, },
      DiagnosticVirtualTextHint = { fg = colors.cyan, },

      LspDiagnosticsDefaultError = { fg = colors.pink, },
      LspDiagnosticsDefaultWarning = { fg = colors.matcha, },
      LspDiagnosticsDefaultInformation = { fg = colors.cyan, },
      LspDiagnosticsDefaultHint = { fg = colors.cyan, },
      LspDiagnosticsUnderlineError = { fg = colors.pink, undercurl = true, },
      LspDiagnosticsUnderlineWarning = { fg = colors.matcha, undercurl = true, },
      LspDiagnosticsUnderlineInformation = { fg = colors.cyan, undercurl = true, },
      LspDiagnosticsUnderlineHint = { fg = colors.cyan, undercurl = true, },
      LspReferenceText = { fg = colors.orange, },
      LspReferenceRead = { fg = colors.orange, },
      LspReferenceWrite = { fg = colors.orange, },

      --LSP Saga
      LspFloatWinNormal = { fg = colors.fg, },
      LspFloatWinBorder = { fg = colors.comment, },
      LspSagaHoverBorder = { fg = colors.comment, },
      LspSagaSignatureHelpBorder = { fg = colors.comment, },
      LspSagaCodeActionBorder = { fg = colors.comment, },
      LspSagaDefPreviewBorder = { fg = colors.comment, },
      LspLinesDiagBorder = { fg = colors.comment, },
      LspSagaRenameBorder = { fg = colors.comment, },
      LspSagaBorderTitle = { fg = colors.menu, },
      LSPSagaDiagnosticTruncateLine = { fg = colors.comment, },
      LspSagaDiagnosticBorder = { fg = colors.comment, },
      LspSagaShTruncateLine = { fg = colors.comment, },
      LspSagaDocTruncateLine = { fg = colors.comment, },
      LspSagaLspFinderBorder = { fg = colors.comment, },

      -- IndentBlankLine
      IndentBlanklineContextChar = { fg = colors.bright_pink, nocombine = true, },

      -- Nvim compe
      CmpItemAbbrDeprecated = { fg = colors.white, bg = colors.menu, },
      CmpItemAbbrMatch = { fg = colors.cyan, bg = colors.menu, },

      --barbar
      BufferCurrentTarget = { fg = colors.pink, },
      BufferVisibleTarget = { fg = colors.pink, },
      BufferInactiveTarget = { fg = colors.pink, },

      -- Compe
      CompeDocumentation = { link = "Pmenu" },
      CompeDocumentationBorder = { link = "Pmenu" },

      -- Cmp
      CmpItemKind = { link = "Pmenu" },
      CmpItemAbbr = { link = "Pmenu" },
      CmpItemKindMethod = { link = "TSMethod" },
      CmpItemKindText = { link = "TSText" },
      CmpItemKindFunction = { link = "TSFunction" },
      CmpItemKindConstructor = { link = "TSType" },
      CmpItemKindVariable = { link = "TSVariable" },
      CmpItemKindClass = { link = "TSType" },
      CmpItemKindInterface = { link = "TSType" },
      CmpItemKindModule = { link = "TSNamespace" },
      CmpItemKindProperty = { link = "TSProperty" },
      CmpItemKindOperator = { link = "TSOperator" },
      CmpItemKindReference = { link = "TSParameterReference" },
      CmpItemKindUnit = { link = "TSField" },
      CmpItemKindValue = { link = "TSField" },
      CmpItemKindField = { link = "TSField" },
      CmpItemKindEnum = { link = "TSField" },
      CmpItemKindKeyword = { link = "TSKeyword" },
      CmpItemKindSnippet = { link = "TSText" },
      CmpItemKindColor = { link = "cssColor" },
      CmpItemKindFile = { link = "TSURI" },
      CmpItemKindFolder = { link = "TSURI" },
      CmpItemKindEvent = { link = "TSConstant" },
      CmpItemKindEnumMember = { link = "TSField" },
      CmpItemKindConstant = { link = "TSConstant" },
      CmpItemKindStruct = { link = "TSStructure" },
      CmpItemKindTypeParameter = { link = "TSParameter" },

      -- navic
      NavicIconsFile = { link = "CmpItemKindFile" },
      NavicIconsModule = { link = "CmpItemKindModule" },
      NavicIconsNamespace = { link = "CmpItemKindModule" },
      NavicIconsPackage = { link = "CmpItemKindModule" },
      NavicIconsClass = { link = "CmpItemKindClass" },
      NavicIconsMethod = { link = "CmpItemKindMethod" },
      NavicIconsProperty = { link = "CmpItemKindProperty" },
      NavicIconsField = { link = "CmpItemKindField" },
      NavicIconsConstructor = { link = "CmpItemKindConstructor" },
      NavicIconsEnum = { link = "CmpItemKindEnum" },
      NavicIconsInterface = { link = "CmpItemKindInterface" },
      NavicIconsFunction = { link = "CmpItemKindFunction" },
      NavicIconsVariable = { link = "CmpItemKindVariable" },
      NavicIconsConstant = { link = "CmpItemKindConstant" },
      NavicIconsString = { link = "String" },
      NavicIconsNumber = { link = "Number" },
      NavicIconsBoolean = { link = "Boolean" },
      NavicIconsArray = { link = "CmpItemKindClass" },
      NavicIconsObject = { link = "CmpItemKindClass" },
      NavicIconsKey = { link = "CmpItemKindKeyword" },
      NavicIconsKeyword = { link = "CmpItemKindKeyword" },
      NavicIconsNull = { fg = "blue" },
      NavicIconsEnumMember = { link = "CmpItemKindEnumMember" },
      NavicIconsStruct = { link = "CmpItemKindStruct" },
      NavicIconsEvent = { link = "CmpItemKindEvent" },
      NavicIconsOperator = { link = "CmpItemKindOperator" },
      NavicIconsTypeParameter = { link = "CmpItemKindTypeParameter" },
      NavicText = { fg = 'gray' },
      NavicSeparator = { fg = 'gray' },


      -- TS rainbow colors
      rainbowcol1 = { fg = colors.pink, },
      rainbowcol2 = { fg = colors.teal, },
      rainbowcol3 = { fg = colors.matcha, },
      rainbowcol4 = { fg = colors.purple, },
      rainbowcol5 = { fg = colors.pink, },
      rainbowcol6 = { fg = colors.cyan, },
      rainbowcol7 = { fg = colors.white, },
   }
end

return {
   setup = setup,
}

