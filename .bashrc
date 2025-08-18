#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

alias ls='ls --color=auto'
alias grep='grep --color=auto'
PS1='\[\e[1;37m\]\u\[\e[0m\]@\[\e[1;31m\]\h \[\e[1;33m\]\W\[\e[0m\]\$ '
source ~/.local/share/blesh/ble.sh
