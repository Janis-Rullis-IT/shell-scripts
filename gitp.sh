#!/bin/bash

## Make globally available with:
# sudo cp gitp.sh /usr/local/bin/gitp
# sudo chmod a+x /usr/local/bin/gitp

echo "== gitp - Quickly push changes You're sure about."
echo "== Short for 'git add .;git commit -m "MSG";git push' ==";
echo "";

if [[ -n $1 ]]; then
	readonly MSG=$1;
	git add . -A;
	git commit -m "$MSG" --no-verify;
	git push
else
	echo "Commit message is missing!";
	echo "Example, gitp 'Update README'";
fi
