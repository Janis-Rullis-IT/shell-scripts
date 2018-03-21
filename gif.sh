#!/bin/bash

## Make globally available with:
# sudo cp gifo.sh /usr/local/bin/gifo
# sudo chmod a+x /usr/local/bin/gifo

echo "== Add overlay to all images in this directory ==
";

size='100x';
format='png';

echo "1st argument is size. Default is '100x'.";
if [[ -n $1 ]]; then
        size=$1;
fi

# Add overlay if has the overlay file.
if [[ -r 'fil' ]]; then
	gifo;
	cd $dir;
fi

convert -resize $size  -delay 20 -loop 0 *.png anim.gif
