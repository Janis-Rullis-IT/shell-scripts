#!/bin/bash
# sudo ln -s ~/Desktop/www/shell-scripts/mag.sh /usr/local/bin/mag && sudo chmod a+x /usr/local/bin/mag

echo "== Collect files with matching filenames and any extension. ==";

DIR=$PWD;
ROOT_DIR="$(dirname "${DIR}")";
DIR_FROM=$ROOT_DIR;

if [[ -n $1 ]]; then
        DIR_FROM=$1;
fi

DIR_TO=$(basename -- "$DIR_FROM")

if [[ ! -d ${DIR_TO} ]]; then
        mkdir ${DIR_TO};
        echo "Created ${DIR_TO}";
fi

for f in  `find . -maxdepth 1 -type f` 
do
        # #9 Format the filename without the extension https://stackoverflow.com/a/965072
        filename=$(basename -- "$f")
        search="${filename%.*}";

        # #9 Look for files in the desired directory.
        for f2 in  `find ${DIR_FROM} -type f -name "${search}.*"` 
        do
          echo $f2;
          cp "${f2}" "${DIR_TO}/"
        done        
done
