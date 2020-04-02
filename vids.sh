#!/bin/bash

IFS=$'\n\t'

## Make globally available with:
# sudo cp vids.sh /usr/local/bin/vids
# sudo chmod a+x /usr/local/bin/vids

echo "== Collect a specific size JPG and generate a video ==";
echo "vid or vid 640x";
# https://github.com/Janis-Rullis-IT/shell-scripts/blob/master/ren.sh
# Trim first digit and get 001 -  https://www.linuxquestions.org/questions/programming-9/incrementing-001-value-in-shell-script-578420/
file_number=1001
size='1920x';

# https://github.com/Janis-Rullis-IT/shell-scripts/blob/master/iwg.sh
if [[ -n $1 ]]; then
        size=$1;
fi

if [[ ! -d $size ]]; then
        mkdir $size;
        echo "Created ${size}";
fi

for f in `find . -name "*${size}.jpg"`
do
        new_filename="img${file_number:1}.jpg";
        target="${size}/${new_filename}";

        echo $f "=>" $target;

        cp "${f}" "${target}"

        ((file_number++));
done

cd $size;
vid
