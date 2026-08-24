#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return
source ~/.local/share/blesh/ble.sh



set -o vi
bind 'set keyseq-timeout 1'

# alias ls='ls --color=auto'
# alias ls='eza --icons --hyperlink'
# En tu ~/.bashrc, reemplaza el alias por esto:
ls() {
    if [ -t 1 ]; then
        eza --icons auto --hyperlink auto "$@"
    else
        eza --icons "$@"
    fi
}

alias grep='grep --color=auto'
PS1='\[\e[1;37m\]\u\[\e[0m\]@\[\e[1;38;2;150;150;150m\]\h \[\e[1;33m\]\w\[\e[0m\]\n\$ '


source $HOME/miniconda3/etc/profile.d/conda.sh
. "$HOME/.cargo/env"
alias upa='flatpak update && sudo pacman -Syu'

eval "$(fzf --bash)"
eval "$(zoxide init bash --cmd cd)"

source '/home/salan/.sdkman/bin/sdkman-init.sh'
export PATH="$HOME/.local/bin:$PATH"
export EDITOR="nvim"

function y() {
	local tmp cwd; tmp="$(mktemp -t "yazi-cwd.XXXXXX")"
	command yazi "$@" --cwd-file="$tmp"
	IFS= read -r -d '' cwd < "$tmp"
	[ "$cwd" != "$PWD" ] && [ -d "$cwd" ] && builtin cd -- "$cwd" || builtin true
	command rm -f -- "$tmp"
}



##BASH HISTORY
export HISTFILE=~/.custom_bash_history
HISTSIZE=-1
HISTFILESIZE=-1
HISTTIMEFORMAT="%F %T "
shopt -s histappend
PROMPT_COMMAND="history -a; history -c; history -r; $PROMPT_COMMAND"
