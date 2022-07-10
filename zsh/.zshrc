#   ____                                 _
#  / ___|  ___  _ __    ___  _ __  __ _ | |
# | |  _  / _ \| '_ \  / _ \| '__|/ _` || |
# | |_| ||  __/| | | ||  __/| |  | (_| || |
#  \____| \___||_| |_| \___||_|   \__,_||_|

# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH=$HOME/.oh-my-zsh

# See https://github.com/ohmyzsh/ohmyzsh/wiki/Themes
ZSH_THEME="aboyce"

# Automatically update without prompting.
DISABLE_UPDATE_PROMPT="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# COMPLETION_WAITING_DOTS="true"

plugins=(git npm sudo yarn web-search zsh-autosuggestions)

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

#  _____        _                             _
# | ____|__  __| |_  ___  _ __  _ __    __ _ | |
# |  _|  \ \/ /| __|/ _ \| '__|| '_ \  / _` || |
# | |___  >  < | |_|  __/| |   | | | || (_| || |
# |_____|/_/\_\ \__|\___||_|   |_| |_| \__,_||_|

# Set DISPLAY variable to the IP automatically assigned to WSL2 (this was added for Cypress support in WSL - more info https://nickymeuleman.netlify.app/blog/gui-on-wsl2-cypress)
#export DISPLAY=$(cat /etc/resolv.conf | grep nameserver | awk '{print $2; exit;}'):0.0
# Start dbus to internally communicate
#sudo /etc/init.d/dbus start &> /dev/null

# Set up Node Version Manager
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

#     _     _  _
#    / \   | |(_)  __ _  ___   ___  ___
#   / _ \  | || | / _` |/ __| / _ \/ __|
#  / ___ \ | || || (_| |\__ \|  __/\__ \
# /_/   \_\|_||_| \__,_||___/ \___||___/

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.

alias v="nvim"
alias devm="cd ~/Source"
alias devl="cd ~/source"

#  __  __                              _   ____   _ 
# |  \/  |  __ _  _ __   _   _   __ _ | | / ___| | |_  ___  _ __   ___
# | |\/| | / _` || '_ \ | | | | / _` || | \___ \ | __|/ _ \| '_ \ / __|
# | |  | || (_| || | | || |_| || (_| || |  ___) || |_|  __/| |_) |\__ \
# |_|  |_| \__,_||_| |_| \__,_| \__,_||_| |____/  \__|\___|| .__/ |___/
#                                                          |_|

# If the autosuggestion plugin is unavailable run the following
# git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
# If you see this, the plugin is probably out of date now, pull down the latest changs
# git -C ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions pull
