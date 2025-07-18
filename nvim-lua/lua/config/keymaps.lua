-- telescope key binds
local builtin = require("telescope.builtin")
vim.keymap.set("n", "<leader>ff", builtin.find_files, { desc = "Telescope find files" })
vim.keymap.set("n", "<leader>fg", builtin.live_grep, { desc = "Telescope live grep" })
vim.keymap.set("n", "<leader>fb", builtin.buffers, { desc = "Telescope buffers" })
vim.keymap.set("n", "<leader>fh", builtin.help_tags, { desc = "Telescope help tags" })

-- quit all - <leader>qq
vim.keymap.set(
	"n",
	"<leader>qq",
	"<cmd>qa<cr>",
	{ desc = "Quit All open files, will prompt for save if a file has changed" }
)

-- move line up or down - shift + up or down
vim.keymap.set("n", "<S-Up>", ":m .-2<CR>==", { noremap = true, silent = true })
vim.keymap.set("n", "<S-Down>", ":m .+1<CR>==", { noremap = true, silent = true })

-- go to next or previous error from lsp
vim.keymap.set("n", "]d", vim.diagnostic.goto_next, { desc = "Go to next diagnostic" })
vim.keymap.set("n", "[d", vim.diagnostic.goto_prev, { desc = "Go to previous diagnostic" })

-- option to disable <leader>n from what already occupies it if i decide to go back to neotree
-- return {
-- 	-- Disable snacks.nvim Notification History keymap (<leader>n) - we use the same mapping for neotree
-- 	{
-- 		"rcarriga/nvim-notify",
-- 		keys = {
-- 			{ "<leader>n", false },
-- 		},
-- 	},
-- }
