#!/bin/bash

## Make globally available with:
# sudo cp fil.sh /usr/local/bin/fil
# sudo chmod a+x /usr/local/bin/fil

echo "== Copies one file behind every file in directory ==
This could be used for GIF layers. layer.png will be copied after a.png and b.png as a1.png and b1.png.
";

def_file="fil";

# Accept the file to copy.
if [[ -n $1 ]]; then
        file=$1;

# Use default file if can.
elif [[ -r  $def_file ]]; then
	echo "Will copy 'fil'";
	file=$def_file;
else
	echo "File is missing. What should I copy?"
	exit;
fi

# All files in directory except the source file and directories.
for f in `find . -maxdepth 1 ! -type d ! -name $file`
do
	ext="${f##*.}";
	filename="${f%.*}";
	target="${filename}-1.${ext}";
	cp $file $target;
	echo $target;
done
