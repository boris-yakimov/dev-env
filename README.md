# dev-env

## win

1. git
2. visual studio
3. atom
4. golang
5. python + pip
6. docker
7. windows power toys
8. neovim
9. terraform - os repo
    - also - terraform -install-autocomplete

### ide
1. visual studio
    - Wakatime
    - Atom Material Theme
    - Remote WSL
    - Terraform
    - Golang

2. atom
    - Terraform
        - terraform-fmt
        - language-terraform
    - HCL language support
    - Wakatime
    - Golang

3. notepad++
    - PluginManager - https://github.com/bruderstein/nppPluginManager
    - Diff plugini - https://github.com/pnedev/compare-plugin

### terminal
1. windows terminal
	- windows-terminal/settings.json

### powershell

Install chocolatey and scoop
```
Set-ExecutionPolicy Bypass -Scope Process -Force; [System.Net.ServicePointManager]::SecurityProtocol = [System.Net.ServicePointManager]::SecurityProtocol -bor 3072; iex ((New-Object System.Net.WebClient).DownloadString('https://chocolatey.org/install.ps1'))
```
```
Invoke-Expression (New-Object System.Net.WebClient).DownloadString('https://get.scoop.sh')
```

Install posh-git and oh-my-posh
```
# You could have the following to allow for scripts execution 
# Set-ExecutionPolicy -ExecutionPolicy RemoteSigned -Scope CurrentUser
Install-Module posh-git -Scope CurrentUser
Install-Module oh-my-posh -Scope CurrentUser
```

Enable prompt
```
# Start the default settings (might not work so optional)
Set-Prompt

# To enable the engine edit your PowerShell profile, run
notepad $PROFILE

# and append the following lines to the profile file you just opened (or created in case the file was not there already):

Import-Module posh-git
Import-Module oh-my-posh
Set-Theme Paradox
```

## wsl 

Set default WSL distro
```
wsl --setdefault Ubuntu-20.04
wsl --list -v
```

Install/Config : 

1. golang
2. python + pip
3. git
    - use windows credential manager
    ```
    # Make sure its installed with Git on windows
    ls -lah /mnt/c/Program\ Files/Git/mingw64/libexec/git-core/git-credential-manager.exe

    # Configure WSL git to use it
    git config --global credential.helper "/mnt/c/Program\ Files/Git/mingw64/libexec/git-core/git-credential-manager.exe"
    ```
4. docker - enable Docker WSL integration 
5. terraform // hashicorp yum repo
6. kubectl - https://kubernetes.io/docs/tasks/tools/install-kubectl-linux/

    # for latest version : 
    ```
    curl -LO "https://dl.k8s.io/release/$(curl -L -s https://dl.k8s.io/release/stable.txt)/bin/linux/amd64/kubectl"
    ```
    
    # for specific verison : 
    ```
    curl -LO https://dl.k8s.io/release/v1.19.8/bin/linux/amd64/kubectl
    ```

    ```
    sudo install -o root -g root -m 0755 kubectl /usr/local/bin/kubectl
    ```


7. helm / helm diff - https://github.com/databus23/helm-diff
8. ssh keys


### zsh
apt-get install zsh

Install oh-my-zsh
```
# When prompted to set zsh as your default shell say Yes
sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
```

Autosuggestions oh-my-zsh plugin
```
git clone https://github.com/zsh-users/zsh-autosuggestions
mv zsh-autosuggestions/ ~/.oh-my-zsh/custom/plugins/zsh-autosuggestions/
```

Than load it in ~/.zshrc in the plugins section
```
plugins=(zsh-autosuggestions)
source ~/.zshrc
```

Add custom .zshrc vars
```
### Custom config ###

# ZSH 
ZSH_THEME="powerlevel10k/powerlevel10k"

# Automatic update of zsh without prompts
DISABLE_UPDATE_PROMPT=true

# Path
export PATH=$PATH:/usr/local/go/bin

# Go
export GOROOT=/usr/local/go
export GOPATH=$HOME/go
export GOBIN=$GOPATH/bin
export PATH=$PATH:$GOROOT:$GOPATH:$GOBIN

# Display
#export DISPLAY=:0

# Aliases
export BROWSER=/mnt/c/Program\ Files\ \(x86\)/Google/Chrome/Application/chrome.exe
alias browse='/mnt/c/Program\ Files\ \(x86\)/Google/Chrome/Application/chrome.exe'
alias home='cd /mnt/c/Users/byakimov_ad/Desktop'
#alias code='/mnt/c/Users/byakimov_ad/AppData/Local/Programs/Microsoft\ VS\ Code/Code.exe'
alias notepad++='/mnt/c/Users/byakimov_ad/AppData/Local/Microsoft/WindowsApps/notepad++.exe'
alias vim="nvim"
alias vi="nvim"

### End Custom config ###
```

repalce user in .zshrc
```
sed -i s/yakim/<new user>/g ~/.zshrc
source ~/.zshrc
```

Install powerlevel10k theme/prompt for oh-my-zsh - https://github.com/romkatv/powerlevel10k
```
git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k
```

Change zsh theme : 
```
vim ~/.zshrc
ZSH_THEME="powerlevel10k/powerlevel10k"
source ~/.zshrc
```

source should show the Powerlevel10k setup screen, if not run it manually : 
```
p10kconfigure
```

If we dont see diamond in powerlevel10k rather we see unicode stuff like []; the windows terminal theme is lacking support or windows fonts for it are not installed :
https://docs.microsoft.com/en-us/windows/terminal/tutorials/powerline-setup
https://docs.microsoft.com/en-us/windows/terminal/cascadia-code

We need to install these fonts :
1. CascadiaCode
2. CascadiaCodePL
3. CascadiaMono
4. CascadiaMonoPL

We also need Nerd Fonts for rendeing icons in NERDTree, zsh, etc
https://github.com/ryanoasis/nerd-fonts#option-2-release-archive-download
Download whichever font we need from the latest archives 
1. Caskaydia Cove Nerd Font - same as the microsoft cascadia fonts, but with added nerd font icons and stuff

### neovim 
convert between file formats
```
# Windows
:setlocal fileformat=dos
```

```
# Linux
:setlocal fileformat=unix
```

set soft word wrapping
```
:set wrap linebreak
```

good guides
    - https://octetz.com/docs/2019/2019-04-24-vim-as-a-go-ide/
    - https://dev.to/jogendra/using-vim-for-go-development-5hc6

1. vim-plug - https://github.com/junegunn/vim-plug
2. NERDCommenter
3. Coc and Tabnine - autocomplete
4. NERDTree (main tool) or nvim.tree (not tested)
5. Theme - morhetz/gruvbox
6. Golang/Python/Rust support
7. Lightline
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

8. win32yank - clipboard - guide https://github.com/neovim/neovim/wiki/FAQ#how-to-use-the-windows-clipboard-from-wsl
    ```
    sudo curl -sLo/tmp/win32yank.zip https://github.com/equalsraf/win32yank/releases/download/v0.0.4/win32yank-x64.zip
    sudo unzip -p /tmp/win32yank.zip win32yank.exe > /tmp/win32yank.exe
    sudo chmod +x /tmp/win32yank.exe
    sudo mv /tmp/win32yank.exe /usr/local/bin
    ```
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
  - https://github.com/juliosueiras/vim-terraform-completion

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

15. Python autocomplete - https://github.com/davidhalter/jedi-vim
    ```
    sudo python -m pip install jedi
    ```

    ```
    " Python autocomplete plugin
    Plug 'davidhalter/jedi-vim'
    ```

Install yarn (Coc autocomplete needs it)
https://classic.yarnpkg.com/en/docs/install#debian-stable

Copy custom configs
```
mkdir -p ~/.config/nvim/
cp nvim/init.vim ~/.config/nvim/init.vim
cp 
```

configure python provider (optional): 
```
pip3 install --upgrade pynvim
pip3 install --upgrade neovim-remote
```

configure node.js provider (optional): 
```
npm install -g neovim
```

Install plugins and Go binaries (requires GOBIN to be set properly in zsh and env var) - https://octetz.com/docs/2019/2019-04-24-vim-as-a-go-ide/
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

Verify Coc configuration
```
nvim +CocConfig
```

Install Coc stuff
```
nvim 
:CocInstall coc-tabnine
:CocInstall coc-json
```

Enable Coc extension autoupdate
```
nvim +CocCommand
extensions.toggleAutoUpdate
```

Enable ignore_all_lsp in tabnine
```
nvim +CocCommand
tabnine.openConfig

"ignore_all_lsp" : true
```

verify everything is good with a Go project : 
```
:CocList diagnostics
```

nvim clipboard failing in :healthcheck can be ignored,we can copy paste stuff by temporarily disabling mouse VISUAL mode in vim temporarily :
```
:set mouse=
```
