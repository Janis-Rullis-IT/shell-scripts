#!/bin/bash
# set -x

echo "";
echo "=== Generate links to files inside this directory and below in the format of Markdown ===";
echo "";

tree=$(tree -tf --noreport -I '*~' --charset ascii $1 |
       sed -e 's/| \+/  /g' -e 's/[|`]-\+/ */g' -e 's:\(* \)\(\(.*/\)\([^/]\+\)\):\1[\4](\2):g')
tree=${tree#?}

file='Tree.md';

if [[ -r README.md ]]; then
	echo 'README.md exist. Will write in Tree.md.';
else
	file='README.md';
	echo 'README.md does not exist. Will write in README.md.';
fi

echo -e "${tree}" > $file;

echo "";
echo "Content: ${tree}.";
echo "Stored in: $file.";
echo "";