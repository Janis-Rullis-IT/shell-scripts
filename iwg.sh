#!/bin/bash

## Make globally available with:
# sudo ln -s ~/Desktop/www/shell-scripts/iwg.sh /usr/local/bin/iwg
# sudo chmod a+x /usr/local/bin/iwg

echo "== Prepare images for WEB - rename, add EXIF, convert to sRGB JPG ==
Example
iwg \"Flowers\" \"-by-Janis-Rullis\" \"2019:09:30\" \"21:00:00\"
";

# Copy me, please!
# iwg "Flowers" "-by-Janis-Rullis" "2019:09:30" "21:00:00"

#set -Eeuo pipefail; # set -o xtrace;
# Define how to handle newlines in the `find` results.
IFS=$'\n\t'

if [[ ! -n $1 ]]; then
  echo 'Description?';
  exit;
fi
if [[ ! -n $2 ]]; then
  echo 'Sufix?';
  exit;
fi
if [[ ! -n $3 ]]; then
  echo 'Date?';
  exit;
fi
if [[ ! -n $4 ]]; then
  echo 'Time?';
  exit;
fi

DESCRIPTION=$1
END=$2
DATE=$3
TIME=$4
SIZES=1920
# Remove ':' from the date.
DATE_FILENAME=${DATE//:/}
DATE_DESCRIPTION=${DATE_FILENAME}-${DESCRIPTION};

if [[  $5 ]]; then
        SIZES=""
fi

ren "${DATE_DESCRIPTION}" "${END}"
cd renamed

# Add converted sRPG JPGs.
#srg
#cd srgb

# Set EXIF for originals.
exi "${DESCRIPTION}" "${DATE}" "${TIME}"

# #2 Genereate various size images and prepare HTML.
rig "${SIZES}" "${DESCRIPTION}" "${DATE}";

# #3 Generate a video.
cd responsive
vids "${DATE_DESCRIPTION}";

cd $PWD;