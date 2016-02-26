#start up display

if [[ $- == *i* ]]; then 
	if todo &>/dev/null; then
		echo "Todo List"
		todo
	fi 
	ls
fi
