#!/bin/bash

## Make globally available with:
# sudo ln -s ~/Desktop/www/shell-scripts/album-for-web.sh /usr/local/bin/album-for-web
# sudo chmod a+x /usr/local/bin/album-for-web

echo "== Prepare images for WEB - rename, add EXIF, convert to sRGB JPG ==
Example
album-for-web \"Flowers\" \"-by-Janis-Rullis\" \"2019:09:30\" \"21:00:00\" 1
";

# Copy me, please!
# album-for-web "Flowers" "-by-Janis-Rullis" "2019:09:30" "21:00:00"

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

# echo 'Upload to r9?';
MUST_UPLOAD=false;
if [[  $6 ]]; then  
  MUST_UPLOAD=$6;
fi

rename-files-cp "${DATE_DESCRIPTION}" "${END}"
cd renamed

# Add converted sRPG JPGs.
#srg
#cd srgb

# Set EXIF for originals.
exi "${DESCRIPTION}" "${DATE}" "${TIME}"

# #2 Genereate various size images and prepare HTML.
rig "${SIZES}" "${DESCRIPTION}" "${DATE}";

 # #4 Upload to r9;    
  if [[ MUST_UPLOAD ]]; then
    scp -r responsive/* root@pma.r9.lv:/root/i/
  fi

# #3 Generate a video.
cd responsive
vids "${DATE_DESCRIPTION}";

cd $PWD;