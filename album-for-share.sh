#!/bin/bash

## Make globally available with:
# sudo ln -s ~/Desktop/www/shell-scripts/album-for-share.sh /usr/local/bin/album-for-share && sudo chmod a+x /usr/local/bin/album-for-share

echo "== Prepare this image album for sharing - make meaningful filenames, add descriptions inside EXIF, resize ==
Example
* album-for-share 'Red-bag' '-by-Janis-Rullis' '2020:03:10' '21:00:00'
* album-for-share 'Red-bag' '-by-Janis-Rullis' '2020:03:10' '21:00:00' 700x
";

# Copy me, please!
# album-for-share "Flowers" "-by-Janis-Rullis" "2019:09:30" "21:00:00"

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
SIZES=2048
# Remove ':' from the date.
DATE_FILENAME=${DATE//:/}
DATE_DESCRIPTION=${DATE_FILENAME}-${DESCRIPTION};

if [[  $5 ]]; then
        SIZES=$5
fi

rename-files-cp "${DATE_DESCRIPTION}" "${END}"
cd renamed

# Set EXIF for originals.
exif-set "${DESCRIPTION}" "${DATE}" "${TIME}"

# #2 Genereate various size images and prepare HTML.
img-and-code-for-web "${SIZES}" "" "${DATE}";

cd $PWD;