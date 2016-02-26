#! /bin/bash


usage(){
	echo "-d dir, set the dropbox directory"
 	echo "-h dir, set the home directory"
	echo "-g dir, set the dotfiles directory"
	exit 1
}

if [ "$#" == "0" ];then
	echo "no arguements"
	usage
fi

dflag=true
hflag=true
gflag=true
while getopts "d:h:g:" opt;do
	case $opt in
	d)		
		dropboxdir="$OPTARG"
		dflag=false
	;;
	h)	
		home="$OPTARG"
		hflag=false

	;;
	g)
		dir="$OPTARG"
		gflag=false
	;;
	esac
done
shift "$((OPTIND-1))"

if $dflag;then  
	echo "no d option"
	usage
fi
if $hflag;then  
	echo "no h option"
	usage
fi
if $gflag;then  
	echo "no g option"
	usage
fi

for directory in $(cat $dir/configs/dropbox.text); do
	echo " linking $dropboxdir to $home/$directory"
	ln -s $dropboxdir/$directory $home/$directory
done
for directory in $(cat $dir/configs/dropbox.hidden.text); do
	echo " linking $dropboxdir to $home/.$directory"
	ln -s $dropboxdir/$directory $home/.$directory 
done

