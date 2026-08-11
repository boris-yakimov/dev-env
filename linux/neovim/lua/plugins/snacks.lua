return {
	"folke/snacks.nvim",
	opts = {
		picker = {
			sources = {
				explorer = {
					hidden = true, -- show dotfiles like .github/
					ignored = true, -- set true to also show .gitignored files
				},
			},
		},
	},
}
