-- Key mappings
local keymap = vim.keymap

-- RSI reduction
keymap.set("n", "j", "gj", { silent = true })
keymap.set("n", "k", "gk", { silent = true })

-- Visually select the text that was last edited/pasted
keymap.set("n", "gV", "`[v`]", { silent = true })

-- Move between splits
keymap.set("n", "<C-h>", "<C-w>h", { silent = true })
keymap.set("n", "<C-j>", "<C-w>j", { silent = true })
keymap.set("n", "<C-k>", "<C-w>k", { silent = true })
keymap.set("n", "<C-l>", "<C-w>l", { silent = true })

-- Clear the search highlight
keymap.set("n", "<leader>\\", ":nohlsearch<CR>", { silent = true })

-- Remove whitespace
keymap.set("n", "<leader>CW", ":%s/\\s\\+$//<CR>:let @/=''<CR>:nohlsearch<CR>", { silent = true })

-- Yank/paste contents using an unnamed register
keymap.set("v", "<leader>y", '"xy', { silent = true })
keymap.set("n", "<leader>p", '"xp', { silent = true })

-- Yanky keymaps
keymap.set({"n","x"}, "p", "<Plug>(YankyPutAfter)")
keymap.set({"n","x"}, "P", "<Plug>(YankyPutBefore)")
keymap.set("n", "<c-p>", "<Plug>(YankyPreviousEntry)")
keymap.set("n", "<c-n>", "<Plug>(YankyNextEntry)")

-- FZF-lua keymaps (replaces CtrlP and Ag)
keymap.set("n", "<F1>", "<cmd>FzfLua files<CR>", { silent = true })
keymap.set("n", "<F3>", "<cmd>FzfLua buffers<CR>", { silent = true })
keymap.set("n", "<F4>", "<cmd>FzfLua grep_project<CR>", { silent = true })
keymap.set("n", "<leader>f", "<cmd>FzfLua files<CR>", { silent = true })
keymap.set("n", "<leader>b", "<cmd>FzfLua buffers<CR>", { silent = true })
keymap.set("n", "<leader>g", "<cmd>FzfLua live_grep<CR>", { silent = true })

-- Neo-tree keymaps (replaces NERDTree)
keymap.set("n", "<F2>", "<cmd>Neotree toggle<CR>", { silent = true })
keymap.set("n", "-", "<cmd>Neotree reveal<CR>", { silent = true })
keymap.set("n", "_", "<cmd>Neotree .<CR>", { silent = true })

-- LSP keymaps (will be set up in lsp.lua when LSP attaches)
-- gd - go to definition
-- gr - go to references
-- K - hover documentation
-- <leader>rn - rename
-- <leader>ca - code action

-- Python virtual environment selector
keymap.set("n", "<leader>vs", "<cmd>VenvSelect<CR>", { silent = true })
