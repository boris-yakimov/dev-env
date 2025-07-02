-- telescope key binds
local builtin = require("telescope.builtin")
vim.keymap.set("n", "<leader>ff", builtin.find_files, { desc = "Telescope find files" })
vim.keymap.set("n", "<leader>fg", builtin.live_grep, { desc = "Telescope live grep" })
vim.keymap.set("n", "<leader>fb", builtin.buffers, { desc = "Telescope buffers" })
vim.keymap.set("n", "<leader>fh", builtin.help_tags, { desc = "Telescope help tags" })

-- quit all
vim.keymap.set("n", "<leader>qq", "<cmd>qa<cr>", { desc = "Quit All open files, will prompt for save" })

-- move line up or down
vim.keymap.set("n", "<S-Up>", ":m .-2<CR>==", { noremap = true, silent = true })
vim.keymap.set("n", "<S-Down>", ":m .+1<CR>==", { noremap = true, silent = true })

-- change the default snacks picker from <leader>n to <leader>N
vim.keymap.set(
	"n",
	"<leader>N",
	"<cmd>SnacksPicker<CR>",
	{ desc = "Snacks Notifications", noremap = true, silent = true }
)
