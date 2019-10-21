  GNU nano 2.9.3                                                                                                                                                               /usr/local/bin/ren                                                                                                                                                                          

#!/bin/bash
## Make globally available with:
# sudo cp ren.sh /usr/local/bin/ren
# sudo chmod a+x /usr/local/bin/ren

echo "== Safely rename all files in subdirectories. Store in 'renamed' directory. ==
Example
ren \"Flowers\" \"2019\"";

#set -Eeuo pipefail; # set -o xtrace # Define how to handle newlines in the `find` results.
IFS=$'\n\t'

readonly DIR=$PWD;
beginning='';
end='-by-Janis-Rullis';
target_dir="renamed";
is_simple=false
filetype="! -type d";

# Trim first digit and get 0001 -  https://www.linuxquestions.org/questions/programming-9/incrementing-001-value-in-shell-script-578420/
file_number=10001

if [[ ! -d $target_dir ]]; then
        mkdir $target_dir;
        echo "Created $target_dir"
fi

echo "1st argument is the beginning.";
if [[ -n $1 ]]; then
        beginning=$1;
fi

echo "2nd argument is the end. Default is '-by-Janis-Rullis'";
if [[ -n $2 ]]; then
        end=$2;
fi

if [[ $end == "-s" ]]; then
        is_simple=true
        echo "Simple rename: enabled"
fi

echo "3nd argument is the file type. Example: jpg";
if [[ -n $3 ]]; then
        files=`find -mindepth 2 -maxdepth 2 -name "*.$3"  | sort -n`

else
        files=`find -mindepth 2 -maxdepth 2 ! -type d  | sort -n`
fi

for f in $files
do
        # Trim the ./ part .
        f=${f:2};

        # Prepare the target.
        dir=$(dirname $f);
        ext="${f##*.}";
        mid="-${dir}${end}"

        if [[ $is_simple = true ]]; then
                mid="";
        fi

        new_filename="${beginning}${mid}-${file_number:1}.${ext}";
        target="${target_dir}/${new_filename}";

        cp "${f}" "${target}"
        echo "${target}"

        ((file_number++));
done
