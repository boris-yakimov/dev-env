return {
	"nvim-neo-tree/neo-tree.nvim",
	enabled = true, -- switched to the default exporer that comes with lazyvim for while
	branch = "v3.x",
	dependencies = {
		"nvim-lua/plenary.nvim",
		"nvim-tree/nvim-web-devicons",
		"MunifTanjim/nui.nvim",
		-- "3rd/image.nvim", -- Optional image support in preview window: See `# Preview Mode` for more information
	},
	keys = {
		{ "<leader>n", ":Neotree toggle<CR>", desc = "Toggle Neo-tree" },
		-- { "nt", ":Neotree toggle<CR>", desc = "Toggle Neo-tree" },
	},
}
