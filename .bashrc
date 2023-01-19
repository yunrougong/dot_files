# ~/.bashrc: executed by bash(1) for non-login shells.
# see /usr/share/doc/bash/examples/startup-files (in the package bash-doc)
# for examples

# support 256 color
export TERM="screen-256color"

umask 0077

PS1="\[\033[96m\]\u\[\033[m\]@\[\033[92m\]\h \A:\[\033[93;1m\]\W\[\033[m\]\$ "
#PS1="[\u@\h \A]\[\033[01;14m\]\W\[\033[0m\]"

# If not running interactively, don't do anything
[ -z "$PS1" ] && return

# don't put duplicate lines or lines starting with space in the history.
# See bash(1) for more options
HISTCONTROL=ignoreboth

# append to the history file, don't overwrite it
shopt -s histappend

# for setting history length see HISTSIZE and HISTFILESIZE in bash(1)
HISTSIZE=1000
HISTFILESIZE=2000

# check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize


# enable color support of ls and also add handy aliases
if [ -x /usr/bin/dircolors ]; then
    test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
    alias ls='ls --color=auto'
    #alias dir='dir --color=auto'
    #alias vdir='vdir --color=auto'

    alias grep='grep --color=auto'
    alias fgrep='fgrep --color=auto'
    alias egrep='egrep --color=auto'
fi

# some more ls aliases
alias ll="ls -alF"
alias la="ls -A"
alias l="ls -CF"
# kubernetes
alias kl="kubectl"
alias kstaging="kubectl config use-context api.staging.corp.mongodb.com"
alias kprod="kubectl config use-context api.prod.corp.mongodb.com"

# sublime command line tool
# alias subl='/Applications/Sublime\ Text.app/Contents/SharedSupport/bin/subl'



# Add an "alert" alias for long running commands.  Use like so:
#   sleep 10; alert
alias alert='notify-send --urgency=low -i "$([ $? = 0 ] && echo terminal || echo error)" "$(history|tail -n1|sed -e '\''s/^\s*[0-9]\+\s*//;s/[;&|]\s*alert$//'\'')"'

# Alias definitions.
# You may want to put all your additions into a separate file like
# ~/.bash_aliases, instead of adding them here directly.
# See /usr/share/doc/bash-doc/examples in the bash-doc package.

if [ -f ~/.bash_aliases ]; then
    . ~/.bash_aliases
fi

# enable programmable completion features (you don't need to enable
# this, if it's already enabled in /etc/bash.bashrc and /etc/profile
# sources /etc/bash.bashrc).
if [ -f /etc/bash_completion ] && ! shopt -oq posix; then
    . /etc/bash_completion
fi

# git completion
source ~/.git-completion.sh

# export for python env
export PIP_REQUIRE_VIRTUALENV=false


# Timer in command line
function timer_start {
          timer=${timer:-$SECONDS}
  }

function timer_stop {
          timer_show=$(($SECONDS - $timer))
            unset timer
              # Write out the history
                if [ "$(id -u)" -ne 0 ]; then echo "$(date -u +"%Y-%m-%dT%H:%M:%S%Z") $(pwd) $(history 1 | sed 's/^[0-9]\+\s\+//')" >> ~/.logs/bash-history-$(date "+%Y-%m-%d").log; fi
        }

if [ "$PROMPT_COMMAND" == "" ]; then
          PROMPT_COMMAND="timer_stop"
  else
            PROMPT_COMMAND="$PROMPT_COMMAND; timer_stop"
fi
