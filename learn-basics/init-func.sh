#!/bin/bash

echo "== Check if variables set in function are available outside ==
> Note: Functions must be defined at the top / above the call.
";

# Define error reporting level, file seperator, and init direcotry.
function init(){
    set -Eeuo pipefail; # set -o xtrace;
    IFS=$'\n\t'
    DIR=$PWD;
    ROOT_DIR="$(dirname "${DIR}")";
}
init

echo $DIR;
echo $ROOT_DIR;
echo "== Conclusion: They are."