#!/bin/bash
############################
# .make.sh
# This script creates symlinks from the home directory to any desired dotfiles in ~/dotfiles
############################

usage(){
	echo "-d dir, set the directory to treat as home" 
	exit 1
}

if [ "$#" == "0" ];then
	echo "no arguements"
	usage
fi

dflag=true
while getopts "d:h" opt;do
	case $opt in
	d)	home="$OPTARG"
		dflag=false
		echo "setting home option"
	;;
	h)
		echo "Usage"
		usage
	;;
	esac
done
shift "$((OPTIND-1))"

if $dflag;then  
	echo "no d option"
	usage
fi

########## Variables
dir=$(dirname $0)                   # dotfiles directory
dir=$(cd $dir; pwd)

mkdir -p $dir/logs

home=$(cd $home; pwd)

###########installs
#other scripts 
cd $dir
for script in $(ls scripts | grep install); do
	. ./scripts/$script $dir $home | tee $dir/logs/$script.log
done













