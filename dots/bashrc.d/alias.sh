#! /bin/bash
 
for file in ~/.bashrc.d/alias.d/*.sh; do
	. $file
done
