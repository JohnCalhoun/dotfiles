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

home=$(cd $home; pwd)

olddir=$home/.dotfiles_old             # old dotfiles backup directory
olddir=$( cd $olddir; pwd)

###########installs

#make directories
for new in $( cat $dir/configs/directories.text);do
	echo "making directory $new in $home"
	mkdir -p $home/$new
done

#packages
if yum --help &>/dev/null; then
	REPO=yum
else
	REPO=dnf
fi

sudo $REPO update 
for package in $(cat $dir/configs/dnf_packages.text); do
	sudo $REPO install $package 
done

#other scripts 
cd $dir
for script in $(ls scripts | grep install); do
	. ./scripts/$script $dir $home
done

#dotfiles
cd $dir && curate -v 















