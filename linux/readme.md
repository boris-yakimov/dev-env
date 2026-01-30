## Arch

btrfs - recommended layout
Audio - Pipewire (there were issues with Pulse)

make sure EFI starts the linux bootloader first and windows
```
sudo efibootmgr -v
# example: make Boot0001 first, Boot0002 second
sudo efibootmgr -o 0001,0002
```

check if windows is in the bootloader options
```
ls /boot/loader/entries/
total 20K
drwxr-xr-x 2 root root 4.0K Nov 24 20:55 .
drwxr-xr-x 4 root root 4.0K Nov 24 20:52 ..
-rwxr-xr-x 1 root root  253 Nov 15 20:17 arch.conf
-rwxr-xr-x 1 root root  271 Nov 15 20:17 arch-fallback.conf
-rwxr-xr-x 1 root root   51 Nov 24 20:49 windows.conf
```
if those files exist with weird names we can safely rename them

Each .conf file corresponds to a boot option.
If there’s a windows.conf or similar file pointing to the Windows EFI (EFI/Microsoft/Boot/bootmgfw.efi), Windows will appear in systemd-boot.
```
cat /boot/loader/entries/windows.conf

# It should have a line like:
efi /EFI/Microsoft/Boot/bootmgfw.efi
```

If there is no windows.conf file we have to create it
```
sudo mkdir -p /boot/loader/entries
cd /boot/loader/entries
sudo vim windows.conf
# title is what will appear in the boot menu
title Windows
efi /EFI/Microsoft/Boot/bootmgfw.efi
```

Make sure the Windows EFI exists
```
ls -la /boot/EFI/Microsoft/Boot/bootmgfw.efi
ls: cannot access '/boot/EFI/Microsoft/Boot/bootmgfw.efi': No such file or directory
```

If it doesn't we need to create it 
```
lsblk -f                                    

NAME        FSTYPE FSVER LABEL UUID                                 FSAVAIL FSUSE% MOUNTPOINTS
zram0       swap   1     zram0 9cb50b87-c362-493c-9b8e-d008b833c4c5                [SWAP]
nvme1n1                                                                            
├─nvme1n1p1 vfat   FAT32       4CC6-5E6B                                           
├─nvme1n1p2                                                                        
├─nvme1n1p3 ntfs               76CECFF8CECFAEA5                                    
└─nvme1n1p4 ntfs               685A8D965A8D6224                                    
nvme0n1                                                                            
├─nvme0n1p1 vfat   FAT32       32FF-1C38                             950.7M     7% /boot
└─nvme0n1p2 btrfs              190d1344-5168-4633-b370-f996e61d0e03  425.9G     8% /var/log
                                                                                   /var/cache/pacman/pkg
                                                                                   /home
                                                                                   /
```
in this nvme1n1 is Windows SSD and nvme0n1 is the Linux SSD (nvme0/1n1p1 of each is the EFI partition: VFAT - FAT32)
```
# mount the windows EFI partition
sudo mkdir -p /mnt/windows-efi
sudo mount /dev/nvme1n1p1 /mnt/windows-efi
# check contents
ls -lah /mnt/windows-efi/EFI
total 4.0K
drwxr-xr-x 4 root root 1.0K Nov 19 20:06 .
drwxr-xr-x 4 root root 1.0K Jan  1  1970 ..
drwxr-xr-x 2 root root 1.0K Feb 19  2023 Boot
drwxr-xr-x 4 root root 1.0K Nov 19 20:06 Microsoft

# copy Windows EFS folder to Linux EFI
sudo cp -r /mnt/windows-efi/EFI/Microsoft /boot/EFI/

# now the EFI we were looking for above should be present
ls -lah /boot/EFI/Microsoft/Boot/bootmgfw.efi
-rwxr-xr-x 1 root root 2.8M Nov 24 21:06 /boot/EFI/Microsoft/Boot/bootmgfw.efi

# check again the windows.conf file
cat /boot/loader/entries/windows.conf
title Windows
efi /EFI/Microsoft/Boot/bootmgfw.efi
```

check the bootloader conf (should have the linux bootloader as default, and we will add windows to it as an option)
```
sudo vim /boot/loader/loader.conf

default arch
timeout 3
```

cleanup
```
sudo umount /mnt/windows-efi
sudo rmdir /mnt/windows-efi
```

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
tmux

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

install yay (AUR - Arch User Repository)
```
sudo pacman -S --needed git base-devel
git clone https://aur.archlinux.org/yay.git
cd yay/
makepkg -si
```

```
# upgrade AUR packages
yay -Sua # or just running without yay also works (which actually also runs pacman -Syu and than searches for AUR package updates)
```

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
if using an NVIDIA GPU follow this first - https://wiki.hypr.land/Nvidia/

some preconfigured setups - https://wiki.hypr.land/Getting-Started/Preconfigured-setups/
other example configs - https://wiki.hypr.land/Configuring/Example-configurations/

default config - ~/.config/hypr/hyprland.conf 
configuration - https://wiki.hypr.land/Configuring/
must haves - https://wiki.hypr.land/Useful-Utilities/Must-have/
hyprland ecosystem - https://wiki.hypr.land/Hypr-Ecosystem/

get list of monitors (take note of ID)
```
hyprctl monitors all
```

configure monitor resolution and scaling
```
vim ~/repos/boris/dev-env/linux/hyprland/hyprland.conf
# home - oled 4k display
monitor=DP-1,preferred,auto,1.5 
# work - laptop and 2k monitor
monitor=eDP-1,1920x1200@60,auto,1.33
monitor=HDMI-A-1,2560x1440@59,auto,1.07



# can also use the default auto option
monitor=,preferred,auto,auto
```

Add input language in hyprland
configuration is already present in the hyprland.conf however we need to make sure that we add the correct keyboard to the bind command because it will be different on each device
```
vim ~/repos/boris/dev-env/linux/hyprland/hyprland.conf
# find line 
bindl = LALT, LSHIFT, exec, hyprctl switchxkblayout logitech-g512-rgb-mechanical-gaming-keyboard next

# replace the keyboard name at the end with the correct one taken from 
hyprctl devices
# the correct one has its main field set to yes, example :
logitech-g512-rgb-mechanical-gaming-keyboard
  rules: r "", m "", l "us,bg", v ",phonetic", o "grp:alt_shift_toggle"
  active layout index: 0
  active keymap: English (US)
  capsLock: no
  numLock: no
  main: yes

```
copy the hyprland conf
```
cp ~/repos/boris/dev-env/linux/hyprland/hyprland.conf ~/.config/hypr/hyprland.conf
```

program launcher - Wofi - https://github.com/SimplyCEO/wofi ; https://cloudninja.pw/docs/wofi.html
```
# install it in arch
sudo pacman -S wofi

# copy the style and script files of wofi
mkdir -p ~/.config/wofi/
cp ~/repos/boris/dev-env/linux/hyprland/wofi/style.css ~/repos/boris/dev-env/linux/hyprland/wofi/wofi-menu.sh ~/.config/wofi/

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
cp ~/repos/boris/dev-env/linux/hyprland/waybar/style.css ~/.config/waybar/
cp ~/repos/boris/dev-env/linux/hyprland/waybar/config.jsonc ~/.config/waybar/
```

Hyprlock
```
# copy hyprlock config
mkdir -p ~/.config/hyprland/
cp ~/repos/boris/dev-env/linux/hyprland/hyprlock.conf ~/.config/hypr/hyprlock.conf
```

Hypridle
```
# copy hypr idle config
cp ~/repos/boris/dev-env/linux/hyprland/hypridle.conf ~/.config/hypr/hypridle.conf
```

Hyprpaper
```
# copy hypr paper config and images
mkdir ~/.config/images/
# copy images from drive to ~/.config/images folder
cp ~/repos/boris/dev-env/linux/hyprland/hyprpaper.conf ~/.config/hypr/hyprpaper.conf
```

Dolphin file manager
```
# update theme
kvantummanager
# choose KVRoughGlass
```

Remove initial sddm login screen and go directly to hyprlock
```
sudo mkdir /etc/sddm.conf./
sudo vim /etc/sddm.conf.d/boris.conf

[Autologin]
User=boris
Session=hyprland.desktop
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
# install
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

## Discord
install
```
flatpak install com.discordapp.Discord
```

run
```
flatpak run com.discordapp.Discord
```

## Zoom
```
# install
yay -S zoom
```

## Rocket chat
```
yay -S rocketchat-client-bin
```

## Slack
```
yay -S slack-desktop
```


# TODO: many desktop apps are blurry - rocket, steam, discord, zoom, heroic (and many are fine, dolphin, browser, terminals) - must be something with the 4k screen
# TODO: boxes for VMs
  - can run a win vm for some of the work stuff that may not start on linux
  - can I keep the Win key on the work laptop and run it inside a VM
  - or in cases where we need restrictive VPN
# TODO: on next install do some tests with hyprlauncher instead of wofi
