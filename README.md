TODO: finsh lua refactoring for nvim  
TODO: tmux todos  

# dev-env

### win

1. git
2. visual studio
3. golang
4. python + pip
5. docker
6. neovim (setup bellow with chocolatey)
7. windows terminal
8. notepad++

### ide
1. neovim (installed in both win and linux - config is at the end of the guide)

2. notepad++
    - PluginManager - https://github.com/bruderstein/nppPluginManager
    - Diff plugini - https://github.com/pnedev/compare-plugin
  
3. visual studio
    - Wakatime
    - Atom Material Theme
    - Remote WSL
    - Terraform
    - Golang
    - Python

### powershell setup

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
Set-ExecutionPolicy Bypass -Scope Process -Force; Invoke-Expression ((New-Object System.Net.WebClient).DownloadString('https://ohmyposh.dev/install.ps1'))
# You can find the themes in the folder indicated by the environment variable POSH_THEMES_PATH
```

Configure shell and theme - after fonts are installed they have to be selected from windows terminal appearance config
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


### wsl setup
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


### linux configuration : 

0. Configurte no password sudo for main user
```
# Open sudo config
sudo visudo

# Add
<user> ALL=(ALL) NOPASSWD: ALL
```

2. Install zsh 
```
sudo apt install zsh
```

2.1 Configure zsh


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
mkdir ~/repos && cd ~/repos
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
p10k configure
```

Need CascadiaCode fonts for this theme. Nerdfont variant of CascadiaCode should be applied on Windows terminal also in order for it to take effect in the WSL shell.

AUTOAMTED WAY TO INSTALL NERD FONTS (recommended) : 
```
# in powershell
oh-my-posh font install
```

MANUAL WAY TO INSTALL NERD FONTS (only if automated way doesn't work) : 
If we dont see diamond in powerlevel10k rather we see unicode stuff like []; the windows terminal theme is lacking support or windows fonts for it are not installed :
https://docs.microsoft.com/en-us/windows/terminal/tutorials/powerline-setup
https://docs.microsoft.com/en-us/windows/terminal/cascadia-code

!! IT IS NOW MUCH EASIER TO INSTALL FONTS FROM POWERSHELL - using oh-my-posh font install
! Check those may alraedy be installed from the powershell setup steps - they may appear alraedy as options in the windows terminal appearance section

We need to install these fonts :
1. CascadiaCode
2. CascadiaCodePL
3. CascadiaMono
4. CascadiaMonoPL

We also need Nerd Fonts for rendeing icons in NERDTree, zsh, etc
https://github.com/ryanoasis/nerd-fonts#option-2-release-archive-download
Download whichever font we need from the latest archives (CascadiaCode.zip will contain caskaydia)
Option 1. Caskaydia Cove Nerd Font - same as the microsoft cascadia fonts, but with added nerd font icons and stuff

tmux config - already in .zshrc but here for reference

copy the tmux.conf
```
cp ~/repos/dev-env/tmux/.tmux.conf ~/.tmux.conf
cat ~/.tmux.conf
```

config in .zshrc
```
# dev env
TMUX_DEV_ENV_SESSION="dev"
tmux has-session -t $TMUX_DEV_ENV_SESSION&> /dev/null
if [ $? != 0 ] 
 then
    tmux new-session -s $TMUX_DEV_ENV_SESSION -n "dev" -d
    tmux send-keys -t $TMUX_DEV_ENV_SESSION "~/repos/dev-env/" C-m 
fi

# landing zones project
alias dev="tmux a -t dev"

TMUX_LZ_SESSION="lz"
tmux has-session -t $TMUX_LZ_SESSION&> /dev/null
if [ $? != 0 ] 
 then
    tmux new-session -s $TMUX_LZ_SESSION -n "lz_nvim" -d "cd ~/repos/itgix/itgix-aws-landing-zones/ && nvim ./"
 
    # stat new window in session and switch to dir
    tmux new-window -d -n "lz_tf_exec" -t $TMUX_LZ_SESSION:1
    tmux send-keys -t $TMUX_LZ_SESSION:1 "~/repos/itgix/itgix-aws-landing-zones/landing-zone-deployment" C-m

    tmux new-window -d -n "lz_tf_modules_nvim" -t $TMUX_LZ_SESSION:2 "cd ~/repos/itgix/itgix-aws-landing-zones/terraform-modules/ && nvim ./"

    tmux new-window -d -n "lz_tf_modules_dir" -t $TMUX_LZ_SESSION:3
    tmux send-keys -t $TMUX_LZ_SESSION:3 "~/repos/itgix/itgix-aws-landing-zones/terraform-modules/" C-m
fi

alias lz="tmux a -t lz"

# vw projects
TMUX_VW_SESSION="vw"
tmux has-session -t $TMUX_VW_SESSION&> /dev/null
if [ $? != 0 ] 
 then
    # TODO window for the tunnels with ncat split window
    tmux new-session -s $TMUX_VW_SESSION -n "vw_nvim" -d
    tmux send-keys -t $TMUX_VW_SESSION "~/repos/vwfs/" C-m

    tmux new-window -d -n "vw_tf" -t $TMUX_VW_SESSION:1
    tmux send-keys -t $TMUX_VW_SESSION:1 "~/repos/vwfs/" C-m

    tmux new-window -d -n "vw_login" -t $TMUX_VW_SESSION:2
    tmux split-window -h -t $TMUX_VW_SESSION:2
fi

alias vw="tmux a -t vw"
```

3. Install neovim - https://github.com/neovim/neovim/releases
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

TODO: !
on next install check options for color scheme Kanagawa- https://github.com/rebelot/kanagawa.nvim?tab=readme-ov-file  
on next install redo neovim configs into lua and fix lsps

5. install golang - https://go.dev/doc/install
```
# download a version of go
wget https://go.dev/dl/go1.24.3.linux-amd64.tar.gz

# make sure no previous installations exist and install the downloaded version
sudo rm -rf /usr/local/go && sudo tar -C /usr/local -xzf go1.24.3.linux-amd64.tar.gz

# verify installation
~ ❯ go version                                                                                                                                                                                                                                                              04:15:15 PM
go version go1.24.3 linux/amd64
```
   
7. python + pip  
8. git - https://git-scm.com/download/linux
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

Git credential manager from Windows Git into WSL - https://github.com/MicrosoftDocs/wsl/blob/main/WSL/tutorials/wsl-git.md
```
# If GIT installed is >= v2.39.0
git config --global credential.helper "/mnt/c/Program\ Files/Git/mingw64/bin/git-credential-manager.exe"

# Configure WSL git to use it
git config --global credential.helper "/mnt/c/Program\ Files/Git/mingw64/bin/git-credential-manager.exe"
```

Alernatively Git credential manager can be setup without WindowS Git - https://github.com/git-ecosystem/git-credential-manager/blob/release/docs/wsl.md#configuring-wsl-without-git-for-windows  

example setup : 
download latest credential manager from - https://github.com/git-ecosystem/git-credential-manager  
either run the .exe to install it or copy the zip and extract it
than configure git in WSL : 
```
git config --global credential.helper "/mnt/c/Program\ Files\ \(x86\)/Git\ Credential\ Manager/git-credential-manager.exe"

# For Azure DevOps support only
git config --global credential.https://dev.azure.com.useHttpPath true
```

In Windows you need to update the WSLENV environment variable to include the value GIT_EXEC_PATH/wp. From an Administrator powershell run the following:

```
SETX WSLENV %WSLENV%:GIT_EXEC_PATH/wp
```
After updating the WSLENV environment variable, restart your WSL installation.
keep in mind the calling the credential manager directly to test if works will fail with this alternative strategy but it will work when called from Git itself, example error : 
```
~ ❯ /mnt/c/Program\ Files\ \(x86\)/Git\ Credential\ Manager/git-credential-manager.exe --version

Unhandled Exception: System.Exception: Failed to locate 'git.exe' executable on the path.
   at GitCredentialManager.EnvironmentExtensions.LocateExecutable(IEnvironment environment, String program)
   at GitCredentialManager.CommandContext.GetGitPath(IEnvironment environment, IFileSystem fileSystem, ITrace trace)
   at GitCredentialManager.CommandContext..ctor()
   at GitCredentialManager.Program.AppMain(Object o)
   at System.Threading.ThreadHelper.ThreadStart_Context(Object state)
   at System.Threading.ExecutionContext.RunInternal(ExecutionContext executionContext, ContextCallback callback, Object state, Boolean preserveSyncCtx)
   at System.Threading.ExecutionContext.Run(ExecutionContext executionContext, ContextCallback callback, Object state, Boolean preserveSyncCtx)
   at System.Threading.ExecutionContext.Run(ExecutionContext executionContext, ContextCallback callback, Object state)
   at System.Threading.ThreadHelper.ThreadStart(Object obj)
```



If we intend to use Azure DevOps or Azure repos we also need to set the crential config bellow to avoid these errors - "fatal: Cannot determine the organization name for this 'dev.azure.com' remote URL. Ensure the `credential.useHttpPath` configuration value is set, or set the organization name as the user in the remote URL '{org}@dev.azure.com'."
```
git config --global credential.https://dev.azure.com.useHttpPath true
```

8. docker - enable Docker WSL integration  
9. terraform // hashicorp yum repo - https://developer.hashicorp.com/terraform/tutorials/aws-get-started/install-cli  
    tfswitch - https://tfswitch.warrensbox.com/Install/ ; https://github.com/warrensbox/terraform-switcher  

enable tf autocomplete
```
terraform -install-autocomplete
```
10. kubectl - https://kubernetes.io/docs/tasks/tools/install-kubectl-linux/

# for latest version : 
```
curl -LO "https://dl.k8s.io/release/$(curl -L -s https://dl.k8s.io/release/stable.txt)/bin/linux/amd64/kubectl"
```

```
sudo install -o root -g root -m 0755 kubectl /usr/local/bin/kubectl
```

11. helm / helm diff - https://github.com/databus23/helm-diff
- helm autocompletion - To load completions for every new session, execute once:
```
# zsh should already be setup
helm completion zsh > "${fpath[1]}/_helm"
```
12. ssh keys


13. saml2aws (needs to be done after ZSH) - https://github.com/Versent/saml2aws#linux
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

to persistently store password we need to configure pass (the unix password manager) as backend for saml2aws as passwords are not stored permanently in WSL2 and wincred is not supported   
steps to set this up - https://github.com/Versent/saml2aws?tab=readme-ov-file#option-2-configure-pass-to-be-the-default-keyring

14. k9s https://k9scli.io/topics/install/
15. aws cli - https://docs.aws.amazon.com/cli/latest/userguide/getting-started-install.html
16. Configure neovim - https://github.com/boris-yakimov/dev-env/blob/main/neovim.md
