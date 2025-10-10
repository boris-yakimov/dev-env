-- In a global plugin <Leader> should be used and in a filetype plugin <LocalLeader>. "mapleader" and "maplocalleader" can be equal.
vim.g.mapleader = "\\"
vim.g.maplocalleader = "\\"

-- LazyVim auto format
vim.g.autoformat = true

-- alias to the global vim.opt
local opt = vim.opt

-- indentation
opt.smartindent = true -- insert indents automatically
opt.shiftwidth = 2 -- number of spaces to use for each step of (auto)indent
opt.tabstop = 2 -- number of spaces per tab
opt.softtabstop = 2 -- number of spaces for soft tab (when pressing Tab in insert mode)
opt.expandtab = true -- use spaces instead of tabs

-- line numbers
opt.relativenumber = true -- (false) disable relative line numbers
opt.number = true -- enable absolute line numbers

-- some additional options
opt.confirm = true -- confirm to save changes before exiting modified buffer
opt.cursorline = true -- enable highlighting of the current line
opt.backspace = { "indent", "eol", "start" } -- allow backspace to delete indentation and inserted text
opt.wrap = true -- long lines wrap onto the next screen line instead of scrolling horizontally
opt.linebreak = true -- requires wrap = true; wrap at word boundaries (spaces, tabs, etc.), not mid-word

-- use the clipboard for ALL operations (instead of interacting with the '+' and/or '*' registers explicitly)
-- also sends vim yanks to the system clipboard
-- TODO: need to figure out why win32yank seems to be very slow sometimes on WSL
opt.clipboard = vim.env.SSH_TTY and "" or "unnamedplus" -- Sync with system clipboard

-- Force Neovim to use win32yank.exe
vim.g.clipboard = {
	name = "win32yank",
	copy = {
		["+"] = "win32yank.exe -i --crlf",
		["*"] = "win32yank.exe -i --crlf",
	},
	paste = {
		["+"] = "win32yank.exe -o --lf",
		["*"] = "win32yank.exe -o --lf",
	},
	cache_enabled = true,
}
