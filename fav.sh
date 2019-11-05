#!/bin/bash
set -euo pipefail;
IFS=$'\n\t';

## Make globally available with:
# sudo cp fav.sh /usr/local/bin/fav
# sudo chmod a+x /usr/local/bin/fav

echo "== Generate WEBP and PNG in recommended sizes for a favicon ==";

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

# 2020 https://www.emergeinteractive.com/insights/detail/the-essentials-of-favicons/
readonly sizes=(32 128 180 192 196);
readonly size_filenames=(favicon-32.webp favicon-128.webp favicon-180.webp favicon-192.webp favicon-196.webp);

# 2018
#readonly sizes=(16 32 64 96 128 256);
#readonly size_filenames=(favicon-16.png favicon-32.png favicon-64.png favicon-96.png favicon-128.png favicon-256.png);
echo "Export the image these defined sizes: '${sizes[@]}'...";
for index in ${!sizes[*]}
do
        size=${sizes[$index]};
	filename="favicon-${size}";
        target="${dir}/${filename}";
        convert "$file[${size}x${size}]" -strip -grayscale Rec709Luminance "$target.png";
	cwebp -q 40 "$target.png" -noalpha -mt -o "$target.webp"
	rm "$target.png";

        echo $target;
done

echo "Wrap all exported sizes in the favicon.ico..."
cd $dir;

# Avoid using the .ico wrapper instead point in the head to the 32x32 icon and to other sizes in the manifest.json. See ruu.lv.
convert ${size_filenames[@]} favicon.ico;

echo "${dir}/favicon.ico is ready!";
