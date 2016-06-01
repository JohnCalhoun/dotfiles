#! /bin/bash
if upower -e &>/dev/null; then
	BATTERY=$(upower -e | grep battery)
	if [ $? -eq 0 ]; then
		STATE=$(upower -i $BATTERY | grep state | cut -d: -f2)
		PERCENTAGE=$(upower -i $BATTERY | grep percentage | cut -d: -f2 |tr -d '[[:space:]]')
		echo $PERCENTAGE$STATE
	else
		echo FAILED
	fi
else
	echo ""
fi
