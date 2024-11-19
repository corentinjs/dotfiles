return {
	{
		"williamboman/mason.nvim",
		dependencies = {
			"zapling/mason-conform.nvim",
		},
		config = function()
			require("mason").setup()
			require("mason-conform").setup()
		end,
	},
	{
		"williamboman/mason-lspconfig.nvim",
		config = function()
			require("mason-lspconfig").setup({
				ensure_installed = { "lua_ls", "gopls" },
			})
		end,
	},
	{
		"neovim/nvim-lspconfig",
		config = function()
			local lspconfig = require("lspconfig")
			lspconfig.lua_ls.setup({})
			lspconfig.gopls.setup({
				cmd = { "gopls" },
				filetypes = { "go", "gomod", "gowork", "gotmpl" },
			})
			vim.keymap.set("n", "I", vim.lsp.buf.hover, {})
		end,
	},
}
