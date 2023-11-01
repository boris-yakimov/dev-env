# dev-env

## win

1. git
2. visual studio
3. golang
4. python + pip
5. docker
6. neovim (setup bellow with chocolatey)

### ide
1. visual studio
    - Wakatime
    - Atom Material Theme
    - Remote WSL
    - Terraform
    - Golang
    - Python
    - Tabnine

2. notepad++
    - PluginManager - https://github.com/bruderstein/nppPluginManager
    - Diff plugini - https://github.com/pnedev/compare-plugin

### terminal
1. windows terminal
	- windows-terminal/settings.json
	- may require fonts to be installed prior to configuration

### powershell

Install chocolatey and scoop
```
Set-ExecutionPolicy Bypass -Scope Process -Force; [System.Net.ServicePointManager]::SecurityProtocol = [System.Net.ServicePointManager]::SecurityProtocol -bor 3072; iex ((New-Object System.Net.WebClient).DownloadString('https://chocolatey.org/install.ps1'))
```
```
#  Set-ExecutionPolicy -ExecutionPolicy RemoteSigned -Scope CurrentUser  
Invoke-Expression (New-Object System.Net.WebClient).DownloadString('https://get.scoop.sh')
```

Install neovim with scoop
```
scoop install neovim
```

Install oh-my-posh
```
# https://ohmyposh.dev/docs/installation/windows
scoop install https://github.com/JanDeDobbeleer/oh-my-posh/releases/latest/download/oh-my-posh.json
# You can find the themes in the folder indicated by the environment variable POSH_THEMES_PATH
```

Configure shell and theme
```
# install fonts - https://ohmyposh.dev/docs/installation/fonts
# run as Admin or pass --user
oh-my-posh font install

## configure prompt - https://ohmyposh.dev/docs/installation/prompt
# get current shell
oh-my-posh get shell

# edit profile config (if customization required)
notepad $PROFILE
# add in file cmd to start oh-my-posh in every powershell profile
oh-my-posh init pwsh | Invoke-Expression

# source latest profile config
. $PROFILE
```

## wsl 
https://learn.microsoft.com/en-us/windows/wsl/setup/environment
Set default WSL distro - in powershell

```
wsl --setdefault <os_name>
wsl --list -v
```

(Optional) Change default Ubuntu user to root - in powershell
```
ubuntu config --default-user root
```


Install/Config : 

1. Install zsh 
   ```
   apt install zsh
   ```

1.1 Configure zsh
### zsh configuration

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

Copy .zshrc file from repo
```
mkdir ~/repos
git clone https://github.com/burizz/dev-env.git
 cp ~/repos/dev-env/zsh/.zshrc ~/
```

Than load it in ~/.zshrc in the plugins section
```
# Plugins should be a part of the same plugins=() block otherwise it takes only the last one if there is more than one
plugins=(zsh-autosuggestions)
source ~/.zshrc
```

Syntax Highlight for zsh - https://github.com/zsh-users/zsh-syntax-highlighting
```
# Downlaod
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting
```

Than load it in .zshrc along with other plugins
```
plugins=(zsh-fzf-history-search zsh-autosuggestions zsh-syntax-highlighting git)
source ~/.zshrc
```


Add custom .zshrc vars
Make sure the paths are correct and exist - vscode, chrome, notepad++, etc
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

# Autocompletion for saml2aws
eval "$(saml2aws --completion-script-zsh)"

# Display
#export DISPLAY=:0

# Aliases - make sure paths are correct and exist
export BROWSER=/mnt/c/Program\ Files/Google/Chrome/Application/chrome.exe
alias browse='/mnt/c/Program\ Files/Google/Chrome/Application/chrome.exe'
alias home='cd /mnt/c/Users/byakimov_ad/Desktop'
alias notepad='/mnt/c/Program\ Files/Notepad++/notepad++.exe'
alias vim="nvim"
alias vi="nvim"

### End Custom config ###
```

repalce user in .zshrc
```
sed -i s/yakim/<new user>/g ~/.zshrc
source ~/.zshrc
```

Install powerlevel10k theme/prompt for oh-my-zsh
```
git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k
```

check Getting Started section to install required fonts from https://github.com/romkatv/powerlevel10k

Change zsh theme : 
```
vim ~/.zshrc
ZSH_THEME="powerlevel10k/powerlevel10k"
source ~/.zshrc
```

change default shell to zsh
```
chsh -s $(which zsh)
```

Install fzf - https://github.com/junegunn/fzf
```
git clone --depth 1 https://github.com/junegunn/fzf.git ~/.fzf
~/.fzf/install
```

Configure fzf zsh history search - https://github.com/joshskidmore/zsh-fzf-history-search
```
# Install
git clone https://github.com/joshskidmore/zsh-fzf-history-search ${ZSH_CUSTOM:=~/.oh-my-zsh/custom}/plugins/zsh-fzf-history-search

# Than add in .zshrc file
plugins=(… zsh-fzf-history-search)
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
Download whichever font we need from the latest archives (CascadiaCode.zip will contain caskaydia)
Option 1. Caskaydia Cove Nerd Font - same as the microsoft cascadia fonts, but with added nerd font icons and stuff

   
2. Install neovim - https://github.com/neovim/neovim/releases
   ```
   apt install neovim
   
   # or for newer versions
   # PPA repo is not officially maintained by neovim team
   sudo apt-get install software-properties-common
   sudo add-apt-repository ppa:neovim-ppa/stable
   sudo apt-get update
   sudo apt-get install neovim

   # for latest version using appimage (works on most linux systems
   curl -LO https://github.com/neovim/neovim/releases/latest/download/nvim.appimage
   chmod u+x nvim.appimage
   ./nvim.appimage

   # If the ./nvim.appimage command fails, try:
   ./nvim.appimage --appimage-extract
   ./squashfs-root/AppRun --version

   # Optional: exposing nvim globally.
   sudo mv squashfs-root /
   sudo ln -s /squashfs-root/AppRun /usr/bin/nvim
   nvim
   
   # or install check install guide for other approaches - https://github.com/neovim/neovim/wiki/Installing-Neovim
   ```

3. golang  
4. python + pip  
5. git - https://git-scm.com/download/linux
   ```
   # Latest stable git
   sudo add-apt-repository ppa:git-core/ppa
   sudo apt update; sudo apt install git
   ```

   Setup - https://learn.microsoft.com/en-us/windows/wsl/tutorials/wsl-git
   ```
   git config --global user.name "Your Name"
   git config --global user.email "youremail@domain.com"
   ```

   Git credential manager from Windows into WSL - https://github.com/MicrosoftDocs/wsl/blob/main/WSL/tutorials/wsl-git.md
   ```
   # If GIT installed is >= v2.39.0
   git config --global credential.helper "/mnt/c/Program\ Files/Git/mingw64/bin/git-credential-manager.exe"

   # Configure WSL git to use it
   git config --global credential.helper "/mnt/c/Program\ Files/Git/mingw64/bin/git-credential-manager.exe"
   ```

   If we intend to use Azure DevOps or Azure repos we also need to set the crential config bellow to avoid these errors - "fatal: Cannot determine the organization name for this 'dev.azure.com' remote URL. Ensure the `credential.useHttpPath` configuration value is set, or set the organization name as the user in the remote URL '{org}@dev.azure.com'."
   ```
   git config --global credential.https://dev.azure.com.useHttpPath true
   ```


6. docker - enable Docker WSL integration   
7. terraform // hashicorp yum repo - https://developer.hashicorp.com/terraform/tutorials/aws-get-started/install-cli
    tfswitch - https://tfswitch.warrensbox.com/Install/ ; https://github.com/warrensbox/terraform-switcher
    enable tf autocomplete
    ```
    terraform -install-autocomplete
    ```
8. kubectl - https://kubernetes.io/docs/tasks/tools/install-kubectl-linux/

    # for latest version : 
    ```
    curl -LO "https://dl.k8s.io/release/$(curl -L -s https://dl.k8s.io/release/stable.txt)/bin/linux/amd64/kubectl"
    ```
    
    ```
    sudo install -o root -g root -m 0755 kubectl /usr/local/bin/kubectl
    ```


9. helm / helm diff - https://github.com/databus23/helm-diff
    - helm autocompletion - To load completions for every new session, execute once:
    ```
    # zsh should already be setup
    helm completion zsh > "${fpath[1]}/_helm"
    ```
10. ssh keys


11. saml2aws (needs to be done after ZSH) - https://github.com/Versent/saml2aws#linux
    ```
    # Install saml2aws - if these steps fail just download the latest binary from Github
    CURRENT_VERSION=$(curl -Ls https://api.github.com/repos/Versent/saml2aws/releases/latest | grep 'tag_name' | cut -d'v' -f2 | cut -d'"' -f1)
    wget -c https://github.com/Versent/saml2aws/releases/download/v${CURRENT_VERSION}/saml2aws_${CURRENT_VERSION}_linux_amd64.tar.gz -O - | tar -xzv -C ~/.local/bin
    chmod u+x ~/.local/bin/saml2aws
    hash -r
    saml2aws --version

    # Configure autocomplete
    eval "$(saml2aws --completion-script-zsh)"
    ```

12. k9s https://k9scli.io/topics/install/

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

scroll through whole vim guide before starting !

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

Run :checkhealth in vim to see what is the status of all vim plugins

8. win32yank - clipboard - guide https://github.com/neovim/neovim/wiki/FAQ#how-to-use-the-windows-clipboard-from-wsl
    ```
    sudo curl -sLo/tmp/win32yank.zip https://github.com/equalsraf/win32yank/releases/download/v0.0.4/win32yank-x64.zip
    sudo unzip -p /tmp/win32yank.zip win32yank.exe > /tmp/win32yank.exe
    sudo chmod +x /tmp/win32yank.exe
    sudo mv /tmp/win32yank.exe /usr/local/bin
    ```
    in case of issues with clipbarod even with win32yank configured  - it should not show as xclip under :checkhealth
    
    If Neovim is installed on both Windows and within the WSL distribution, the win32yank.exe binary provided by the Neovim Windows installation can be symlinked to a directory included in our $PATH so it can be found by Neovim on WSL. Replace $NEOVIM_WIN_DIR with the path to our Neovim Windows installation, e.g. /mnt/c/Program Files/Neovim. The command can then be symlinked using:
    ```
    sudo ln -s "$NEOVIM_WIN_DIR/bin/win32yank.exe" "/usr/local/bin/win32yank.exe"
    ```

    make sure Neovim is also installed on Windows
    ```
    scoop install neovim

    # Set symlink in WSL to win32yank that is part of Neovim - Windows path may be different here
    sudo ln -s /mnt/c/Users/yakim/scoop/apps/neovim/current/bin/win32yank.exe /usr/local/bin/win32yank.exe
    ```

    In either case, don't forget to set Neovim's clipboard to unnamedplus using set clipboard=unnamedplus to make Neovim use the system's (i.e Windows') clipboard by default.

    If Neovim keeps detecting xclip instead of win32yank; we can rename it (not sure if this may not cause other issues)
    ```
    mv /usr/bin/xclip /usr/bin/xclip-bkp
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

nvim clipboard failing in :healthcheck can be temporarily ignored,we can copy paste stuff by temporarily disabling mouse VISUAL mode in vim temporarily :
afterwards yank copy stuff needs to be fixed to work properly with windows clipboard
```
:set mouse=
```
