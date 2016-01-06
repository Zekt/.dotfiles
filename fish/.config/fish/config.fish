# Path to Oh My Fish install.
set -gx OMF_PATH /home/vik/.local/share/omf

# Customize Oh My Fish configuration path.
#set -gx OMF_CONFIG /home/vik/.config/omf

# Load oh-my-fish configuration.
source $OMF_PATH/init.fish

tmux -2
powerline-config tmux setup
fish_vi_mode

set default_user vik
set -x PATH "/home/vik/.pyenv/bin" $PATH
status --is-interactive; and . (pyenv init -|psub)
status --is-interactive; and . (pyenv virtualenv-init -|psub)

alias wifi "sudo wifi-menu"
alias wifi-up "sudo ifconfig wlo1 up"
alias wifi-down "sudo ifconfig wlo1 down"
alias dhcp "sudo dhclient wlo1"
alias scan "sudo iw dev wlo1 scan"
alias connect "sudo iw dev wlo1 connect"
alias connect-peap "sudo wpa_supplicant -i wlo1 -c ~/ntupeap.conf;and dhcp"
alias home "ssh vik@zekt.me"
alias ntuosc "ssh zekt@home.ntuosc.org -p 2200"
alias ntuim "ssh zekt@ntu.im"

alias dropbox "dropbox-cli"
alias vim "nvim"
bind \t\[dw backward-kill-word
