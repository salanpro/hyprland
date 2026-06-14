#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

set -o vi
bind 'set keyseq-timeout 1'

# alias ls='ls --color=auto'
# alias ls='eza --icons --hyperlink'
# En tu ~/.bashrc, reemplaza el alias por esto:
ls() {
    if [ -t 1 ]; then
        eza --icons --hyperlink "$@"
    else
        eza --icons "$@"
    fi
}

alias grep='grep --color=auto'
PS1='\[\e[1;37m\]\u\[\e[0m\]@\[\e[1;38;2;150;150;150m\]\h \[\e[1;33m\]\w\[\e[0m\]\$ '
HISTSIZE=50000
HISTFILESIZE=100000
HISTTIMEFORMAT="%F %T "
shopt -s histappend
PROMPT_COMMAND='history -a'

source ~/.local/share/blesh/ble.sh
source $HOME/miniconda3/etc/profile.d/conda.sh
. "$HOME/.cargo/env"
alias upa='flatpak update && sudo pacman -Syu'

eval "$(fzf --bash)"
