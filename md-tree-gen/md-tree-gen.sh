#!/bin/bash

tree=$(tree -tf --noreport -I '*~' --charset ascii $1 |
       sed -e 's/| \+/  /g' -e 's/[|`]-\+/ */g' -e 's:\(* \)\(\(.*/\)\([^/]\+\)\):\1[\4](\2):g')

tree=${tree#?}
printf "# $PWD\n\n${tree}" > $PWD/README.md

