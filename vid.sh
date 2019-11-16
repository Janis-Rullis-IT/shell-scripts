#!/bin/bash

# sudo apt install ffmpeg
# sudo cp vid.sh /usr/local/bin/vid
# sudo chmod a+x /usr/local/bin/vid

echo "== Create a video from images with a music ==";

ffmpeg -framerate 1/10 -i img%03d.jpg -i audio.mp3 -strict -2 out.mp4
