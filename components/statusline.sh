if [ $# -eq 0 ]; then
	echo -e "";
else
	xdotool key Super_L+u 
	(sleep 3 && xdotool key Super_L+d) &>/dev/null &
	echo "---- $1 ----"
fi

