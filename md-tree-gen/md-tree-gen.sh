#!/bin/bash
# set -x

echo "";
echo "=== Generate links to files inside this directory and below in the format of Markdown ===";
echo "";

tree=$(tree -tf --noreport -I '*~' --charset ascii $1 |
       sed -e 's/| \+/  /g' -e 's/[|`]-\+/ */g' -e 's:\(* \)\(\(.*/\)\([^/]\+\)\):\1[\4](\2):g')
tree=${tree#?}

file='Tree.md';

if [[ -r index.md ]]; then
	echo 'index.md exist. Will write in Tree.md.';
else
	file='index.md';
	echo 'index.md does not exist. Will write in index.md.';
fi

# Create the file first so it would be included in the tree.
echo "" > $file;

# Add [Jekyll Front Matter](https://jekyllrb.com/docs/frontmatter/) at the top of
# file. It is a config that tells what's the title and what layout to use.
tree="---
title: Hello
layout: default
---"$tree;

echo -e "${tree}" > $file;

echo "";
echo "Content:
${tree}.";
echo "Stored in: $file.";
echo "";