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
opt.relativenumber = false -- disable relative line numbers
opt.number = true -- enable absolute line numbers

-- some additional options
opt.confirm = true -- confirm to save changes before exiting modified buffer
opt.cursorline = true -- enable highlighting of the current line
opt.linebreak = true -- wrap lines at convenient points
opt.backspace = { "indent", "eol", "start" } -- allow backspace to delete indentation and inserted text

-- use the clipboard for ALL operations (instead of interacting with the '+' and/or '*' registers explicitly)
-- also sends vim yanks to the system clipboard
-- TODO: need to figure out why win32yank seems to be very slow sometimes on WSL
opt.clipboard = vim.env.SSH_TTY and "" or "unnamedplus" -- Sync with system clipboard
