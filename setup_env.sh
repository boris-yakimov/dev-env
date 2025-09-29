#!/bin/zsh
# TODO: setup sepate .zsh configs for wsl and linux
# TODO: options to call the script to setup only neovim or zsh tools or tmux or all (by default)

# TODO: maybe has to be setup in advance
# sudo config
#sudo echo "boris ALL=(ALL) NOPASSWD: ALL" >> /etc/sudoers

# TODO: install ghostty
# TODO: install chrome

# TODO: zsh should be setup in advance
# zsh
# sudo apt install zsh -y

# TODO: how to auto accept add repo
# git
sudo add-apt-repository ppa:git-core/ppa
sudo apt update; sudo apt install git -y

# TODO: how do I handle this
#git config --global user.name "Your Name"
#git config --global user.email "Your Mail"
git config --global core.editor "nvim"
git config --global credential.helper store

# tools
sudo apt install -y curl tmux python3 python3-pip python3-venv

# fuse for appiamges
sudo add-apt-repository universe
sudo apt install libfuse2t64

# oh my zsh
sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"

# TODO: automate getting the latest version
# install Go
GO_VERSION=1.24.3
wget https://go.dev/dl/go$GO_VERSION.linux-amd64.tar.gz
# make sure no previous installations exist and install the downloaded version
sudo rm -rf /usr/local/go && sudo tar -C /usr/local -xzf go$GO_VERSION.linux-amd64.tar.gz
go version  
rm -f go$GO_VERSION.linux-amd64.tar.gz

# lazygit (needed for nvim.snacks)
LAZYGIT_VERSION=$(curl -s "https://api.github.com/repos/jesseduffield/lazygit/releases/latest" | \grep -Po '"tag_name": *"v\K[^"]*')
curl -Lo lazygit.tar.gz "https://github.com/jesseduffield/lazygit/releases/download/v${LAZYGIT_VERSION}/lazygit_${LAZYGIT_VERSION}_Linux_x86_64.tar.gz"
tar xf lazygit.tar.gz lazygit
sudo install lazygit -D -t /usr/local/bin/

# setup dev-env repo
mkdir ~/repos && cd ~/repos
git clone https://github.com/burizz/dev-env.git
cp ~/repos/dev-env/zsh/.zshrc ~/

# zsh plugins
git clone https://github.com/zsh-users/zsh-autosuggestions
mv zsh-autosuggestions/ ~/.oh-my-zsh/custom/plugins/zsh-autosuggestions/
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting

# theme - powerlevel10k
git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k

# change default shell
chsh -s $(which zsh)

# fuzzy finder
git clone --depth 1 https://github.com/junegunn/fzf.git ~/.fzf
~/.fzf/install

# shell history fuzzy find 
git clone https://github.com/joshskidmore/zsh-fzf-history-search ${ZSH_CUSTOM:=~/.oh-my-zsh/custom}/plugins/zsh-fzf-history-search

# zsh config
cp ~/repos/dev-env/zsh/.zshrc ~/.zshrc

# tmux 
cp ~/repos/dev-env/tmux/.tmux.conf ~/.tmux.conf
cat ~/.tmux.conf

# TODO: check best place to source this
source ~/.zshrc

# TODO: check how to script this in advance
p10k configure

# neovim
curl -LO https://github.com/neovim/neovim/releases/latest/download/nvim.appimage
# chmod u+x nvim.appimage
# ./nvim.appimage
#
# TODO: or with extract
./nvim.appimage --appimage-extract
./squashfs-root/AppRun --version
sudo mv squashfs-root /
sudo ln -s /squashfs-root/AppRun /usr/bin/nvim
nvim --version

# neovim tools
sudo apt install -y ripgrep fd-find

# ruff for python lsp
curl -LsSf https://astral.sh/ruff/install.sh | sh

# install npm package for neovim
sudo npm install -g neovim

# neovim setup
mkdir -p ~/.config/nvim/lua/config/

# TODO: latest version of npm and node
# install nodejs and npm (for python lsp)
sudo apt install -y nodejs npm unzip python3-neovim

# verify node versions
npm -v
node -v

# install lua and liblua-dev needed for luarocks
sudo apt install -y lua5.3 liblua5.3-dev

# TODO: fix hardcoded version
# setup load rocks
wget https://luarocks.org/releases/luarocks-3.11.1.tar.gz
tar zxpf luarocks-3.11.1.tar.gz
cd luarocks-3.11.1
./configure && make && sudo make install
sudo luarocks install luasocket
lua
rm -rf luarocks-3.11.1.tar.gz luarocks-3.11.1/

# neovim personal lua configs 
rm -rf ~/.config/nvim/
cd ~/repos/dev-env 
mkdir -p ~/.config/nvim && cp -r nvim-lua/* ~/.config/nvim/

# TODO: add a check which display server is used at the moment and depending on that pick which to install
# for wayland
sudo apt install -y wl-clipboard
# for xorg
sudo apt install -y xclip

 nvim :Lazy

# additional tools

# docker
sudo apt install -y docker.io

# terraform
sudo apt update && sudo apt install -y gnupg software-properties-common
wget -O- https://apt.releases.hashicorp.com/gpg | sudo gpg --dearmor -o /usr/share/keyrings/hashicorp-archive-keyring.gpg
echo "deb [signed-by=/usr/share/keyrings/hashicorp-archive-keyring.gpg] https://apt.releases.hashicorp.com $(lsb_release -cs) main" | sudo tee /etc/apt/sources.list.d/hashicorp.list
sudo apt update && sudo apt install -y terraform
terraform -install-autocomplete

# kubectl
curl -LO "https://dl.k8s.io/release/$(curl -L -s https://dl.k8s.io/release/stable.txt)/bin/linux/amd64/kubectl"
sudo install -o root -g root -m 0755 kubectl /usr/local/bin/kubectl

# helm
curl https://get.helm.sh/helm-v3.15.4-linux-amd64.tar.gz -o helm.tar.gz
tar -zxvf helm.tar.gz
sudo mv linux-amd64/helm /usr/local/bin/helm
rm -rf linux-amd64 helm.tar.gz
helm completion zsh > "${fpath[1]}/_helm"

# saml2aws
CURRENT_VERSION=$(curl -Ls https://api.github.com/repos/Versent/saml2aws/releases/latest | grep 'tag_name' | cut -d'v' -f2 | cut -d'"' -f1)
wget -c https://github.com/Versent/saml2aws/releases/download/v${CURRENT_VERSION}/saml2aws_${CURRENT_VERSION}_linux_amd64.tar.gz -O - | tar -xzv -C ~/.local/bin
chmod u+x ~/.local/bin/saml2aws
hash -r
saml2aws --version

# k9s
wget https://github.com/derailed/k9s/releases/latest/download/k9s_Linux_amd64.tar.gz
tar -xzf k9s_Linux_amd64.tar.gz
sudo install k9s /usr/local/bin/
rm k9s_Linux_amd64.tar.gz

# aws cli
curl "https://awscli.amazonaws.com/awscli-exe-linux-x86_64.zip" -o "awscliv2.zip"
unzip awscliv2.zip
sudo ./aws/install
rm -rf aws awscliv2.zip

# Neovim LSPs and tools (installed system-wide to match Mason installs)
# gopls
go install golang.org/x/tools/gopls@latest

# terraformls
go install github.com/hashicorp/terraform-ls@latest

# pyright
sudo npm install -g pyright

# clangd
sudo apt install -y clangd

# lua_ls
sudo luarocks install --server=https://luarocks.org/dev lua-lsp

# tflint
go install github.com/terraform-linters/tflint@latest
