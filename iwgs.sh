
#!/bin/bash

## Make globally available with:
# sudo cp iwgs.sh /usr/local/bin/iwgs
# sudo chmod a+x /usr/local/bin/iwgs

# Define error reporting level, file seperator, and init direcotry.
function init(){
    set -Eeuo pipefail; # set -o xtrace;
    IFS=$'\n\t'
    DIR=$PWD;
    ROOT_DIR="$(dirname "${DIR}")";
}
init

echo "== Prepare albums for WEB - rename, add EXIF, convert to sRGB JPG ==
Example
iwgs
";

# #3 Get the total image count and pass it to the HTML generator.
FOUND_SCRIPTS=`find . -name 'gen.sh'`
FOUND_SCRIPTS_ARR=($FOUND_SCRIPTS)
FOUND_SCRIPT_CNT=${#FOUND_SCRIPTS_ARR[@]} 

for i in "${!FOUND_SCRIPTS_ARR[@]}"
do
  f=${FOUND_SCRIPTS_ARR[$i]};
  dir=$(dirname $f);
  echo $dir >> "${DIR}/iwgs.log";

  cd "${dir}";

  if [[ -r 'renamed' ]]; then
    echo "Skipping because there's already a generated content." >> "${DIR}/iwgs.log";
  else
    ./gen.sh
    echo "Completed." >> "${DIR}/iwgs.log";
  fi

  cd ${DIR};
done

echo "Done! See ${DIR}/iwgs.log";