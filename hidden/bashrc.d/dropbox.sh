#! /bin/bash

if dropbox &>/dev/null; then
	dropbox start > /dev/null
fi
