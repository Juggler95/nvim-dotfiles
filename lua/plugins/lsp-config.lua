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
	},

	{
		"williamboman/mason-lspconfig.nvim",
		dependencies = { "neovim/nvim-lspconfig" },
		config = function()
			require("mason-lspconfig").setup({
				ensure_installed = { "lua_ls", "ts_ls", "html", "cssls", "bashls", "jsonls", "pyright" },
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
			vim.lsp.config["pyright"] = {
				capabilities = capabilities,
			}
			vim.lsp.enable("pyright")
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
