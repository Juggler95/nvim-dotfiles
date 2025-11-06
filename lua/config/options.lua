vim.cmd("set expandtab")
vim.cmd("set tabstop=2")
vim.cmd("set softtabstop=2")
vim.cmd("set shiftwidth=2")
vim.cmd.colorscheme("catppuccin") -- tokyonight, catppuccin, cyberdream

vim.opt.number = true
vim.wo.relativenumber = true
vim.opt.clipboard = "unnamedplus"

-- hightlight yanked text
vim.api.nvim_create_autocmd("TextYankPost", {
  desc = "Highlight when yanking (copying) text",
  group = vim.api.nvim_create_augroup("highlight-yank", { clear = true }),
  callback = function()
    vim.highlight.on_yank()
  end,
})

-- auto format on save
vim.api.nvim_create_augroup("AutoFormatting", {})
vim.api.nvim_create_autocmd("BufWritePre", {
  -- pattern = '*.lua',
  group = "AutoFormatting",
  callback = function()
    vim.lsp.buf.format({ async = true })
  end,
})

vim.api.nvim_set_hl(0, "LineNrAbove", { fg = "#aaaaaa" }) -- Dark grey for numbers above
vim.api.nvim_set_hl(0, "LineNrBelow", { fg = "#aaaaaa" }) -- Dark grey for numbers below
