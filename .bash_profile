# added by myself
export LC_ALL=en_US.UTF-8
export LANG=en_US.UTF-8

source ~/.bashrc
# export PATH="/usr/local/bin:$PATH"
# M1 chip Mac, brew install by default to another path
export PATH="/opt/homebrew/bin:$PATH""
export CLICOLOR=1
export LSCOLORS=ExFxCxDxBxegedabagacad

# added by Miniconda3 installer
# export PATH="/Users/gyr/miniconda3/bin:$PATH"

THIS_COMP="AWESOME🌸😻🦄🍀"
export PS1="\n\[$(tput bold)\]\[$(tput setaf 7)\]\$([[ \$? != 0 ]] && tput setaf 1)#[\$(date +%k:%M:%S)|\${timer_show}s]\[$(tput setaf 2)\] \u\[$(tput setaf 5)\]@${THIS_COMP}:\[$(tput setaf 3)\]\w \[$(tput setaf 3)\]    [ \$(find . -mindepth 1 -maxdepth 1 -type d | wc -l | tr -d ' ') D | \$(find . -mindepth 1 -maxdepth 1 -type f | wc -l | tr -d ' ') F ] \$(__git_ps1)  \n\[$(tput setaf 3)\]"
trap "timer_start; echo -ne $'\e[0m'" DEBUG
