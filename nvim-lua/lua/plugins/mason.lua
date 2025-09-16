-- TODO: figure out why these are not loading
-- TODO: it seems that mason is actually picking up all the binaries for languages we have installed already, do some tests if enabling an lsp explicitly and letting it pick up a language automatically, actually makes a difference
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
		})
	end,
}
