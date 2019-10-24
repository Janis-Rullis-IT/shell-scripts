#!/bin/bash
# sudo cp rig.sh /usr/local/bin/rig
# sudo chmod a+x /usr/local/bin/rig

echo "== Resize an image into defined sizes for a responsive page ==
Example
1) rig - generates a list of sizes.
2) rig 1920 - only 1 size.
";

if [[ -n $1 ]]; then
        readonly target_dir="$1x";
        readonly sizes=($1);
else
        readonly target_dir="responsive";
        readonly sizes=(3840 3200 2732 2048 1920 1600 1536 1366 1024 900 768 450);
fi

if [[ ! -d $target_dir ]]; then
        mkdir $target_dir;
        echo "Created $target_dir"
fi

for f in `find ./  -maxdepth 1 -type f \( -iname \*.jpg -o -iname \*.png -o -iname \*.tif \)`
do
        # Trim the ./ part .
        f=${f:2};
        filename=$(basename $f);

        # Loop through sizes.
        for index in ${!sizes[*]}
        do
                size=${sizes[$index]};
                new_filename="${filename%.*}-${size}x.jpg"
                target="${target_dir}/${new_filename}";
                dir=$(dirname $f);

                convert  "$f[${size}>]" "$target";
                echo $target;
        done
done
