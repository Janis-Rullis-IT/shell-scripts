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
max_depth=$dir_cnt-1;
min_depth=$(( max_depth - current_depth_in_project ));

# Loop through directories from deepest to highest.
for ((i=max_depth; i >= $min_depth ; i--)); do

	# Each iteration goes up in the folder structure.
	directory=${directories[$i]};

	# Add each part a relative ('../' goes up) Markdown's link. Except the current dir.
	if(( $i < max_depth )); then
		level=$level'../';
	else
		level=$level'./';
	fi

	link="[$directory]($level)";
	nav_bar=' / '$link$nav_bar;
done

nav_bar="### $nav_bar\n\n-----------------------------------------------------------------------------------";
echo -e $nav_bar > Navigation.md;

echo "Path: '$PWD'.";
echo "Directories: '${directories[@]}'.";
echo "First: '${directories[$max_depth]}'.";
echo "Directory count: '$dir_cnt'.";
echo "Current depth inside the project: $current_depth_in_project.";
echo "";
echo "Navigation bar: '$nav_bar'.";
echo "Stored in: 'Navigation.md.'.";
echo "";

