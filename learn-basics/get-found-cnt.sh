#!/bin/bash

set -Eeuo pipefail; # set -o xtrace;
    IFS=$'\n\t'
    DIR=$PWD;
    ROOT_DIR="$(dirname "${DIR}")";

parts=`find ./  -maxdepth 1 -type f \( -iname \*.jpg -o -iname \*.png -o -iname \*.tif \)`

parts=($parts);
#echo "${parts[0]}";
echo ${#parts[@]};

# 2. Will throw and error if nothing is found 
