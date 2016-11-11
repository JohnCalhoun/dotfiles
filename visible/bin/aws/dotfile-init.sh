#! /bin/bash
HOME=/home/ec2-user
TMP=$HOME/tmp

yum update -y
yum install git -y 
yum install vim -y

mkdir -p $TMP
cd $TMP

git clone https://github.com/JohnCalhoun/dotfiles.git 
cd dotfiles

./INSTALL.sh -d $HOME
