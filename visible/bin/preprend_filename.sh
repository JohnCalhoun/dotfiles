#!/bin/bash
for file in $(for path in $(find . -name "*cpp"); do echo $(basename $path);done);
	do echo -e "// $file\n$(cat $file)">$file ;done 
