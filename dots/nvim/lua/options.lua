-- Leader key
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- Tab settings
vim.opt.expandtab = true
vim.opt.shiftwidth = 2
vim.opt.softtabstop = 2
vim.opt.tabstop = 2
vim.opt.smarttab = true
vim.opt.smartindent = true
vim.opt.autoindent = true
vim.opt.shiftround = true

-- UI settings
vim.opt.number = true
vim.opt.cursorline = true
vim.opt.ruler = true
vim.opt.showmatch = true
vim.opt.laststatus = 2
vim.opt.title = true
vim.opt.mouse = "a"
vim.opt.termguicolors = true

-- Display settings
vim.opt.list = true
vim.opt.listchars = { tab = "▸ ", eol = "¬", trail = "·" }
vim.opt.wrap = false
vim.opt.scrolloff = 3
vim.opt.sidescrolloff = 3

-- Search settings
vim.opt.hlsearch = true
vim.opt.incsearch = true
vim.opt.ignorecase = true
vim.opt.smartcase = true

-- Completion settings
vim.opt.completeopt = { "longest", "menu" }
vim.opt.pumheight = 20
vim.opt.wildmenu = true
vim.opt.wildmode = { "longest:full", "full" }
vim.opt.wildignore:append({ "*.DS_Store" })

-- File handling
vim.opt.autoread = true
vim.opt.autowrite = true
vim.opt.hidden = true
vim.opt.backup = false
vim.opt.swapfile = false
vim.opt.clipboard = "unnamed"
vim.opt.fileformats:append({ "mac" })

-- Split settings
vim.opt.splitright = true
vim.opt.splitbelow = true

-- Misc settings
vim.opt.backspace = { "indent", "eol", "start" }
vim.opt.history = 1000
vim.opt.undolevels = 1000
vim.opt.ttimeout = true
vim.opt.ttimeoutlen = 50
vim.opt.ttyfast = true
vim.opt.showcmd = false
vim.opt.errorbells = false
vim.opt.visualbell = false
vim.opt.startofline = false

-- Fold settings
vim.opt.foldmethod = "marker"
vim.opt.foldlevelstart = 0

-- Grep program
if vim.fn.executable("ag") == 1 then
  vim.opt.grepprg = "ag --nogroup --nocolor"
end

-- Encoding
vim.opt.encoding = "utf-8"

-- Filetype
vim.cmd("filetype plugin indent on")
vim.cmd("syntax enable")
