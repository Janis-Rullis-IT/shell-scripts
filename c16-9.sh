#!/bin/bash

## Make globally available with:
# sudo cp c16-9.sh /usr/local/bin/c16-9
# sudo chmod a+x /usr/local/bin/c16-9

IFS=$'\n\t'
DIR=$PWD;
ROOT_DIR="$(dirname "${DIR}")";

echo "== Convert images to 16:9 ratio based on the passed width ==";

if [[ ! -n $1 ]]; then
        echo "Width?";
        exit;
fi

width=$1;

echo "Calculate the height for 16:9 ratio";
height=$((width/16*9))
size="1920x1080";

echo "Create ${height}.";
cd $ROOT_DIR;

if [[ -d ${height} ]]; then
        rm -R ${height};
        echo "CLear ${height}.";
fi

target_dir=$DIR/$height;
echo "Make 16:9 sized copies into ${target_dir}.";
cp $DIR $height -R;
mv $height $target_dir;
cd $target_dir;

mogrify -resize ${width}x${height} *.jpg
mogrify -extent ${size} -gravity Center -fill white *.jpg
