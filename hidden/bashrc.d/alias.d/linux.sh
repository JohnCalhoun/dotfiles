# vim:syntax=sh

shopt -s checkwinsize
alias rm="rm"
alias rmr="command rm -r"
alias sudo="sudo -E"
alias rudo="sudo -E !!"
alias c="clear"
alias cl="clear && ls"

alias ls="ls -h"
alias ls='ls '
alias la="ls -d .??*"
alias ll="ls -l -h"
alias bd='cd $OLDPWD'
alias grep="grep --color"
alias du="du -h -s"

alias chmodx="chmod +x"

alias wget='wget -c'

alias dnf="sudo -E dnf"
alias yum="sudo -E yum"
alias histg="history | grep"

alias shutdown="shutdown -h now"
alias restart="shutdown -r now"
alias g='git'
alias psg='ps aux | grep'

alias tls='tmux ls'
alias tat='tmux switch-client -t'
alias tns='tmux new-session -d -t'
alias tkill='tmux kill-session -t'

alias npr="npm run"
alias vim="nvim"
