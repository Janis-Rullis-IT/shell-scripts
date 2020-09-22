#!/bin/bash

# sudo apt install cwebp
# sudo  ln -s ~/Desktop/www/shell-scripts/img-and-code-for-web.sh /usr/local/bin/img-and-code-for-web
# sudo chmod a+x /usr/local/bin/img-and-code-for-web

# Define error reporting level, file seperator, and init direcotry.
function init(){
    set -Eeuo pipefail; # set -o xtrace;
    IFS=$'\n\t'
    DIR=$PWD;
    ROOT_DIR="$(dirname "${DIR}")";
}
init

echo "== Generarte responsive images and put them inside HTML, XML, JSON ==
Example
1) img-and-code-for-web - generates a list of sizes.
2) img-and-code-for-web 1920 - only 1 size.
4) img-and-code-for-web '' 'Birds' '2020-03-03' - also generate HTML and placeholders.
";

HTML_IMG_DESCRIPTION="";
HTML_IMG_DATE="2020-03-03";
target_dir="responsive";
sizes=(3840 3200 2732 2048 1920 1600 1536 1366 1024 900 768 450);

if [[ -n $1 ]]; then
        target_dir="$1x";
        sizes=($1);
fi
if [[ -n $2 ]]; then
        HTML_IMG_DESCRIPTION=$2;
fi
if [[ -n $3 ]]; then
        HTML_IMG_DATE=$3;
fi

if [[ ! -d $target_dir ]]; then
        mkdir $target_dir;
        echo "Created $target_dir"
fi

# #3 Get the total image count and pass it to the HTML generator.
FOUND_IMAGES=`find ./  -maxdepth 1 -type f \( -iname \*.jpg -o -iname \*.png -o -iname \*.tif \)`
FOUND_IMAGES_ARR=($FOUND_IMAGES)
FOUND_IMAGE_CNT=${#FOUND_IMAGES_ARR[@]} 

for i in "${!FOUND_IMAGES_ARR[@]}"
do
        f=${FOUND_IMAGES_ARR[$i]};

        # Trim the ./ part .
        f=${f:2};
        filename=$(basename $f);
        target_prefix=${target_dir}/${filename%.*};

        # #3 Generate a placeholder image and HTML.
        if [[ $HTML_IMG_DESCRIPTION != "" ]]; then

            # #3 Generate a JPG placeholder.
            convert "$f" -resize 700x -strip -blur 0x8 -quality 20 "${target_prefix}-700x-placeholder.jpg";
            convert "${target_prefix}-700x-placeholder.jpg" -grayscale Rec709Luminance "${target_prefix}-700x-gray-placeholder.jpg";
            
            # #3 Generate a WEMP placeholder.
            cwebp -q 40 "${target_prefix}-700x-placeholder.jpg" -noalpha -mt -o "${target_prefix}-700x-placeholder.webp";
            cwebp -q 40 "${target_prefix}-700x-gray-placeholder.jpg" -noalpha -mt -o "${target_prefix}-700x-gray-placeholder.webp";

            # #3 Generate img.html and json.html.
            # #3 Pass the image count to the HTML generator.
            code-for-web ${filename%.*} "${HTML_IMG_DESCRIPTION}" "${HTML_IMG_DATE}" $FOUND_IMAGE_CNT $i;
        fi

        # Loop through sizes.
        for index in ${!sizes[*]}
        do
            size=${sizes[$index]};
            target="${target_prefix}-${size}x";
            dir=$(dirname $f);

            # Convert to *.jpg.
            convert "$f" -resize ${size} -gaussian-blur 0.05 -quality 85%  "${target}.jpg";

            # Convert to *.webp.
            cwebp -q 85 "${f}"  -resize ${size} 0 -mt  -metadata all -o "${target}.webp"
            echo $target;
        done
done
