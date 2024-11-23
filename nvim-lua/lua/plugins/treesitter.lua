return {
	"nvim-treesitter/nvim-treesitter",
	opts = function(_, opts)
		-- Add your desired languages here
		opts.ensure_installed = vim.list_extend(opts.ensure_installed or {}, {
			"python",
			"go",
			"hcl",
			"terraform",
		})
	end,
}
