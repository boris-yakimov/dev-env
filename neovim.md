## required tools
nvim => v0.10
npm => ? (for ruff)
python => v3.12 (for pyright)
go => v1.23

nvim install 
```
sudo add-apt-repository ppa:neovim-ppa/stable
sudo apt-get update
sudo apt-get install neovim
```

### dependencies : 

1. ripgrep - https://github.com/BurntSushi/ripgrep
```
apt install ripgrep
```
2. fd - https://github.com/sharkdp/fd
```
apt install fd-find
```

3. Cascadia Code Nerd Font - make sure it is also set on the terminal as default

Setup Configs
prep dir for custom lua configs
```
mkdir -p ~/.config/nvim/lua/config/
```

4. Install nodejs and npm (for python lsp)
```
sudo apt update
sudo apt install -y nodejs npm

# verify
npm -v
node -v
```

### copy all lua configs : 
```
# first cleanup than copy
rm -rf ~/.config/nvim/
mkdir -p ~/.config/nvim && cp -r nvim-lua/* ~/.config/nvim/
```

### run, update and verify : 

open nvim and run lazy to update plugins
```
:Lazy 
```

verify healthcheck of plugins
```
:checkhealth telescope
:checkhealth
```

## TODO: verify these with the lua setup on the next install 
win32yank - clipboard - guide https://github.com/neovim/neovim/wiki/FAQ#how-to-use-the-windows-clipboard-from-wsl

check what is the latest version of win32yank
```
sudo curl -sLo/tmp/win32yank.zip https://github.com/equalsraf/win32yank/releases/download/v0.1.1/win32yank-x64.zip
sudo unzip -p /tmp/win32yank.zip win32yank.exe > /tmp/win32yank.exe
sudo chmod +x /tmp/win32yank.exe
sudo mv /tmp/win32yank.exe /usr/local/bin/
```
in case of issues with clipbarod even with win32yank configured  - it should not show as xclip under :checkhealth

If Neovim is installed on both Windows and within the WSL distribution, the win32yank.exe binary provided by the Neovim Windows installation can be symlinked to a directory included in our $PATH so it can be found by Neovim on WSL. Replace $NEOVIM_WIN_DIR with the path to our Neovim Windows installation, e.g. /mnt/c/Program Files/Neovim. The command can then be symlinked using:
```
sudo ln -s "$NEOVIM_WIN_DIR/bin/win32yank.exe" "/usr/local/bin/win32yank.exe"
```
make sure Neovim is also installed on Windows windows as well
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




### Some options : 
convert between file formats
```
# Windows
:setlocal fileformat=dos
```
```
# Linux
:setlocal fileformat=unix
```

