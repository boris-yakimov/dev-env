-- TODO: figure out why these are not loading
-- TODO: it seems that mason is actually picking up all the binaries for languages we have installed already, do some tests if enabling an lsp explicitly and letting it pick up a language automatically, actually makes a difference
return {
	"williamboman/mason.nvim",
	"williamboman/mason-lspconfig.nvim",
	"neovim/nvim-lspconfig",
	opts = function(_, opts)
		-- extend default list of LSPs
		opts.ensure_installed = vim.list_extend(opts.ensure_installed or {}, {
			-- TODO: need to make sure this is not causing 100% CPU spikes like it did before
			-- TODO: test that enabling or disabling these does not impact performance of nvim
			"terraformls", -- terraform lsp
			"gopls", -- official go lsp
			"pyright", -- pyright recommended python lsp
			"ruff", -- ruff - adds formatting and linting for python since pyright doesn't provide them
		})
	end,
}
