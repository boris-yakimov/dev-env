return {
	"nvim-treesitter/nvim-treesitter",
	enabled = true,
	opts = function(_, opts)
		-- extend default list of languages
		opts.ensure_installed = vim.list_extend(opts.ensure_installed or {}, {
			"python",
			"go",
			"hcl", -- TODO: check if need both hcl and terraform
			"terraform",
		})
	end,
}
