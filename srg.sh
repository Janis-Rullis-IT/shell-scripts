#!/bin/bash

## Make globally available with:
# sudo cp srg.sh /usr/local/bin/srg
# sudo cp sRGB_v4_ICC_preference.icc /usr/local/bin/sRGB_v4_ICC_preference.icc
# sudo chmod a+x /usr/local/bin/srg

# Get the sRGB profile file from http://www.color.org/srgbprofiles.xalter

echo "== Convert to sRGB ==";

target_dir="srgb";

if [[ ! -d $target_dir ]]; then
	mkdir $target_dir;
	echo "Created $target_dir"
fi

for f in `find ./  -maxdepth 1 -type f \( -iname \*.jpg -o -iname \*.png -o -iname \*.tif \)`
do
	# Trim the ./ part .
        f=${f:2};
	target="${target_dir}/$f";
	mogrify -path ${target_dir} -colorspace sRGB -strip -profile /usr/local/bin/sRGB_v4_ICC_preference.icc $f
	echo $target;
done

	
