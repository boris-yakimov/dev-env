-- TODO: figure out why these are not loading
-- TODO: it seems that mason is actually picking up all the binaries for languages we have installed already, do some tests if enabling an lsp explicitly and letting it pick up a language automatically, actually makes a difference
return {
	"williamboman/mason-lspconfig.nvim",
	opts = function(_, opts)
		-- extend default list of LSPs to ensure they are installed
		opts.ensure_installed = vim.list_extend(opts.ensure_installed or {}, {
			"gopls", -- official go lsp
			-- TODO: need to make sure this is not causing 100% CPU spikes like it did before
			-- TODO: test that enabling or disabling these does not impact performance of nvim
			"terraformls", -- terraform lsp
			"pyright", -- recommended python lsp
			"ruff", -- adds formatting and linting for python since pyright doesn't provide them
		})
	end,
}
