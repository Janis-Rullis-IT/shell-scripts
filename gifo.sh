#!/bin/bash

## Make globally available with:
# sudo cp gifo.sh /usr/local/bin/gifo
# sudo chmod a+x /usr/local/bin/gifo

echo "== Add overlay to all images in this directory ==
";

def_file="fil";
dir="merged";

# Accept the file to copy.
if [[ -n $1 ]]; then
        file=$1;

# Use default file if can.
elif [[ -r  $def_file ]]; then
        echo "Will copy 'fil'";
        file=$def_file;
else
        echo "File is missing. What should I copy?"
        exit;
fi

# Stored merged copies in a separate directory.
if [[ ! -d $dir ]]; then
	mkdir $dir;
fi

# All files in directory except the source file and directories.
for f in `find . -name "*.png"`
do
	target=$dir/$f;

	# Merge those two files.
	convert -gravity center $f $file -composite $target;

        echo $target;
done
