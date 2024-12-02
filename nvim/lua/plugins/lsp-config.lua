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
				ensure_installed = { "lua_ls", "gopls", "docker_compose_language_service", "dockerls", "ts_ls" },
			})
		end,
	},
	{
		"neovim/nvim-lspconfig",
		config = function()
			local capabilities = require("cmp_nvim_lsp").default_capabilities()
			local lspconfig = require("lspconfig")
			lspconfig.lua_ls.setup({
				capabilities = capabilities,
			})
			lspconfig.gopls.setup({
				capabilities = capabilities,
				cmd = { "gopls" },
				filetypes = { "go", "gomod", "gowork", "gotmpl" },
			})
			lspconfig.docker_compose_language_service.setup({
				cmd = { "docker-compose-langserver", "--stdio" },
				filetypes = { "yaml.docker-compose" },
			})
			lspconfig.dockerls.setup({
				cmd = { "docker-langserver", "--stdio" },
				filetypes = { "dockerfile" },
			})
			lspconfig.ts_ls.setup({
				cmd = { "typescript-language-server", "--stdio" },
				filetypes = {
					"javascript",
					"javascriptreact",
					"javascript.jsx",
					"typescript",
					"typescriptreact",
					"typescript.tsx",
				},
			})
			vim.keymap.set("n", "I", vim.lsp.buf.hover, {})
		end,
	},
}
