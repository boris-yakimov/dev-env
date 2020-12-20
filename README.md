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

### nvim - good guide - https://octetz.com/docs/2019/2019-04-24-vim-as-a-go-ide/
apt install nodejs
apt install neovim
cp nvim/init.vim ~/.config/nvim/init.vim
vim-plug - https://github.com/junegunn/vim-plug
NERDCommenter

Install plugins and Go binaries (requires GOBIN to be set properly in zsh and env var) - https://octetz.com/docs/2019/2019-04-24-vim-as-a-go-ide/
```
nvim +PlugInstall
nvim +GoInstallBinaries
```
verify tools are in $GOBIN
```
ls -la $GOBIN

output : 
total 193800
drwxr-xr-x 2 root root     4096 Dec 20 13:05 .
drwxr-xr-x 5 root root     4096 Dec  5 17:40 ..
-rwxr-xr-x 1 root root  2860404 Dec 20 13:05 asmfmt
-rwxr-xr-x 1 root root 15926434 Dec  5 17:53 dlv
-rwxr-xr-x 1 root root  5491433 Dec 20 13:04 errcheck
-rwxr-xr-x 1 root root  5673946 Dec 20 13:04 fillstruct
-rwxr-xr-x 1 root root  3515629 Dec  5 17:28 go-outline
-rwxr-xr-x 1 root root 10732151 Dec  5 17:28 gocode
-rwxr-xr-x 1 root root 10290723 Dec  5 17:29 gocode-gomod
-rwxr-xr-x 1 root root  7386515 Dec  5 17:29 godef
-rwxr-xr-x 1 root root  5173695 Dec  5 17:29 goimports
-rwxr-xr-x 1 root root 31211352 Dec 20 13:05 golangci-lint
-rwxr-xr-x 1 root root  5300970 Dec  5 17:29 golint
-rwxr-xr-x 1 root root  3610803 Dec 20 13:05 gomodifytags
-rwxr-xr-x 1 root root  5283930 Dec  5 17:28 gopkgs
-rwxr-xr-x 1 root root 22440979 Dec 20 13:04 gopls
-rwxr-xr-x 1 root root  5277056 Dec 20 13:04 gorename
-rwxr-xr-x 1 root root  3099060 Dec 20 13:04 gotags
-rwxr-xr-x 1 root root  9034530 Dec 20 13:04 guru
-rwxr-xr-x 1 root root  2755416 Dec 20 13:04 iferr
-rwxr-xr-x 1 root root  5878581 Dec 20 13:04 impl
-rwxr-xr-x 1 root root  5285935 Dec 20 13:05 keyify
-rwxr-xr-x 1 root root  3499857 Dec 20 13:04 motion
-rwxr-xr-x 1 root root  8568488 Dec  6 18:49 protoc-gen-go
-rwxr-xr-x 1 root root  8284236 Dec  5 20:15 protoc-gen-go-grpc
-rwxr-xr-x 1 root root 11804962 Dec 20 13:05 staticcheck
```

verify everything is good with : 
```
nvim +checkhealth
```

verify everything is good with a Go project : 
```
:CocList diagnostics
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
