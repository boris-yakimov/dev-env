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

### ide
visual studio
	- Wakatime
	- Atom Material Theme
	- Remote WSL
	- Terraform
	- Golang

atom
	- Terraform
	- Wakatime
	- Golang

notepad++
	- Diff plugin

### terminal
windows terminal
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
4. docker - enable Docker WSL integration 
5. terraform // hashicorp repo
6. helm
7. ssh keys


### zsh
apt-get install zsh

Install oh-my-zsh
```
# When prompted to set zsh as your default shell say Yes
sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
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

### nvim 
- good guide - https://octetz.com/docs/2019/2019-04-24-vim-as-a-go-ide/

1. vim-plug - https://github.com/junegunn/vim-plug
2. NERDCommenter
3. Coc and Tabnine - autocomplete
4. NERDTree
5. Theme - morhetz/gruvbox
6. Golang/Python/Rust support
7. Lightline
8. win32yank - clipboard - guide https://github.com/neovim/neovim/wiki/FAQ#how-to-use-the-windows-clipboard-from-wsl
    ```
    sudo curl -sLo/tmp/win32yank.zip https://github.com/equalsraf/win32yank/releases/download/v0.0.4/win32yank-x64.zip
    sudo unzip -p /tmp/win32yank.zip win32yank.exe > /tmp/win32yank.exe
    sudo chmod +x /tmp/win32yank.exe
    sudo mv /tmp/win32yank.exe /usr/local/bin
    ```

apt install nodejs
apt install neovim

Install yarn (Coc autocomplete needs it)
https://classic.yarnpkg.com/en/docs/install#debian-stable

Copy custom configs
```
mkdir -p ~/.config/nvim/
cp nvim/init.vim ~/.config/nvim/init.vim
cp 
```

configure python provider: 
```
pip3 install --upgrade pynvim
pip3 install --upgrade neovim-remote
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
nvim +CocInstall coc-tabnine
nvim +CocInstall coc-json
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

nvim clipboard failing in :healthcheck can be ignored,we can copy paste stuff by disabling mouse VISUAL mode in vim temporarily :
```
:set mouse=
```
