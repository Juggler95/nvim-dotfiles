vim.g.mapleader = " "
vim.g.maplocalleader = " "

vim.opt.backspace = "2"
vim.opt.showcmd = true
vim.opt.autowrite = true
vim.opt.cursorline = true
vim.opt.autoread = true

vim.opt.swapfile = false

vim.keymap.set("n", "<leader>h", ":nohlsearch<CR>")
vim.keymap.set("n", "<leader>s", "<cmd>w<CR>")

-- Navigate tmux panes better
vim.keymap.set("n", "<A-k>", ":wincmd k<CR>")
vim.keymap.set("n", "<A-j>", ":wincmd j<CR>")
vim.keymap.set("n", "<A-h>", ":wincmd h<CR>")
vim.keymap.set("n", "<A-l>", ":wincmd l<CR>")

-- tmux-sessionizer
vim.keymap.set("n", "<C-f>", "<cmd>silent !tmux neww tmux-sessionizer<CR>")
-- vim.keymap.set("n", "<C-h>", "<cmd>silent !tmux neww tmux-sessionizer -s 0<CR>")
-- vim.keymap.set("n", "<C-j>", "<cmd>silent !tmux neww tmux-sessionizer -s 1<CR>")
-- vim.keymap.set("n", "<C-k>", "<cmd>silent !tmux neww tmux-sessionizer -s 2<CR>")
-- vim.keymap.set("n", "<C-l>", "<cmd>silent !tmux neww tmux-sessionizer -s 3<CR>")

-- Telescope
local builtin = require("telescope.builtin")
vim.keymap.set("n", "<leader>sf", builtin.find_files, { desc = "[S]earch [F]iles" })
vim.keymap.set("n", "<leader>sg", builtin.live_grep, { desc = "[S]earch [G]rep" })
vim.keymap.set("n", "<leader>sk", builtin.keymaps, { desc = "[S]earch [K]eymaps" })
vim.keymap.set("n", "<leader>sw", builtin.grep_string, { desc = "[S]earch current [W]ord" })

-- Neo-tree
-- vim.keymap.set("n", "<C-n>", ":Neotree toggle <CR>")
-- vim.keymap.set("n", "<C-n>", ":Neotree filesystem reveal left <CR>")

-- LSP
vim.keymap.set("n", "K", vim.lsp.buf.hover, {})
vim.keymap.set("n", "gd", vim.lsp.buf.definition, {})
vim.keymap.set({ "n", "v" }, "<leader>ca", vim.lsp.buf.code_action, {})

-- Undo tree
-- vim.keymap.set("n", "<leader>u", vim.cmd.UndotreeToggle)
-- vim.keymap.set("n", "<leader>f", vim.cmd.UndotreeFocus)

-- None-ls formatting
vim.keymap.set("n", "<leader>gf", vim.lsp.buf.format, {})

-- Live server
vim.keymap.set("n", "<leader>l", ":LiveServerStart<CR>")
vim.keymap.set("n", "<leader>x", ":LiveServerStop<CR>")
