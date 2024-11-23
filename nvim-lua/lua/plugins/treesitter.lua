return {
	"nvim-treesitter/nvim-treesitter",
	opts = function(_, opts)
		-- extend default list of languages
		opts.ensure_installed = vim.list_extend(opts.ensure_installed or {}, {
			"python",
			"go",
			"hcl",
			"terraform",
		})
	end,
}
