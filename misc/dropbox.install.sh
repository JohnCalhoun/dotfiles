#! /bin/bash 

sudo yum install wget

if [ ! -e ~/.dropbox-dist/dropboxd ]; then
	wget --output-documentt=dropbox.gzip https://www.dropbox.com/download/?plat=lnx.x86_64
	tar -xvzf ~/dropbox.gzip

	~/.dropbox-dist/dropboxd
fi

if [ ! -e ~/dropbox.py ]; then
	wget -O ~/dropbox.py "https://www.dropbox.com/download?dl=packages/dropbox.py"
fi

chmod +x ~/dropbox.py
~/dropbox.py start
~/dropbox.py exclude add ~/Dropbox
~/dropbox.py autostart y
rm ~/dropbox.py
