#!/bin/bash

echo "== Check if variables set in function are available outside ==
";

# Define error reporting level, file seperator, and init direcotry.
function init(){
    set -Eeuo pipefail; # set -o xtrace;
    IFS=$'\n\t'
    DIR=$PWD;
}
init

echo ${DIR};
echo "== Conclusion: They are."