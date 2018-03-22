#!/bin/bash

## Make globally available with:
# sudo cp gifo.sh /usr/local/bin/gifo
# sudo chmod a+x /usr/local/bin/gifo

echo "== Create GIF from images in this directory ==
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
	cd 'merged';
	
	# Replaces lime color with transparency (if has).
	convert anim.gif -fuzz 50% -transparent 'lime' anim.gif
fi

convert -resize $size -delay 20 *.png -loop 0 anim.gif;
