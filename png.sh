#!/bin/bash
IFS=$'\n\t'

## Make globally available with:
# sudo cp png.sh /usr/local/bin/png
# sudo chmod a+x /usr/local/bin/png

echo "== Convert all BMP to PNG ==";

format='png';

echo "1st argument is format. Default is 'png'.";
if [[ -n $1 ]]; then
        format=$1;
fi

for f in `find . -name "*.bmp"`
do
	# Store images in a separate directory.
	dir=$(dirname $f)"/$format";

	# Trim the ./ part.
        dir=${dir:2};

	if [[ ! -d $dir ]]; then
		mkdir $dir;
	fi

	# Replace spaces with - and add the required extension.
	filename=$(basename $f);
        filename=`tr ' ' '-' <<< $filename`;
        filename="${filename%.*}.${format}";

	target="$dir/$filename";
	convert "$f" "$target";

	echo $target;
done
