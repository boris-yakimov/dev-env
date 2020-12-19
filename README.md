# dev-env

## win

1. git
2. visual studio
3. atom
4. golang
5. python + pip
6. docker
7. windows power toys

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

Install/Config : 

1. golang
2. python + pip
3. git
4. docker
5. terraform // hashicorp repo
6. helm
7. ssh keys


### zsh
apt-get install zsh
```
sed -i s/yakim/<your new user>/g zsh/.zshrc 
cp zsh/.zshrc ~/.zshrc
```

Install oh-my-zsh
```
# When prompted to set zsh as your default shell say Yes
sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
```


Install powerlevel10k theme/prompt - https://github.com/romkatv/powerlevel10k
```
git clone --depth=1 https://github.com/romkatv/powerlevel10k.git
$ZSH_CUSTOM/themes/powerlevel10k
```

Change zsh theme : 
```
vim ~/.zshrc
ZSH_THEME=powerlevel10k/powerlevel10k
```

```
source ~/.zshrc
p10kconfigure
```

If we dont see diamond in powerlevel10k rather we see unicode stuff like []; the windows terminal theme is lacking support or windows fonts for it are not installed :
https://docs.microsoft.com/en-us/windows/terminal/tutorials/powerline-setup
https://docs.microsoft.com/en-us/windows/terminal/cascadia-code

### nvim
apt install nodejs
apt install neovim
cp nvim/init.vim ~/.config/nvim/init.vim
vim-plug - https://github.com/junegunn/vim-plug
NERDCommenter
PlugInstall

verify everything is good with : 
```
nvim +checkhealth
```

configure python provider: 
```
pip3 install --upgrade pynvim
pip3 install --upgrade neovim-remote
nvim +checkhealth
```

nvim clipboard failing in :healthcheck can be ignored,we can copy paste stuff by disabling mouse VISUAL mode in vim temporarily :
```
:set mouse=
```
