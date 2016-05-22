#!/bin/bash

# Export some ENV variables so you don't have to type anything
export AWS_ACCESS_KEY_ID="AKIAJRWPXNIST2FJPVXQ"
export AWS_SECRET_ACCESS_KEY="isLJF/gOmQ9A9ATT41NTZrzHokUTuXCvyEmZ1B80"
export PASSPHRASE="password"

# Your GPG key
#GPG_KEY=

# The S3 destination followed by bucket name
DEST="s3://s3-us-west-2.amazonaws.com/johnmcalhoun-personal/backup"

# Set up some variables for logging
HOST=`hostname`
DATE=`date +%Y-%m-%d`
MAILADDR="johnmcalhoun123@gmail.com"
TODAY=$(date +%d%m%Y)

is_running=$(ps -ef | grep duplicity  | grep python | wc -l)


if [ $is_running -eq 0 ]; then
    # How long to keep backups for
    OLDER_THAN="1M"

    # The source of your backup
    SOURCE=/home/john/test

    echo "Backup for local filesystem started"

    echo "... removing old backups"

    duplicity remove-older-than ${OLDER_THAN} ${DEST} -v 9

    echo "... backing up filesystem"

    duplicity \
	   full \
        ${SOURCE} ${DEST} 

    echo "Backup for local filesystem complete"
    echo "------------------------------------"

    unset AWS_ACCESS_KEY_ID
    unset AWS_SECRET_ACCESS_KEY
    unset PASSPHRASE
fi

