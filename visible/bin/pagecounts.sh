#!/bin/bash

for i in *;
	do
		echo $i
		pdfinfo $i | grep Pages
	done
