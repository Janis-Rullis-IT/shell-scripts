#!/bin/bash

# #3 See in https://github.com/Janis-Rullis-IT/shell-scripts/blob/cc5428f13dfb18fa23dae18213eeb6314cd14379/rig.sh#L45

set -Eeuo pipefail; # set -o xtrace;
    IFS=$'\n\t'
    DIR=$PWD;
    ROOT_DIR="$(dirname "${DIR}")";

parts=`find ./  -maxdepth 1 -type f \( -iname \*.jpg -o -iname \*.png -o -iname \*.tif \)`

parts=($parts);
#echo "${parts[0]}";
echo ${#parts[@]};

# 2. Will throw and error if nothing is found 
