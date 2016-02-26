# vim:syntax=sh
source ~/.bashrc.d/git-prompt.sh
source ~/.bashrc.d/colors.sh

__prompt_command ()
{ 	
	#screen status
		STATUS=$?
	#open bracket
		PS1="$PROMPT_PRIMARY[$PROMPT_RESET"
	#username
		PS1+="\u"
	#@
		PS1+="$PROMPT_PRIMARY@$PROMPT_RESET"
	#hostname
		PS1+="\h "
	#working directory
		PS1+="\W"
	#close bracket
		PS1+="$PROMPT_PRIMARY]$PROMPT_RESET"
	#git status
		PS1+="$(__git_ps1)"
	#command status
		if [ $STATUS = 0 ]; then
			PS1+="$PROMPT_PRIMARY\$ $PROMPT_RESET"
		else
			PS1+="$PROMPT_SECONDARY! $PROMPT_RESET"
		fi
}
PS2="$PROMPT_PRIMARY------->$PROMPT_RESET"

export PROMPT_COMMAND=__prompt_command
export PS1
export PS2
