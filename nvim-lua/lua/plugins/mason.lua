return {
	-- mason.nvim manages all external tools
	{
		"mason-org/mason.nvim",
		enabled = true,
		opts = function(_, opts)
			opts.ensure_installed = vim.list_extend(opts.ensure_installed or {}, {
				"tflint", -- Terraform linter
				"ruff", -- Python linter/formatter
			})
		end,
	},

	-- mason-lspconfig.nvim bridges mason with lspconfig
	{
		"mason-org/mason-lspconfig.nvim",
		enabled = true,
		opts = function(_, opts)
			opts.ensure_installed = vim.list_extend(opts.ensure_installed or {}, {
				"gopls", -- Go LSP
				"terraformls", -- Terraform LSP
				"pyright", -- Python LSP
				"clangd", -- C/C++ LSP
				"lua_ls", -- Lua LSP
			})
		end,
	},
}
