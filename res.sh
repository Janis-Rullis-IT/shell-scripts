#!/bin/bash

## Make globally available with:
# sudo cp res.sh /usr/local/bin/res
# sudo chmod a+x /usr/local/bin/res

echo "== Resize images with ImageMagick ==";

size=250x;
format='png';

echo "1st argument is size. Default is '250x'.";
if [[ -n $1 ]]; then
        size=$1;
fi

echo "2nd argument is format. Default is 'png'.";
if [[ -n $2 ]]; then
        format=$2;
fi

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
