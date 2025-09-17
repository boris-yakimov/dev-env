return {
	"williamboman/mason-lspconfig.nvim",
	enabled = true,
	opts = function(_, opts)
		-- extend default list of LSPs to ensure they are installed
		opts.ensure_installed = vim.list_extend(opts.ensure_installed or {}, {
			"gopls", -- official go lsp
			"terraformls", -- terraform lsp
			"pyright", -- recommended python lsp
			"ruff", -- adds formatting and linting for python since pyright doesn't provide them
			"clangd", -- c/c++ lsp
			"lua-language-server", -- lua LSP
		})
	end,
}
