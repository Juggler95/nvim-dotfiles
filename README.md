# Neovim config setup (macOS + Linux)

This config is set up to be portable across macOS and Linux.
All local paths in Lua use `vim.fn.stdpath("config")`, and the dashboard image lives in `assets/jinx.webp` inside this repo.

## 1) Install base dependencies

Required for core functionality:
- `neovim` (0.11+ recommended)
- `git`
- `ripgrep` (search pickers)
- `fd` (faster file finding, recommended)
- a Nerd Font in your terminal (recommended for icons)

Required by enabled plugins/features:
- `node` + `npm` or `pnpm` (Mason/npm ecosystem, `live-server`, JS debugging)
- `python` + `pip` + `venv` (Python tooling, `venv-selector`)
- `tmux` (for `vimux`, navigator, and tmux-based flows)
- `lazygit` (for `<leader>gg`)
- `ascii-image-converter` (optional: dashboard image rendering)

### Example install commands

macOS (Homebrew):
```bash
brew install neovim git ripgrep fd node python tmux lazygit
```

Ubuntu/Debian:
```bash
sudo apt update
sudo apt install -y neovim git ripgrep fd-find nodejs npm python3 python3-pip python3-venv tmux
```

Arch Linux:
```bash
sudo pacman -S --needed neovim git ripgrep fd nodejs npm python python-pip tmux lazygit
```

Install optional dashboard image renderer:
```bash
cargo install ascii-image-converter
```

## 2) Install this config

Back up existing config:
```bash
mv ~/.config/nvim ~/.config/nvim.bak
```

Clone:
```bash
git clone https://github.com/Juggler95/nvim.git ~/.config/nvim
```

First launch:
```bash
nvim
```

`lazy.nvim` bootstraps automatically on first start.

## 3) Post-install checks

Inside Neovim run:
- `:checkhealth`
- `:Lazy`
- `:Mason`
- `:LspInfo`

If the dashboard image does not render, verify:
- `ascii-image-converter` is installed and in `PATH`
- `assets/jinx.webp` exists (it is tracked in this repo)

## 4) External tools for formatting/linting (none-ls)

This config enables these formatters/linters via `lua/plugins/none-ls.lua`:
- `stylua`
- `prettier`
- `black`
- `isort`
- `rubocop`
- `shfmt`
- `clang-format`
- `eslint_d`

Install what you need for your workflow:
```bash
npm install -g prettier eslint_d
pip install black isort
gem install rubocop
cargo install stylua
```

`clang-format` and `shfmt` are usually installed via your OS package manager.

## 5) Add support for a new language

When adding a language, update these places:

1. Treesitter parser list in `lua/plugins/treesitter.lua`
2. LSP install list in `lua/plugins/lsp-config.lua` (`ensure_installed`)
3. LSP server config in `lua/plugins/lsp-config.lua` (`vim.lsp.config[...]` + `vim.lsp.enable(...)`)
4. Optional formatter/linter in `lua/plugins/none-ls.lua`
5. Optional snippets in `snippets/<language>.lua`

### Example: adding Go

1) Treesitter (`lua/plugins/treesitter.lua`): add `"go"` to `ensure_installed`.

2) Mason/LSP (`lua/plugins/lsp-config.lua`):
- add `"gopls"` to `ensure_installed`
- add:
```lua
vim.lsp.config["gopls"] = {
  capabilities = capabilities,
}
vim.lsp.enable("gopls")
```

3) Formatting/linting (optional):
- install Go tools you use (for example `goimports`, `golangci-lint`)
- wire them into `none-ls` if desired

4) Verify:
- open a `.go` file
- run `:LspInfo`
- run formatting (`<leader>gf` or save)

## 6) Optional tools used by keymaps/plugins

- `tmux-sessionizer` for `<C-f>` mapping in `lua/config/keymaps.lua`
- `live-server` commands (`<leader>l`/`<leader>x`) via `live-server.nvim`
- `lazygit` via Snacks (`<leader>gg`)

If optional tools are missing, core editing/LSP still works.

## 7) Troubleshooting

- If Neovim starts but features are missing: run `:checkhealth` and `:Lazy sync`.
- If LSP does not attach: check `:LspInfo`, then install the server in `:Mason`.
- If Python venv detection is wrong: run `:VenvSelect`.
- If test commands fail: ensure `tmux` is running (`vim-test` strategy is `vimux`).
