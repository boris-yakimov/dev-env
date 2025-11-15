Audio - Pipewire instead of Pulse worked out of the box

Tools install
```
# shell / terminal
zsh
ghostty

# editor
neovim

# tools
curl
wget
less
git

# work
aws-cli-v2
k8s
terraform

# programming languages
python

# programming utilities
clang
gopls

# UI
wofi
```

Hyprland 
great guides for first steps - https://www.youtube.com/watch?v=2CP_9-jCV6A 

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
