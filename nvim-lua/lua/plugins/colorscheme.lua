return {
	{
		"folke/tokyonight.nvim",
		enabled = true,
		lazy = true,
		priority = 1000,
		opts = {
			-- style = "night",
			-- style = "day", -- you will get flashbanged
			style = "moon",
		},
	},

	{
		"LazyVim/LazyVim",
		opts = {
			colorscheme = "tokyonight",
		},
	},
}
