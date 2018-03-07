#!/bin/bash

## Make globally available with:
# sudo cp res.sh /usr/local/bin/res
# sudo chmod a+x /usr/local/bin/res

echo "== Resize images with ImageMagick ==";

size=250x;
format='png';

for f in `find . -name "*.$format"`
do
	# Store the resized images in a separate directory.
	dir=$(dirname $f)"/$size";

	if [[ ! -d $dir ]]; then
		mkdir $dir;
	fi

	convert "$f[$size>]" -set filename:base "%[base]" "$dir/%[filename:base].$format";

	echo $f;
done
