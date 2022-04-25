#!/bin/bash

# https://libre-software.net/edit-metadata-exiftool/
# https://metacpan.org/pod/distribution/Image-ExifTool/lib/Image/ExifTool/TagNames.pod#EXIF-Tags
# PhotoShop's 'RAW Data' tab (last) in the File info dialog.

## Make globally available with:
# sudo ln -s ~/Desktop/www/shell-scripts/exif-set.sh /usr/local/bin/exif-set && sudo chmod a+x /usr/local/bin/exif-set
set -Eeuo pipefail; # set -o xtrace;
echo "== Set EXIF for all files ==";
echo "Example
./exif-set.sh \"Flowers\" \"2019:09:30\" \"21:00:00\"
"

AUTHOR="Janis Rullis"
WEBSITE="ruu.lv"
COPYRIGHT="© 2022 ${AUTHOR} | ${WEBSITE}"
DESCRIPTION="${1} | ${COPYRIGHT}"
DATE=$2
TIME=$3
DATETIME="${DATE} ${TIME}"

# #10 Remove all metadata.
exiftool -all= -tagsfromfile @ -Orientation .

# #10 Set only the reqquired metadata.
exiftool \
-overwrite_original \
\
-Photoshop:CopyrightFlag='True' \
-rights="${COPYRIGHT}" \
-XMP-dc:Rights="${COPYRIGHT}" \
-Copyright="${COPYRIGHT}" \
-CopyrightNotice="${COPYRIGHT}" \
\
-Description="${DESCRIPTION}" \
-Title="${DESCRIPTION}" \
-ImageDescription="${DESCRIPTION}" \
-XPTitle="${DESCRIPTION}" \
-XMP-dc:Title="${DESCRIPTION}" \
-XMP-dc:Description="${DESCRIPTION}" \
-XMP-xmp:Title="${DESCRIPTION}" \
-iptc:Caption-Abstract="${DESCRIPTION}" \
-iptc:ObjectName="${DESCRIPTION}" \
\
-CreateDate="${DATETIME}" \
-DateTimeOriginal="${DATETIME}" \
-iptc:DateCreated="${DATE}" \
-iptc:TimeCreated="${TIME}" \
\
-XMP-dc:Creator="${AUTHOR}" \
-XMP-cc:AttributionName="${AUTHOR}" \
-Artist="${AUTHOR}" \
-iptc:By-line="${AUTHOR}" \
\
-XMP-cc:AttributionURL="https://${WEBSITE}" \
-URL="https://${WEBSITE}" \
-XMP-iptcCore:CreatorWorkURL="https://${WEBSITE}" \
.
