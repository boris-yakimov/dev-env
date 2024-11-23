-- In a global plugin <Leader> should be used and in a filetype plugin <LocalLeader>. "mapleader" and "maplocalleader" can be equal.
vim.g.mapleader = "\\"
vim.g.maplocalleader = "\\"

-- LazyVim auto format
vim.g.autoformat = true

-- alias to the global vim.opt
local opt = vim.opt
opt.confirm = true -- Confirm to save changes before exiting modified buffer
opt.cursorline = true -- Enable highlighting of the current line
opt.expandtab = true -- Use spaces instead of tabs
opt.linebreak = true -- Wrap lines at convenient points
opt.shiftwidth = 2 -- Number of spaces to use for each step of (auto)indent
opt.tabstop = 2 -- Number of spaces per tab
opt.softtabstop = 4 -- Number of spaces for soft tab (when pressing Tab in insert mode)
opt.smartindent = true -- Insert indents automatically

-- TODO: To ALWAYS use the clipboard for ALL operations (instead of interacting with the '+' and/or '*' registers explicitly):
--" send even vim yanks to the system clipboard
-- set clipboard+=unnamedplus
--  TODO: how do we fix this for the WSL win32 clipboard
opt.clipboard = vim.env.SSH_TTY and "" or "unnamedplus" -- Sync with system clipboard

-- Indentation
vim.cmd("set shiftwidth=4")
vim.cmd("set expandtab")

-- TODO: check what these two do exactly
vim.cmd("set tabstop=4")
vim.cmd("set softtabstop=4")
-- Indentation
vim.cmd("set shiftwidth=4")
vim.cmd("set expandtab")

-- TODO: check what these two do exactly
vim.cmd("set tabstop=4")
vim.cmd("set softtabstop=4")

-- TODO: test how it looks with python and go with 4 spaces
--vim.cmd("autocmd Filetype python setlocal expandtab tabstop=4 shiftwidth=4 softtabstop=4")
--vim.cmd("autocmd Filetype go setlocal tabstop=4 shiftwidth=4 softtabstop=4")
-- TODO: verify what each of these do
--vim.cmd("set wrap linebreak")
--vim.cmd("set noshowmode")
--vim.cmd("filetype plugin indent on")
--
-- TODO: Allow backspace to delete indentation and inserted text
--i.e. how it works in most programs
--set backspace=indent,eol,start
--" indent  allow backspacing over autoindent
--" eol     allow backspacing over line breaks (join lines)
--" start   allow backspacing over the start of insert; CTRL-W and CTRL-U
--"        stop once at the start of insert.

-- TODO: do I need devicons - https://github.com/nvim-tree/nvim-web-devicons
