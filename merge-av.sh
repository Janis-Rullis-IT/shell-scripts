#!/bin/bash
# https://superuser.com/a/277667
# ffmpeg -i FILENAME.MOV -i FILENAME.wav -c:v copy -c:a aac -map 0:v:0 -map 1:a:0 -shortest -y FILENAME-1.MOV
