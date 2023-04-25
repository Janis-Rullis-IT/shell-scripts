#!/bin/bash

## Make globally available with:
# sudo cp gitd.sh /usr/local/bin/gitd
# sudo chmod a+x /usr/local/bin/gitd

echo "git diff";
TARGET=$1
if [[ ! -n $1 ]]; then
	TARGET=staging
fi
COMMIT=`git merge-base $TARGET HEAD`
git diff $COMMIT..HEAD