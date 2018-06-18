#!/bin/bash
# https://stackoverflow.com/a/11287896

echo "
=== Check if a file contain a string 'array' ===
";

function initGlobals(){
  set -Eeuo pipefail; # set -o xtrace;
  IFS=$'\n\t'
}

function doesFileContainString(){
	file=$1
	string=$2

  echo "* $file"

  if grep -q $string "$file"; then
    echo ' contain.'
  else
    echo ' does not contain.'
  fi
}

initGlobals
doesFileContainString 'array.sh' 'array'
doesFileContainString 'debug.sh' 'array'