
#!/bin/bash
# sudo cp extr.sh /usr/local/bin/extr
# sudo chmod a+x /usr/local/bin/extr

echo "== Copy searched files to a directory ==";

# #1 https://github.com/Janis-Rullis-IT/shell-scripts/blob/master/iwg.sh
if [[ ! -n $1 ]]; then
        echo "What are You searching?";
        exit;
fi

search=$1;

if [[ ! -d ${search} ]]; then
        mkdir ${search};
        echo "Created ${search}";
fi

for f in  `find . -maxdepth 1 -type f -name "*${search}"` 
do
        echo $f;
        cp "${f}" "${search}"
done

