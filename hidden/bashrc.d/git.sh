#! /bin/bash

if [ "$(git rev-parse --is-inside-work-tree 2> /dev/null )" == "true" ]; then
    REPO="$(basename `git rev-parse --show-toplevel`)"
    BRANCH="$(git rev-parse --abbrev-ref HEAD)"
    echo "($REPO|$BRANCH)"
fi
