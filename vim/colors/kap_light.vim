set background=light
hi clear
if exists('syntax_on')
    syntax reset
endif
let g:colors_name='kap_light'
hi Normal guifg=#121212 ctermfg=233 guibg=#fff9d7 ctermbg=230 gui=NONE cterm=NONE
hi Visual guifg=#121212 ctermfg=233 guibg=#d5c4a1 ctermbg=187 gui=bold,underline cterm=bold,underline
hi Underline guifg=#665c54 ctermfg=59 guibg=NONE ctermbg=NONE gui=underline cterm=underline
hi Search guifg=NONE ctermfg=NONE guibg=#bdae93 ctermbg=144 gui=bold,italic cterm=bold,italic
hi IncSearch guifg=NONE ctermfg=NONE guibg=#bdae93 ctermbg=144 gui=bold,italic cterm=bold,italic
hi MatchParen guifg=#928374 ctermfg=244 guibg=NONE ctermbg=NONE gui=bold cterm=bold
hi Delimiter guifg=#303030 ctermfg=236 guibg=NONE ctermbg=NONE gui=NONE cterm=NONE
hi rustModPathSep guifg=#303030 ctermfg=236 guibg=NONE ctermbg=NONE gui=NONE cterm=NONE
hi jsonBraces guifg=#303030 ctermfg=236 guibg=NONE ctermbg=NONE gui=NONE cterm=NONE
hi markdownUrlDelimiter guifg=#303030 ctermfg=236 guibg=NONE ctermbg=NONE gui=NONE cterm=NONE
hi markdownLinkDelimiter guifg=#303030 ctermfg=236 guibg=NONE ctermbg=NONE gui=NONE cterm=NONE
hi markdownLinkTextDelimiter guifg=#303030 ctermfg=236 guibg=NONE ctermbg=NONE gui=NONE cterm=NONE
hi markdownCodeDelimiter guifg=#303030 ctermfg=236 guibg=NONE ctermbg=NONE gui=NONE cterm=NONE
hi Folded guifg=#303030 ctermfg=236 guibg=#fff9d7 ctermbg=230 gui=italic cterm=italic
hi FoldColumn guifg=#303030 ctermfg=236 guibg=#fff9d7 ctermbg=230 gui=italic cterm=italic
hi SignColumn guifg=#303030 ctermfg=236 guibg=#fff9d7 ctermbg=230 gui=NONE cterm=NONE
hi LineNr guifg=#303030 ctermfg=236 guibg=#fff9d7 ctermbg=230 gui=NONE cterm=NONE
hi SignifySignAdd guifg=#07962a ctermfg=28 guibg=NONE ctermbg=NONE gui=NONE cterm=NONE
hi SignifyLineAdd guifg=#07962a ctermfg=28 guibg=NONE ctermbg=NONE gui=NONE cterm=NONE
hi SignifySignChange guifg=#3a94c5 ctermfg=68 guibg=NONE ctermbg=NONE gui=NONE cterm=NONE
hi SignifyLineChange guifg=#3a94c5 ctermfg=68 guibg=NONE ctermbg=NONE gui=NONE cterm=NONE
hi SignifySignDelete guifg=#d80006 ctermfg=160 guibg=NONE ctermbg=NONE gui=NONE cterm=NONE
hi SignifyLineDelete guifg=#d80006 ctermfg=160 guibg=NONE ctermbg=NONE gui=NONE cterm=NONE
hi Cursor guifg=NONE ctermfg=NONE guibg=NONE ctermbg=NONE gui=reverse cterm=reverse
hi vCurosr guifg=NONE ctermfg=NONE guibg=NONE ctermbg=NONE gui=reverse cterm=reverse
hi iCursor guifg=NONE ctermfg=NONE guibg=NONE ctermbg=NONE gui=reverse cterm=reverse
hi lCursor guifg=NONE ctermfg=NONE guibg=NONE ctermbg=NONE gui=reverse cterm=reverse
hi CursorLine guifg=NONE ctermfg=NONE guibg=#ebdbb2 ctermbg=223 gui=NONE cterm=NONE
hi CursorColumn guifg=NONE ctermfg=NONE guibg=#ebdbb2 ctermbg=223 gui=NONE cterm=NONE
hi CursorLineNr guifg=#121212 ctermfg=233 guibg=#ebdbb2 ctermbg=223 gui=italic cterm=italic
hi Pmenu guifg=#121212 ctermfg=233 guibg=#d5c4a1 ctermbg=187 gui=NONE cterm=NONE
hi PmenuSel guifg=#121212 ctermfg=233 guibg=#d1d187 ctermbg=186 gui=bold,italic cterm=bold,italic
hi WildMenu guifg=#121212 ctermfg=233 guibg=#d1d187 ctermbg=186 gui=bold,italic cterm=bold,italic
hi PmenuSbar guifg=NONE ctermfg=NONE guibg=#928374 ctermbg=244 gui=NONE cterm=NONE
hi PmenuThumb guifg=NONE ctermfg=NONE guibg=#7c6f64 ctermbg=242 gui=NONE cterm=NONE
hi DiffAdd guifg=#121212 ctermfg=233 guibg=#d1d187 ctermbg=186 gui=NONE cterm=NONE
hi diffAdded guifg=#121212 ctermfg=233 guibg=#d1d187 ctermbg=186 gui=NONE cterm=NONE
hi DiffChange guifg=#121212 ctermfg=233 guibg=#d7e7e9 ctermbg=254 gui=NONE cterm=NONE
hi diffChangeed guifg=#121212 ctermfg=233 guibg=#d7e7e9 ctermbg=254 gui=NONE cterm=NONE
hi DiffDelete guifg=#121212 ctermfg=233 guibg=#ffb090 ctermbg=216 gui=NONE cterm=NONE
hi diffRemoved guifg=#121212 ctermfg=233 guibg=#ffb090 ctermbg=216 gui=NONE cterm=NONE
hi DiffText guifg=#121212 ctermfg=233 guibg=#d7e7e9 ctermbg=254 gui=bold,underline cterm=bold,underline
hi LspDiagnisticsDefaultError guifg=#ffb090 ctermfg=216 guibg=NONE ctermbg=NONE gui=NONE cterm=NONE
hi LspDiagnisticsUnderlineError guifg=#ffb090 ctermfg=216 guibg=NONE ctermbg=NONE gui=NONE cterm=NONE
hi ALEError guifg=#ffb090 ctermfg=216 guibg=NONE ctermbg=NONE gui=NONE cterm=NONE
hi ALEErrorSign guifg=#ffb090 ctermfg=216 guibg=NONE ctermbg=NONE gui=NONE cterm=NONE
hi LspDiagnisticsDefaultWarning guifg=#dfa000 ctermfg=178 guibg=NONE ctermbg=NONE gui=NONE cterm=NONE
hi LspDiagnisticsUnderlineWarning guifg=#dfa000 ctermfg=178 guibg=NONE ctermbg=NONE gui=NONE cterm=NONE
hi ALEWarning guifg=#dfa000 ctermfg=178 guibg=NONE ctermbg=NONE gui=NONE cterm=NONE
hi ALEWarningSign guifg=#dfa000 ctermfg=178 guibg=NONE ctermbg=NONE gui=NONE cterm=NONE
hi LspDiagnisticsDefaultInformation guifg=#d1d187 ctermfg=186 guibg=NONE ctermbg=NONE gui=NONE cterm=NONE
hi LspDiagnisticsUnderlineInformation guifg=#d1d187 ctermfg=186 guibg=NONE ctermbg=NONE gui=NONE cterm=NONE
hi ALEInfo guifg=#d1d187 ctermfg=186 guibg=NONE ctermbg=NONE gui=NONE cterm=NONE
hi ALEErrorSign guifg=#d1d187 ctermfg=186 guibg=NONE ctermbg=NONE gui=NONE cterm=NONE
hi LspDiagnisticsDefaultHint guifg=#3a94c5 ctermfg=68 guibg=NONE ctermbg=NONE gui=NONE cterm=NONE
hi LspDiagnisticsUnderlineHint guifg=#3a94c5 ctermfg=68 guibg=NONE ctermbg=NONE gui=NONE cterm=NONE
hi SpellCap guifg=NONE ctermfg=NONE guibg=NONE ctermbg=NONE gui=bold,undercurl cterm=bold,undercurl
hi SpellBad guifg=NONE ctermfg=NONE guibg=NONE ctermbg=NONE gui=undercurl cterm=undercurl
hi SpellLocal guifg=NONE ctermfg=NONE guibg=NONE ctermbg=NONE gui=undercurl cterm=undercurl
hi SpellRare guifg=NONE ctermfg=NONE guibg=NONE ctermbg=NONE gui=undercurl cterm=undercurl
hi Error guifg=#121212 ctermfg=233 guibg=#d80006 ctermbg=160 gui=bold cterm=bold
hi ErorMsg guifg=#121212 ctermfg=233 guibg=#d80006 ctermbg=160 gui=bold cterm=bold
hi ExtraWhiteSpace guifg=#121212 ctermfg=233 guibg=#d80006 ctermbg=160 gui=bold cterm=bold
hi WarningMsg guifg=#d80006 ctermfg=160 guibg=NONE ctermbg=NONE gui=NONE cterm=NONE
hi Question guifg=#f57d26 ctermfg=208 guibg=NONE ctermbg=NONE gui=bold cterm=bold
hi MoreMsg guifg=#dfa000 ctermfg=178 guibg=NONE ctermbg=NONE gui=bold cterm=bold
hi ModeMsg guifg=#dfa000 ctermfg=178 guibg=NONE ctermbg=NONE gui=bold cterm=bold
hi Keyword guifg=#000000 ctermfg=16 guibg=NONE ctermbg=NONE gui=bold cterm=bold
hi Statement guifg=#000000 ctermfg=16 guibg=NONE ctermbg=NONE gui=bold cterm=bold
hi Conditional guifg=#000000 ctermfg=16 guibg=NONE ctermbg=NONE gui=bold cterm=bold
hi Repeat guifg=#000000 ctermfg=16 guibg=NONE ctermbg=NONE gui=bold cterm=bold
hi Label guifg=#000000 ctermfg=16 guibg=NONE ctermbg=NONE gui=bold cterm=bold
hi Exception guifg=#000000 ctermfg=16 guibg=NONE ctermbg=NONE gui=bold cterm=bold
hi pythonOperator guifg=#000000 ctermfg=16 guibg=NONE ctermbg=NONE gui=bold cterm=bold
hi Operator guifg=#121212 ctermfg=233 guibg=NONE ctermbg=NONE gui=NONE cterm=NONE
hi Structure guifg=#000000 ctermfg=16 guibg=NONE ctermbg=NONE gui=bold cterm=bold
hi pythonInclude guifg=#000000 ctermfg=16 guibg=NONE ctermbg=NONE gui=bold cterm=bold
hi pythonImport guifg=#000000 ctermfg=16 guibg=NONE ctermbg=NONE gui=bold cterm=bold
hi Function guifg=NONE ctermfg=NONE guibg=NONE ctermbg=NONE gui=italic cterm=italic
hi luaFunction guifg=NONE ctermfg=NONE guibg=NONE ctermbg=NONE gui=italic cterm=italic
hi pythonBuiltinFunction guifg=NONE ctermfg=NONE guibg=NONE ctermbg=NONE gui=italic cterm=italic
hi Identifier guifg=NONE ctermfg=NONE guibg=NONE ctermbg=NONE gui=italic cterm=italic
hi pythonClass guifg=NONE ctermfg=NONE guibg=NONE ctermbg=NONE gui=italic cterm=italic
hi rustModPath guifg=NONE ctermfg=NONE guibg=NONE ctermbg=NONE gui=italic cterm=italic
hi justRecipeBody guifg=NONE ctermfg=NONE guibg=NONE ctermbg=NONE gui=italic cterm=italic
hi Macro guifg=NONE ctermfg=NONE guibg=NONE ctermbg=NONE gui=italic cterm=italic
hi rustPanic guifg=NONE ctermfg=NONE guibg=NONE ctermbg=NONE gui=italic cterm=italic
hi rustAssert guifg=NONE ctermfg=NONE guibg=NONE ctermbg=NONE gui=italic cterm=italic
hi Constant guifg=#121212 ctermfg=233 guibg=NONE ctermbg=NONE gui=italic cterm=italic
hi pythonClassVar guifg=#121212 ctermfg=233 guibg=NONE ctermbg=NONE gui=italic cterm=italic
hi rustSelf guifg=#121212 ctermfg=233 guibg=NONE ctermbg=NONE gui=italic cterm=italic
hi justParameter guifg=#121212 ctermfg=233 guibg=NONE ctermbg=NONE gui=italic cterm=italic
hi justName guifg=#121212 ctermfg=233 guibg=NONE ctermbg=NONE gui=italic cterm=italic
hi Character guifg=#121212 ctermfg=233 guibg=NONE ctermbg=NONE gui=bold cterm=bold
hi Number guifg=#121212 ctermfg=233 guibg=NONE ctermbg=NONE gui=bold cterm=bold
hi Float guifg=#121212 ctermfg=233 guibg=NONE ctermbg=NONE gui=bold cterm=bold
hi Boolean guifg=#121212 ctermfg=233 guibg=NONE ctermbg=NONE gui=bold,italic cterm=bold,italic
hi pythonNone guifg=#121212 ctermfg=233 guibg=NONE ctermbg=NONE gui=bold,italic cterm=bold,italic
hi rustEnumVariant guifg=#121212 ctermfg=233 guibg=NONE ctermbg=NONE gui=bold,italic cterm=bold,italic
hi Special guifg=#303030 ctermfg=236 guibg=NONE ctermbg=NONE gui=NONE cterm=NONE
hi SpecialChar guifg=#303030 ctermfg=236 guibg=NONE ctermbg=NONE gui=NONE cterm=NONE
hi SpecialKey guifg=#303030 ctermfg=236 guibg=NONE ctermbg=NONE gui=NONE cterm=NONE
hi Comment guifg=#928374 ctermfg=244 guibg=NONE ctermbg=NONE gui=italic cterm=italic
hi rustCommentLineDoc guifg=#928374 ctermfg=244 guibg=NONE ctermbg=NONE gui=italic cterm=italic
hi Todo guifg=#000000 ctermfg=16 guibg=NONE ctermbg=NONE gui=bold cterm=bold
hi Character guifg=#665c54 ctermfg=59 guibg=NONE ctermbg=NONE gui=italic cterm=italic
hi String guifg=#665c54 ctermfg=59 guibg=NONE ctermbg=NONE gui=italic cterm=italic
hi jsonKeyword guifg=#665c54 ctermfg=59 guibg=NONE ctermbg=NONE gui=italic cterm=italic
hi jsonString guifg=#665c54 ctermfg=59 guibg=NONE ctermbg=NONE gui=italic cterm=italic
hi Type guifg=#303030 ctermfg=236 guibg=NONE ctermbg=NONE gui=bold,italic,NONE cterm=bold,italic,NONE
hi Typedef guifg=#303030 ctermfg=236 guibg=NONE ctermbg=NONE gui=bold,italic,NONE cterm=bold,italic,NONE
hi StorageClass guifg=#303030 ctermfg=236 guibg=NONE ctermbg=NONE gui=bold,italic cterm=bold,italic
hi PreProc guifg=#665c54 ctermfg=59 guibg=NONE ctermbg=NONE gui=italic cterm=italic
hi Include guifg=#665c54 ctermfg=59 guibg=NONE ctermbg=NONE gui=italic cterm=italic
hi Define guifg=#665c54 ctermfg=59 guibg=NONE ctermbg=NONE gui=italic cterm=italic
hi PreCondit guifg=#665c54 ctermfg=59 guibg=NONE ctermbg=NONE gui=italic cterm=italic
hi pythonDecoratorName guifg=#665c54 ctermfg=59 guibg=NONE ctermbg=NONE gui=italic cterm=italic
hi pythonDottedName guifg=#665c54 ctermfg=59 guibg=NONE ctermbg=NONE gui=italic cterm=italic
hi markdownH1 guifg=#000000 ctermfg=16 guibg=NONE ctermbg=NONE gui=bold cterm=bold
hi markdownH2 guifg=#000000 ctermfg=16 guibg=NONE ctermbg=NONE gui=bold cterm=bold
hi markdownH3 guifg=#000000 ctermfg=16 guibg=NONE ctermbg=NONE gui=bold cterm=bold
hi markdownH4 guifg=#000000 ctermfg=16 guibg=NONE ctermbg=NONE gui=bold cterm=bold
hi markdownH1markdownH5 guifg=#000000 ctermfg=16 guibg=NONE ctermbg=NONE gui=bold cterm=bold
hi markdownH6 guifg=#000000 ctermfg=16 guibg=NONE ctermbg=NONE gui=bold cterm=bold
hi markdownCode guifg=#121212 ctermfg=233 guibg=NONE ctermbg=NONE gui=NONE cterm=NONE
hi markdownCodeBlock guifg=#121212 ctermfg=233 guibg=NONE ctermbg=NONE gui=NONE cterm=NONE
hi markdownCodeDelimiter guifg=#121212 ctermfg=233 guibg=NONE ctermbg=NONE gui=NONE cterm=NONE
hi markdownBold guifg=NONE ctermfg=NONE guibg=NONE ctermbg=NONE gui=bold cterm=bold
hi mardownItalic guifg=NONE ctermfg=NONE guibg=NONE ctermbg=NONE gui=italic cterm=italic
hi markdownListMarker guifg=#303030 ctermfg=236 guibg=NONE ctermbg=NONE gui=NONE cterm=NONE
hi markdownOrderedListMarker guifg=#303030 ctermfg=236 guibg=NONE ctermbg=NONE gui=NONE cterm=NONE
hi markdownLinkText guifg=#303030 ctermfg=236 guibg=NONE ctermbg=NONE gui=NONE cterm=NONE
hi markdownUrl guifg=#303030 ctermfg=236 guibg=NONE ctermbg=NONE gui=NONE cterm=NONE
hi markdownUrlTitleDelimiter guifg=#303030 ctermfg=236 guibg=NONE ctermbg=NONE gui=NONE cterm=NONE
hi markdwonBlockquote guifg=#303030 ctermfg=236 guibg=NONE ctermbg=NONE gui=NONE cterm=NONE
hi markdownHeadingRule guifg=#303030 ctermfg=236 guibg=NONE ctermbg=NONE gui=NONE cterm=NONE
hi markdownRule guifg=#303030 ctermfg=236 guibg=NONE ctermbg=NONE gui=NONE cterm=NONE
hi StatusLineRight guifg=#121212 ctermfg=233 guibg=#a89984 ctermbg=138 gui=NONE cterm=NONE
hi StatusLineNormal guifg=#121212 ctermfg=233 guibg=#3a94c5 ctermbg=68 gui=bold cterm=bold
hi StatusLineTerm guifg=#121212 ctermfg=233 guibg=#f57d26 ctermbg=208 gui=bold cterm=bold
hi StatusLineVisual guifg=#121212 ctermfg=233 guibg=#35a77c ctermbg=72 gui=NONE cterm=NONE
hi StatusLineMiddle guifg=#121212 ctermfg=233 guibg=#ebdbb2 ctermbg=223 gui=NONE cterm=NONE
hi StatusLineFarRight guifg=#121212 ctermfg=233 guibg=#bdae93 ctermbg=144 gui=NONE cterm=NONE
hi NonText guifg=#a89984 ctermfg=138 guibg=NONE ctermbg=NONE gui=NONE cterm=NONE
hi StatusLineInsert guifg=#121212 ctermfg=233 guibg=#07962a ctermbg=28 gui=bold cterm=bold
hi StatusLineReplace guifg=#121212 ctermfg=233 guibg=#ffb090 ctermbg=216 gui=bold cterm=bold
hi StatusLineLeft guifg=#121212 ctermfg=233 guibg=#a89984 ctermbg=138 gui=NONE cterm=NONE
hi justBodyText guifg=#121212 ctermfg=233 guibg=NONE ctermbg=NONE gui=NONE cterm=NONE
hi VertSplit guifg=NONE ctermfg=NONE guibg=NONE ctermbg=NONE gui=NONE cterm=NONE
hi VisualNOS guifg=NONE ctermfg=NONE guibg=#ebdbb2 ctermbg=223 gui=bold cterm=bold
hi Title guifg=#000000 ctermfg=16 guibg=NONE ctermbg=NONE gui=bold cterm=bold
hi Directory guifg=#000000 ctermfg=16 guibg=NONE ctermbg=NONE gui=bold cterm=bold
hi Conceal guifg=#928374 ctermfg=244 guibg=NONE ctermbg=NONE gui=NONE cterm=NONE
hi StatusLineSelect guifg=#121212 ctermfg=233 guibg=#35a77c ctermbg=72 gui=bold cterm=bold
hi StatusLineCommand guifg=#121212 ctermfg=233 guibg=#dfa000 ctermbg=178 gui=bold cterm=bold
hi StatusLineInactive guifg=#121212 ctermfg=233 guibg=#bdae93 ctermbg=144 gui=NONE cterm=NONE