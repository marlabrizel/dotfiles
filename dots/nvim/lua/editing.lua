-- Editing configuration
-- Most editing plugin configurations are handled in plugins.lua
-- This file contains additional editing-related settings and autocommands

-- File type specific settings
vim.api.nvim_create_autocmd("FileType", {
  pattern = { "markdown", "text", "txt" },
  callback = function()
    vim.opt_local.textwidth = 80
    vim.opt_local.linebreak = true
    vim.opt_local.list = false
    vim.opt_local.wrap = true
    vim.opt_local.spell = true
  end,
})

-- Python-specific settings
vim.api.nvim_create_autocmd("FileType", {
  pattern = "python",
  callback = function()
    vim.opt_local.tabstop = 4
    vim.opt_local.softtabstop = 4
    vim.opt_local.shiftwidth = 4
  end,
})

-- CSS/SCSS/Sass settings
vim.api.nvim_create_autocmd("FileType", {
  pattern = { "css", "scss", "sass" },
  callback = function()
    vim.opt_local.iskeyword:append("-")
  end,
})

-- Swift settings
vim.api.nvim_create_autocmd("FileType", {
  pattern = "swift",
  callback = function()
    vim.opt_local.tabstop = 2
    vim.opt_local.softtabstop = 2
    vim.opt_local.shiftwidth = 2
  end,
})

-- Markdown preview (F12 key)
vim.api.nvim_create_autocmd("FileType", {
  pattern = "markdown",
  callback = function()
    vim.keymap.set("n", "<F12>", "<cmd>!open -a 'Marked 2' %<CR>", { buffer = true, silent = true })
  end,
})
