# vim:syntax=sh

shopt -s histappend
HISTFILESIZE=1000000
HISTSIZE=1000000

#ignore duplicates and starting with space
HISTCONTROL=ignoreboth

HISTIGNORE='ls:bg:fp:history'
#one line in .bash_history
shopt -s cmdhist

