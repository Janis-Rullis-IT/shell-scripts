#!/bin/bash

## Make globally available with:
# sudo ln -s ~/Desktop/www/shell-scripts/sme.sh /usr/local/bin/sme
# sudo chmod a+x /usr/local/bin/sme

# Define error reporting level, file seperator, and init direcotry.
function init(){
    set -Eeuo pipefail; # set -o xtrace;
    IFS=$'\n\t'
    DIR=$PWD;
    ROOT_DIR="$(dirname "${DIR}")";
}
init

echo "== Sitemap merger ==
Example
sme
";

if [[ -r sitemap.xml ]]; then
  echo "" > sitemap.xml;
fi

for f in `find . -type f -name "*.xml"` 
do
    cat $f >> sitemap.xml;
done
echo "Merged into sitemap.xml.";