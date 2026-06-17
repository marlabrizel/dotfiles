-- Polarized colorscheme for Neovim (Lua port)
-- Based on http://ethanschoonover.com/solarized
-- Original vim version by marla

vim.cmd("hi clear")
if vim.fn.exists("syntax_on") then
  vim.cmd("syntax reset")
end

vim.o.background = "dark"
vim.g.colors_name = "polarized"

-- Polarized Palette
-- text: #839496
-- bold text: #93a1a1
-- selection: #053641
-- cursor: #d33682
-- background: #00202a (98%)

-- Helper function to set highlights
local function hi(group, opts)
  local cmd = "hi " .. group
  if opts.cterm then cmd = cmd .. " cterm=" .. opts.cterm end
  if opts.ctermbg then cmd = cmd .. " ctermbg=" .. opts.ctermbg end
  if opts.ctermfg then cmd = cmd .. " ctermfg=" .. opts.ctermfg end
  vim.cmd(cmd)
end

local function link(from, to)
  vim.cmd("hi def link " .. from .. " " .. to)
end

-- Editor groups
hi("Normal",           { cterm = "NONE", ctermbg = "NONE",        ctermfg = "Blue" })
hi("Cursor",           { cterm = "NONE", ctermbg = "DarkMagenta", ctermfg = "NONE" })
hi("Visual",           { cterm = "NONE", ctermbg = "Black",       ctermfg = "NONE" })
hi("CursorLine",       { cterm = "NONE", ctermbg = "Black",       ctermfg = "NONE" })
hi("CursorColumn",     { cterm = "NONE", ctermbg = "Black",       ctermfg = "NONE" })
hi("ColorColumn",      { cterm = "NONE", ctermbg = "Black",       ctermfg = "NONE" })
hi("VertSplit",        { cterm = "NONE", ctermbg = "DarkGrey",    ctermfg = "DarkGrey" })
hi("StatusLine",       { cterm = "NONE", ctermbg = "DarkGrey",    ctermfg = "Cyan" })
hi("TabLineSel",       { cterm = "NONE", ctermbg = "DarkGrey",    ctermfg = "Cyan" })
hi("StatusLineNC",     { cterm = "NONE", ctermbg = "DarkGrey",    ctermfg = "Green" })
hi("TabLine",          { cterm = "NONE", ctermbg = "DarkGrey",    ctermfg = "Green" })
hi("TabLineFill",      { cterm = "NONE", ctermbg = "DarkGrey",    ctermfg = "Green" })
hi("Search",           { cterm = "NONE", ctermbg = "Black",       ctermfg = "White" })
hi("IncSearch",        { cterm = "NONE", ctermbg = "DarkBlue",    ctermfg = "White" })
hi("WildMenu",         { cterm = "NONE", ctermbg = "DarkBlue",    ctermfg = "White" })
hi("SignColumn",       { cterm = "NONE", ctermbg = "NONE",        ctermfg = "White" })
hi("LineNr",           { cterm = "NONE", ctermbg = "NONE",        ctermfg = "Black" })
hi("CursorLineNr",     { cterm = "NONE", ctermbg = "NONE",        ctermfg = "Black" })
hi("NonText",          { cterm = "NONE", ctermbg = "NONE",        ctermfg = "Black" })
hi("Title",            { cterm = "NONE", ctermbg = "NONE",        ctermfg = "White" })
hi("SpecialKey",       { cterm = "NONE", ctermbg = "NONE",        ctermfg = "DarkRed" })
hi("ErrorMsg",         { cterm = "NONE", ctermbg = "NONE",        ctermfg = "DarkRed" })
hi("MatchParen",       { cterm = "NONE", ctermbg = "NONE",        ctermfg = "Red" })
hi("WarningMsg",       { cterm = "NONE", ctermbg = "NONE",        ctermfg = "Brown" })
hi("Conceal",          { cterm = "NONE", ctermbg = "NONE",        ctermfg = "DarkBlue" })
hi("Directory",        { cterm = "NONE", ctermbg = "NONE",        ctermfg = "DarkBlue" })
hi("ModeMsg",          { cterm = "NONE", ctermbg = "NONE",        ctermfg = "DarkGreen" })
hi("MoreMsg",          { cterm = "NONE", ctermbg = "NONE",        ctermfg = "DarkGreen" })
hi("Question",         { cterm = "NONE", ctermbg = "NONE",        ctermfg = "DarkGreen" })
hi("Folded",           { cterm = "NONE", ctermbg = "NONE",        ctermfg = "Magenta" })
hi("FoldColumn",       { cterm = "NONE", ctermbg = "NONE",        ctermfg = "Magenta" })

hi("Pmenu",            { cterm = "NONE", ctermbg = "NONE",        ctermfg = "DarkGrey" })
hi("PmenuSel",         { cterm = "NONE", ctermbg = "Black",       ctermfg = "White" })
hi("PmenuThumb",       { cterm = "NONE", ctermbg = "Black",       ctermfg = "NONE" })
hi("PmenuSbar",        { cterm = "NONE", ctermbg = "NONE",        ctermfg = "NONE" })

hi("DiffAdd",          { cterm = "NONE", ctermbg = "DarkGrey",    ctermfg = "DarkGreen" })
hi("DiffChange",       { cterm = "NONE", ctermbg = "DarkGrey",    ctermfg = "Brown" })
hi("DiffDelete",       { cterm = "NONE", ctermbg = "DarkGrey",    ctermfg = "DarkRed" })
hi("DiffText",         { cterm = "NONE", ctermbg = "DarkGrey",    ctermfg = "DarkBlue" })

hi("SpellBad",         { cterm = "underline", ctermbg = "NONE",   ctermfg = "NONE" })
hi("SpellCap",         { cterm = "underline", ctermbg = "NONE",   ctermfg = "NONE" })
hi("SpellRare",        { cterm = "underline", ctermbg = "NONE",   ctermfg = "NONE" })
hi("SpellLocal",       { cterm = "underline", ctermbg = "NONE",   ctermfg = "NONE" })

-- Syntax groups
hi("Comment",          { cterm = "NONE", ctermbg = "NONE",        ctermfg = "Magenta" })
hi("Constant",         { cterm = "NONE", ctermbg = "NONE",        ctermfg = "DarkCyan" })
hi("String",           { cterm = "NONE", ctermbg = "NONE",        ctermfg = "DarkGreen" })
hi("Character",        { cterm = "NONE", ctermbg = "NONE",        ctermfg = "DarkGreen" })
hi("Identifier",       { cterm = "NONE", ctermbg = "NONE",        ctermfg = "Red" })
hi("Statement",        { cterm = "NONE", ctermbg = "NONE",        ctermfg = "DarkBlue" })
hi("PreProc",          { cterm = "NONE", ctermbg = "NONE",        ctermfg = "Brown" })
hi("Type",             { cterm = "NONE", ctermbg = "NONE",        ctermfg = "DarkMagenta" })
hi("Special",          { cterm = "NONE", ctermbg = "NONE",        ctermfg = "DarkRed" })
hi("Underlined",       { cterm = "underline", ctermbg = "NONE",   ctermfg = "NONE" })
hi("Ignore",           { cterm = "NONE", ctermbg = "NONE",        ctermfg = "NONE" })
hi("Error",            { cterm = "NONE", ctermbg = "NONE",        ctermfg = "DarkRed" })
hi("Todo",             { cterm = "NONE", ctermbg = "DarkRed",     ctermfg = "White" })

-- Language-specific overrides
link("rubyDefine", "Keyword")
link("rubyModule", "Define")
link("rubyStringDelimiter", "Character")
link("rubyRailsTestMethod", "Keyword")

link("jsThis", "PreProc")
link("jsArgsObj", "StorageClass")
link("jsFuncArgRest", "StorageClass")
link("jsPrototype", "Keyword")
link("jsFunction", "Keyword")
link("jsArrowFunction", "Keyword")

link("coffeeSpecialIdent", "jsThis")
link("coffeeSpecialVar", "StorageClass")
link("coffeeSpecialOp", "Ignore")

hi("cssAttrComma",     { cterm = "NONE", ctermbg = "NONE",        ctermfg = "White" })
link("cssSelectorOp", "Operator")
link("cssSelectorOp2", "cssSelectorOp")
link("cssFunctionComma", "cssAttrComma")
link("cssProp", "Label")
link("cssAttributeSelector", "PreProc")
link("cssClassName", "Type")
link("cssClassNameDot", "cssClassName")
link("cssBraces", "Ignore")
link("atKeyword", "Include")
hi("cssURL",           { cterm = "underline", ctermbg = "NONE",   ctermfg = "DarkGreen" })

link("sassIdChar", "sassId")
link("sassClassChar", "sassClass")
link("sassAmpersand", "Identifier")
link("sassPlaceholder", "Identifier")
link("sassReturn", "Keyword")
link("sassControl", "Conditional")
link("sassFor", "Repeat")
link("sassDebug", "Debug")
link("sassWarn", "PreProc")

hi("htmlTag",          { cterm = "NONE", ctermbg = "NONE",        ctermfg = "Green" })
link("htmlArg", "Define")
link("htmlEndTag", "htmlTag")
link("htmlTagN", "Error")
link("htmlSpecialTagName", "PreProc")
link("htmlH1", "Statement")
link("htmlItalic", "Ignore")
link("htmlBold", "Ignore")
link("htmlBoldItalic", "Ignore")

link("hamlTag", "htmlTag")
link("hamlClassChar", "sassClassChar")
link("hamlIdChar", "sassIdChar")
link("hamlAttributesDelimiter", "Ignore")

link("markdownLinkText", "Identifier")

-- Plugin highlights
hi("multiple_cursors_cursor", { cterm = "NONE", ctermbg = "DarkMagenta", ctermfg = "White" })
link("NERDTreeExecFile", "Special")
link("NERDTreeOpenable", "Identifier")
link("NERDTreeClosable", "Identifier")

-- Neo-tree highlights
link("NeoTreeDirectoryIcon", "Directory")
link("NeoTreeDirectoryName", "Directory")
link("NeoTreeFileName", "Normal")
link("NeoTreeFileIcon", "Normal")
link("NeoTreeGitModified", "DiffChange")
link("NeoTreeGitAdded", "DiffAdd")
link("NeoTreeGitDeleted", "DiffDelete")
