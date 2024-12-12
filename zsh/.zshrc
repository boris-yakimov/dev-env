# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH


# Path to your oh-my-zsh installation.
export ZSH="/home/boris/.oh-my-zsh"

### Custom config ###

# ZSH 
ZSH_THEME="powerlevel10k/powerlevel10k"

# Automatic update of zsh without prompts
DISABLE_UPDATE_PROMPT=true

# tfswitch - terraform binaries
export PATH=$PATH:$HOME/bin:~/.local/bin

# Path
export PATH=$PATH:/usr/local/go/bin

# Go
export GOROOT=/usr/local/go
export GOPATH=$HOME/go
export GOBIN=$GOPATH/bin
export PATH=$PATH:$GOROOT:$GOPATH:$GOBIN
alias code='/mnt/c/Users/yakim/AppData/Local/Programs/Microsoft\ VS\ Code/Code.exe'

# Display
#export DISPLAY=:0

# Aliases
export BROWSER=/mnt/c/Program\ Files\ \(x86\)/Google/Chrome/Application/chrome.exe
alias browse='/mnt/c/Program\ Files/Google/Chrome/Application/chrome.exe'
alias home='cd /mnt/c/Users/yakim/Desktop'
alias notepad++='/mnt/c/Users/yakim/AppData/Local/Microsoft/WindowsApps/notepad.exe'
alias vim="nvim"
alias vi="nvim"

# Autocompletion for saml2aws, helm, kubectl 
eval "$(saml2aws --completion-script-zsh)"
eval "$(kubectl completion zsh)"
eval "$(helm completion zsh)"

# configure unix pass - https://www.passwordstore.org/ as backend for saml2aws to persist password - needed for WSL since there is no default keychain to store it and wincred doesn't work
#export SAML2AWS_KEYRING_BACKEND=pass
#export GPG_TTY="$( tty )"

# set tmux to use full color mode by default
alias tmux="TERM=screen-256color-bce tmux"

##  tmux config
# dev env
TMUX_DEV_ENV_SESSION="dev"
tmux has-session -t $TMUX_DEV_ENV_SESSION&> /dev/null
if [ $? != 0 ] 
 then
    tmux new-session -s $TMUX_DEV_ENV_SESSION -n "dev" -d
    tmux send-keys -t $TMUX_DEV_ENV_SESSION "~/repos/dev-env/" C-m 
    
    # stat new window in session and open readme
    tmux new-window -d -n "readme" -t $TMUX_DEV_ENV_SESSION:2
    tmux send-keys -t $TMUX_DEV_ENV_SESSION:2 "cd ~/repos/dev-env/" C-m
    tmux send-keys -t $TMUX_DEV_ENV_SESSION:2 "nvim ./" C-m
   
    # when started focus on first nvim window
    tmux select-window -t $TMUX_DEV_ENV_SESSION:1
fi

# landing zones project
alias dev="tmux a -t dev"

TMUX_LZ_SESSION="lz"
tmux has-session -t $TMUX_LZ_SESSION&> /dev/null
if [ $? != 0 ] 
 then
    tmux new-session -s $TMUX_LZ_SESSION -n "nvim" -d "cd ~/repos/itgix/itgix-aws-landing-zones/ && nvim ./"
 
    # stat new window in session and switch to dir
    tmux new-window -d -n "tf_exec" -t $TMUX_LZ_SESSION:2
    tmux send-keys -t $TMUX_LZ_SESSION:2 "~/repos/itgix/itgix-aws-landing-zones/landing-zone-deployment" C-m

    tmux new-window -d -n "tf_modules_nvim" -t $TMUX_LZ_SESSION:3 "cd ~/repos/itgix/itgix-aws-landing-zones/terraform-modules/ && nvim ./"

    tmux new-window -d -n "tf_modules_dir" -t $TMUX_LZ_SESSION:4
    tmux send-keys -t $TMUX_LZ_SESSION:4 "~/repos/itgix/itgix-aws-landing-zones/terraform-modules/" C-m

    # when started focus on first nvim window
    tmux select-window -t $TMUX_LZ_SESSION:1
fi

alias lz="tmux a -t lz"

# vw projects
TMUX_VW_SESSION="vw"
tmux has-session -t $TMUX_VW_SESSION&> /dev/null
if [ $? != 0 ] 
 then
    # TODO window for the tunnels with ncat split window
    tmux new-session -s $TMUX_VW_SESSION -n "nvim" -d
    tmux send-keys -t $TMUX_VW_SESSION "~/repos/vwfs/" C-m

    tmux new-window -d -n "tf" -t $TMUX_VW_SESSION:2
    tmux send-keys -t $TMUX_VW_SESSION:2 "~/repos/vwfs/" C-m

    tmux new-window -d -n "vw_login" -t $TMUX_VW_SESSION:3
    tmux split-window -h -t $TMUX_VW_SESSION:3

    # when started focus on login window
    tmux select-window -t $TMUX_VW_SESSION:3
fi

alias vw="tmux a -t vw"

### End Custom config ###

# Set name of the theme to load --- if set to "random", it will
# load a random theme each time oh-my-zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/ohmyzsh/ohmyzsh/wiki/Themes
#ZSH_THEME="robbyrussell"

ZSH_DISABLE_COMPFIX=true


# Set list of themes to pick from when loading at random
# Setting this variable when ZSH_THEME=random will cause zsh to load
# a theme from this variable instead of looking in $ZSH/themes/
# If set to an empty array, this variable will have no effect.
# ZSH_THEME_RANDOM_CANDIDATES=( "robbyrussell" "agnoster" )

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion.
# Case-sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to automatically update without prompting.
# DISABLE_UPDATE_PROMPT="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

# Uncomment the following line if pasting URLs and other text is messed up.
# DISABLE_MAGIC_FUNCTIONS="true"

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# You can set one of the optional three formats:
# "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# or set a custom format using the strftime function format specifications,
# see 'man strftime' for details.
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load?
# Standard plugins can be found in $ZSH/plugins/
# Custom plugins may be added to $ZSH_CUSTOM/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.

# Plugins should be in one block otherwise it takes the last plugins=() block and ignores the first ones 
plugins=(zsh-fzf-history-search zsh-autosuggestions zsh-syntax-highlighting git)

# ZSH Syntax Highlight - remove underlining
(( ${+ZSH_HIGHLIGHT_STYLES} )) || typeset -A ZSH_HIGHLIGHT_STYLES
ZSH_HIGHLIGHT_STYLES[path]=none
ZSH_HIGHLIGHT_STYLES[path_prefix]=none

source $ZSH/oh-my-zsh.sh

# User configuration

# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='mvim'
# fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

export PATH="$HOME/.yarn/bin:$HOME/.config/yarn/global/node_modules/.bin:$PATH"

# add Pulumi to the PATH
export PATH=$PATH:$HOME/.pulumi/bin

autoload -U +X bashcompinit && bashcompinit
complete -o nospace -C /usr/bin/terraform terraform
