#!/bin/bash

sudo modprobe v4l2loopback exclusive_caps=1 max_buffers=2
gphoto2 --stdout --capture-movie | ffmpeg -i - -vcodec rawvideo -pix_fmt yuv420p -threads 0 -f v4l2 /dev/video0

## List available video devices
# v4l2-ctl --list-devices
# > Dummy video device (0x0000) (platform:v4l2loopback-000):
# > /dev/video4
