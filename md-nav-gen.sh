#!/bin/bash
# http://tldp.org/LDP/abs/html/arrays.html

echo "
=== Generate a navigation bar to upper directories for Markdown files ===
";

nav_bar='';
level='';

# Split the path into pieces.
directories=(`tr '/' '\n' <<< $PWD;`)
dir_cnt=${#directories};

# Loop through directories from deepest to highest.
for ((i=$dir_cnt-1; i >= 0 ; i--)); do

	# Each iteration goes up in the folder structure.
	level=$level'../';
	directory=${directories[$i]};

	# Add each part a relative ('../' goes up) Markdown's link.
	link="[$directory]($level)";
	nav_bar='/'$link$nav_bar;
done

echo $nav_bar > Navigation.md;

echo "'$nav_bar' was stored into Navigation.md file.";