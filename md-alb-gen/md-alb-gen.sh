#!/bin/bash
# set -x

echo "";
echo "=== Include all images from all directories below in the format of Markdown ===";
echo "";

file='Images.md';
tree='';

# The name of the current directory.
readonly CUR_DIR_NAME=${PWD##*/}

# Page title is the current directory's name which - is replace with space.
page_title=`tr '-' ' ' <<< $CUR_DIR_NAME`;

# Collect a list of files in the current directories, each file in a separate line. Only names no additional info.
readonly list=`find -type f \( -iname \*.jpg -o -iname \*.png \)`;

# Format each filename.
for part in $list; do

	# Trim the ./ part .
	part=${part:2}

	# Replace - with a space.
	title=`tr '-' ' ' <<< $part`;

	# Remove the extension.
	title=${title%.*}

	# Formate the link.
	link="#### $title
![$title]($part)
";

	# Add the link to the list.
	tree="$tree
$link";
done

# Determine the target file where to write the list.
if [[ -r index.md ]]; then
	echo "index.md exist. Will write in $file.";
else
	file='index.md';
	echo 'index.md does not exist. Will write in index.md.';
fi

# Create the file first so it would be included in the tree.
echo "" > $file;

# Add [Jekyll Front Matter](https://jekyllrb.com/docs/frontmatter/) at the top of
# file. It is a config that tells what's the title and what layout to use.
tree="---
title: $page_title
layout: default
---
# $page_title
"$tree;

# Write the list to file.
echo -e "${tree}" > $file;

# Display status.
echo "";
echo "Content:
${tree}.";
echo "Stored in: $file.";
echo "";
