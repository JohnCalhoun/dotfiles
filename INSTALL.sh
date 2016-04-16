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

##########
# create dotfiles_old in homedir
echo -n "Creating $olddir for backup of any existing dotfiles in ~ ..."
mkdir -p $olddir
echo "done"

# change to the dotfiles directory
echo -n "Changing to the $dir directory ..."
cd $dir
echo "done"

# move any existing dotfiles in homedir to dotfiles_old directory, then create symlinks from the homedir to any files in the ~/dotfiles directory specified in $files
echo "Moving any existing dotfiles from ~ to $olddir"
for file in $(ls $dir/dots); do
	if [ -e $home/.$file ];then
		echo "Moving old .$file to $olddir" 
		mv -fv $home/.$file $olddir
	fi 
	if [ -L $home/.$file ];then 
		rm $home/.$file
	fi 
	if [ ! -L $home/.$file ];then 
		echo "Creating symlink to $file in home directory."
		ln -s $dir/dots/$file $home/.$file
	fi 
done
#installs

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
#make directories
for new in $( cat $dir/configs/directories.text);do
	echo "making directory $new in $home"
	mkdir -p $home/$new
done

#bin scripts 
echo "creating bin folder"
ln -s $dir/bin/* $home/bin 

















