# This approach was deprecated after refactoring the setup with Lua and Lazyvim
### was used Dev.2021 - Nov.2024

Some of the nodes from the previous setup are added here just for reference 

CoC configuration - https://github.com/neoclide/coc.nvim
CoC Langauage servers - https://github.com/neoclide/coc.nvim/wiki/Language-servers


### neovim configuration

0. Create nvim config directory and init.vim file from vim
From inside neovim : 
```
# create a directory to hold the init.vim file
:call mkdir(stdpath('config'), 'p')
# then create an init.vim file
:exe 'edit '.stdpath('config').'/init.vim'
```
Or just create ~/.config/nvim/init.vim directory and file

copy contents of init.vim from this repo
make sure ~/.config/nvim/init.vim is created and has correct contents

1. vim-plug - https://github.com/junegunn/vim-plug
   Install Plug; open neovim and run PlugInstall ; PlugStatus

   Most points bellow should already be done by the PlugInstall if the correct init.vim file was added and PlugInstall executed :
2. NERDCommenter
3. CoC - CoC is a NodeJS extension host for vim & neovim, load extensions like VSCode and host language servers -
4. Tabnine/Github CoPilot (paid)
5. NERDTree (main tool) or nvim.tree (not tested)
6. Theme - morhetz/gruvbox
7. Golang/Python/Rust support
8. Lightline
- Example lightline config with different themes that also shows Git branch
```
"'' Configure Lightline status bar ''"
"let g:lightline = {'colorscheme' : 'horizon'}
"let g:lightline = {'colorscheme': 'wombat'}

" set lightline to include git-branch
let g:lightline = {
      \ 'active': {
      \   'left': [ [ 'mode', 'paste' ],
      \             [ 'gitbranch', 'readonly', 'filename', 'modified' ] ,
      \             [ 'venv', 'readonly'] ]
      \ },
      \ 'component_function': {
      \   'gitbranch': 'fugitive#head',
      \   'venv': 'virtualenv#statusline'
      \ },
      \ }
```

Run :checkhealth in vim to see what is the status of all vim plugins


9. Wakatime - https://github.com/wakatime/vim-wakatime
10. Terraform Plugin - https://github.com/hashivim/vim-terraform
```
# Allow vim-terraform to align settings automatically with Tabularize. - Default: 0
let g:terraform_align = 1

# Allow vim-terraform to use a custom path for the terraform binary. - Default: terraform
"let g:terraform_binary_path = 'terraform'

# Allow vim-terraform to automatically format *.tf and *.tfvars files with terraform fmt. You can also do this manually with the `:TerraformFmt` command. - Default: 0
let g:terraform_fmt_on_save = 1

# Allow vim-terraform to automatically fold (hide until unfolded) sections of
"let g:terraform_fold_sections = 1
```

Additional Terraform vim stuff : 
- Terraform Language Server - https://dev.to/braybaut/integrate-terraform-language-server-protocol-with-vim-38g
- https://github.com/juliosueiras/vim-terraform-completion (github issue with slowness - https://github.com/juliosueiras/vim-terraform-completion/issues/68)

11. Powershell plugin - https://vimawesome.com/plugin/windows-powershell-syntax-file
```
Plug 'vim-scripts/Windows-PowerShell-Syntax-Plugin'
```

12. Polyglot plugin - https://vimawesome.com/plugin/vim-polyglot
```
" Multi-language syntax plugin
Plug 'sheerun/vim-polyglot'
```


13. Install neovim - https://github.com/neovim/neovim/wiki/Installing-Neovim
```
sudo apt update
sudo apt install neovim
```
install neovim version >= 5
```
sudo add-apt-repository ppa:neovim-ppa/stable
sudo apt-get update
sudo apt-get install neovim
```

14. Install nodejs
```
sudo apt update
sudo apt install nodejs
```

this will likely install an older version if you need a newer version - https://www.digitalocean.com/community/tutorials/how-to-install-node-js-on-ubuntu-22-04
```
cd ~
curl -sL https://deb.nodesource.com/setup_18.x -o nodesource_setup.sh
sudo bash nodesource_setup.sh
sudo apt install nodejs
node -v

Output
v18.7.0
```

16. Python autocomplete - https://github.com/davidhalter/jedi-vim
```
sudo python -m pip install jedi
```

```
" Python autocomplete plugin
Plug 'davidhalter/jedi-vim'
```

17. Install yarn (Coc autocomplete needs it)
https://classic.yarnpkg.com/en/docs/install#debian-stable

Copy custom configs
```
mkdir -p ~/.config/nvim/
cp nvim/init.vim ~/.config/nvim/init.vim
cp 
```


18. configure python provider (optional): 
```
pip3 install --upgrade pynvim
pip3 install --upgrade neovim-remote
```

19. configure node.js provider (optional): 
```
npm install -g neovim
```
20. Install plugins and Go binaries (requires GOBIN to be set properly in zsh and env var) - https://octetz.com/docs/2019/2019-04-24-vim-as-a-go-ide/
```
nvim +PlugInstall
nvim +GoInstallBinaries
```
verify tools are in $GOBIN
```
ls -la $GOBIN
```

verify everything is good with : 
```
nvim +checkhealth
```

22. Github CoPilot - https://github.com/github/copilot.vim
Should already be in vim init
```
Plug 'github/copilot.vim'

# than run from nvim
:PlugInstall
:Copilot setup
```

Verify Coc configuration
```
nvim +CocConfig
```

Install JSON language extension for coc.nvim
```
nvim 
:CocInstall coc-json
```

Enable Coc extension autoupdate
```
nvim +CocCommand
extensions.toggleAutoUpdate
```

verify everything is good with a Go project : 
```
:CocList diagnostics
```


Some Options : 
set soft word wrapping
```
:set wrap linebreak
```

nvim clipboard failing in :healthcheck can be temporarily ignored,we can copy paste stuff by temporarily disabling mouse VISUAL mode in vim temporarily :
afterwards yank copy stuff needs to be fixed to work properly with windows clipboard
```
:set mouse=
```
