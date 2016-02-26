#source tp_command function, improved cd command
. ~/bin/tp_command

#teleport for cd with memory
alias cd="tp"
cdl() { cd "$@" && ls;}
cdt() { cd "#@" && tree;}

