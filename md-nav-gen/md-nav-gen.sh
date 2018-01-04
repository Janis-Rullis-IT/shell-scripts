#!/bin/bash
# http://tldp.org/LDP/abs/html/arrays.html

echo "
=== Generate a navigation bar to upper directories for Markdown files ===
";

nav_bar='';
level='';

# Split the path into pieces.
directories=(`tr '/' '\n' <<< $PWD;`)
dir_cnt=${#directories[@]};

# Define how deep inside the project we currently are. Default is 1. This is required
# to avoid adding redundant depth. If not set it will got till the root of the path.
current_depth_in_project=1;
if [[ -n $1 ]]; then current_depth_in_project=$1; fi
min_depth=$(( dir_cnt - current_depth_in_project ));

# Loop through directories from deepest to highest.
for ((i=$dir_cnt-1; i >= $min_depth ; i--)); do

	# Each iteration goes up in the folder structure.
	level=$level'../';
	directory=${directories[$i]};

	# Add each part a relative ('../' goes up) Markdown's link.
	link="[$directory]($level)";
	nav_bar='/'$link$nav_bar;
done


echo "Path: '$PWD'.";
echo "Directories: '${directories[@]}'.";
echo "First: '${directories[$dir_cnt-1]}'.";
echo "Directory count: '$dir_cnt'.";
echo "Current depth inside the project: $current_depth_in_project.";
echo "";
echo "Navigation bar: '$nav_bar'.";
echo "Stored in: 'Navigation.md.'.";
echo "";

echo $nav_bar > Navigation.md;