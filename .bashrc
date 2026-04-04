#
# ~/.bashrc
#

export ANDROID_HOME=$HOME/Android/Sdk
export PATH=$PATH:$ANDROID_HOME/emulator
export PATH=$PATH:$ANDROID_HOME/platform-tools
export PATH=$PATH:$ANDROID_HOME/tools

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

alias ls='ls --color=auto'
alias grep='grep --color=auto'

PS1=' \[\e[32m\]>\[\e[0m\] '
# PS1='[\u@\h \W]\$ '
# PS1=' > '
export PATH="$PATH":"$HOME/.pub-cache/bin"

# Wildcard + individual mv confirmation
mv() {
    if [[ "$*" == *"*"* ]]; then
        read -p "Wildcard move detected, are you sure? (y/N): " confirm
        [[ "$confirm" == "y" ]] || return 1
        sudo -k && sudo true || return 1
    else
        read -p "Move '$1' to '$2', are you sure? (y/N): " confirm
        [[ "$confirm" == "y" ]] || return 1
    fi
    command mv "$@"
}

# Wildcard + individual rm confirmation
rm() {
    if [[ "$*" == *"*"* ]]; then
        read -p "Wildcard delete detected, are you sure? (y/N): " confirm
        [[ "$confirm" == "y" ]] || return 1
        sudo -k && sudo true || return 1
    else
        read -p "Delete '$*', are you sure? (y/N): " confirm
        [[ "$confirm" == "y" ]] || return 1
    fi
    trash-put "$@"
}

export PATH="$HOME/.local/bin:$PATH"
