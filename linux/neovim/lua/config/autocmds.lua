-- Autocommand for Python files
vim.api.nvim_create_autocmd("FileType", {
	pattern = "python",
	callback = function()
		vim.opt_local.expandtab = true
		vim.opt_local.tabstop = 4
		vim.opt_local.shiftwidth = 4
		vim.opt_local.softtabstop = 4
	end,
})

-- Autocommand for Go files
--vim.api.nvim_create_autocmd("FileType", {
-- pattern = "go",
-- callback = function()
-- vim.opt_local.tabstop = 4
-- vim.opt_local.shiftwidth = 4
-- vim.opt_local.softtabstop = 4
-- end,
--})
