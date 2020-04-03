#!/bin/bash

# https://linux4one.com/how-to-install-ffmpeg-on-ubuntu-18-04/
# sudo ln -s ~/Desktop/www/shell-scripts/vid.sh /usr/local/bin/vid
# sudo chmod a+x /usr/local/bin/vid

echo "== Create a video from images with a music ==";
size=1920:1080;

if [[ ! -n $1 ]]; then
  echo 'Description?';
  exit;
fi
DESCRIPTION=$1;

if [[ -n $2 ]]; then
        size=$2;
fi

# https://video.stackexchange.com/a/23532
ffmpeg -framerate 1/10 -i img-%04d.jpg -r 100 -pix_fmt yuv420p "${DESCRIPTION}.mp4"

# #4 https://www.youtube.com/watch?v=lE1y_TTISTQ
ffmpeg -i "${DESCRIPTION}.mp4" -i /usr/local/bin/audio.mp3 -c copy -shortest "${DESCRIPTION}_with_audio.mp4"
