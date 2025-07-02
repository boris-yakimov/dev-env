return {
	"nvim-neo-tree/neo-tree.nvim",
	-- enabled = true,
	branch = "v3.x",
	dependencies = {
		"nvim-lua/plenary.nvim",
		"nvim-tree/nvim-web-devicons",
		"MunifTanjim/nui.nvim",
		-- "3rd/image.nvim", -- Optional image support in preview window: See `# Preview Mode` for more information
	},
	opts = {
		filesystem = {
			filtered_items = {
				visible = true, -- show hidden files by default
				hide_dotfiles = false, -- do NOT hide dotfiles
				hide_gitignored = false, -- optional: show .gitignored files too
			},
		},
	},
	keys = {
		{
			"<leader>n",
			":Neotree toggle<CR>",
			desc = "Toggle Neo-tree",
		},
	},
}
