return {
	"nvim-lualine/lualine.nvim",
	opts = function(_, opts)
		opts.sections = vim.tbl_extend("force", opts.sections or {}, {
			lualine_c = { -- middle section
				{
					"filename",
					path = 1, -- 0 = filename only, 1 = relative path, 2 = absolute path
					shorting_target = 20, -- shorten path if it exceeds char limit
					symbols = {
						modified = "[+]", -- show when the file is modified
						readonly = "[-]", -- show for readonly files
						unnamed = "[No Name]", -- used for unnamed buffers
					},
				},
			},
			lualine_x = { -- right section
				{
					"filetype", -- show file type
					icon_only = false, -- display both the file type name and icon
				},
				{
					"encoding", -- show file encoding (e.g., UTF-8)
					fmt = string.upper, -- format the encoding
				},
				"fileformat", -- show file format (e.g., UNIX, DOS)
			},
		})
	end,
}
