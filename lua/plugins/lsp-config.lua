return {
	{
		"williamboman/mason.nvim",
		config = function()
			require("mason").setup()
		end,
	},

	{
		"williamboman/mason-lspconfig.nvim",
		lazy = false,
		dependencies = { "neovim/nvim-lspconfig" },
		config = function()
			require("mason-lspconfig").setup({
				ensure_installed = {
					"lua_ls",
					"ts_ls",
					"html",
					"cssls",
					"bashls",
					"jsonls",
					"pyright",
					"clangd",
					"jinja_lsp",
				},
				auto_install = true,
			})
		end,
	},

	{
		"neovim/nvim-lspconfig",
		lazy = false,
		config = function()
			local capabilities = require("cmp_nvim_lsp").default_capabilities()

			-- Lua
			vim.lsp.config["lua_ls"] = {
				capabilities = capabilities,
				settings = {
					Lua = {
						runtime = { version = "LuaJIT" },
						diagnostics = {
							globals = { "vim", "love" },
						},
						workspace = {
							checkThirdParty = false,
							library = { vim.env.VIMRUNTIME },
						},
						telemetry = { enable = false },
					},
				},
			}
			vim.lsp.enable("lua_ls")

			-- TypeScript/JavaScript
			vim.lsp.config["ts_ls"] = {
				capabilities = capabilities,
			}
			vim.lsp.enable("ts_ls")

			-- HTML
			vim.lsp.config["html"] = {
				capabilities = capabilities,
			}
			vim.lsp.enable("html")

			-- CSS
			vim.lsp.config["cssls"] = {
				capabilities = capabilities,
			}
			vim.lsp.enable("cssls")

			-- Bash
			vim.lsp.config["bashls"] = {
				capabilities = capabilities,
			}
			vim.lsp.enable("bashls")

			-- JSON
			vim.lsp.config["jsonls"] = {
				capabilities = capabilities,
			}
			vim.lsp.enable("jsonls")

			-- Python
			vim.lsp.config["pyright"] =
				{
					capabilities = capabilities,
					settings = {
						python = {
							venvPath = ".",
							venv = ".venv",
						},
					},
				}, vim.lsp.enable("pyright")

			-- C/C++
			vim.lsp.config["clangd"] = {
				capabilities = capabilities,
			}
			vim.lsp.enable("clangd")

			-- Jinja (for Flask HTML templates)
			vim.lsp.config["jinja_lsp"] = {
				capabilities = capabilities,
				filetypes = { "html", "jinja" },
			}
			vim.lsp.enable("jinja_lsp")
		end,
	},
	{
		"nvimdev/lspsaga.nvim",
		config = function()
			require("lspsaga").setup({})
		end,
		dependencies = {
			"nvim-treesitter/nvim-treesitter", -- optional
			"nvim-tree/nvim-web-devicons", -- optional
		},
	},
}
