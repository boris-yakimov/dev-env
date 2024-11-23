nvim => v0.10

dependencies : 

ripgrep - https://github.com/BurntSushi/ripgrep
```
apt install ripgrep
```
fd - https://github.com/sharkdp/fd
```
apt install fd-find
```

prep dir for custom lua configs
```
mkdir -p ~/.config/nvim/lua/config/
```

copy init.lua and other lua confgs
```
cp -r nvim-lua/* ~/.config/nvim/
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
