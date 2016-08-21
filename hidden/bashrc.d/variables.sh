#! /bin/bash 

export EDITOR='vim'
PATH=$PATH:~/bin
if [ -d ~/opt/hadoop ];then
	PATH=$PATH:~/opt/hadoop/bin
	PATH=$PATH:~/opt/hadoop/sbin
fi

export path
