## Arch

btrfs - recommended layout
Audio - Pipewire (there were issues with Pulse)

## Tools

either install them during archinstall or after with pacman
```
# shell / terminal
zsh
ghostty
kitty (should already be installed by hyperland)

# editor
neovim

# for neovim
ripgrep
python-neovim

# tools
curl
wget
less
git
unzip

# work
aws-cli-v2
terraform
kubectl
k8s
helm

# programming languages
go
lua
python

# programming utilities
clang
gopls
python-pip
nodejs # needed for npm
npm # needed for pyright in neovim

# UI
wofi
waybar
# fonts
otf-font-awesome
ttf-nerd-fonts-symbols
ttf-nerd-fonts-symbols-mono
```

## Neovim

add custom lua configs
```
rm -rf ~/.config/nvim/
cd ~/repos/boris/dev-env/linux/
mkdir -p ~/.config/nvim && cp -r ~/repos/boris/dev-env/linux/neovim/* ~/.config/nvim/
```

open nvim and run lazy to update plugins
```
:Lazy
```

verify healthcheck of plugins
```
:checkhealth telescope
:checkhealth
```

verify that LSPs are working
```
# open any file type that we use an lsp for - .go, .tf, .py, lua, etc
:LspInfo
```

## TMUX
copy the tmux.conf
```
cp ~/repos/boris/dev-env/linux/tmux/.tmux.conf ~/.tmux.conf
cat ~/.tmux.conf
```

## ZSH
install oh-my-zsh
```
sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
```

Autosuggestions oh-my-zsh plugin
```
git clone https://github.com/zsh-users/zsh-autosuggestions
mv zsh-autosuggestions/ ~/.oh-my-zsh/custom/plugins/zsh-autosuggestions/
```

Copy .zshrc file from repo
```
cp ~/repos/boris/dev-env/linux/zsh/.zshrc ~/
```

Syntax Highlight for zsh - https://github.com/zsh-users/zsh-syntax-highlighting
```
# Downlaod
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting
```

Install powerlevel10k theme/prompt for oh-my-zsh
```
git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k   
```


Install fzf - https://github.com/junegunn/fzf
```
git clone --depth 1 https://github.com/junegunn/fzf.git ~/.fzf
~/.fzf/install
```


Configure fzf zsh history search - https://github.com/joshskidmore/zsh-fzf-history-search
```
git clone https://github.com/joshskidmore/zsh-fzf-history-search ${ZSH_CUSTOM:=~/.oh-my-zsh/custom}/plugins/zsh-fzf-history-search
```

change default shell to zsh
```

# check if shell is already zsh
echo $SHELL

# if it is not, change it
chsh -s $(which zsh)

# also check the shell under current user
grep "^$(whoami):" /etc/passwd
```

## Hyprland

default config - /home/boris/.config/hypr/hyprland.conf 

get list of monitors (take note of ID)
```
hyprctl monitors all
```

configure monitor resolution and scaling
```
monitor=DP-1,preferred,auto,1.5 
```

program launcher - Wofi - https://github.com/SimplyCEO/wofi 
```
# in the hyprland conf
$menu = wofi --show drun  

# install it in arch
sudo pacman -S wofi
```

status bar - Waybar - https://github.com/Alexays/Waybar
```
# install waybar and required fonts for the bar icons
sudo pacman -S waybar
sudo pacman -S ttf-nerd-fonts-symbols ttf-nerd-fonts-symbols-mono otf-font-awesome

# create config dir
mkdir ~/.config/waybar

# copy waybar config and style files
cp hyprland/waybar/style.css hyprland/waybar/config ~/.config/waybar/
```

"format": "  {:%Y-%m-%d}    {:%H:%M}"

