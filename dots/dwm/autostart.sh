#! /bin/bash
if [ -s ~/.Xmodmap ]; then
	xmodmap ~/.Xmodmap
fi

feh --bg-scale '/home/john/documents/wallpaper/wallpaperBW.png'
~/.bashrc.d/xmodmap.sh
unclutter &
statnot ~/.config/statnot/config.py &> ~/.config/statnot/log &
xdotool key Super_L+d
