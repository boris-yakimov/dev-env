## Arch

btrfs - recommended layout
Audio - Pipewire (there were issues with Pulse)

## Tools

update OS repo mirrors and packages
```
sudo pacman -Syu
```

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
kvantum # theme for dolphin file manager 

# hyprland
hyprshot  # screenshots
swaync    # desktop notifications
hyprlock  # lock screen
hypridle  # idle management
hyprpaper # wallpaper management
```

## Package management
install flatpak
```
sudo pacman -S flatpak
```

install AUR (yay)
TODO:

## Fonts
option 1 - full nerd fonts package (over 1.3GB of fonts)
```
sudo pacman -S nerd-fonts
```

option 2 - select group of fonts that we actually use
```
# for general use
sudo pacman -S noto-fonts noto-fonts-cjk noto-fonts-emoji noto-fonts-extra ttf-dejavu ttf-liberation

# for coding and terminals
sudo pacman -S adobe-source-code-pro-fonts ttf-hack
```

# TODO: check if need those on the next install - the first 2 install commands should be enough for everything
```
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

default config - ~/.config/hypr/hyprland.conf 
must haves - https://wiki.hypr.land/Useful-Utilities/Must-have/

get list of monitors (take note of ID)
```
hyprctl monitors all
```

configure monitor resolution and scaling
```
monitor=DP-1,preferred,auto,1.5 
```

program launcher - Wofi - https://github.com/SimplyCEO/wofi ; https://cloudninja.pw/docs/wofi.html
```
# install it in arch
sudo pacman -S wofi

# copy the style and script files of wofi
cp hyprland/wofi/style.css hyprland/wofi/wofi-menu.sh ~/.config/wofi/

```

status bar - Waybar - https://github.com/Alexays/Waybar ; https://github.com/Alexays/Waybar/wiki/Configuration ; examples - https://github.com/Alexays/Waybar/wiki/Examples
```
# install waybar and required fonts for the bar icons
sudo pacman -S waybar
sudo pacman -S ttf-nerd-fonts-symbols ttf-nerd-fonts-symbols-mono otf-font-awesome

# create config dir
mkdir ~/.config/waybar

# copy waybar config and style files
rm -f ~/.config/waybar/*
cp hyprland/waybar/style.css ~/.config/waybar/
cp hyprland/waybar/config.jsonc ~/.config/waybar/
```

Hyprlock
```
# copy hyprlock config
cp hyprland/hyprlock.conf ~/.config/hyprland/hyprlock.conf
```

Hypridle
```
# copy hypr idle config
cp hyprland/hypridle.conf ~/.config/hyprland/hypridle.conf
```

Hyprpaper
```
# copy hypr paper config and images
mkdir ~/.config/images/
# copy images from drive to ~/.config/images folder
cp hyprland/hyprpaper.conf ~/.config/hyprland/hyprpaper.conf
```

Dolphin file manager
```
# update theme
kvantummanager
# choose KVRoughGlass
```



## Steam
add multilib repo to pacman
```
sudo vim /etc/pacman.conf

# uncomment the multilib section
[multilib]
Include = /etc/pacman.d/mirrorlist 
```

make sure everything is up to date
```
sudo pacman -Syu
```

install steam
```
sudo pacman -S steam
```

Ensure the appropriate 32-bit OpenGL or Vulkan drivers are also installed for your graphics card (e.g., lib32-nvidia-utils for NVIDIA, or lib32-mesa for AMD/Intel). The steam package installation should prompt you to select the necessary dependencies. 

install Vulkan-Tools
```
sudo pacman -Syu vulkan-tools
```

check info
```
vulkan-info
```

check GPU detected by Linux
```
lspci | grep VGA
```

check GPU driver
```
vulkaninfo | grep -i driver
```

install 32bit libraries (needed for the Steam Proton compatibility layer)

For Intel/AMD (Mesa):
```
sudo pacman -S lib32-mesa
```

For NVIDIA:
```
sudo pacman -S lib32-nvidia-utils
```

Enable Proton in Steam
Steam -> Settings -> Compatibility -> Select a Proton version (usually latest stable)
Make sure "Enable Steam Play for all other titles." is enabled

Install a custom Proton version (Proton GE) 
For potentially better compatibility with certain games, you can use a community-maintained version like Proton GE (GloriousEggroll). A convenient way to manage this is with the protonup-qt tool, available in the Arch User Repository (AUR).
```
yay -S protonup-qt
```

Open protonup-qt after installation to easily download and install different custom Proton versions. These versions will then appear in the Steam compatibility dropdown menu for you to select on a per-game basis.
```
protonup-qt
```


## Heroic Games Launcher (Epic, GoG, Amazon Games)
install heroic
```
flatpak install flathub com.heroicgameslauncher.hgl
```

run heroic
```
flatpak run com.heroicgameslauncher.hgl
```


## Localsend
https://localsend.org/

install
```
flatpak install flathub org.localsend.localsend_app
```

run
```
flatpak run org.localsend.localsend_app
```

# TODO: https://wiki.hypr.land/Hypr-Ecosystem/
# TODO: boxes for VMs
# fix bootloader
