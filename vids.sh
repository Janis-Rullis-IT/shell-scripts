
#!/bin/bash

## Make globally available with:
# sudo cp vids.sh /usr/local/bin/vids
# sudo chmod a+x /usr/local/bin/vids

IFS=$'\n\t'
DIR=$PWD;
ROOT_DIR="$(dirname "${DIR}")";

echo "== Collect a specific width JPG and generate a video ==";
echo "vid or vid 640";

# https://github.com/Janis-Rullis-IT/shell-scripts/blob/master/ren.sh
# Trim first digit and get 001 -  https://www.linuxquestions.org/questions/programming-9/incrementing-001-value-in-shell-script-578420/
file_number=1001
width=1920;

# https://github.com/Janis-Rullis-IT/shell-scripts/blob/master/iwg.sh
if [[ -n $1 ]]; then
        width=$1;
fi

# #1 Copy searched files to a directory. Ex., 1920x.
dir_width="${width}x.jpg";
extr ${dir_width};

cd $dir_width;

# #1 Convert images to 16:9 ratio based on the passed width. Ex., 1920x/1080/.
c16-9 $width;

# #1 Convert to indexed format.
ren 'img' '-s';

# #1 Create a video.
cd renamed;
vid $width:$height;

echo "Video created."
cd $DIR;
