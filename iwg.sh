#!/bin/bash

## Make globally available with:
# sudo cp iwg.sh /usr/local/bin/iwg
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
                exit
fi

DESCRIPTION=$1
END=$2
DATE=$3
TIME=$4
# Remove ':' from the date.
DATE_FILENAME=${DATE//:/}

ren "${DATE_FILENAME}-${DESCRIPTION}" "${END}"
cd renamed

# Add converted sRPG JPGs.
srg
cd srgb

# Set EXIF for originals.
exi "${DESCRIPTION}" "${DATE}" "${TIME}"

rig 1920
#cd 1920x
#exi "${DESCRIPTION}" "${DATE}" "${TIME}"

echo "Final result is in \"${PWD}"
