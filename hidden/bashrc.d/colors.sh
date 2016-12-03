# vim:syntax=sh

#prompt colors

TEAL='\[$(tput setaf 81)\]'
PURPLE='\[$(tput setaf 199)\]'

PROMPT_RESET='\[$(tput sgr0)\]'
PROMPT_PRIMARY=$TEAL
PROMPT_SECONDARY=$PURPLE


export PROMPT_PRIMARY
export PROMPT_SECONDARY
export PROMPT_RESET
