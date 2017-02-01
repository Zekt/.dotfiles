# The following lines were added by compinstall

zstyle ':completion:*' completer _expand _complete _ignored _correct _approximate
zstyle ':completion:*' matcher-list '' 'm:{[:lower:]}={[:upper:]}' 'm:{[:lower:][:upper:]}={[:upper:][:lower:]}' 'r:|[._-]=* r:|=*'
zstyle ':completion:*' max-errors 2
zstyle :compinstall filename '/home/vik/.zshrc'

autoload -Uz compinit
compinit
# End of lines added by compinstall
# Lines configured by zsh-newuser-install
bindkey -e
# End of lines configured by zsh-newuser-install
#
# Path to your oh-my-zsh installation.
export ZSH=/home/vik/.oh-my-zsh

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
ZSH_THEME="cloud"

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# The optional three formats: "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(git)
plugins=(tmux)

# User configuration

export PATH="/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/usr/games:/usr/local/games"
export GOPATH="/home/vik/gocode"
export WIFIDEVICE=$(iw dev | grep -Po 'Interface \K([^\n\r]*)')
# export MANPATH="/usr/local/man:$MANPATH"

source $ZSH/oh-my-zsh.sh
#if [[ -r /usr/lib/python3.5/site-packages/powerline/bindings/zsh/powerline.zsh  ]]; then
#	source /usr/lib/python3.5/site-packages/powerline/bindings/zsh/powerline.zsh
#fi

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

# ssh
# export SSH_KEY_PATH="~/.ssh/dsa_id"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
alias zshconfig="vim ~/.zshrc"
alias ohmyzsh="vim ~/.oh-my-zsh"
alias wifi="sudo wifi-menu"
alias wifi-up="sudo ifconfig $WIFIDEVICE up"
alias wifi-down="sudo ifconfig $WIFIDEVICE down"
alias connect="sudo iw dev $WIFIDEVICE connect"
alias scan="sudo iw dev $WIFIDEVICE scan"
alias dhcp="sudo dhclient $WIFIDEVICE"
alias connect-peap="sudo wpa_supplicant -B -i $WIFIDEVICE -c ~/ntupeap.conf && dhcp -d"
alias home="ssh vik@zekt.me -p 8787"
alias ntuosc="ssh zekt@home.ntuosc.org -p 2200"
alias ntuim="ssh zekt@ntu.im"
alias vi="nvim"
alias vim="nvim"
alias svim="sudo -E nvim"

source ~/.oh-my-zsh/custom/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
source ~/.oh-my-zsh/custom/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh

if [ -n "$TMUX" ]; then
	powerline-config tmux setup;
elif [ -z ${INSIDE_NAUTILUS_PYTHON+x} ]; then
	tmux -2;
fi

### Added by the Heroku Toolbelt
#export PATH="/usr/local/heroku/bin:$PATH"

export PYTHONIOENCODING=UTF-8
export TZ="Asia/Taipei"
export LC_CTYPE="zh_TW.UTF-8"
export XMODIFIERS=@im=fcitx
export GTK_IM_MODULE="fcitx"
export QT_IM_MODULE="fcitx"
