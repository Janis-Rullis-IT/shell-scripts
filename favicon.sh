#!/bin/bash
set -euo pipefail;
IFS=$'\n\t';

## Make globally available with:
# sudo cp favicon.sh /usr/local/bin/favicon
# sudo chmod a+x /usr/local/bin/favicon

echo "== Generate a favicon including multiple sizes ==";

echo "Checking the file...";
readonly file=${1:-};
if [ -z "$file" ]; then
	echo "Tell me, please, from which image should I generate the favicon?";
	exit 1;
fi
if [[ ! -r $file ]]; then
	echo "Sorry, file is not readable.";
	exit 1;
fi

readonly dir="Favicon";
echo "Create a separate directory '${dir}'...";
if [[ ! -d $dir ]]; then
	mkdir $dir;
fi

readonly sizes=(16 32 64 96 128 256);
readonly size_filenames=(favicon-16.png favicon-32.png favicon-64.png favicon-96.png favicon-128.png favicon-256.png);
echo "Export the image these defined sizes: '${sizes[@]}'...";
for index in ${!sizes[*]}
do
        size=${sizes[$index]};
	filename="favicon-${size}.png";
#	sizes_str="${filename} ${sizes_str}";
        target="${dir}/${filename}";
        convert "$file[${size}x${size}]" "$target";
        echo $target;
done

echo "Wrap all exported sizes in the favicon.ico..."
cd $dir;
convert ${size_filenames[@]} favicon.ico;

echo "${dir}/favicon.ico is ready!";
