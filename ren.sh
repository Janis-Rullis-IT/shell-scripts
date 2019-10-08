#!/bin/bash

## Make globally available with:
# sudo cp ren.sh /usr/local/bin/ren
# sudo chmod a+x /usr/local/bin/ren

echo "== Safely rename all files in subdirectories. Store in 'renamed' directory. ==
Example
ren \"Flowers\" \"2019\"";

#set -Eeuo pipefail; # set -o xtrace;
# Define how to handle newlines in the `find` results.
IFS=$'\n\t'

readonly DIR=$PWD;
beginning='';
end='-by-Janis-Rullis';
target_dir="renamed";
file_number=1

if [[ ! -d $target_dir ]]; then
	mkdir $target_dir;
	echo "Created $target_dir"
fi

echo "1st argument is the beginning.";
if [[ -n $1 ]]; then
        beginning=$1;
fi

echo "2nd argument is the end. Default is '-by-Janis-Rullis'";
if [[ -n $2 ]]; then
        end=$2;
fi

files=`find -mindepth 2 ! -type d | sort -n`

for f in $files
do
	# Trim the ./ part .
        f=${f:2};

	# Prepare the target.
	dir=$(dirname $f);
	ext="${f##*.}";
	new_filename="${beginning}${dir}${end}-${file_number}.${ext}";		
	target="${target_dir}/${new_filename}";

	cp "${f}" "${target}"
	echo "${target}"

	((file_number++));
done
