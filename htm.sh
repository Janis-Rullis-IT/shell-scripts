#!/bin/bash

# sudo cp htm.sh /usr/local/bin/htm
# sudo chmod a+x /usr/local/bin/htm

echo "== Generarte HTML blocks for ruu.lv  ==
Example
htm 20190820-Kurzeme-Klaipeda-0002-Pavilosta-by-Janis-Rullis Pavilosta 2019:08:20 1 0
";

if [[ ! -n $1 ]]; then
        echo "Filename?";
        exit;
fi
if [[ ! -n $2 ]]; then
        echo "Description?";
        exit;
fi
if [[ ! -n $3 ]]; then
        echo "Date?";
        exit;
fi
if [[ ! -n $4 ]]; then
        echo "Image count?";
        exit;
fi
if [[ ! -n $5 ]]; then
        echo "Image INDEX?";
        exit;
fi

# #2 https://clubmate.fi/replace-strings-in-files-with-the-sed-bash-command/#Replace_an_array_of_values
# Associative array where key represents a search string,
# and the value itself represents the replace string.
declare -A confs
DATE=$3;
DATE_SHORT=${DATE//:/};
DESCRIPTION=$2
IMG_CNT=$4;
IMG_INDEX=$5;
DATE_W_DOTS=`tr ':' '.' <<< ${DATE}`.;

confs=(
  [DATE_W_HYPENS]=`tr ':' '-' <<< ${DATE}`
  [DATE_W_DOTS]=$DATE_W_DOTS
  [DATE_SHORT]=$DATE_SHORT
  [HTML_FILENAME]="${DATE_SHORT}-${DESCRIPTION}.html"
  [XML_FILENAME]="${DATE_SHORT}-${DESCRIPTION}.xml"
  [HTML_SHORT_TITLE]="${DATE_W_DOTS} ${DESCRIPTION}"
  [HTML_TITLE]="Analog Photography | ${DATE_W_DOTS} ${DESCRIPTION} | ruu.lv"  
  [IMG_FILENAME]=$1
  [DESCRIPTION]=$DESCRIPTION 
)

setVariables(){
  if [[ ! -n $1 ]]; then
        echo "Filename?";
        exit;
  fi
  target=$1

  for i in "${!confs[@]}"
  do
      search=$i
      replace=${confs[$i]}
      sed -i -e "s/${search}/${replace}/g" $target;
  done
}

# #2 tpl.html can be found in https://github.com/ruu-lv/content_gen

# #3 Create a fresh HTML, Sitemap XML if this is the first image.
if [[ $IMG_INDEX == 0 ]]; then
  cat /usr/local/bin/news.header.tpl.html > ${confs[HTML_FILENAME]};
  setVariables ${confs[HTML_FILENAME]};

  cat /usr/local/bin/news.header.tpl.xml > ${confs[XML_FILENAME]};
  setVariables ${confs[XML_FILENAME]};

  echo "" > img.html;
  echo "" > img.xml;
fi

# #2 Append the image template block to the target HTML.
cat /usr/local/bin/img.tpl.html >> img.html
setVariables img.html

# #5 Append the image template block to the target Sitemap XML.
cat /usr/local/bin/img.tpl.xml >> img.xml
setVariables img.xml

# #3 Merge HTML and Sitemap XML parts if this is the last image.
if [[ $IMG_INDEX == $((IMG_CNT-1)) ]]; then
  cat img.html >> ${confs[HTML_FILENAME]};
  cat /usr/local/bin/news.footer.tpl.html >> ${confs[HTML_FILENAME]};
  echo ${confs[HTML_FILENAME]};

  cat img.xml >> ${confs[XML_FILENAME]};
  cat /usr/local/bin/news.footer.tpl.xml >> ${confs[XML_FILENAME]};
  echo ${confs[XML_FILENAME]};
fi
