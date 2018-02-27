read commit

case $commit in 
y|Y|YES|yes)
git push
;;
n|NO|N|no)
 exit 0

esac
