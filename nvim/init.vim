if empty(glob('~/.config/nvim/autoload/plug.vim'))
  silent !curl -fLo ~/.config/nvim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd!
  autocmd VimEnter * PlugInstall
endif


"'' VIM PRE-PLUG ''"
filetype plugin indent on
set exrc
set hidden
set nobackup
set nocompatible
set nowritebackup
set secure
set shortmess+=c
set termguicolors
set updatetime=300
syntax enable

"To ALWAYS use the clipboard for ALL operations (instead of interacting with the '+' and/or '*' registers explicitly):
"no point of this for now, we can copy/paste by disabling mouse VISUAL mode with - :set mouse:
":set clipboard+=unnamedplus

call plug#begin('~/.config/nvim/plugged')

"File Search:
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'

"File Browser:
Plug 'scrooloose/nerdtree'
Plug 'jistr/vim-nerdtree-tabs'
Plug 'mkitt/tabline.vim'
Plug 'ryanoasis/vim-devicons'

"Theme:
Plug 'morhetz/gruvbox'

""" Language Support ''"
Plug 'neoclide/coc.nvim', { 'branch': 'release' }
Plug 'fatih/vim-go'
Plug 'rust-lang/rust.vim'


"Autocomplete:
Plug 'ncm2/ncm2'
Plug 'ncm2/ncm2-go'
Plug 'roxma/nvim-yarp'
Plug 'roxma/vim-hug-neovim-rpc'
Plug 'stamblerre/gocode', { 'rtp': 'nvim', 'do': '~/.config/nvim/plugged/gocode/nvim/symlink.sh' }

"Snippets:
Plug 'ncm2/ncm2-ultisnips'
Plug 'SirVer/ultisnips'

"Git:
Plug 'tpope/vim-fugitive'

" Utilities
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'preservim/nerdcommenter'
Plug 'voldikss/vim-floaterm'
Plug 'takac/vim-hardtime' " see http://vimcasts.org/blog/2013/02/habit-breaking-habit-making/

" Lightline
Plug 'itchyny/lightline.vim'

call plug#end()

"'' Conquer of Completion (CoC) ''"
if filereadable(expand("~/.config/nvim/plugged/coc.nvim/plugin/coc.vim"))
  let g:coc_global_extensions=[
        \'coc-actions',
        \'coc-docker',
        \'coc-elixir',
        \'coc-floaterm',
        \'coc-go',
        \'coc-highlight',
        \'coc-html',
        \'coc-json',
        \'coc-marketplace',
        \'coc-prettier',
        \'coc-python',
        \'coc-rls',
        \'coc-sh',
        \'coc-sql',
        \'coc-tabnine',
        \'coc-tailwindcss',
        \'coc-yaml',
        \]
endif

"'' Go ''"
if filereadable(expand("~/.config/nvim/plugged/vim-go/plugin/go.vim"))
  let g:go_code_completion_enabled = 1 
  let g:go_fmt_command = "goimports"
  let g:go_gpls_enabled = 1
  let g:go_doc_keywordprg_enabled = 1

  let g:go_highlight_array_whitespace_error = 1
  let g:go_highlight_chan_whitespace_error = 1
  let g:go_highlight_extra_types = 1
  let g:go_highlight_space_tab_error = 1
  let g:go_highlight_trailing_whitespace_error = 1
  let g:go_highlight_operators = 1
  let g:go_highlight_functions = 1
  let g:go_highlight_function_parameters = 1
  let g:go_highlight_function_calls = 1
  let g:go_highlight_types = 1
  let g:go_highlight_fields = 1
  let g:go_highlight_build_constraints = 1
  let g:go_highlight_generate_tags = 1
  let g:go_highlight_variable_declarations = 1
  let g:go_highlight_variable_assignments = 1
endif

"'' Lightline ''"
if filereadable(expand("~/.config/nvim/plugged/lightline.vim/plugin/lightline.vim"))
  let g:lightline = {'colorscheme' : 'horizon'}
endif

"COPY/PASTE:
"-----------
"Increases the memory limit from 50 lines to 1000 lines
:set viminfo='100,<1000,s10,h

"NUMBERING:
"----------
:set number

"INDENTATION:
"------------
"Highlights code for multiple indents without reselecting
vnoremap < <gv
vnoremap > >gv

"COLOR:
"------
colorscheme gruvbox

"AUTO IMPORT:
"------------
let g:go_fmt_command = "goimports"

"AUTOCOMPLETE:
"-------------
augroup ncm2
  au!
  autocmd BufEnter * call ncm2#enable_for_buffer()
  set completeopt=noinsert,menuone,noselect
  au User Ncm2PopupOpen set completeopt=noinsert,menuone,noselect
  au User Ncm2PopupClose set completeopt=menuone
augroup END
"Press Enter to select item in autocomplete popup
inoremap <silent> <expr> <CR> (pumvisible() ? ncm2_ultisnips#expand_or("\<CR>", 'n') : "\<CR>")
"Cycle through completion entries with tab/shift+tab
inoremap <expr> <TAB> pumvisible() ? "\<c-n>" : "\<TAB>"
inoremap <expr> <s-tab> pumvisible() ? "\<c-p>" : "\<TAB>"
"Allow getting out of pop with Down/Up arrow keys
inoremap <expr> <down> pumvisible() ? "\<C-E>" : "\<down>"
inoremap <expr> <up> pumvisible() ? "\<C-E>" : "\<up>"

"SNIPPETS:
"---------
"Change default expand since TAB is used to cycle options
let g:UltiSnipsExpandTrigger="<c-j>"
let g:UltiSnipsJumpForwardTrigger="<c-j>"
let g:UltiSnipsJumpBackwardTrigger="<c-k>"

"FILE SEARCH:
"------------
"allows FZF to open by pressing CTRL-F
map <C-p> :FZF<CR>
"allow FZF to search hidden 'dot' files
let $FZF_DEFAULT_COMMAND = "find -L"

"FILE BROWSER:
"-------------
"allows NERDTree to open/close by typing 'n' then 't'
map nt :NERDTreeTabsToggle<CR>
"Start NERDtree when dir is selected (e.g. "vim .") and start NERDTreeTabs
let g:nerdtree_tabs_open_on_console_startup=2
"Add a close button in the upper right for tabs
let g:tablineclosebutton=1
"Automatically find and select currently opened file in NERDTree
let g:nerdtree_tabs_autofind=1
"Add folder icon to directories
let g:WebDevIconsUnicodeDecorateFolderNodes = 1
let g:DevIconsEnableFoldersOpenClose = 1
"Hide expand/collapse arrows
let g:NERDTreeDirArrowExpandable = "\u00a0"
let g:NERDTreeDirArrowCollapsible = "\u00a0"
let g:WebDevIconsNerdTreeBeforeGlyphPadding = ""
highlight! link NERDTreeFlags NERDTreeDir

"SHORTCUTS:
"----------
"Open file at same line last closed
if has("autocmd")
  au BufReadPost * if line("'\"") > 0 && line("'\"") <= line("$")
  \| exe "normal! g'\"" | endif
endif

"SOURCING:
"---------
"Automatically reloads neovim configuration file on write (w)
autocmd! bufwritepost init.vim source %

"MOUSE:
"------
"Allow using mouse helpful for switching/resizing windows
set mouse+=a
if &term =~ '^screen'
  " tmux knows the extended mouse mode
  set ttymouse=xterm2
endif

"TEXT SEARCH:
"------------
"Makes Search Case Insensitive
set ignorecase

"SWAP:
"-----
set dir=~/.local/share/nvim/swap/

"GIT (FUGITIVE):
"---------------
map fgb :Gblame<CR>
map fgs :Gstatus<CR>
map fgl :Glog<CR>
map fgd :Gdiff<CR>
map fgc :Gcommit<CR>
map fga :Git add %:p<CR>

"SYNTAX HIGHLIGHTING:
"--------------------
syntax on

"HIGHLIGHTING:
"-------------
" <Ctrl-l> redraws the screen and removes any search highlighting.
nnoremap <silent> <C-l> :nohl<CR><C-l>
" Highlight the current line the cursor is on
set cursorline
