nvim => v0.10


dependencies : 

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

copy all lua configs
```
# first cleanup than copy
rm -rf ~/.config/nvim/
mkdir -p ~/.config/nvim && cp -r nvim-lua/* ~/.config/nvim/
```

run, update and verify
open nvim and run lazy to update plugins
```
:Lazy 
```

verify healthcheck of plugins
```
:checkhealth telescope
:checkhealth
```
