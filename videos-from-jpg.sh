#!/bin/bash

## Make globally available with:
# sudo ln -s ~/Desktop/www/shell-scripts/videos-from-jpg.sh /usr/local/bin/videos-from-jpg && sudo chmod a+x /usr/local/bin/videos-from-jpg

IFS=$'\n\t'
DIR=$PWD;
ROOT_DIR="$(dirname "${DIR}")";

echo "== Collect a specific width JPG and generate a video ==";
echo "vid Birds or vid Birds 640";

if [[ ! -n $1 ]]; then
  echo 'Description?';
  exit;
fi
DESCRIPTION=$1;

# https://github.com/Janis-Rullis-IT/shell-scripts/blob/master/ren.sh
# Trim first digit and get 001 - https://www.linuxquestions.org/questions/programming-9/incrementing-001-value-in-shell-script-578420/
file_number=1001

width=1920;
if [[ -n $2 ]]; then
        width=$2;
fi

# #1 Copy searched files to a directory. Ex., 1920x.
dir_width="${width}x.jpg";
collect-searched ${dir_width};

cd $dir_width;

# #1 Convert images to 16:9 ratio based on the passed width. Ex., 1920x/1080/.
img-to-16-9 $width;

# #1 Convert to indexed format.
rename-files-cp 'img' '-s';

# #1 Create a video.
cd renamed;
video-from-jpg "${DESCRIPTION}" $width:$height;

echo "Video created."
cd $DIR;
